% 9. Ingresar una lista de números enteros y calcular su promedio. Respetar
% el formato del predicado promedio(L,S,C) donde L es la lista ingresada,
% S la sumatoria y C el contador de los elementos de la lista.

leer([H|T]):-
    write('ingrese un numero para añadir a la lista o [] para finalizar'),
    read(H),
    H \= [],
    leer(T).
leer([]).

menu:-
    leer(Lista),
    sumatoriaYContar(Lista, Sumatoria, Cant),
    nl,
    Promedio is Sumatoria / Cant,
    write('La sumatoria de la lista es: '), write(Sumatoria), write(', la cantidad de elementos es: '), write(Cant), write(', El promedio es: '), write(Promedio).

sumatoriaYContar([X], X, 1).
sumatoriaYContar([H|T], Sumatoria, Cant):-
    sumatoriaYContar(T, SumatoriaAnt, CantAnt),
    Sumatoria is SumatoriaAnt + H,
    Cant is CantAnt + 1.