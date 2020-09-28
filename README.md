Theoretically, this implementation finds small roots for any modular multivariate polynomial. Optimizations are a work in progress. See [examples.sage](examples.sage) for confirmed use cases.

Sage by default handles univariate polynomials with a special class. On the other hand, `small_roots` requires that the function's parent ring be implemented as multivariate. In order to create such a ring, you must explicitly pass in 1 like so:

```sage
sage: P.<x> = PolynomialRing(ZZ); P
Univariate Polynomial Ring in x over Integer Ring
sage: P.<x> = PolynomialRing(ZZ, 1); P
Multivariate Polynomial Ring in x over Integer Ring
```

## References
* https://cr.yp.to/bib/2001/coppersmith.pdf
* https://web.eecs.umich.edu/~cpeikert/lic13
