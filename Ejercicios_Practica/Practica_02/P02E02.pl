leer([H|T]):-
    write('ingrese una lista, para finalizar ingrese []'),
    read(H),
    H \= [],
    leer(T).
leer([]).

menu:-
    write('ingrese una lista, para finalizar ungrese []'),
    leer([H|T]),
    nl,
    write('la cabeza es '), write(H),
    nl,
    write('la cola es '), write(T).