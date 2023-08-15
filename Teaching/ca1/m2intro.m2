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
f%I == 0 --nope
isSubset(ideal(f),I) -- also no