leer([H|T]):-
    write('ingrese una lista, para finalizar ingrese []'),
    read(H),
    H \= [],
    leer(T).
leer([]).

menu:-
    leer([H|[HH|_]]),
    nl,
    write('el primer elemento es '), write(H),
    write(' el segundo elemento es '), write(HH).