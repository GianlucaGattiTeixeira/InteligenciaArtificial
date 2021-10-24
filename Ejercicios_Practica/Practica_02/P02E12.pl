% 12. Ingresar una lista de enteros e informar cuál es el menor de todos los
% números.
leer([H|T]):-
    write('ingrese un numero para añadir a la lista o [] para finalizar '),
    read(H),
    H \= [],
    leer(T).
leer([]).

menu:-
    leer(Lista),
    menor(Lista,M),
    nl,
    write('El menor es: '),write(M).

menor([H|T],Menor):-
    menor(T,H,Menor).

menor([],Min,Min).
menor([H|T], MenorParcial,Menor):-
    H =< MenorParcial,
    menor(T,H,Menor).
menor([_|T],MenorParcial,Menor):-
    menor(T, MenorParcial,Menor).


min_list([], Min0, Min) :-
    Min = Min0.
min_list([H|T], Min0, Min) :-
    Min1 is min(H, Min0),
    min_list(T, Min1, Min).
