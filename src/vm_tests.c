#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "rsa.h"
#include "rsa_params.h"
#include "lookup_table.h"

#define ITERATIONS 20

int main(int argc, char **argv)
{
    const char *method = "mmm";
    int use_class_key = 0;

    if (argc > 1)
    {
        method = argv[1];
    }
    if (argc > 2 && strcmp(argv[2], "class") == 0)
    {
        use_class_key = 1;
    }

    uint64_t E, D, PQ;
    if (use_class_key)
    {
        E = CLASS_E;
        D = CLASS_D;
        PQ = CLASS_PQ;
    }
    else
    {
        E = DEFAULT_E;
        D = DEFAULT_D;
        PQ = DEFAULT_PQ;
    }

    rsa_key_t key;
    rsa_init(&key, E, D, PQ);

    uint64_t T = DEFAULT_TEST_T % PQ;
    if (T == 0)
    {
        T = 123;
    }

    int failures = 0;

    for (int i = 0; i < ITERATIONS; i++)
    {
        uint64_t C, T_back;

        if (strcmp(method, "opt") == 0)
        {
            C = rsa_encrypt_opt(&key, T);
            T_back = rsa_decrypt_opt(&key, C);
        }
        else
        {
            C = rsa_encrypt(&key, T);
            T_back = rsa_decrypt(&key, C);
        }

        if (T_back != T)
        {
            failures++;
        }
    }

    printf("method     = %s\n", method);
    printf("key        = %s (PQ=%llu, m=%d)\n",
           use_class_key ? "class" : "default",
           (unsigned long long)PQ, key.m);
    printf("iterations = %d encrypt+decrypt cycles\n", ITERATIONS);
    printf("plaintext  = %llu\n", (unsigned long long)T);

    if (failures == 0)
    {
        printf("result     = OK (all round-trips correct)\n");
    }
    else
    {
        printf("result     = FAILED (%d bad round-trips)\n", failures);
    }

    return failures == 0 ? 0 : 1;
}
