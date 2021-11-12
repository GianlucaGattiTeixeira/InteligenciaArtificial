/*1 - Dada una Lista [] de Dni, y un Codigo de Jardin Devolver una Lista [] con aquellos Dni que asisten realmente al Jardin.
2 - Dada una Lista [] de Jardines, y una Lista [] de Tipos de Sala, devolver una Lista [] con los Jardines que tengan todos los tipos de sala.
Tips: en ninguno se usaba (o era necesario retract), como solo es recorrer listas las condiciones de fin van al principio. */

:-dynamic(jardin/2).
:-dynamic(salas/3).

cargarbase:-
retractall(jardin(_,_)),
retractall(salas(_,_,_)),
consult('C:/Users/Catriel/Desktop/FinalesResueltos/Final-16-11-2017/bd.txt').

menu:-writeln('Dada una Lista [] de Dni, y un Codigo de Jardin Devolver una Lista [] con aquellos Dni que asisten realmente al Jardin.'),
writeln('Dada una Lista [] de Jardines, y una Lista [] de Tipos de Sala, devolver una Lista [] con los Jardines que tengan todos los tipos de sala.'),
read(Op),op\=0,opcion(Op),menu.
menu:-write('Fin').


opcion(1):-cargarbase,
writeln('Ingresar dni:'),
leer(Dni),
writeln('Ingresar codigo de un jardin:'),
read(Jar),
buscardni(Dni,Jar,Listadni),
writeln(Listadni).

leer([H|T]):-read(H),H\=[],leer(T).
leer([]).

buscardni([],_,[]).
buscardni([H|T],Jar,[H|T1]):-
salas(Jar,_,Listita),
pertenece(H,Listita),

buscardni(T,Jar,T1).
buscardni([_|T],Jar,Lista):-
buscardni(T,Jar,Lista).


pertenece(X,[X|_]).
pertenece(X,[_|T]):-pertenece(X,T).

opcion(2):-cargarbase,writeln('Ingrese jardines:'),
leer(Jard),
writeln('Ingrese tipos de salas: '),
leer(Sala),
filtrar(Jard,Sala,Resultado),
writeln(Resultado).


filtrar([H|T],Sala,[H|T1]):-
jardin(H,Listita),
buscar(Sala,Listita),
filtrar(T,Sala,T1).
filtrar([_|T],Sala,Listita):-filtrar(T,Sala,Listita).
filtrar([],_,[]).

buscar([S|E],Listita):-pertenece(S,Listita),
buscar(E,Listita).
buscar([],_).
opcion(_).
