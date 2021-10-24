guitarrista(carolina,rosario).
guitarrista(jose,rosario).
guitarrista(jose,funes).

cantante(mariano,rosario).
cantante(silvia,funes).
cantante(mauro,funes).

baterista(eduardo,roldan).
baterista(diego,casilda).
baterista(laura,rosario).

recital(A):-
    guitarrista(_,A),cantante(_,A),baterista(_,A).
