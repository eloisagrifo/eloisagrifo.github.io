--variety (t,t^2,t^3)
k = RR;
R = k[x,y,z];
f = map(k[t],R,{t,t^2,t^3})
ker f



---prime ideals
restart
k = QQ;
f = map(k[t],k[a,b],{t^2,t^3})
I = ker f
isPrime I

restart
k = QQ;
f = map(k[s,t],k[x_1 .. x_4],{s^3,s^2*t,s*t^2,t^3})
I = ker f
isPrime I

--Why grading matters:
restart
k = QQ;
f = map(k[t],k[a,b,c],{t^3,t^(11),t^(13)})
I = ker f -- wow that's a lot of generators!
--Do we really need all that? No!
--Here is a fix: make sure M2 knows this is a graded ring
restart
k = QQ;
f = map(k[t],k[a,b,c, Degrees => {3,11,13}],{t^3,t^(11),t^(13)})
I = ker f--much better
