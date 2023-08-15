restart
R = QQ[t,x,y,z, MonomialOrder => Lex]
I = ideal"x-t3,y-t4,z-t5"
gens gb I
L = flatten entries gens gb I

p = map(R,R,{0,x,y,z})
w = select(L,f -> p(f)==f) --choosing the elements in the grobner basis not involving t
J = ideal w
flatten entries mingens ideal w

