#ifndef RSA_PARAMS_H
#define RSA_PARAMS_H

#include <stdint.h>

/*
 * Hardcoded RSA key parameters
 *
 * DEFAULT KEY  (project secret key)
 *
 *   P and Q are distinct 32-bit odd primes.  Their product PQ is
 *   63 bits wide, too large to fit in a single 32-bit ARM register.
 *   This is what forces 64-bit long-word arithmetic throughout:
 *     - mmm() uses a T_hi:T_lo register pair for its accumulator
 *     - compute_R2() uses __uint128_t for the final R*R squaring
 *     - On ARM, these map to register pairs with ADDS/ADC carry chains
 *       and UMULL/UMLAL for 64x64->128-bit products.
 *
 *   E = 65537 = 2^16 + 1 is the standard real-world RSA public
 *   exponent. It is a Fermat prime with a very sparse binary which makes encryption fast
 *   the square-and-multiply loop has only 17 iterations (one per
 *   significant bit) and multiplies only twice (at bits 0 and 16).
 *
 *   D was computed offline using the extended Euclidean algorithm:
 *     D * E ≡ 1 (mod (P-1)*(Q-1))
 *   Verified in run_tests() at startup: D*E mod phi must equal 1.
 *
 * CLASS EXAMPLE  (slide deck reference)
 *
 *   P=61, Q=53, E=17, D=2753, PQ=3233.  Used in Group 2 of
 *   run_tests() to verify all methods against the known values
 *   from the lecture slides: encrypt(123) = 855, decrypt(855) = 123.
 */

/* Default 64-bit key */
#define DEFAULT_P    ((uint64_t)2155137979ULL)
#define DEFAULT_Q    ((uint64_t)2148718241ULL)
#define DEFAULT_PQ   ((uint64_t)4630784287349174939ULL)   /* P * Q          */
#define DEFAULT_PHI  ((uint64_t)4630784283045318720ULL)   /* (P-1) * (Q-1)  */
#define DEFAULT_E    ((uint64_t)65537ULL)
#define DEFAULT_D    ((uint64_t)3122495510201194433ULL)

/* Known encrypt/decrypt pair for DEFAULT key, computed offline */
#define DEFAULT_TEST_T  ((uint64_t)123456789ULL)
#define DEFAULT_TEST_C  ((uint64_t)4415223357710204485ULL)

/* Class example (slide deck reference) */
#define CLASS_P    ((uint64_t)61ULL)
#define CLASS_Q    ((uint64_t)53ULL)
#define CLASS_PQ   ((uint64_t)3233ULL)
#define CLASS_E    ((uint64_t)17ULL)
#define CLASS_D    ((uint64_t)2753ULL)
#define CLASS_PHI  ((uint64_t)3120ULL)

#endif /* RSA_PARAMS_H */