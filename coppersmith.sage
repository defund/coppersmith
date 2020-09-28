import itertools

def small_roots(f, bounds, m=1):
	d = f.degree()
	R = f.base_ring()
	N = R.cardinality()
	
	f /= f.coefficients().pop(0)
	f = f.change_ring(ZZ)

	G = []
	for i in range(m+1):
		power = N^(m-i) * f^i
		for shifts in itertools.product(range(d), repeat=f.nvariables()):
			g = power
			for variable, shift in zip(f.variables(), shifts):
				g *= variable^shift
			G.append(g)

	B, monomials = Sequence(G).coefficient_matrix()
	monomials = vector(monomials)

	factors = [monomial(*bounds) for monomial in monomials]
	for i, factor in enumerate(factors):
		B.rescale_col(i, factor)

	B = B.dense_matrix().LLL()
	B = B.change_ring(QQ)
	for i, factor in enumerate(factors):
		B.rescale_col(i, 1/factor)
	B = B.change_ring(ZZ)

	H = []
	for h in B*monomials:
		if not h.is_zero():
			H.append(h.change_ring(QQ))

	for i in range(f.nvariables(), len(H)):
		I = Sequence(H[:i]).ideal()
		if I.dimension() <= 0:
			break

	roots = []
	for root in I.variety(ring=ZZ):
		root = map(R, map(root.__getitem__, f.variables()))
		roots.append(tuple(root))
	return roots
