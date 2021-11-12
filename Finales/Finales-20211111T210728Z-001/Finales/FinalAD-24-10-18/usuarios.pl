/*usuario(id, estado, edad, ciudad, [ids usuarios amigos]).
provincia(id, nombre, [ids ciudades]).
pais(id, nombre, [ids provincias]).
El estado de un usuario puede ser activo o inactivo.
1) Mostrar la cantidad de usuarios activos que vivan en países que tengan más de 20 provincias.
2) Ingresar los datos de un usuario (id, estado, edad, ciudad, [ids
usuarios amigos]) y guardarlo en la base de datos sólo si es argentino y
mayor de 18 años.*/

% Se declaran los hechos con dynamic siempre al principio
:- dynamic(usuario/5).
:- dynamic(provincia/3).
:- dynamic(pais/3).

% Predicado para leer de la base de hechos
% Se usa retracall para todos los hechos

cargarbase:- retractall(usuario(_, _, _, _, _)), retractall(provincia(_, _, _)), retractall(pais(_, _, _)),
consult('C:/Users/Catriel/Desktop/FinalesResueltos/FinalAD-24-10-18/bd.txt').

% Menu para poder seleccionar las opciones

menu:- writeln('1. Mostrar la cantidad de usuarios activos que vivan en paises con mas de 20 provincias'),
writeln('2. Ingresar usuario'), write('Ingrese una opcion: '), read(Op), Op \= 0, opciones(Op), menu.
menu:-write('Fin').


opciones(1):-cargarbase,buscarusuario(Lista),contar(Lista,Cant), write("La cantidad de usuarios activos es: "),writeln(Cant).


buscarusuario([H|T]):-usuario(H,'activo',_,Ciu,_),provincia(Idp,_,Ciudades),pertenece(Ciu,Ciudades),pais(Idpai,_,Provincias),
pertenece(Idp,Provincias),
contar(Provincias,Cantidad),Cantidad>1,
retract(usuario(H,'activo',_,Ciu,_)),buscarusuario(T).
buscarusuario([]).


pertenece(X,[X|_]).
pertenece(X,[_|T]):-pertenece(X,T).


contar([],0).
contar([_|T],C):-
    contar(T,CantA),
    C is CantA + 1.




opciones(2):-cargarbase,write('Ingresar id usuario:'), read(Id),write('Ingresar estado del usuario:'),read(E),write('Ingresar la edad usuario:'),
read(Ed),write('Ingresar la ciudad del usuario:'), read(Ciud), write('Ingresar id amigos:'),leer(Amigos),Ed>18, buscar(Ciud),
assert(usuario(Id,E,Ed,Ciud,Amigos)),guardar.

leer([H|T]):-read(H),H\=[],leer(T).
leer([]).

buscar(Ciud):-provincia(Pro,_,Listaprov),pertenece(Ciud,Listaprov),
pais(_,'Argentina',Lp),pertenece(Pro,Lp).
buscar(_).



guardar:-tell('C:/Users/Catriel/Desktop/FinalesResueltos/FinalAD-24-10-18/bd.txt'),listing(usuario),listing(provincia),listing(pais),told.

opcion(_).