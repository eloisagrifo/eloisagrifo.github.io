--Example 5.31
restart
R = QQ[x_1 .. x_5]
I = monomialIdeal ideal(x_1*x_4, x_1*x_5, x_2*x_5, x_3*x_5, x_1*x_2*x_3)
dual I
primaryDecomposition I
minimalPrimes I -- I is radical, so of course these two lines are the same


--Example 5.32
restart
R = QQ[x_1 .. x_5]
I = monomialIdeal ideal(x_1*x_3, x_3*x_5, x_4*x_5, x_2*x_3*x_4)
dual I
primaryDecomposition I
