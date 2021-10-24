:-dynamic(cantante/2).
:-dynamic(album/5).

abrir:-
    retractall(jardin(_,_)),
    retractall(album(_,_,_,_,_)),
    consult('C:/Users/PC/Desktop/IA/Cantantes/bd.txt').

menu:-
    abrir,
    writeln('Consigna 1'),
    writeln('Consigna 2'),
    writeln('Consigna 3'),
    writeln('Salir 4'),
    read(Opcion),
    Opcion\=4,
    ejecutar(Opcion),
    menu.
menu.

ejecutar(1):-
    writeln('Ingrese album'),
    read(Album),
    writeln('Ingrese lista de temas'),
    leer_lista(ListaTemas),
    corresponde(Album,ListaTemas,TemasCorrespondientes),
    writeln(TemasCorrespondientes).
ejecutar(2):-
    writeln('Ingrese anio'),
    read(Anio),
    albumes_anio(Anio,CantidadAlbumes),
    writeln(CantidadAlbumes).
ejecutar(3):-
    writeln('Ingrese cantante'),
    read(Cantante),
    albumes_lanzados(Cantante,Albumes),
    writeln(Albumes).

albumes_lanzados(Cantante,[H|T]):-
    cantante(Cantante,_),
    album(H,Cantante,_,_,Copias),
    Copias>1000000,
    retract(album(H,Cantante,_,_,Copias)),
    albumes_lanzados(Cantante,T).
albumes_lanzados(_,[]).

albumes_anio(Anio,CantidadAlbumes):-
    album(_,Cantante,_,Fecha,_),
    cantante(Cantante,suecia),
    sub_atom(Fecha,6,4,0,Anio),
    retract(album(_,Cantante,_,Fecha,_)),
    albumes_anio(Anio,Cant),
    CantidadAlbumes is Cant+1.
albumes_anio(_,0).

corresponde(Album,[H|T],[H|T2]):-
    album(Album,_,Temas,_,_),
    pertenece(H,Temas),
    corresponde(Album,T,T2).
corresponde(Album,[_|T],L):-
    corresponde(Album,T,L).
corresponde(_,_,[]).

leer_lista([H|T]):-
    read(H),
    H\=[],
    leer_lista(T).
leer_lista([]).

