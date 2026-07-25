#include "rsa.h"

void rsa_init(rsa_key_t *key, uint64_t E, uint64_t D, uint64_t PQ)
{
    key->E = E;
    key->D = D;
    key->PQ = PQ;
    key->m = bit_length(PQ);
    key->R2 = compute_R2(PQ, key->m);
}

uint64_t rsa_encrypt(const rsa_key_t *key, uint64_t P)
{
    return mme(P, key->E, key->PQ, key->m, key->R2);
}

uint64_t rsa_decrypt(const rsa_key_t *key, uint64_t C)
{
    return mme(C, key->D, key->PQ, key->m, key->R2);
}