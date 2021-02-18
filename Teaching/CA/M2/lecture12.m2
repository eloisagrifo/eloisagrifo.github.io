restart
k = QQ
I = ker map(k[t],k[a,b,c],{t^3,t^(11),t^(13)})
mingens I
numgens I
isHomogeneous I

restart
k = QQ
I = ker map(k[t],k[a,b,c, Degrees => {3,11,13}],{t^3,t^(11),t^(13)})
mingens I
numgens I
isHomogeneous I
J = ideal"a3c-b2, b5-ac4, a2b3-c3, a5b-c2, a8-bc"
I == J


restart
k = QQ
I = ker map(k[t],k[a,b,c],{t^3,t^(11),t^(13)})
mingens I
numgens I
J = ideal"b2-a3c, a8-bc, a5b-c2"
I == J
