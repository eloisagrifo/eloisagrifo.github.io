--Complexes in M2

--ChainComplexes
restart
R = QQ[a,b]
d1 = map(R^1, R^2, {{a,b}})
d2 = map(R^2, R^1, {{-b},{a}})
--double checking:
d1 * d2 == 0
C = new ChainComplex
--setting up modules
C#0 = target d1
C#1 = target d2
C#2 = source d2
--setting up maps
C.dd_1 = d1
C.dd_2 = d2
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
D = chainComplex(d1,d2)
D.dd
HH D
HH_0 D

--Complexes
restart
needsPackage "Complexes"
R = QQ[a,b];	
d1 = map(R^1, R^2, {{a,b}})
d2 = map(R^2, R^1, {{-b},{a}})
F = complex({d1,d2})
HH F
F.dd
G = complex({d1,d2}, Base => 7)
H = complex({d1,d2}, Base => -13)
