#include <stdio.h>
#include <stdint.h>
#include "mmm.h"
#include "rsa.h"
// #include "lookup_table.h"

// compile with gcc -Wall -o rsa mmm.c rsa.c main.c
int main(void)
{
    /* pleaceholder key values */
    const uint64_t E = 17;
    const uint64_t D = 2753;
    const uint64_t PQ = 3233;
    const uint64_t P = 65; /* plaintext to test */

    rsa_key_t key;
    rsa_init(&key, E, D, PQ);

    printf("RSA with Montgomery Modular Multiplication\n");
    printf("Keys: E=%llu, D=%llu, PQ=%llu\n\n", (unsigned long long)E, (unsigned long long)D, (unsigned long long)PQ);

    /* encrypt then decrypt */
    uint64_t C = rsa_encrypt(&key, P);
    uint64_t P_back = rsa_decrypt(&key, C);

    printf("Plaintext:       P = %llu\n", (unsigned long long)P);
    printf("Ciphertext:      C = P^E mod PQ = %llu\n", (unsigned long long)C);
    printf("Decrypted back:  P' = C^D mod PQ = %llu\n\n", (unsigned long long)P_back);

    // for testing lookup table method
    // uint64_t C_table = table_modexp(P, E, PQ);
    // printf("RSA with Lookup Table\n");
    // printf("Keys: E=%llu, D=%llu, PQ=%llu\n\n", (unsigned long long)E, (unsigned long long)D, (unsigned long long)PQ);
    // printf("Plaintext:       P = %llu\n", (unsigned long long)P);
    // printf("Ciphertext:      C = P^E mod PQ = %llu\n", (unsigned long long)C_table);
    // printf("Decrypted back:  P' = C^D mod PQ = %llu\n\n", (unsigned long long)P_back);
    return 0;
}
