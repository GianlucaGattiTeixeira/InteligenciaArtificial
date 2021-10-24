% 1. Ingresar una cadena de texto y obtener el primer carácter de la misma

% sub_atom('peruca', 0, 1, After, Sub).
primerElemento(Atom, Sub):-
    sub_atom(Atom, 0, 1, _ , Sub).

