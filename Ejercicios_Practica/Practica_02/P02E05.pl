leer([H|T]):-
    write('ingrese una lista, para finalizar ingrese []'),
    read(H),
    H \= [],
    leer(T).
leer([]).

ultimoElemento([H|[]], H).
ultimoElemento([_|T], Ultimo):-
    ultimoElemento(T, Ultimo).


menu:-
    leer(Lista),
    ultimoElemento(Lista, U),
    write('El ult elemento es: '), write(U).