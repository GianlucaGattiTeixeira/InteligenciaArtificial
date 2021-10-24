% 10. Ingresar una lista y un elemento e informar si ese elemento está en la
% lista.

leer([H|T]):-
    write('ingrese un numero para añadir a la lista o [] para finalizar '),
    read(H),
    H \= [],
    leer(T).
leer([]).

menu:-
    leer(Lista),
    nl,
    write('ingrese un elemento para verificar su pertenencia: '),
    read(Elem),
    nl,
    existeEnLista(Lista,Elem).

existeEnLista(Lista,E):-
    pertenece(Lista,E),
    nl, write('el elemento existe en la lista ').
existeEnLista(_,_):-
    nl, write('el elemento no existe en la lista ').

pertenece([H|_],H).
pertenece([_|T], Elem):-
    pertenece(T,Elem).

