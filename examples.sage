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

def trivariate(N):
	bounds = (floor(N^.12), floor(N^.12), floor(N^.12))
	roots = tuple(randrange(bound) for bound in bounds)
	R = Integers(N)
	P.<x, y, z> = PolynomialRing(R)
	monomials = [x, y, x*y, x*z, y*z]
	f = sum(randrange(N)*monomial for monomial in monomials)
	f -= f(*roots)
	return small_roots(f, bounds)

def boneh_durfee(N, p, q):
	bounds = (floor(N^.25), 2^1024)
	d = random_prime(bounds[0])
	e = inverse_mod(d, (p-1)*(q-1))
	roots = (e*d//((p-1)*(q-1)), (p+q)//2)
	R = Integers(e)
	P.<k, s> = PolynomialRing(R)
	f = 2*k*((N+1)//2 - s) + 1
	return small_roots(f, bounds, m=3, d=4)

if __name__ == '__main__':
	print('Generating primes')
	p = random_prime(2^1024)
	q = random_prime(2^1024)
	N = p*q

	print('Univariate')
	print(univariate(N))

	print('Bivariate')
	print(bivariate(N))

	print('Trivariate')
	print(trivariate(N))

	print('Boneh Durfee')
	print(boneh_durfee(N, p, q))
