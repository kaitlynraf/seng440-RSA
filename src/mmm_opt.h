#ifndef MMM_OPT_H
#define MMM_OPT_H

#include <stdint.h>

// Montgomery multiplication: (X * Y * R^-1) mod M. M must be odd, > 1
uint64_t mmm_opt(uint64_t X, uint64_t Y, uint64_t M, int m);

// Montgomery exponentiation: (X^E) mod M, square-and-multiply
uint64_t mme_opt(uint64_t X, uint64_t E, uint64_t M, int m, uint64_t R2);

#endif /* MMM_OPT_H */
