hijo(juan,miguel).
hijo(jose,miguel).
hijo(miguel,roberto).
hijo(julio,roberto).
hijo(roberto,carlos).

descendiente(X,Y):-
    hijo(X,Y).
descendiente(X,Y):-
    hijo(X,P), descendiente(P,Y).   