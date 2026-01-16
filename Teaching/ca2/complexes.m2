--An intro to M2
--fields
k1 = QQ
k2 = ZZ
k3 = CC
k4 = RR
--finite fields
k5 = ZZ/5

--polynomial rings
R = QQ[x,y,z]
S = k5[a_1 .. a_5]
U = R[u]

--ideals
I = ideal"xy,z2"
--can also write instead
ideal(x*y,z^2) -- same as I


--quotient rings
T = R/I

--careful: M2 will by default assume computations are happening in T, not R, since T was last used
x --M2 will tell us this is an element in T, not R
--if we want to talk about x the element in R, we can switch things by doing
use R
--now x is in R
x


--the module R/I and the ring R/I are very different things in M2
R/I -- ring
R^1/I -- module
--alternative way:
module R / I
--careful, this is different from
module(R/I) -- this is the module R/I over the ring R/I




--Good rule of thumb: if you're done with the previous calculations, 
--and are starting something completely new, use restart
restart

--asking M2 questions:
?map
viewHelp "map"


--Ideal Membership
restart
R = QQ[x,y]
I = ideal(x^2-y^2,x*y-1)
f = y^4*x^2-x^2*y^3
--is f in I?
f%I == 0 --nope
isSubset(ideal(f),I) -- also no



--Complexes and resolutions:

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
--now we can read homology in other degrees
HH_1 D
HH_3 D


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


--how to compute a free resolution?
restart
R = QQ[x,y]
I = ideal"x2,xy"
C = res(R^1/I) -- resolution of R/I over R
C.dd
D = res I -- note that this is also a resolution for R/I, not for I
D.dd
--but if you set I as a module, you will get a resolution for I:
E = res module I
E.dd

--computing resolutions with Complexes instead:
needsPackage "Complexes"
freeResolution I
freeResolution(R^1/I)
freeResolution module I

--we can also get betti tables:
betti res I
