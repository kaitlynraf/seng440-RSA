#include "mmm_opt.h"

/* Montgomery Multiplication: returns (X * Y * R^-1) mod M
 * where R = 2^m.  m is number of bits in modulus M.
 * This function assumes M is odd and > 0.
 */

uint64_t mmm_opt(uint64_t X, uint64_t Y, uint64_t M, int m)
{

    uint32_t T_hi = 0;
    uint64_t T_lo = 0;
    const uint64_t Y0 = Y & 1ULL;

    // strength reduction optimization: (X >> i) & 1 is a variable distance 64-bit shift, that ARM splices from two registers
    // shifting a copy right by 1 each pass is constant shift instead
    uint64_t Xs = X;

    // optimization: count down to compare against zero rather than m
    for (int i = m; i > 0; i--)
    {
        const uint64_t Xi = Xs & 1ULL;
        const uint64_t T0 = T_lo & 1ULL;
        const uint64_t eta = T0 ^ (Xi & Y0);
        Xs >>= 1;

        if (Xi)
        {
            uint64_t old_lo = T_lo;
            T_lo += Y;
            if (T_lo < old_lo)
            {
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

        T_lo = (T_lo >> 1) | ((uint64_t)(T_hi & 1U) << 63);
        T_hi >>= 1;

        if (T_hi != 0 || T_lo >= M)
        {
            T_lo -= M;
            T_hi = 0;
        }
    }

    return T_lo;
}

// computes X^E mod M with square and multiply, using mmm_opt() for each multiply
uint64_t mme_opt(uint64_t X, uint64_t E, uint64_t M, int m, uint64_t R2)
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
    uint64_t X_m = mmm_opt(X % M, R2, M, m);

    // optimization: CLZ gives the position of the most significant set
    // bit of E, so the loop starts there instead of at bit 63

    const int e_bits = 64 - __builtin_clzll(E);

    // process bits of E from most -> least significant bit
    uint64_t Z_m = X_m;
    for (int i = e_bits - 2; i >= 0; i--)
    {
        Z_m = mmm_opt(Z_m, Z_m, M, m); // square

        if ((E >> i) & 1ULL)
        {
            Z_m = mmm_opt(Z_m, X_m, M, m); // multiply
        }
    }

    // convert out of Montgomery
    uint64_t Z = mmm_opt(Z_m, 1, M, m);
    return Z;
}