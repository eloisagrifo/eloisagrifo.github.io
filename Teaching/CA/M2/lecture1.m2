R = QQ[x,y]
I = ideal"x2,xy,y2"
f = map(I*R^1,R^3,{{1,0,0},{0,1,0},{0,0,1}})
f = map(R^1,R^3,{{x^2,x*y,y^2}})
ker f
R^1
