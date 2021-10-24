% Ingresar una cadena de texto e informar cuántos caracteres tiene. En
% primer lugar haciendo uso del predicado atom_length/2 y en una
% segunda instancia sin hacer uso de dicho predicado.

menu:-
    write('ingrese una cadena para que se informe cuantos caracteres tiene'),
    read(Cad),
    contarCaracteres(Cad,Cant),
    write(Cant).

contarCaracteres('',0).
contarCaracteres(Cad,Cant):-
    sub_atom(Cad, 0, _, 1, Sub),
    contarCaracteres(Sub,CantPrev),
    Cant is CantPrev + 1.

    
