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

padres( adrian, josefa, edo).
padres( fabiana, josefa, edo).
padres( marcela, josefa, edo).

padres(sandra, ileana, jaime).
padres(ximena, ileana, jaime).
padres(alexei, ileana, jaime).

padres( gianluca, sandra, adrian).

hermana(X,Y):- mujer(Y),padres(X,J,K),padres(Y,J,K),X\=Y.

%B es abuelo de A
abuelo( A, B):-
     hombre(B), padres(A,Y,_), padres(Y,_,B).
abuelo( A, B):-
     hombre(B), padres(A,_,Z),padres(Z,_,B).

%A es nieto de B
nieto( A, B):-
      padres(A,Y,_), padres(Y,_,B).
nieto( A, B):-
      padres(A,_,Z),padres(Z,_,B).
nieto( A, B):-
      padres(A,Y,_), padres(Y,B,_).
nieto( A, B):-
      padres(A,_,Z),padres(Z,B,_).

%B es tia de A
tia(A, B):-
    mujer(B),padres(A,Y,_), hermana(Y,B).
tia(A, B):-
    mujer(B),padres(A,_,Z),hermana(Z,B) .




