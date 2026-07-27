#include "mmm.h"

// typedef unsigned __int128 uint128_t;

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
        R = (R * 2) % M;
    }

    // R^2 mod M
    return (R * R) % (M);
}

/* Montgomery Multiplication: returns (X * Y * R^-1) mod M
 * where R = 2^m.  m is number of bits in modulus M.
 * This function assumes M is odd and > 0.
 */

/*
NEW to make work on VM for baseline profiling (uint128 not on 32bit):
representing T as 2 64 bit halves (T_hi and T_lo) to hold 128 bits

*/

uint64_t mmm(uint64_t X, uint64_t Y, uint64_t M, int m)
{

    uint64_t T_hi = 0;
    uint64_t T_lo = 0;
    const uint64_t Y0 = Y & 1ULL;

    for (int i = 0; i < m; i++)
    {
        const uint64_t Xi = (X >> i) & 1ULL;
        // Least significant bit of T
        const uint64_t T0 = T_lo & 1ULL;
        // eta = T0 XOR (Xi AND Y0)
        const uint64_t eta = T0 ^ (Xi & Y0);

        // Conditionally add Y and M
        if (Xi)
        {
            uint64_t old_lo = T_lo;
            T_lo += Y;
            if (T_lo < old_lo)
            { // unsigned overflow -> carry out
                T_hi += 1;
            }
        }
        if (eta)
        {
            uint64_t old_lo = T_lo;
            T_lo += M;
            if (T_lo < old_lo)
            {
                T_hi += 1;
            }
        }

        // Shift pair right by 1
        T_lo = (T_lo >> 1) | (T_hi << 63);
        T_hi = T_hi >> 1;

        // Conditionally subtract M to keep T in [0, M-1]
        if (T_hi != 0 || T_lo >= M)
        {
            T_lo -= M;
            T_hi = 0;
        }
    }

    return T_lo;
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
    uint64_t Z = mmm(Z_m, 1, M, m);
    return Z;
}
