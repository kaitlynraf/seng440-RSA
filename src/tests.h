#ifndef TESTS_H
#define TESTS_H

/* Runs the self-test suite (see test.c): cross-checks table_modexp,
 * mme, and an independent 128-bit reference implementation against
 * each other and against known values from the lecture slides and
 * the project's default key. Prints PASS/FAIL per check.
 * Returns 0 if everything passed, nonzero otherwise. */
int run_tests(void);

#endif /* TESTS_H */