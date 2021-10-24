menu:-
    write('ingrese una lista, para finalizar ungrese []'),
    leer(Lista),
    nl,
    write('La lista ingresada es '),
    writeln(Lista). 

leer([H|T]):-
    read(H),
    H \= [],
    leer(T).
leer([]).