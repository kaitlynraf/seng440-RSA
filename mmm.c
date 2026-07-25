#include "mmm.h"

typedef unsigned __int128 uint128_t;

// computes bit length of M
int bit_length(uint64_t M)
{
    int m = 0;
    uint64_t MM = M;
    while (MM)
    {
        m++;
        MM >>= 1;
    }
    return m;
}

uint64_t compute_R2(uint64_t M, int m)
{
    // R = 2^m mod M

    uint64_t R = 1 % M;
    for (int i = 0; i < m; i++)
    {
        R = (uint64_t)(((uint128_t)R * 2) % (uint128_t)M);
    }

    // R^2 mod M
    return (uint64_t)(((uint128_t)R * (uint128_t)R) % (uint128_t)M);
}

/* Montgomery Multiplication: returns (X * Y * R^-1) mod M
 * where R = 2^m.  m is number of bits in modulus M.
 * This function assumes M is odd and > 0.
 */
uint64_t mmm(uint64_t X, uint64_t Y, uint64_t M, int m)
{

    uint128_t T = 0;
    const uint64_t Y0 = Y & 1ULL;

    for (int i = 0; i < m; i++)
    {
        const uint64_t Xi = (X >> i) & 1ULL;
        // Least significant bit of T
        unsigned int T0 = (unsigned int)(T & 1ULL);
        // eta = T0 XOR (Xi AND Y0)
        unsigned int eta = T0 ^ (Xi & Y0);

        // Conditionally add Y and M
        if (Xi)
        {
            T += (uint128_t)Y;
        }
        if (eta)
        {
            T += (uint128_t)M;
        }

        // Shift right by 1
        T >>= 1;

        // Conditionally subtract M to keep T in [0, M-1]
        if (T >= (uint128_t)M)
        {
            T -= (uint128_t)M;
        }
    }

    return (uint64_t)T;
}

// computes X^E mod M with square and multiple, using mmm() for each multiply
uint64_t mme(uint64_t X, uint64_t E, uint64_t M, int m, uint64_t R2)
{

    // Handle modulus 1: everything mod 1 is 0.
    if (M == 1)
    {
        return 0;
    }
    // x^0 = 1
    if (E == 0)
    {
        return 1 % M;
    }

    // bring base into Montgomery domain
    uint64_t X_m = mmm(X % M, R2, M, m);

    // initialize Z as 1 in Montgomery domain
    uint64_t Z_m = mmm(1, R2, M, m);

    // process bits of E from least -> most significant bit
    uint64_t e = E;
    while (e != 0)
    {
        if (e & 1ULL)
        {
            Z_m = mmm(Z_m, X_m, M, m); // multiply
        }
        X_m = mmm(X_m, X_m, M, m); // square
        e >>= 1ULL;
    }

    // convert out of Montgomery
    int Z = mmm(Z_m, 1, M, m);
    return Z;
}
