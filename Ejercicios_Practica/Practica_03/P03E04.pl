% 4. Transformar una cadena en una lista de caracteres.

menu:-
    write('ingrese una cadena para convertir en lista'),
    read(Cad),
    toList(Cad,List),
    write(List).

toList('',[]).
toList(Cad,[H|T]):-
    sub_atom(Cad, 0, 1, _, H),
    sub_atom(Cad, 1, _, 0, NewCad),
    toList(NewCad,T).
    
    