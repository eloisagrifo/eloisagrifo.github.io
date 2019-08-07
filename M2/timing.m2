restart
-- Create File
g = openOut "res"
g << "Start row" << endl << close
--START ROW
--K=QQ
--START BLOCK
--n=2
--pdec Fermat
--k = QQ
--n = 2
restart
k = QQ
n = 2
R = k[x,y,z]
I = ideal(x*(y^3-z^3),y*(z^3-x^3),z*(x^3-y^3));
pdec = method(TypicalValue => Ideal)
pdec(Ideal,ZZ) := Ideal => (I,n) -> (
    assI := associatedPrimes(I);
    decomp := primaryDecomposition power(I,n);
    intersect select(decomp, a -> any(assI, i -> radical a==i)))
t = timing pdec(I,n);
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close

--sat Fermat
--k = QQ
--n = 2
--also k = ZZ/p and n=p for p = 17,19,23
restart
k =QQ
n = 2
R = k[x,y,z]
I = ideal(x*(y^3-z^3),y*(z^3-x^3),z*(x^3-y^3));
t = timing saturate(I^(n));
g = openOutAppend "res"
g << t#0 << endl
g << "&" << endl << close

--charp Fermat
--k = ZZ/7, ZZ/101
--n = 2, 3, 10



--BLOCK n=3

--pdec Fermat
--k = QQ
--n = 3
restart
k =QQ
n = 3
R = k[x,y,z]
I = ideal(x*(y^3-z^3),y*(z^3-x^3),z*(x^3-y^3));
pdec = method(TypicalValue => Ideal)
pdec(Ideal,ZZ) := Ideal => (I,n) -> (
    assI := associatedPrimes(I);
    decomp := primaryDecomposition power(I,n);
    intersect select(decomp, a -> any(assI, i -> radical a==i)))
t = timing pdec(I,n);
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close

--sat Fermat
--k = QQ
--n = 3

restart
k =QQ
n = 3
R = k[x,y,z]
I = ideal(x*(y^3-z^3),y*(z^3-x^3),z*(x^3-y^3));
t = timing saturate(I^(n));
g = openOutAppend "res"
g << t#0 << endl
g << "&" << endl << close

--charp Fermat
--k = QQ
--n = 3



--BLOCK n=10


--pdec Fermat
--k = QQ
--n = 10
restart
k =QQ
n = 10
R = k[x,y,z]
I = ideal(x*(y^3-z^3),y*(z^3-x^3),z*(x^3-y^3));
pdec = method(TypicalValue => Ideal)
pdec(Ideal,ZZ) := Ideal => (I,n) -> (
    assI := associatedPrimes(I);
    decomp := primaryDecomposition power(I,n);
    intersect select(decomp, a -> any(assI, i -> radical a==i)))
t = timing pdec(I,n);
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close

--sat Fermat
--k = QQ
--n = 10
restart
k =QQ
n = 10
R = k[x,y,z]
I = ideal(x*(y^3-z^3),y*(z^3-x^3),z*(x^3-y^3));
t = timing saturate(I^(n));
g = openOutAppend "res"
g << t#0 << endl
g << "\\" << "\\" << endl << close

--charp Fermat
--k = QQ
--n = 10


--START ROW
--k=ZZ/7
--START BLOCK
--n=2

--pdec Fermat
--k = ZZ/7
--n = 2
restart
k = ZZ/7
n = 2
R = k[x,y,z]
I = ideal(x*(y^3-z^3),y*(z^3-x^3),z*(x^3-y^3));
pdec = method(TypicalValue => Ideal)
pdec(Ideal,ZZ) := Ideal => (I,n) -> (
    assI := associatedPrimes(I);
    decomp := primaryDecomposition power(I,n);
    intersect select(decomp, a -> any(assI, i -> radical a==i)))
t = timing pdec(I,n);
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close

--sat Fermat
--k = ZZ/7
--n = 2
--also k = ZZ/p and n=p for p = 17,19,23
restart
k =ZZ/7
n = 2
R = k[x,y,z]
I = ideal(x*(y^3-z^3),y*(z^3-x^3),z*(x^3-y^3));
t = timing saturate(I^(n));
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close

--charp Fermat
--k = ZZ/7
--n = 2

restart
k = ZZ/7
n = 2
R = k[x,y,z]
I = ideal(x*(y^3-z^3),y*(z^3-x^3),z*(x^3-y^3));
frobeniusPower = method(TypicalValue => Ideal)
frobeniusPower(Ideal,ZZ) := Ideal => (I,q) -> 
ideal(apply(flatten entries gens I, i -> i^q))
bigHeight = method(TypicalValue => ZZ)
bigHeight(Ideal) := ZZ => I -> (if isPrimary(I) then codim(I) else 
    (R := ring I; 
	d := dim R; 
	c := codim I; 
	M := R^1/I; 
	ans := d;
	scan(reverse toList (c .. d), 
	    i -> (if codim Ext^i(M,R) == i then (ans = i; break)));
	ans    	    	
	)
    )
charp = method()
charp(Ideal,ZZ) := Ideal => (I,n) -> (
R := ring I; p := char R;
h := bigHeight I;
(e := ceiling(log_p n); 
q := p^e; c := q-1; d := h*c-n+1; 
J:= I^d;
(frobeniusPower(I,q)):J))
t = timing charp(I,n);
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close
--BLOCK n=3

--pdec Fermat
--k = ZZ/7
--n = 3
restart
k =ZZ/7
n = 3
R = k[x,y,z]
I = ideal(x*(y^3-z^3),y*(z^3-x^3),z*(x^3-y^3));
pdec = method(TypicalValue => Ideal)
pdec(Ideal,ZZ) := Ideal => (I,n) -> (
    assI := associatedPrimes(I);
    decomp := primaryDecomposition power(I,n);
    intersect select(decomp, a -> any(assI, i -> radical a==i)))
t = timing pdec(I,n);
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close


--sat Fermat
--k = ZZ/7
--n = 3

restart
k =ZZ/7
n = 3
R = k[x,y,z]
I = ideal(x*(y^3-z^3),y*(z^3-x^3),z*(x^3-y^3));
t = timing saturate(I^(n));
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close

--charp Fermat
--k = ZZ/7
--n = 3

restart
k = ZZ/7
n = 3
R = k[x,y,z]
I = ideal(x*(y^3-z^3),y*(z^3-x^3),z*(x^3-y^3));
frobeniusPower = method(TypicalValue => Ideal)
frobeniusPower(Ideal,ZZ) := Ideal => (I,q) -> 
ideal(apply(flatten entries gens I, i -> i^q))
bigHeight = method(TypicalValue => ZZ)
bigHeight(Ideal) := ZZ => I -> (if isPrimary(I) then codim(I) else 
    (R := ring I; 
	d := dim R; 
	c := codim I; 
	M := R^1/I; 
	ans := d;
	scan(reverse toList (c .. d), 
	    i -> (if codim Ext^i(M,R) == i then (ans = i; break)));
	ans    	    	
	)
    )
charp = method()
charp(Ideal,ZZ) := Ideal => (I,n) -> (
R := ring I; p := char R;
h := bigHeight I;
(e := ceiling(log_p n); 
q := p^e; c := q-1; d := h*c-n+1; 
J:= I^d;
(frobeniusPower(I,q)):J))
t = timing charp(I,n);
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close


--BLOCK n=10


--pdec Fermat
--k = ZZ/7
--n = 10
restart
k =ZZ/7
n = 10
R = k[x,y,z]
I = ideal(x*(y^3-z^3),y*(z^3-x^3),z*(x^3-y^3));
pdec = method(TypicalValue => Ideal)
pdec(Ideal,ZZ) := Ideal => (I,n) -> (
    assI := associatedPrimes(I);
    decomp := primaryDecomposition power(I,n);
    intersect select(decomp, a -> any(assI, i -> radical a==i)))
t = timing pdec(I,n)
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close

--sat Fermat
--k = ZZ/7
--n = 10

restart
k =ZZ/7
n = 10
R = k[x,y,z]
I = ideal(x*(y^3-z^3),y*(z^3-x^3),z*(x^3-y^3));
t = timing saturate(I^(n));
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close

--charp Fermat
--k = ZZ/7
--n = 10

restart
k = ZZ/7
n = 10
R = k[x,y,z]
I = ideal(x*(y^3-z^3),y*(z^3-x^3),z*(x^3-y^3));
frobeniusPower = method(TypicalValue => Ideal)
frobeniusPower(Ideal,ZZ) := Ideal => (I,q) -> 
ideal(apply(flatten entries gens I, i -> i^q))
bigHeight = method(TypicalValue => ZZ)
bigHeight(Ideal) := ZZ => I -> (if isPrimary(I) then codim(I) else 
    (R := ring I; 
	d := dim R; 
	c := codim I; 
	M := R^1/I; 
	ans := d;
	scan(reverse toList (c .. d), 
	    i -> (if codim Ext^i(M,R) == i then (ans = i; break)));
	ans    	    	
	)
    )
charp = method()
charp(Ideal,ZZ) := Ideal => (I,n) -> (
R := ring I; p := char R;
h := bigHeight I;
(e := ceiling(log_p n); 
q := p^e; c := q-1; d := h*c-n+1; 
J:= I^d;
(frobeniusPower(I,q)):J))
t = timing charp(I,n);
g = openOutAppend "res"
g << t#0 << endl
g << "\\" << "\\" << endl << close

--START ROW
--k=ZZ/101
--START BLOCK
--n=2

--pdec Fermat
--k = ZZ/101
--n = 2
restart
k = ZZ/101
n = 2
R = k[x,y,z]
I = ideal(x*(y^3-z^3),y*(z^3-x^3),z*(x^3-y^3));
pdec = method(TypicalValue => Ideal)
pdec(Ideal,ZZ) := Ideal => (I,n) -> (
    assI := associatedPrimes(I);
    decomp := primaryDecomposition power(I,n);
    intersect select(decomp, a -> any(assI, i -> radical a==i)))
t = timing pdec(I,n)
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close

--sat Fermat
--k = ZZ/101
--n = 2
--also k = ZZ/p and n=p for p = 17,19,23
restart
k =QQ
n = 2
R = k[x,y,z]
I = ideal(x*(y^3-z^3),y*(z^3-x^3),z*(x^3-y^3));
t = timing saturate(I^(n));
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close

--charp Fermat
--k = ZZ/101
--n = 2

restart
k = ZZ/101
n = 2
R = k[x,y,z]
I = ideal(x*(y^3-z^3),y*(z^3-x^3),z*(x^3-y^3));
frobeniusPower = method(TypicalValue => Ideal)
frobeniusPower(Ideal,ZZ) := Ideal => (I,q) -> 
ideal(apply(flatten entries gens I, i -> i^q))
bigHeight = method(TypicalValue => ZZ)
bigHeight(Ideal) := ZZ => I -> (if isPrimary(I) then codim(I) else 
    (R := ring I; 
	d := dim R; 
	c := codim I; 
	M := R^1/I; 
	ans := d;
	scan(reverse toList (c .. d), 
	    i -> (if codim Ext^i(M,R) == i then (ans = i; break)));
	ans    	    	
	)
    )
charp = method()
charp(Ideal,ZZ) := Ideal => (I,n) -> (
R := ring I; p := char R;
h := bigHeight I;
(e := ceiling(log_p n); 
q := p^e; c := q-1; d := h*c-n+1; 
J:= I^d;
(frobeniusPower(I,q)):J))
t = timing charp(I,n);
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close

--BLOCK n=3

--pdec Fermat
--k = ZZ/101
--n = 3
restart
k =ZZ/101
n = 3
R = k[x,y,z]
I = ideal(x*(y^3-z^3),y*(z^3-x^3),z*(x^3-y^3));
pdec = method(TypicalValue => Ideal)
pdec(Ideal,ZZ) := Ideal => (I,n) -> (
    assI := associatedPrimes(I);
    decomp := primaryDecomposition power(I,n);
    intersect select(decomp, a -> any(assI, i -> radical a==i)))
t = timing pdec(I,n)
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close

--sat Fermat
--k = ZZ/101
--n = 3

restart
k =ZZ/101
n = 3
R = k[x,y,z]
I = ideal(x*(y^3-z^3),y*(z^3-x^3),z*(x^3-y^3));
t = timing saturate(I^(n));
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close

--charp Fermat
--k = ZZ/101
--n = 3

restart
k = ZZ/101
n = 3
R = k[x,y,z]
I = ideal(x*(y^3-z^3),y*(z^3-x^3),z*(x^3-y^3));
frobeniusPower = method(TypicalValue => Ideal)
frobeniusPower(Ideal,ZZ) := Ideal => (I,q) -> 
ideal(apply(flatten entries gens I, i -> i^q))
bigHeight = method(TypicalValue => ZZ)
bigHeight(Ideal) := ZZ => I -> (if isPrimary(I) then codim(I) else 
    (R := ring I; 
	d := dim R; 
	c := codim I; 
	M := R^1/I; 
	ans := d;
	scan(reverse toList (c .. d), 
	    i -> (if codim Ext^i(M,R) == i then (ans = i; break)));
	ans    	    	
	)
    )
charp = method()
charp(Ideal,ZZ) := Ideal => (I,n) -> (
R := ring I; p := char R;
h := bigHeight I;
(e := ceiling(log_p n); 
q := p^e; c := q-1; d := h*c-n+1; 
J:= I^d;
(frobeniusPower(I,q)):J))
t = timing charp(I,n);
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close


--BLOCK n=10


--pdec Fermat
--k = ZZ/101
--n = 10
restart
k =ZZ/101
n = 10
R = k[x,y,z]
I = ideal(x*(y^3-z^3),y*(z^3-x^3),z*(x^3-y^3));
pdec = method(TypicalValue => Ideal)
pdec(Ideal,ZZ) := Ideal => (I,n) -> (
    assI := associatedPrimes(I);
    decomp := primaryDecomposition power(I,n);
    intersect select(decomp, a -> any(assI, i -> radical a==i)))
t = timing pdec(I,n)
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close

--sat Fermat
--k = ZZ/101
--n = 10

restart
k =ZZ/101
n = 10
R = k[x,y,z]
I = ideal(x*(y^3-z^3),y*(z^3-x^3),z*(x^3-y^3));
t = timing saturate(I^(n));
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close
--charp Fermat
--k = ZZ/101
--n = 10

restart
k = ZZ/101
n = 10
R = k[x,y,z]
I = ideal(x*(y^3-z^3),y*(z^3-x^3),z*(x^3-y^3));
frobeniusPower = method(TypicalValue => Ideal)
frobeniusPower(Ideal,ZZ) := Ideal => (I,q) -> 
ideal(apply(flatten entries gens I, i -> i^q))
bigHeight = method(TypicalValue => ZZ)
bigHeight(Ideal) := ZZ => I -> (if isPrimary(I) then codim(I) else 
    (R := ring I; 
	d := dim R; 
	c := codim I; 
	M := R^1/I; 
	ans := d;
	scan(reverse toList (c .. d), 
	    i -> (if codim Ext^i(M,R) == i then (ans = i; break)));
	ans    	    	
	)
    )
charp = method()
charp(Ideal,ZZ) := Ideal => (I,n) -> (
R := ring I; p := char R;
h := bigHeight I;
(e := ceiling(log_p n); 
q := p^e; c := q-1; d := h*c-n+1; 
J:= I^d;
(frobeniusPower(I,q)):J))
t = timing charp(I,n);
g = openOutAppend "res"
g << t#0 << endl
g << "\\" << "\\" << endl << close


--OTHER IDEAL
--OTHER IDEAL
--OTHER IDEAL
--OTHER IDEAL

--START ROW
--k=QQ
--START BLOCK
--n=2

--pdec t^3, t^4, t^5
--k = QQ
--n = 2
--also k = ZZ/p and n=p for p = 17,19,23
restart
k = QQ
n = 2
R = k[x,y,z]
I = ideal(x^3-y*z,y^2-x*z,z^2-x^2*y);
pdec = method(TypicalValue => Ideal)
pdec(Ideal,ZZ) := Ideal => (I,n) -> (
    assI := associatedPrimes(I);
    decomp := primaryDecomposition power(I,n);
    intersect select(decomp, a -> any(assI, i -> radical a==i)))
t = timing pdec(I,n)
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close

--sat t^3,t^4,t^5
--k = QQ
--n = 2
--also k = ZZ/p and n=p for p = 17,19,23
restart
k =QQ
n =2
R = k[x,y,z]
I = ideal(x^3-y*z,y^2-x*z,z^2-x^2*y);
t = timing saturate(I^(n));
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close
--charp t^3,t^4,t^5
--k = ZZ/7, ZZ/101
--n = 2, 3, 10

--START BLOCK
--n=3

--pdec t^3, t^4, t^5
--k = QQ
--n = 3
--also k = ZZ/p and n=p for p = 17,19,23
restart
k = QQ
n = 3
R = k[x,y,z]
I = ideal(x^3-y*z,y^2-x*z,z^2-x^2*y);
pdec = method(TypicalValue => Ideal)
pdec(Ideal,ZZ) := Ideal => (I,n) -> (
    assI := associatedPrimes(I);
    decomp := primaryDecomposition power(I,n);
    intersect select(decomp, a -> any(assI, i -> radical a==i)))
t = timing pdec(I,n)
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close

--sat t^3,t^4,t^5
--k = QQ
--n = 3
--also k = ZZ/p and n=p for p = 17,19,23
restart
k =
n =
R = k[x,y,z]
I = ideal(x^3-y*z,y^2-x*z,z^2-x^2*y);
t = timing saturate(I^(n));
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close
--charp t^3,t^4,t^5
--k = ZZ/7, ZZ/101
--n = 2, 3, 10


--START BLOCK
--n=10

--pdec t^3, t^4, t^5
--k = QQ
--n = 10
--also k = ZZ/p and n=p for p = 17,19,23
restart
k = QQ
n = 10
R = k[x,y,z]
I = ideal(x^3-y*z,y^2-x*z,z^2-x^2*y);
pdec = method(TypicalValue => Ideal)
pdec(Ideal,ZZ) := Ideal => (I,n) -> (
    assI := associatedPrimes(I);
    decomp := primaryDecomposition power(I,n);
    intersect select(decomp, a -> any(assI, i -> radical a==i)))
t = timing pdec(I,n)
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close

--sat t^3,t^4,t^5
--k = QQ
--n = 10
--also k = ZZ/p and n=p for p = 17,19,23
restart
k = QQ
n = 10
R = k[x,y,z]
I = ideal(x^3-y*z,y^2-x*z,z^2-x^2*y);
t = timing saturate(I^(n));
g = openOutAppend "res"
g << t#0 << endl
g << "\\" << "\\" << endl << close
--charp t^3,t^4,t^5
--k = ZZ/7, ZZ/101
--n = 2, 3, 10


--START ROW
--k=ZZ/7
--START BLOCK
--n=2

--pdec t^3, t^4, t^5
--k = ZZ/7
--n = 2
--also k = ZZ/p and n=p for p = 17,19,23
restart
k = ZZ/7
n = 2
R = k[x,y,z]
I = ideal(x^3-y*z,y^2-x*z,z^2-x^2*y);
pdec = method(TypicalValue => Ideal)
pdec(Ideal,ZZ) := Ideal => (I,n) -> (
    assI := associatedPrimes(I);
    decomp := primaryDecomposition power(I,n);
    intersect select(decomp, a -> any(assI, i -> radical a==i)))
t = timing pdec(I,n)
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close

--sat t^3,t^4,t^5
--k = ZZ/7
--n = 2
--also k = ZZ/p and n=p for p = 17,19,23
restart
k = ZZ/7
n = 2
R = k[x,y,z]
I = ideal(x^3-y*z,y^2-x*z,z^2-x^2*y);
t = timing saturate(I^(n));
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close

--charp t^3,t^4,t^5
--k = ZZ/7
--n = 2
restart
k = ZZ/7
n =  2
R = k[x,y,z]
I = ideal(x^3-y*z,y^2-x*z,z^2-x^2*y);
frobeniusPower = method(TypicalValue => Ideal)
frobeniusPower(Ideal,ZZ) := Ideal => (I,q) -> 
ideal(apply(flatten entries gens I, i -> i^q))
bigHeight = method(TypicalValue => ZZ)
bigHeight(Ideal) := ZZ => I -> (if isPrimary(I) then codim(I) else 
    (R := ring I; 
	d := dim R; 
	c := codim I; 
	M := R^1/I; 
	ans := d;
	scan(reverse toList (c .. d), 
	    i -> (if codim Ext^i(M,R) == i then (ans = i; break)));
	ans    	    	
	)
    )
charp = method()
charp(Ideal,ZZ) := Ideal => (I,n) -> (
R := ring I; p := char R;
h := bigHeight I;
(e := ceiling(log_p n); 
q := p^e; c := q-1; d := h*c-n+1; 
J:= I^d;
(frobeniusPower(I,q)):J))
t = timing charp(I,n);
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close
--START BLOCK
--n=3

--pdec t^3, t^4, t^5
--k = ZZ/7
--n = 3
--also k = ZZ/p and n=p for p = 17,19,23
restart
k = ZZ/7
n = 3
R = k[x,y,z]
I = ideal(x^3-y*z,y^2-x*z,z^2-x^2*y);
pdec = method(TypicalValue => Ideal)
pdec(Ideal,ZZ) := Ideal => (I,n) -> (
    assI := associatedPrimes(I);
    decomp := primaryDecomposition power(I,n);
    intersect select(decomp, a -> any(assI, i -> radical a==i)))
t = timing pdec(I,n)
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close

--sat t^3,t^4,t^5
--k = ZZ/7
--n = 3
--also k = ZZ/p and n=p for p = 17,19,23
restart
k = ZZ/7
n = 3
R = k[x,y,z]
I = ideal(x^3-y*z,y^2-x*z,z^2-x^2*y);
t = timing saturate(I^(n));
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close

--charp t^3,t^4,t^5
--k = ZZ/7
--n = 3
restart
k = ZZ/7
n =  3
R = k[x,y,z]
I = ideal(x^3-y*z,y^2-x*z,z^2-x^2*y);
frobeniusPower = method(TypicalValue => Ideal)
frobeniusPower(Ideal,ZZ) := Ideal => (I,q) -> 
ideal(apply(flatten entries gens I, i -> i^q))
bigHeight = method(TypicalValue => ZZ)
bigHeight(Ideal) := ZZ => I -> (if isPrimary(I) then codim(I) else 
    (R := ring I; 
	d := dim R; 
	c := codim I; 
	M := R^1/I; 
	ans := d;
	scan(reverse toList (c .. d), 
	    i -> (if codim Ext^i(M,R) == i then (ans = i; break)));
	ans    	    	
	)
    )
charp = method()
charp(Ideal,ZZ) := Ideal => (I,n) -> (
R := ring I; p := char R;
h := bigHeight I;
(e := ceiling(log_p n); 
q := p^e; c := q-1; d := h*c-n+1; 
J:= I^d;
(frobeniusPower(I,q)):J))
t = timing charp(I,n);
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close


--START BLOCK
--n=10

--pdec t^3, t^4, t^5
--k = ZZ/7
--n = 10
--also k = ZZ/p and n=p for p = 17,19,23
restart
k = ZZ/7
n = 10
R = k[x,y,z]
I = ideal(x^3-y*z,y^2-x*z,z^2-x^2*y);
pdec = method(TypicalValue => Ideal)
pdec(Ideal,ZZ) := Ideal => (I,n) -> (
    assI := associatedPrimes(I);
    decomp := primaryDecomposition power(I,n);
    intersect select(decomp, a -> any(assI, i -> radical a==i)))
t = timing pdec(I,n)
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close

--sat t^3,t^4,t^5
--k = ZZ/7
--n = 10
--also k = ZZ/p and n=p for p = 17,19,23
restart
k = ZZ/7
n = 10
R = k[x,y,z]
I = ideal(x^3-y*z,y^2-x*z,z^2-x^2*y);
t = timing saturate(I^(n));
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close

--charp t^3,t^4,t^5
--k = ZZ/7
--n = 10
restart
k = ZZ/7
n =  10
R = k[x,y,z]
I = ideal(x^3-y*z,y^2-x*z,z^2-x^2*y);
frobeniusPower = method(TypicalValue => Ideal)
frobeniusPower(Ideal,ZZ) := Ideal => (I,q) -> 
ideal(apply(flatten entries gens I, i -> i^q))
bigHeight = method(TypicalValue => ZZ)
bigHeight(Ideal) := ZZ => I -> (if isPrimary(I) then codim(I) else 
    (R := ring I; 
	d := dim R; 
	c := codim I; 
	M := R^1/I; 
	ans := d;
	scan(reverse toList (c .. d), 
	    i -> (if codim Ext^i(M,R) == i then (ans = i; break)));
	ans    	    	
	)
    )
charp = method()
charp(Ideal,ZZ) := Ideal => (I,n) -> (
R := ring I; p := char R;
h := bigHeight I;
(e := ceiling(log_p n); 
q := p^e; c := q-1; d := h*c-n+1; 
J:= I^d;
(frobeniusPower(I,q)):J))
t = timing charp(I,n);
g = openOutAppend "res"
g << t#0 << endl
g << "\\" << "\\" << endl << close


--START ROW
--k=ZZ/101
--START BLOCK
--n=2

--pdec t^3, t^4, t^5
--k = ZZ/101
--n = 2
--also k = ZZ/p and n=p for p = 17,19,23
restart
k = ZZ/101
n = 2
R = k[x,y,z]
I = ideal(x^3-y*z,y^2-x*z,z^2-x^2*y);
pdec = method(TypicalValue => Ideal)
pdec(Ideal,ZZ) := Ideal => (I,n) -> (
    assI := associatedPrimes(I);
    decomp := primaryDecomposition power(I,n);
    intersect select(decomp, a -> any(assI, i -> radical a==i)))
t = timing pdec(I,n)
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close

--sat t^3,t^4,t^5
--k = ZZ/101
--n = 2
--also k = ZZ/p and n=p for p = 17,19,23
restart
k = ZZ/101
n = 2
R = k[x,y,z]
I = ideal(x^3-y*z,y^2-x*z,z^2-x^2*y);
t = timing saturate(I^(n));
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close

--charp t^3,t^4,t^5
--k = ZZ/101
--n = 2
restart
k = ZZ/101
n =  2
R = k[x,y,z]
I = ideal(x^3-y*z,y^2-x*z,z^2-x^2*y);
frobeniusPower = method(TypicalValue => Ideal)
frobeniusPower(Ideal,ZZ) := Ideal => (I,q) -> 
ideal(apply(flatten entries gens I, i -> i^q))
bigHeight = method(TypicalValue => ZZ)
bigHeight(Ideal) := ZZ => I -> (if isPrimary(I) then codim(I) else 
    (R := ring I; 
	d := dim R; 
	c := codim I; 
	M := R^1/I; 
	ans := d;
	scan(reverse toList (c .. d), 
	    i -> (if codim Ext^i(M,R) == i then (ans = i; break)));
	ans    	    	
	)
    )
charp = method()
charp(Ideal,ZZ) := Ideal => (I,n) -> (
R := ring I; p := char R;
h := bigHeight I;
(e := ceiling(log_p n); 
q := p^e; c := q-1; d := h*c-n+1; 
J:= I^d;
(frobeniusPower(I,q)):J))
t = timing charp(I,n);
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close
--START BLOCK
--n=3

--pdec t^3, t^4, t^5
--k = ZZ/101
--n = 3
--also k = ZZ/p and n=p for p = 17,19,23
restart
k = ZZ/101
n = 3
R = k[x,y,z]
I = ideal(x^3-y*z,y^2-x*z,z^2-x^2*y);
pdec = method(TypicalValue => Ideal)
pdec(Ideal,ZZ) := Ideal => (I,n) -> (
    assI := associatedPrimes(I);
    decomp := primaryDecomposition power(I,n);
    intersect select(decomp, a -> any(assI, i -> radical a==i)))
t = timing pdec(I,n)
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close

--sat t^3,t^4,t^5
--k = ZZ/101
--n = 3
--also k = ZZ/p and n=p for p = 17,19,23
restart
k = ZZ/101
n = 3
R = k[x,y,z]
I = ideal(x^3-y*z,y^2-x*z,z^2-x^2*y);
t = timing saturate(I^(n));
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close

--charp t^3,t^4,t^5
--k = ZZ/101
--n = 3
restart
k = ZZ/101
n =  3
R = k[x,y,z]
I = ideal(x^3-y*z,y^2-x*z,z^2-x^2*y);
frobeniusPower = method(TypicalValue => Ideal)
frobeniusPower(Ideal,ZZ) := Ideal => (I,q) -> 
ideal(apply(flatten entries gens I, i -> i^q))
bigHeight = method(TypicalValue => ZZ)
bigHeight(Ideal) := ZZ => I -> (if isPrimary(I) then codim(I) else 
    (R := ring I; 
	d := dim R; 
	c := codim I; 
	M := R^1/I; 
	ans := d;
	scan(reverse toList (c .. d), 
	    i -> (if codim Ext^i(M,R) == i then (ans = i; break)));
	ans    	    	
	)
    )
charp = method()
charp(Ideal,ZZ) := Ideal => (I,n) -> (
R := ring I; p := char R;
h := bigHeight I;
(e := ceiling(log_p n); 
q := p^e; c := q-1; d := h*c-n+1; 
J:= I^d;
(frobeniusPower(I,q)):J))
t = timing charp(I,n);
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close


--START BLOCK
--n=10

--pdec t^3, t^4, t^5
--k = ZZ/101
--n = 10
--also k = ZZ/p and n=p for p = 17,19,23
restart
k = ZZ/101
n = 10
R = k[x,y,z]
I = ideal(x^3-y*z,y^2-x*z,z^2-x^2*y);
pdec = method(TypicalValue => Ideal)
pdec(Ideal,ZZ) := Ideal => (I,n) -> (
    assI := associatedPrimes(I);
    decomp := primaryDecomposition power(I,n);
    intersect select(decomp, a -> any(assI, i -> radical a==i)))
t = timing pdec(I,n)
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close

--sat t^3,t^4,t^5
--k = ZZ/101
--n = 10
--also k = ZZ/p and n=p for p = 17,19,23
restart
k = ZZ/101
n = 10
R = k[x,y,z]
I = ideal(x^3-y*z,y^2-x*z,z^2-x^2*y);
t = timing saturate(I^(n));
g = openOutAppend "res"
g << t#0 << endl 
g << "&" << endl << close

--charp t^3,t^4,t^5
--k = ZZ/101
--n = 10
restart
k = ZZ/101
n =  10
R = k[x,y,z]
I = ideal(x^3-y*z,y^2-x*z,z^2-x^2*y);
frobeniusPower = method(TypicalValue => Ideal)
frobeniusPower(Ideal,ZZ) := Ideal => (I,q) -> 
ideal(apply(flatten entries gens I, i -> i^q))
bigHeight = method(TypicalValue => ZZ)
bigHeight(Ideal) := ZZ => I -> (if isPrimary(I) then codim(I) else 
    (R := ring I; 
	d := dim R; 
	c := codim I; 
	M := R^1/I; 
	ans := d;
	scan(reverse toList (c .. d), 
	    i -> (if codim Ext^i(M,R) == i then (ans = i; break)));
	ans    	    	
	)
    )
charp = method()
charp(Ideal,ZZ) := Ideal => (I,n) -> (
R := ring I; p := char R;
h := bigHeight I;
(e := ceiling(log_p n); 
q := p^e; c := q-1; d := h*c-n+1; 
J:= I^d;
(frobeniusPower(I,q)):J))
t = timing charp(I,n);
g = openOutAppend "res"
g << t#0 << endl 
g << "END" << endl << close