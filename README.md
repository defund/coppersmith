# coppersmith
A totally generic implementation of Coppersmith's method that finds small roots for any modular multivariate polynomial. For example, this supports:
* Univariate, bivariate, trivariate, theoretically n-variate polynomials.
* Arbitrary monomials and degrees.
* Unknown moduli, assuming you know some multiple.

Of course, added complexity leads to lower quality bounds. Optimizations are a work in progress.

## Usage
See [examples.sage](examples.sage) for confirmed use cases. For general use, the arguments of `small_roots` are:
* `f` - Multivariate polynomial with small roots. Its base ring should be some sort of integers modulo `N`.
* `bounds` - Tuple of bounds for each variable in `f.variables()`. This is used to optimize the lattice and does not strictly determine the size of roots returned.
* `m` - Determines how many higher powers of `f` and `N` to use. Defaults to 1.
* `d` - Determines how many variable shifts to use. Defaults to `f.degree()`.

## References
* https://cr.yp.to/bib/2001/coppersmith.pdf
* https://web.eecs.umich.edu/~cpeikert/lic13
