restart
needsPackage "DGAlgebras"
Q = QQ[x,y,z];
I = ideal"xy,xz,yz";
A = minimalModel(I, EndDegree => 1)
--A is now Q[X_{ <= 2 }] (we have added vars of degree 1 and 2)

--let's look at the images of the vars
d = A.diff;
d(T_(2,1))
d(T_(2,2))

C = toComplex (A, 3) --this is our partial minimal model viewed as a complex
C.dd_2 -- differential from degree 2 to degree 1
--from here we can deduce in what order the basis in degree 2 has been written

mingens HH_2(A)
--these two are same thing, asked in different ways
mingens HH_2(C)

--we can check our work
B = minimalModel(I, EndDegree => 2)
newd = B.diff
newd(T_(3,1))
