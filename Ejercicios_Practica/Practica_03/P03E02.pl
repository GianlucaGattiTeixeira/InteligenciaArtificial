% 2. Ingresar una cadena de texto y obtener el último carácter de la misma.

ultimoElemento(Atom, Sub):-
    sub_atom(Atom, _, 1, 0 , Sub).

