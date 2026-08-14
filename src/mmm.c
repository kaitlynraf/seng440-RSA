#include "mmm.h"

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

static uint64_t mul32(uint32_t a, uint32_t b)
{
    return (uint64_t)a * (uint64_t)b;
}

/* 64x64 -> 128-bit multiply via long multiplication on
 * 32-bit halves, returned as a (hi, lo) pair, the same T_hi:T_lo
 * representation mmm() already uses below for its own accumulator,
 * extended here to build a full product instead of a running sum. */
static void mul64_wide(uint64_t a, uint64_t b, uint64_t *hi, uint64_t *lo)
{
    uint32_t a_lo = (uint32_t)a, a_hi = (uint32_t)(a >> 32);
    uint32_t b_lo = (uint32_t)b, b_hi = (uint32_t)(b >> 32);

    uint64_t ll = mul32(a_lo, b_lo);
    uint64_t hl = mul32(a_hi, b_lo);
    uint64_t lh = mul32(a_lo, b_hi);
    uint64_t hh = mul32(a_hi, b_hi);

    /* Sum of the three middle-order 32-bit chunks: high half of ll,
     * plus the low halves of hl and lh (their high halves carry into
     * hi below). */
    uint64_t mid = (ll >> 32) + (uint32_t)hl + (uint32_t)lh;

    *lo = (mid << 32) | (uint32_t)ll;
    *hi = hh + (hl >> 32) + (lh >> 32) + (mid >> 32);
}

/* Reduces a 128-bit value (hi:lo) mod M via the same bit-serial
 * shift/conditional-subtract technique mmm() uses on its T_hi:T_lo
 * accumulator: go through the 128 bits from most- to least-significant,
 * shifting the running remainder left and pulling in each bit,
 * subtracting M whenever the remainder reaches or exceeds it.
 * Requires M < 2^63 (true for every modulus this project uses) so
 * rem<<1 never overflows uint64_t. */
static uint64_t mod128(uint64_t hi, uint64_t lo, uint64_t M)
{
    uint64_t rem = 0;
    for (int i = 127; i >= 0; i--)
    {
        uint64_t bit = (i >= 64) ? ((hi >> (i - 64)) & 1ULL)
                                 : ((lo >> i) & 1ULL);
        rem = (rem << 1) | bit;
        if (rem >= M)
            rem -= M;
    }
    return rem;
}

uint64_t compute_R2(uint64_t M, int m)
{
    // R = 2^m mod M
    uint64_t R = 1 % M;
    for (int i = 0; i < m; i++)
    {
        R = (R * 2) % M;
    }

    // R^2 mod M: build the full 128-bit product as a (hi, lo) pair,
    // then reduce it mod M, no native 128-bit type needed anywhere,
    // works identically on any target, VM or not.
    uint64_t hi, lo;
    mul64_wide(R, R, &hi, &lo);
    return mod128(hi, lo, M);
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

    const int e_bits = bit_length(E);

    // process bits of E from most -> least significant bit
    uint64_t Z_m = X_m;
    for (int i = e_bits - 2; i >= 0; i--)
    {
        Z_m = mmm(Z_m, Z_m, M, m); // square

        if ((E >> i) & 1ULL)
        {
            Z_m = mmm(Z_m, X_m, M, m); // multiply
        }
    }

    // convert out of Montgomery
    uint64_t Z = mmm(Z_m, 1, M, m);
    return Z;
}