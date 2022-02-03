k = QQ;
a = 9; 
b = 11; 
c = 14;
R = k[x,y,z, Degrees => {a,b,c}];
P = ker map(QQ[t],R,{t^a,t^b,t^c})
associatedPrimes(P^2)
symbolic2 = (select(primaryDecomposition(P^2), Q -> radical(Q) == P))_0
degrees symbolic2
degrees (P^2)

select(flatten entries mingens (symbolic2), f -> degree(f) == {88})
select(flatten entries mingens (symbolic2), f -> f%(P^2) != 0)
f = oo_0 --oo indicates the last output
P^2 + ideal(f) == symbolic2
