#include "tests.h"
#include "mmm.h"
#include "lookup_table.h"
#include "rsa.h"
#include "rsa_params.h"
#include <stdio.h>
#include <stdint.h>

typedef unsigned __int128 uint128_t;

/*
 * mod_exp_naive(base, exp, M)
 *
 * Plain square-and-multiply using 128-bit division for every
 * modular reduction.  Used only inside the test suite as an
 * independent reference implementation to cross-check that mme()
 * and table_modexp() produce the same results.
 *
 * Not optimised, correctness is the only goal here.
 */
static uint64_t mod_exp_naive(uint64_t base, uint64_t exp, uint64_t M)
{
    if (M == 1) return 0;
    uint128_t r = 1, b = (uint128_t)base % M;
    for (uint64_t e = exp; e; e >>= 1) {
        if (e & 1) r = (r * b) % M;
        b = (b * b) % M;
    }
    return (uint64_t)r;
}

/*
 * CHECK(label, got, exp)
 *
 * Compares got == exp.  Prints the label and PASS/FAIL.
 * On failure also prints the actual vs expected values so the
 * source of the mismatch is immediately visible.
 * Increments the local variable `fail` which run_tests() returns.
 */
#define CHECK(label, got, exp)                                          \
    do {                                                                \
        int _p = ((got) == (exp));                                      \
        printf("  %-45s [%s]\n", (label), _p ? "PASS" : "FAIL");       \
        if (!_p) printf("    got %llu  expected %llu\n",               \
                        (unsigned long long)(got),                      \
                        (unsigned long long)(exp));                     \
        fail += !_p;                                                    \
    } while(0)

/*
 * CHECK_TRUE(label, cond)
 *
 * Evaluates cond as a boolean.  Used for compound checks where
 * a single expected value is not meaningful (e.g. all three methods
 * agree with each other).
 */
#define CHECK_TRUE(label, cond)                                         \
    do {                                                                \
        int _p = !!(cond);                                              \
        printf("  %-45s [%s]\n", (label), _p ? "PASS" : "FAIL");       \
        fail += !_p;                                                    \
    } while(0)

int run_tests(void)
{
    int fail = 0;

    printf("=============================================================\n");
    printf("  Self-Test\n");
    printf("=============================================================\n");

    /* ----------------------------------------------------------
     * Group 1, Raw MMM textbook example
     *
     * Values from the slide deck: X=17, Y=22, M=23.
     * m = bit_length(23) = 5, so R = 2^5 = 32.
     * R mod 23 = 9,  R^-1 mod 23 = 18  (since 9 * 18 mod 23 = 1).
     * Expected: MMM(17, 22, 23) = 17 * 22 * R^-1 mod 23 = 16.
     *
     * T2 checks the Montgomery identity: MMM(R, R, M) = R.
     *   R * R * R^-1 = R.  Confirms the scaling round-trips correctly.
     *
     * T3 checks the inverse derivation: MMM(1, 1, M) = R^-1.
     *   1 * 1 * R^-1 = R^-1.  Useful shortcut to compute R^-1.
     * ---------------------------------------------------------- */
    printf("\n  [Group 1] Raw MMM, textbook example (X=17, Y=22, M=23)\n");
    {
        uint64_t M    = 23;
        int      m    = bit_length(M);
        uint64_t R    = 9;    /* 2^5 mod 23 */
        uint64_t Rinv = 18;   /* 9 * 18 mod 23 = 1 */

        CHECK("T1  mmm(17,22,23) = 16",          mmm(17,22,M,m), 16ULL);
        CHECK("T2  mmm(R,R,M)    = R (identity)", mmm(R,R,M,m),  R);
        CHECK("T3  mmm(1,1,M)    = R^-1",         mmm(1,1,M,m),  Rinv);
    }

    /* ----------------------------------------------------------
     * Group 2, Class example (slide deck reference)
     *
     * P=61, Q=53, E=17, D=2753, PQ=3233, phi=3120.
     * Kept so results can be verified by hand against the slides.
     *
     * T4 checks that D was derived correctly: D*E mod phi must be 1.
     * T5-T6 test table_modexp independently.
     * T7-T8 test mod_exp_naive independently.
     * T9-T10 test mme independently.
     * T11 confirms all three implementations agree on the same
     *      ciphertext, a mismatch would reveal a bug in one of them.
     * ---------------------------------------------------------- */
    printf("\n  [Group 2] Class example (P=61, Q=53, E=17), slide deck ref\n");
    {
        uint64_t E = CLASS_E,  D  = CLASS_D;
        uint64_t PQ = CLASS_PQ, phi = CLASS_PHI;
        int      m  = bit_length(PQ);
        uint64_t R2 = compute_R2(PQ, m);

        uint64_t de = (uint64_t)(((uint128_t)D*(uint128_t)E) % (uint128_t)phi);
        CHECK("T4  D*E mod phi = 1",              de, 1ULL);
        CHECK("T5  [table] encrypt(123) = 855",   table_modexp(123,E,PQ), 855ULL);
        CHECK("T6  [table] decrypt(855) = 123",   table_modexp(855,D,PQ), 123ULL);
        CHECK("T7  [naive] encrypt(123) = 855",   mod_exp_naive(123,E,PQ), 855ULL);
        CHECK("T8  [naive] decrypt(855) = 123",   mod_exp_naive(855,D,PQ), 123ULL);
        CHECK("T9  [mme]   encrypt(123) = 855",   mme(123,E,PQ,m,R2), 855ULL);
        CHECK("T10 [mme]   decrypt(855) = 123",   mme(855,D,PQ,m,R2), 123ULL);
        CHECK_TRUE("T11 table == naive == mme on encrypt",
                   table_modexp(123,E,PQ) == mme(123,E,PQ,m,R2) &&
                   mod_exp_naive(123,E,PQ) == mme(123,E,PQ,m,R2));
    }

    /* ----------------------------------------------------------
     * Group 3, Hardcoded 64-bit key
     *
     * P=2155137979, Q=2148718241 (both 32-bit primes).
     * PQ is 63 bits, requires 64-bit long-word arithmetic.
     *
     * T12 verifies the key itself: D*E mod phi must be 1.
     * T13-T19 test all three methods against a known ciphertext
     *   computed offline (DEFAULT_TEST_C).
     * T20-T24 are a round-trip sweep across boundary values:
     *   T=1, T=999999999, T=123456789, T=1e12, T=PQ-1.
     *   Any off-by-one or overflow bug in mmm() would likely
     *   surface at the boundary values T=1 and T=PQ-1.
     * ---------------------------------------------------------- */
    printf("\n  [Group 3] Hardcoded 64-bit key\n");
    printf("  (P=%llu, Q=%llu, E=%llu)\n",
           (unsigned long long)DEFAULT_P,
           (unsigned long long)DEFAULT_Q,
           (unsigned long long)DEFAULT_E);
    {
        uint64_t E   = DEFAULT_E,  D  = DEFAULT_D;
        uint64_t PQ  = DEFAULT_PQ, phi = DEFAULT_PHI;
        int      m   = bit_length(PQ);
        uint64_t R2  = compute_R2(PQ, m);
        uint64_t T_k = DEFAULT_TEST_T;
        uint64_t C_k = DEFAULT_TEST_C;

        uint64_t de = (uint64_t)(((uint128_t)D*(uint128_t)E) % (uint128_t)phi);
        CHECK("T12 D*E mod phi = 1",                     de, 1ULL);
        CHECK("T13 [table] encrypt(123456789) = known C", table_modexp(T_k,E,PQ), C_k);
        CHECK("T14 [table] decrypt round-trip",           table_modexp(C_k,D,PQ), T_k);
        CHECK("T15 [naive] encrypt(123456789) = known C", mod_exp_naive(T_k,E,PQ), C_k);
        CHECK("T16 [naive] decrypt round-trip",           mod_exp_naive(C_k,D,PQ), T_k);
        CHECK("T17 [mme]   encrypt(123456789) = known C", mme(T_k,E,PQ,m,R2), C_k);
        CHECK("T18 [mme]   decrypt round-trip",           mme(C_k,D,PQ,m,R2), T_k);
        CHECK_TRUE("T19 table == naive == mme on encrypt",
                   table_modexp(T_k,E,PQ) == mme(T_k,E,PQ,m,R2) &&
                   mod_exp_naive(T_k,E,PQ) == mme(T_k,E,PQ,m,R2));

        printf("\n  [Group 3] Round-trip sweep\n");
        uint64_t    pts[]    = { 1ULL, 999999999ULL, DEFAULT_TEST_T,
                                 1000000000000ULL, DEFAULT_PQ - 1 };
        const char *labels[] = { "T20 T=1", "T21 T=999999999",
                                  "T22 T=123456789", "T23 T=1000000000000",
                                  "T24 T=PQ-1" };
        for (size_t i = 0; i < sizeof(pts) / sizeof(pts[0]); i++) {
            uint64_t Tc = pts[i];
            uint64_t Cc = mme(Tc, E, PQ, m, R2);
            uint64_t Tr = mme(Cc, D, PQ, m, R2);
            CHECK_TRUE(labels[i], Tr == Tc);
        }
    }
     /* ----------------------------------------------------------
     * Group 4 — Optimized MMM
     *
     * mmm_opt and mme_opt must produce bit-identical results to
     * mmm and mme.  Any difference here means the CLZ shortcut,
     * loop unrolling, or branchless add changes broke correctness.
     *
     * T25-T27 repeat the Group 1 raw MMM checks using mmm_opt.
     * T28-T29 check mme_opt against the class example.
     * T30-T31 check mme_opt against the 64-bit key known values.
     * T32 directly compares mme_opt vs mme on the same input.
     * ---------------------------------------------------------- */
    printf("\n  [Group 4] Optimized MMM — mmm_opt / mme_opt\n");
    {
        uint64_t M = 23;
        int      m = bit_length(M);
        CHECK("T25 mmm_opt(17,22,23) = 16",   mmm_opt(17,22,M,m), 16ULL);
        CHECK("T26 mmm_opt(R,R,M)    = R",    mmm_opt(9,9,M,m),    9ULL);
        CHECK("T27 mmm_opt(1,1,M)    = R^-1", mmm_opt(1,1,M,m),   18ULL);
    }
    {
        uint64_t E  = CLASS_E,  D  = CLASS_D,  PQ = CLASS_PQ;
        int      m  = bit_length(PQ);
        uint64_t R2 = compute_R2(PQ, m);
        CHECK("T28 [opt] encrypt(123) = 855", mme_opt(123,E,PQ,m,R2), 855ULL);
        CHECK("T29 [opt] decrypt(855) = 123", mme_opt(855,D,PQ,m,R2), 123ULL);
    }
    {
        uint64_t E  = DEFAULT_E, D  = DEFAULT_D, PQ = DEFAULT_PQ;
        int      m  = bit_length(PQ);
        uint64_t R2 = compute_R2(PQ, m);
        uint64_t T_k = DEFAULT_TEST_T, C_k = DEFAULT_TEST_C;
        CHECK("T30 [opt] encrypt(123456789) = known C", mme_opt(T_k,E,PQ,m,R2), C_k);
        CHECK("T31 [opt] decrypt round-trip",           mme_opt(C_k,D,PQ,m,R2), T_k);
        CHECK_TRUE("T32 mme_opt == mme on encrypt",
                   mme_opt(T_k,E,PQ,m,R2) == mme(T_k,E,PQ,m,R2));
    }

    printf("\n-------------------------------------------------------------\n");
    if (fail == 0)
        printf("  All tests PASSED.\n");
    else
        printf("  %d test(s) FAILED.\n", fail);
    printf("=============================================================\n\n");

    return fail ? 1 : 0;
}