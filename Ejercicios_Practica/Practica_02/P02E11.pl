% 11. Ingresar una lista de enteros e informar cuál es el mayor de todos los
% números.
leer([H|T]):-
    write('ingrese un numero para añadir a la lista o [] para finalizar '),
    read(H),
    H \= [],
    leer(T).
leer([]).

menu:-
    leer(Lista),
    mayor(Lista,M),
    nl,
    write('El mayor es: '),write(M).

mayor([H|T],Mayor):-
    mayor(T,H,Mayor).

mayor([],Mayor,Mayor).
mayor([H|T],MayorPrev,Mayor):-
    H >= MayorPrev,
    mayor(T, H, Mayor).
mayor([_|T], MayorPrev, Mayor):-
    mayor(T,MayorPrev,Mayor).

