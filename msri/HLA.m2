restart
needsPackage "HomotopyLieAlgebra"
Q = QQ[x];
I = ideal"x2"
A = minimalModel(I, EndDegree => 15)


restart
needsPackage "HomotopyLieAlgebra"
Q = QQ[x,y];
I = ideal"xy"
A = minimalModel I
bracketMatrix(A, 1, 1)


restart
needsPackage "HomotopyLieAlgebra"
Q = QQ[x,y];
I = ideal"x3"
A = minimalModel I
bracketMatrix(A, 1, 1)

--Recall the example from Tuesday (lecture 3):
restart
needsPackage "DGAlgebras"
Q = QQ[x,y,z];
I = ideal"xy,xz,yz";
A = minimalModel(I, EndDegree => 4)
--A = Q[X_{ <= 5 }] (we have added vars of degree 1 through 5)
d = A.diff; --differential
A = minimalModel(I, EndDegree => 4)
bracketMatrix(A, 2, 2)

--to read off the bracket in the homotopy Lie algebra directly:
needsPackage "HomotopyLieAlgebra"
bracketMatrix(A, 1, 2)


--can also read it from the minimal model:
A.natural --the underlying Q-algebra
d = A.diff --differential

--fancy way to display the differentials:
v = flatten entries vars A.natural
netList apply(v, w -> {w,d(w)})
