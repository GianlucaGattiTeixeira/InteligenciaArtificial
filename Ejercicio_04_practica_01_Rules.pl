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

abuelo( A, B):-
    padres(A,Y,Z), (padres(Y,_,B); padres(Z,_,B)), hombre(B).


nieto( A, B):-
    padres(B,Y,Z), (padres(Y,_,A); padres(Z,_,A); padres(Y,A,_); padres(Z,A,_)).

tia(A, B):-
    mujer(B),padres(A,Y,Z), padres(Y,AAM,AOM),padres(Z,AAP,AOP),(padres(B,AAM,AOM);padres(B,AAP,AOP)),Y\=B.



