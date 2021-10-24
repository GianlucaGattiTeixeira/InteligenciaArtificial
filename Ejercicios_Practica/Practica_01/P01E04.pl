hombre(edo).
hombre(adrian).
hombre(gianluca).
hombre(jaime).
hombre(alexei).
mujer(josefa).
mujer(ileana).
mujer(ximena).
mujer(sandra).
mujer(fabiana).
mujer(marcela).
mujer(paula).
mujer(mara).

padres( adrian, josefa, edo).
padres( fabiana, josefa, edo).
padres( marcela, josefa, edo).

padres(sandra, ileana, jaime).
padres(ximena, ileana, jaime).
padres(alexei, ileana, jaime).

padres( gianluca, sandra, adrian).

padres( paula, ximena,chileno).

padres(mara, gisela, alexei).
% Y es hermana de X
hermana(X,Y) :-
    padres(X,M,P), padres(Y,M,P), mujer(Y),  X\=Y.

% Y es abuelo de X
abuelo(X,Y):-
    hombre(Y), padres(X,_,P), padres(P,_,Y).
abuelo(X,Y) :-
    hombre(Y), padres(X,M,_), padres(M,_,Y).

%  Y es nieto de X
nieto(X,Y) :-
    hombre(Y), padres(M,X,_), padres(Y,M,_).
nieto(X,Y) :-
    hombre(Y), padres(M,_,X), padres(Y,M,_).
nieto(X,Y) :-
    hombre(Y), padres(P,X,_), padres(Y,_,P).
nieto(X,Y) :-
    hombre(Y), padres(P,_,X), padres(Y,_,P).

% Y es nieta de X
nieta(X,Y) :-
    mujer(Y), padres(M,X,_), padres(Y,M,_).
nieta(X,Y) :-
    mujer(Y), padres(M,_,X), padres(Y,M,_).
nieta(X,Y) :-
    mujer(Y), padres(P,X,_), padres(Y,_,P).
nieta(X,Y) :-
    mujer(Y), padres(P,_,X), padres(Y,_,P).

% Y es tia de X

tia(X,Y):-
    padres(X,M,_), hermana(M,Y).
tia(X,Y):-
    padres(X,_,P), hermana(P,Y).

% tia(X,Y):-
%     mujer(Y), padres(X,M,_),padres(M,MM,PP),padres(Y,MM,PP), M\=Y.
% tia(X,Y):-
%     mujer(Y), padres(X,_,P),padres(P,MM,PP),padres(Y,MM,PP), P\=Y.








