#ifndef RSA_H
#define RSA_H

#include <stdint.h>
#include "mmm.h"

typedef struct
{
    uint64_t E;  /* public exponent  */
    uint64_t D;  /* private exponent */
    uint64_t PQ; /* modulus (product of two primes p*q) */
    int m;       /* bit-length of PQ, computed once at init */
    uint64_t R2; /* R^2 mod PQ, computed once at init */
} rsa_key_t;

// sets up an RSA key: stores E, D, PQ and computes m and R2 once so they can be reused across many encrypt/decrypt calls
void rsa_init(rsa_key_t *key, uint64_t E, uint64_t D, uint64_t PQ);

// encrypt plaintext P: C = P^E mod PQ, with MME
uint64_t rsa_encrypt(const rsa_key_t *key, uint64_t P);

// eecrypt ciphertext C: P = C^D mod PQ, with MME
uint64_t rsa_decrypt(const rsa_key_t *key, uint64_t C);

#endif /* RSA_H */