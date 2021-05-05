restart
R = QQ[x,y,z]
I = ideal"xy,xz,yz"
D = res(R^1/I)
D.dd
betti D


restart
R = QQ[x,y]
I = ideal"x2,xy,y3"
C = res(R^1/I)
C.dd
betti C
