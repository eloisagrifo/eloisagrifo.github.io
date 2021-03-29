--ChainComplexes
restart
R = QQ[x,y]/ideal"xy";	
d0 = map(R^1,R^1,matrix{{x}})
d1 = map(source d0, R^1, matrix{{y}})
--double checking:
d1 * d0 == 0
C = new ChainComplex
--setting up modules
C#0 = target d0
C#1 = target d1
C#2 = source d1
--setting up maps
C.dd_1 = d0
C.dd_2 = d1
--seeing what C is:
C
--what are the maps?
C.dd
--what's the homology of C?
HH_1(C)
--unfortunately, we cannot read homology in degrees 0 and 2:
HH_0(C)
HH_2(C)
--another way to set up the same complex:
D = chainComplex(d0,d1)
D.dd
HH D
HH_0 D

--Complexes
restart
needsPackage "Complexes"
R = QQ[x,y]/ideal"xy";	
d0 = map(R^1,R^1,matrix{{x}})
d1 = map(source d0, R^1, matrix{{y}})
F = complex({d0,d1})
HH F
F.dd
G = complex({d0,d1}, Base => 7)
H = complex({d0,d1}, Base => -13)

