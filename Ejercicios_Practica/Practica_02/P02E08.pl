% 8. Ingresar una lista de números enteros e informar cuánto da la
% sumatoria de ellos.

leer([H|T]):-
    write('ingrese un numero para añadir a la lista o [] para finalizar'),
    read(H),
    H \= [],
    leer(T).
leer([]).

menu:-
    leer(Lista),
    sumatoria(Lista, Cant),
    nl,
    write('La sumatoria de la lista es: '), write(Cant).

sumatoria([X],X).
sumatoria([H|T],Sumatoria):-
    sumatoria(T,SumAnt),
    Sumatoria is SumAnt + H.