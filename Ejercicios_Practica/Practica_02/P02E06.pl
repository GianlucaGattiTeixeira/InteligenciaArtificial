% Ingresar una lista de números enteros y calcular la diferencia entre el
% primero y el último de ellos.

leer([H|T]):-
    write('ingrese un numero para añadir a la lista o [] para finalizar'),
    read(H),
    H \= [],
    leer(T).
leer([]).

ultimo([U],U).
ultimo([_,T],U):-
    ultimo(T,U).

diferenciaPrimeroYUltimo([H|T], Dif):-
    ultimo([H,T],Ult),
    nl, write('ultimo es '),write(Ult), nl, 
    Dif is H - Ult.

menu:-
    leer(Lista),
    diferenciaPrimeroYUltimo(Lista, Dif),
    nl,
    write('la diferencia entre el primero y el ultimo de la lista es: '), write(Dif).