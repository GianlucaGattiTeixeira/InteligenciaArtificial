% 16. Ingresar una lista y un elemento e informar cuántas veces está ese
% elemento en la lista.

contarElemento([],_,0).
contarElemento([H|T],H,Cant):-
    contarElemento(T,H,CantPrev),
    Cant is CantPrev + 1.
contarElemento([_|T],Elem,Cant):-
    contarElemento(T,Elem,Cant).