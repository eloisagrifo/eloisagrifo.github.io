restart
R = QQ[x,y,z,w];
degree x
I = ideal"w2x+wyz+z3,x2 +3xy+5xz+7yz+11z2";
isHomogeneous I--true
--now the ring R/I is graded



--an ideal might be homogeneous in some gradings but not in others!
restart
R = QQ[x,y,z]
isHomogeneous ideal"x2+y4+z5" --false
restart
R = QQ[x,y,z, Degrees => {15,10,6}]
isHomogeneous ideal"x2+y3+z5" --true


restart
R = ZZ/101[a,b,c, Degrees=>{{1,2},{2,1},{1,0}}];
degree (a+b)
isHomogeneous(a+b)
degree a
degree b


