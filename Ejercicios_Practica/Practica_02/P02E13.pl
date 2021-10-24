% 13. Ingresar dos listas de elementos, concatenarlas (los elementos deben
% ser asignados de a uno en la lista de salida) y mostrarlas en una
% tercera.

concat([],[],[]).
concat([],[H2|T2],[H2|T3]):-
    concat([],T2,T3).
concat([H1|T1],L2,[H1|T3]):-
    concat(T1,L2,T3).