restart
R = QQ[x,y]/ideal"xy"
M = R^1/ideal"x"
N = R^1/ideal vars R
quotientMtoN = inducedMap(N,M)
--can take Hom of two modules
Hom(M,N)
--can apply Hom to a map
Hom(quotientMtoN,R^1)--quotientMtoN^*
--this is a map Hom(N,R^1) --> Hom(M, R^1)
Hom(R^1,quotientMtoN)--quotientMtoN_*
--this is a map Hom(M,R^1) --> Hom(N, R^1)

Hom(R^1,quotientMtoN) == 0
--can tensor two modules
M ** N
--can apply tensor to a map
quotientMtoN ** (R^1/ideal(y))
--this is a map M ** (R^1/ideal(y)) --> N ** (R^1/ideal(y))
--can apply tensor and Hom to a complex
--chainComplexes
mx = map(R^1,R^1,matrix{{x}})
my = map(R^1, R^1, matrix{{y}})
F = chainComplex({mx,my,mx,my})
F ** M
Hom(F,M)
--with complexes instead
needsPackage "Complexes"
mx = map(R^1,R^1,matrix{{x}})
my = map(R^1, R^1, matrix{{y}})
C = complex({mx,my,mx,my})
D = C ** M
prune HH D
E = Hom(C,M)
Hom(M,C)
prune HH E
restart
