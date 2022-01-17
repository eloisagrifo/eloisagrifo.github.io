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
R^1/I -- module
--alternative way:
module R / I
R/I -- ring



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
f%I --nope
isSubset(ideal(f),I) -- also no



--Presenting an algebra / finding kernels
restart
T = QQ[s,t]
S = QQ[x,y,z,w]
f = map(T,S,{s^3,s*t^2,s^2*t,t^3})
I = ker f
R = S/I
x*y-z --s^4t^2-s^2t



--Cautionary tales

--maps need to be graded or we're going to have a problem
restart
T = QQ[t]
S = QQ[x,y,z]
P = ker map(T,S,{t^(13),t^(42),t^(73)})
mingens P
numgens P
C = res P
C.dd
isHomogeneous P

--Correct version
restart
T = QQ[t]
S = QQ[x,y,z,Degrees => {13,42,73}]
P = ker map(T,S,{t^(13),t^(42),t^(73)})
mingens P
C = res P
C.dd







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
