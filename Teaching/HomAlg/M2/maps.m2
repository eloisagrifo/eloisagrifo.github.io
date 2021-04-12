restart
R = QQ[x,y,z]
R = QQ[x,y]/ideal"xy";	
mx = map(R^1,R^1,matrix{{x}})
my = map(R^1, R^1, matrix{{y}})
C = chainComplex(mx,my)
D = chainComplex(my,mx)
f = map(D,C,i -> if even(i) then my else mx)

f = map(D,C,i -> {my,mx,my}_i)

--this one unfortunately doesn't work:
f = map(D,C,{my,mx,my})


--Now we can ask lots of things about our map:
ker f
image f
HH f
HH_0(f) == 0
prune HH_0(f)
prune HH_1(f)
prune HH_2(f)
f_2
image f_2

--Using Complexes instead
restart
needsPackage "Complexes"
R = QQ[x,y,z]
R = QQ[x,y]/ideal"xy";	
mx = map(R^1,R^1,matrix{{x}})
my = map(R^1, R^1, matrix{{y}})
C = complex({mx,my})
D = complex({my,mx})
f = map(D,C,{my,mx,my})
ker f
HH f
prune HH f
