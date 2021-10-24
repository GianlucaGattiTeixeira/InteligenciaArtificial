% agregarAgregar a lista

% repetidos([H|T],[H|TR]):-
%     existe(T,H),
%     repetidos(T,TR).
%   repetidos([_|T],TR):-
%     repetidos(T,TR).
  
%   existe([H|_],H).
%   existe([_|T],H):-
%     existe(T,H).

rep_elements([], []).
% rep_elements([H|T], Z) :-
%     not(member(T,H)),
%     rep_elements(T,Z).
rep_elements([H|T], [H|Z]) :-
   member(H, T),
    rep_elements(T, Z).



se_repite([],[]).
se_repite([H|T],[H|T2]):-
    pertenece(H,T),
    se_repite(T,T2).
%si no existe H en T entra en el siguiente predicado
se_repite([_|T],Rep):-
    se_repite(T,Rep).

pertenece(X,[X|_]).
pertenece(X,[_|T]):-
    pertenece(X,T).

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


