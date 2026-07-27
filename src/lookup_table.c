#include "lookup_table.h"
#include <stdlib.h>

typedef unsigned __int128 uint128_t;

uint64_t mulmod_slow(uint64_t a, uint64_t b, uint64_t m)
{

    return (uint64_t)(((uint128_t)a * (uint128_t)b) % (uint128_t)m);
}

uint64_t table_modexp(uint64_t X, uint64_t E, uint64_t M)
{
    if (M == 1)
    {
        return 0;
    }
    if (E == 0)
    {
        return 1 % M;
    }

    // count bits E needs
    int bits = 0;
    uint64_t EE = E;
    while (EE)
    {
        bits++;
        EE >>= 1;
    }

    // table[i] = X^(2^i) mod M, built once by repeated squaring.
    uint64_t *table = (uint64_t *)malloc(sizeof(uint64_t) * (size_t)bits);
    if (!table)
    {
        return 0;
    }

    table[0] = X % M;
    for (int i = 1; i < bits; i++)
    {
        table[i] = mulmod_slow(table[i - 1], table[i - 1], M);
    }

    // combine the entries with bit set in E
    uint64_t result = 1 % M;
    for (int i = 0; i < bits; i++)
    {
        if ((E >> i) & 1ULL)
        {
            result = mulmod_slow(result, table[i], M);
        }
    }

    free(table);
    return result;
}