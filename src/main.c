#include <stdio.h>
#include <stdint.h>
#include <inttypes.h>
#include <string.h>
#include "mmm.h"
#include "rsa.h"
#include "rsa_params.h"
#include "lookup_table.h"
#include "tests.h"

/*
 * SENG440 RSA Cryptography — main.c
 *
 * Demonstrates RSA encrypt/decrypt using two methods:
 *   1. Table of powers  (lookup_table.c)
 *   2. Montgomery MMM   (mmm.c / rsa.c)
 *
 * Key selection is one of two fixed keys from rsa_params.h:
 *   Default — the project's hardcoded 63-bit key (DEFAULT_*).
 *   Class example — P=61, Q=53, E=17 from the lecture slides
 *     (CLASS_*), so results can be checked against the slide deck.
 */

static uint64_t read_u64(const char *prompt) {
    uint64_t v;
    printf("%s", prompt);
    while (scanf("%" SCNu64, &v) != 1) {
        printf("  Invalid. Try again: ");
        while (getchar() != '\n');
    }
    return v;
}

/* Widest plaintext, Capped at 8 since T is a uint64_t. */
#define MAX_TEXT_BYTES 8
static size_t max_text_bytes(int m) {
    size_t bytes = (size_t)(m - 1) / 8;
    return bytes > MAX_TEXT_BYTES ? MAX_TEXT_BYTES : bytes;
}

/* Packs len ASCII bytes into uint64_t: s[0] is the most-significant byte. len must be <= MAX_TEXT_BYTES. */
static uint64_t pack_text(const char *s, size_t len) {
    uint64_t v = 0;
    for (size_t i = 0; i < len; i++)
        v = (v << 8) | (uint8_t)s[i];
    return v;
}

/* Reverses pack_text(): writes len bytes (+ NUL) back into out,
 * most-significant byte first. out must hold at least len+1 bytes. */
static void unpack_text(uint64_t v, char *out, size_t len) {
    for (size_t i = 0; i < len; i++)
        out[len - 1 - i] = (char)((v >> (8 * i)) & 0xFF);
    out[len] = '\0';
}

int main(void) {
        if (run_tests() != 0) {
        printf("\nSelf-test failed — aborting before interactive mode.\n");
        return 1;
    }
    
    printf("=====================================================\n");
    printf("  SENG440 RSA Cryptography\n");
    printf("  64-bit wordlength | Montgomery MMM | ARM target\n");
    printf("=====================================================\n\n");

    /* --------------------------------------------------
     * Key selection — both keys are fixed, loaded straight from
     * rsa_params.h.
     *
     * Default: the project's hardcoded 63-bit key.  PQ is wider than
     *   a single ARM register, so long-word arithmetic is required
     *   (T_hi:T_lo pair in mmm(), UMULL/UMLAL in compute_R2()).
     *
     * Class example: the P=61, Q=53, E=17 key from the lecture
     *   slides, so results can be checked against the slide deck's
     *   worked example.
     * -------------------------------------------------- */
    printf("  Key selection:\n");
    printf("  [1] Default        P=%" PRIu64 "  Q=%" PRIu64 "\n", DEFAULT_P, DEFAULT_Q);
    printf("  [2] Class example  P=%" PRIu64 "  Q=%" PRIu64 "  E=%" PRIu64 "\n",
           CLASS_P, CLASS_Q, CLASS_E);
    printf("  Select 1 or 2: ");

    int choice = 0;
    while (choice != 1 && choice != 2) {
        if (scanf("%d", &choice) != 1) choice = 0;
        while (getchar() != '\n');
        if (choice != 1 && choice != 2)
            printf("  Invalid input. Select 1 or 2: ");
    }

    uint64_t P, Q, PQ, phi, E, D;

    if (choice == 2) {
        P = CLASS_P;   Q = CLASS_Q;
        E = CLASS_E;   D = CLASS_D;
        PQ = CLASS_PQ; phi = CLASS_PHI;
    } else {
        P = DEFAULT_P;   Q = DEFAULT_Q;
        E = DEFAULT_E;   D = DEFAULT_D;
        PQ = DEFAULT_PQ; phi = DEFAULT_PHI;
    }

    int m = bit_length(PQ);

    printf("\n  P=%" PRIu64 "  Q=%" PRIu64 "\n", P, Q);
    printf("  PQ=%" PRIu64 "  phi=%" PRIu64 "\n", PQ, phi);
    printf("  E=%" PRIu64 "  D=%" PRIu64 "\n", E, D);
    printf("  m = bit_length(PQ) = %d bits  (%s)\n\n", m,
           m > 32 ? "64-bit long-word arithmetic required"
                  : "fits in 32-bit register");

    /* --------------------------------------------------
     * Plaintext input
     *
     * Number: enter T directly.
     * Text: enter up to max_text_bytes(m) ASCII characters, so it round-trips through the same encrypt/decrypt path as
     *   any other T. How many characters fit depends on the 63-bit default key which allows 7, the tiny class-example key
     *   allows only 1.
     * -------------------------------------------------- */
    size_t max_bytes = max_text_bytes(m);

    printf("  Plaintext input:\n");
    printf("  [1] Number  (1 <= T < %" PRIu64 ")\n", PQ);
    printf("  [2] Text    (up to %zu ASCII character%s for this key)\n",
           max_bytes, max_bytes == 1 ? "" : "s");
    printf("  Select 1 or 2: ");

    int t_choice = 0;
    while (t_choice != 1 && t_choice != 2) {
        if (scanf("%d", &t_choice) != 1) t_choice = 0;
        while (getchar() != '\n');
        if (t_choice != 1 && t_choice != 2)
            printf("  Invalid input. Select 1 or 2: ");
    }

    int  is_text = (t_choice == 2 && max_bytes > 0);
    if (t_choice == 2 && max_bytes == 0)
        printf("\n  This modulus is too small to hold even one character — using a number instead.\n");

    uint64_t T;
    size_t   text_len = 0;
    char     text_buf[MAX_TEXT_BYTES + 1] = {0};

    if (is_text) {
        char line[256];
        while (1) {
            printf("  Text (max %zu char%s): ", max_bytes, max_bytes == 1 ? "" : "s");
            if (!fgets(line, sizeof(line), stdin)) line[0] = '\0';

            size_t len = strlen(line);
            if (len > 0 && line[len - 1] == '\n') {
                line[--len] = '\0';
            } else {
                int c;
                while ((c = getchar()) != '\n' && c != EOF); /* flush overflow */
            }

            if (len == 0) {
                printf("  Enter at least one character.\n");
            } else if (len > max_bytes) {
                printf("  Too long — max %zu character%s for this key.\n",
                       max_bytes, max_bytes == 1 ? "" : "s");
            } else {
                text_len = len;
                memcpy(text_buf, line, text_len);
                text_buf[text_len] = '\0';
                break;
            }
        }
        T = pack_text(text_buf, text_len);
        printf("  Packed \"%s\" -> T = %" PRIu64 "\n\n", text_buf, T);
    } else {
        printf("  Plaintext T  (1 <= T < %" PRIu64 "):\n", PQ);
        while (1) {
            T = read_u64("    T = ");
            if (T == 0 || T >= PQ)
                printf("  Must be in [1, %" PRIu64 "].\n", PQ - 1);
            else break;
        }
        printf("\n");
    }

    /* --------------------------------------------------
     * Encrypt and decrypt with both methods, then cross-check
     * that they agree.
     * -------------------------------------------------- */
    rsa_key_t key;
    rsa_init(&key, E, D, PQ);

    uint64_t C_tbl = table_modexp(T, E, PQ);
    uint64_t C_mmm = rsa_encrypt(&key, T);
    uint64_t C_mmm_opt = rsa_encrypt_opt(&key, T);

    uint64_t T_tbl = table_modexp(C_tbl, D, PQ);
    uint64_t T_mmm = rsa_decrypt(&key, C_mmm);
    uint64_t T_mmm_opt = rsa_decrypt_opt(&key, C_mmm_opt);

    printf("  %-14s  %-22s  %-22s\n", "Method", "Ciphertext C", "Decrypted T'");
    printf("  %s\n", "--------------------------------------------------------------");
    printf("  %-14s  %-22" PRIu64 "  %-22" PRIu64 "  %s\n", "Table",
           C_tbl, T_tbl, T_tbl == T ? "OK" : "MISMATCH");
    printf("  %-14s  %-22" PRIu64 "  %-22" PRIu64 "  %s\n", "MMM",
           C_mmm, T_mmm, T_mmm == T ? "OK" : "MISMATCH");
    printf("  %-14s  %-22" PRIu64 "  %-22" PRIu64 "  %s\n", "MMM",
           C_mmm_opt, T_mmm_opt, T_mmm_opt == T ? "OK" : "MISMATCH");

    int agree = (C_tbl == C_mmm && C_mmm == C_mmm_opt);
    printf("\n  Both methods agree: %s\n", agree ? "YES" : "MISMATCH");

    if (is_text) {
        char tbl_out[MAX_TEXT_BYTES + 1], mmm_out[MAX_TEXT_BYTES + 1], mmm_opt_out[MAX_TEXT_BYTES + 1];
        unpack_text(T_tbl, tbl_out, text_len);
        unpack_text(T_mmm, mmm_out, text_len);
        unpack_text(T_mmm_opt, mmm_opt_out, text_len);
        printf("\n  Decrypted text (table): \"%s\"\n", tbl_out);
        printf("  Decrypted text (MMM):   \"%s\"\n", mmm_out);
        printf("  Decrypted text (MMM Optimized):   \"%s\"\n", mmm_opt_out);
    }

    return 0;
}