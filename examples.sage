load('coppersmith.sage')

def univariate(N):
	bounds = (floor(N^.3),)
	roots = tuple(randrange(bound) for bound in bounds)
	R = Integers(N)
	P.<x> = PolynomialRing(R, 1)
	monomials = [x, x^2, x^3]
	f = sum(randrange(N)*monomial for monomial in monomials)
	f -= f(*roots)
	return small_roots(f, bounds, m=7)

def bivariate(N):
	bounds = (floor(N^.15), floor(N^.15))
	roots = tuple(randrange(bound) for bound in bounds)
	R = Integers(N)
	P.<x, y> = PolynomialRing(R)
	monomials = [x, y, x*y, x^2]
	f = sum(randrange(N)*monomial for monomial in monomials)
	f -= f(*roots)
	return small_roots(f, bounds)

def trivariate(M):
	bounds = (floor(N^.12), floor(N^.12), floor(N^.12))
	roots = tuple(randrange(bound) for bound in bounds)
	R = Integers(N)
	P.<x, y, z> = PolynomialRing(R)
	monomials = [x, y, x*y, x*z, y*z]
	f = sum(randrange(N)*monomial for monomial in monomials)
	f -= f(*roots)
	return small_roots(f, bounds)

if __name__ == '__main__':
	print('Generating primes')
	p = random_prime(2^1024)
	q = random_prime(2^1024)
	N = p*q

	print('Solving univariate')
	print(univariate(N))

	print('Solving bivariate')
	print(bivariate(N))

	print('Solving trivariate')
	print(trivariate(N))
