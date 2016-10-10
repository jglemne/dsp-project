# Random number generators
Practical discrete time stochastic processes and tests of randomness. Project in the course EE706 Digital Signal Processing at University of Auckland 2016. 

### RNGs
Currently only using two implementations; standard accept-reject and inverse transformation method.

### Test of randomness
Using a proprietary implementation of the Non-overlapping Template Matching Test, based on "A Statistical Test Suite for Random and Pseudorandom Number Generators for Cryptographic Applications" from NIST.

### Documentation
To create vector with specified length containing randomly generated values, binary or decimal, use the function genvar. Possible to specify RNG-method during function call. To test the randomness, use the function p-value. For more detailed instruction, see documentation in each function file.
