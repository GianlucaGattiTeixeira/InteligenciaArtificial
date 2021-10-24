% 14. Ingresar una lista y determinar el primer elemento que se repite.

primerRepetido([H|T], Rep):-
    pertenece(T,H),
    Rep is H.
primerRepetido([_|T],Rep):-
    primerRepetido(T,Rep).



pertenece([Elem|_],Elem).
pertenece([_|T],Elem):-
    pertenece(T,Elem).

