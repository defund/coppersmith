import itertools

from sage.rings.polynomial.multi_polynomial_sequence import PolynomialSequence

def small_roots(f, bounds, m=1, d=None):
	if not d:
		d = f.degree()

	R = f.base_ring()
	N = R.cardinality()
	
	f /= f.coefficients().pop(0)
	f = f.change_ring(ZZ)

	G = PolynomialSequence([], f.parent())
	for i in range(m+1):
		power = N^(m-i) * f^i
		for shifts in itertools.product(range(d), repeat=f.nvariables()):
			g = power
			for variable, shift in zip(f.variables(), shifts):
				g *= variable^shift
			G.append(g)

	B, monomials = G.coefficient_matrix()
	monomials = vector(monomials)

	factors = [monomial(*bounds) for monomial in monomials]
	for i, factor in enumerate(factors):
		B.rescale_col(i, factor)

	B = B.dense_matrix().LLL()

	B = B.change_ring(QQ)
	for i, factor in enumerate(factors):
		B.rescale_col(i, 1/factor)
	B = B.change_ring(ZZ)

	H = Sequence([], f.parent().change_ring(QQ))
	for h in B*monomials:
		if h.is_zero():
			continue
		H.append(h.change_ring(QQ))
		I = H.ideal()
		if I.dimension() == -1:
			H.pop()
		elif I.dimension() == 0:
			V = I.variety(ring=ZZ)
			if V:
				roots = []
				for root in V:
					root = map(R, map(root.__getitem__, f.variables()))
					roots.append(tuple(root))
				return roots

	return []
