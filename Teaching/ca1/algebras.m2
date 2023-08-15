
--defining polynomial rings is easy:
restart
R = QQ[x,y,z]
--we can define polynomial rings over any coefficient ring:
S = R/ideal"xy,yz"
T = S[a .. f]
--here .. is shorthand to say a, b, c, d, e, f
--note that it's only two dots, not three, in ..


--but we cannot define a subalgebra, only quotient rings
--so to think of subalgebras, we need to think about them as quotients
---here is the degree 2 Veronese on 3 variables,
--a Q-subalgebra of the ring R above
--since there are 6 algebra generators, we need to write it as a quotient
--of a polynomial ring in 6 variables
use R -- the last ring we defined used the same variables as R, 
--so M2 will read any of those variables as beloging to T, not R
--that's why we tell M2 to use R instead
aux = QQ[w_1 .. w_6]
p = map(R,aux,{x^2,x*y,x*z,y^2,y*z,z^2})
V = aux/ker p
--sad thing: can't just use the image of the map:
image p --this gives an error!
