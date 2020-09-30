# coppersmith
A totally generic implementation of Coppersmith's method that finds small roots for any modular multivariate polynomial. In particular, this supports:
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

Sage by default handles univariate polynomials with a special class. On the other hand, `small_roots` requires that the polynomial ring be implemented as multivariate. In order to do that for a single variable, you must explicitly pass in 1 like so:

```sage
sage: P.<x> = PolynomialRing(ZZ); P
Univariate Polynomial Ring in x over Integer Ring
sage: P.<x> = PolynomialRing(ZZ, 1); P
Multivariate Polynomial Ring in x over Integer Ring
```

## References
* https://cr.yp.to/bib/2001/coppersmith.pdf
* https://web.eecs.umich.edu/~cpeikert/lic13
