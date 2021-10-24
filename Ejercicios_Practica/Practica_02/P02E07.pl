% 7. Ingresar una lista de elementos e informar cuántos elementos tiene.
leer([H|T]):-
    write('ingrese un numero para añadir a la lista o [] para finalizar'),
    read(H),
    H \= [],
    leer(T).
leer([]).

contar([_], 1).
contar([_|T],Cant):-
    contar(T,CantAnt),
    Cant is CantAnt + 1.

menu:-
    leer(Lista),
    contar(Lista, Cant),
    nl,
    write('La cantidad de elementos de la lista es: '), write(Cant).