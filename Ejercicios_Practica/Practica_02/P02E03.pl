leer([H|T]):-
    write('ingrese una lista, para finalizar ingrese []'),
    read(H),
    H \= [],
    leer(T).
leer([]).

menu:-
    leer([H|_]),
    nl,
    write('el primer elemento es '), write(H).