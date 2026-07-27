#ifndef LOOKUP_TABLE_H
#define LOOKUP_TABLE_H

#include <stdint.h>

// slow modular multiply: (a * b) mod m used to build lookup table
uint64_t mulmod_slow(uint64_t a, uint64_t b, uint64_t m);

// Table-of-powers modular exponentiation: returns (X^E) mod M.

/* precomputes X^(2^0), X^(2^1), X^(2^2), etc mod M by repeated
 * squaring, then multiplies together the entries with their bit set
 * in E
 */
uint64_t table_modexp(uint64_t X, uint64_t E, uint64_t M);

#endif /* LOOKUP_TABLE_H */