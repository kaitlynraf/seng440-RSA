#ifndef MMM_H
#define MMM_H

#include <stdint.h>

// computes bit length of M (the smallest m such that M < 2^m)
//  this is used to pick R = 2^m for Montgomery math
int bit_length(uint64_t M);

// R^2 mod M, where R = 2^m.
// used to move values in and out of Montgomery domain
// computed once per mod and passed into mme()
uint64_t compute_R2(uint64_t M, int m);

// Montgomery Modular Multiplication
// returns (X * Y * R^-1) mod M, where R = 2^m.
// M must be odd and M > 1.
uint64_t mmm(uint64_t X, uint64_t Y, uint64_t M, int m);

// Montgomery Modular Exponentiation, built on top of mmm()
// returns (X^E) mod M using square-and-multiply
// R2 must be (2^m)^2 mod M, from compute_R2().

uint64_t mme(uint64_t X, uint64_t E, uint64_t M, int m, uint64_t R2);

#endif /* MMM_H */