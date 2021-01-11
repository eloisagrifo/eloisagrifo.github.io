T = QQ[s,t] --big ambient ring
--S = QQ[s^2,s*t,t^2]
U = QQ[a,b,c]
f = map(T,U,{s^2,s*t,t^2})
--relations:
ker f
S = U/ker f
