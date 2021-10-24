% Transformar una cadena de texto en una lista de palabras, tomando
% como divisor el espacio.

menu:-
    write('ingrese una cadena para convertir en lista'),
    read(Cad),
    toListaDePalabras(Cad,List),
    write(List).

toListaDePalabras('',[]).
toListaDePalabras(Cad,[H|T]):-
    contarElementosHastaBlanco(Cad,Cant),    
    sub_atom(Cad, 0, Cant, _, H),
    % Salto is Cant + 1,
    sub_atom(Cad, Cant, _, 0, NewCad),
    toListaDePalabras(NewCad,T).
% toListaDePalabras(_,[]).

contarElementosHastaBlanco('',0).
contarElementosHastaBlanco(Cad,1):-
    sub_atom(Cad, 0, 1,_ , Sub),
    Sub = ' '.
contarElementosHastaBlanco(Cad,Cant):-
    sub_atom(Cad,1,_,0,NewCad),
    contarElementosHastaBlanco(NewCad,NewCant),
    Cant is NewCant + 1 .
    
    
% ------------- PO3 E05 del drive ---------------
inicio:-
    writeln('Ingrese una cadena: '),
    read(Cad),
    transformar(Cad,Lis),
    writeln('Transformada la cadena en lista de palabras: '),
    write(Lis).

transformar('',[]).
transformar(Cad,[H|T]):-
    sub_atom(Cad,X,_,_,' '),
    sub_atom(Cad,0,X,_,H),
    X2 is X + 1,
    sub_atom(Cad,X2,_,0,Cad_res),
    transformar(Cad_res,T).
transformar(Cad,[H|T]):-
    sub_atom(Cad,0,_,0,H),
    transformar('',T).

% ------------- FIN PO3 E05 del drive ---------------