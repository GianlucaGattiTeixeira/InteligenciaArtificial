precede(a,c).

precede(b,d).
precede(c,d).

precede(b,f).

precede(d,e).

precede(e,h).
precede(e,i).

precede(f,g).

precede(h,j).
precede(i,j).
precede(g,j).

requiere(B,A):-
    precede(A,B).
requiere(B,A):-
    precede(X,B), requiere(A,X).


