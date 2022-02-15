--free resolutions in Macaulay2
restart
R = QQ[x,y,z]
M = R^1/ideal"xy,xz,yz"
C = res M
C.dd
betti C

--we can computed the same resolution with Complexes instead
restart
needsPackage "Complexes"
R = QQ[x,y,z]
M = R^1/ideal"xy,xz,yz"
C = freeResolution M
C.dd
betti C



restart 
R = QQ[x,y]
I = ideal"x2,xy,y3"
C = res(R^1/I)
C.dd
betti C



--Notice that Macaulay2 CAN compute finite pieces of an infinite resolution
--it will NOT go into an infinite calculation; Macaulay2 is set to stop after a set number of steps
restart
R = QQ[x]/ideal"x2"
k = R^1/ideal vars R
C = res k
C.dd
