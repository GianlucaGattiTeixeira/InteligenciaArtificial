% 15. Ingresar una lista y determinar a través de una segunda lista todos los
% elementos que se repiten.

% repetidos([H|T], L2):-
%     pertenece(L2,H),
%     repetidos(T,L2).
repetidos([],[]).
repetidos([H|T],[H|TL2]):-
    % not(member(H,TL2)),
    member(H,T),
    repetidos(T,TL2).
repetidos([_|T],L2):-
    repetidos(T,L2).

% repetidos([H|T],[H|TR]):-
%     pertenece(T,H),
%     repetidos(T,TR).
% repetidos([_|T],TR):-
%   repetidos(T,TR). 

pertenece([H|_],H).
pertenece([_|T],Elem):-
    pertenece(T,Elem).
