#include "mmm_opt.h"

/* One step of the MMM inner loop, used by the 4x-unrolled body.
 * static inline so the compiler inlines all four copies into the unrolled block
 * no call overhead, and the scheduler sees all four steps together. */
static inline void mmm_step(
        uint64_t Xi, uint64_t Y,
        uint64_t eta, uint64_t M,
        uint64_t *T_lo, uint32_t *T_hi)
{
    // branchless add of Xi*Y: Xi is 0 or 1, so Xi*Y is 0 or Y, no branch needed.
    // on ARM the compiler emits UMLAL (multiply-accumulate into register pair),
    // which handles the carry into T_hi in one instruction.
    uint64_t add_y = Xi * Y;
    uint64_t old = *T_lo;
    *T_lo += add_y;
    if (*T_lo < old)
        (*T_hi)++;
 
    // same pattern for eta*M
    uint64_t add_m = eta * M;
    old = *T_lo;
    *T_lo += add_m;
    if (*T_lo < old)
        (*T_hi)++;
 
    // shift the 128-bit T_hi:T_lo pair right by 1
    *T_lo = (*T_lo >> 1) | ((uint64_t)(*T_hi & 1U) << 63);
    *T_hi >>= 1;
 
    // conditional subtract to keep T in [0, M)
    if (*T_hi != 0 || *T_lo >= M)
    {
        *T_lo -= M;
        *T_hi = 0;
    }
}

/* Montgomery Multiplication: returns (X * Y * R^-1) mod M
 * where R = 2^m.  m is number of bits in modulus M.
 * This function assumes M is odd and > 0.
 */

uint64_t mmm_opt(uint64_t X, uint64_t Y, uint64_t M, int m)
{

    uint32_t T_hi = 0;
    uint64_t T_lo = 0;
    const uint64_t Y0 = Y & 1ULL;
 
    // strength reduction: shifting a copy right by 1 each pass is a constant-distance
    // shift (one ARM instruction) vs the variable-distance (X >> i) & 1 in the baseline
    // which requires splicing across two registers on a 64-bit pair
    uint64_t Xs = X;
 
    int i = 0;
 
    // 4x unrolled body, processes 4 bits of Xs per C iteration.
    // reduces loop overhead (decrement, compare-against-zero, branch) by 4x.
    // eta must be recomputed after each step because each call modifies T_lo,
    // changing its LSB which feeds into the next eta.
    for (; i <= m - 4; i += 4)
    {
        uint64_t Xi, eta;
 
        Xi = Xs & 1ULL; Xs >>= 1;
        eta = (T_lo & 1ULL) ^ (Xi & Y0);
        mmm_step(Xi, Y, eta, M, &T_lo, &T_hi);
 
        Xi = Xs & 1ULL; Xs >>= 1;
        eta = (T_lo & 1ULL) ^ (Xi & Y0);
        mmm_step(Xi, Y, eta, M, &T_lo, &T_hi);
 
        Xi = Xs & 1ULL; Xs >>= 1;
        eta = (T_lo & 1ULL) ^ (Xi & Y0);
        mmm_step(Xi, Y, eta, M, &T_lo, &T_hi);
 
        Xi = Xs & 1ULL; Xs >>= 1;
        eta = (T_lo & 1ULL) ^ (Xi & Y0);
        mmm_step(Xi, Y, eta, M, &T_lo, &T_hi);
    }
 
    for (; i < m; i++)
    {
        uint64_t Xi = Xs & 1ULL; Xs >>= 1;
        uint64_t eta = (T_lo & 1ULL) ^ (Xi & Y0);
        mmm_step(Xi, Y, eta, M, &T_lo, &T_hi);
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