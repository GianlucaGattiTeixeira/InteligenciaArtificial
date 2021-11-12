/*1)Ingresar una caracteristica y devolver una lista con códigos de los autos que tengan esa caracteristica.
2)Ingresar una lista de código de vehiculos y un año y devolver una lista con los
autos que se hayan vendido mas de 10 veces en ese año.*/

:-dynamic(vehiculo/2).
:-dynamic(ventas/3).

cargarbase:- retractall(vehiculo(_,_)),retractall(ventas(_,_,_)),
consult('C:/Users/Catriel/Desktop/FinalesResueltos/final-3-07-2019/bd.txt').

menu:-writeln('1.Ingrese una caracteristica y devolver una lista de autos con esa caracteristica: '),
writeln('2.Ingresar una lista de código de vehiculos y un año y devolver una lista con los
autos que se hayan vendido mas de 10 veces en ese año'),writeln('Elige una opción:'), read(Op),Op\=0,opcion(Op), menu.

opcion(1):-cargarbase,write('Ingrese una caracteristica: '),read(C),buscarauto(C,Lista),
writeln('Autos con esa caracteristica ingresada:'), writeln(Lista).
menu:-write('Fin').

buscarauto(C,[H|T]):-vehiculo(H,Car),pertenece(C,Car),
retract(vehiculo(H,Car)),buscarauto(C,T).
buscarauto(_,[]).

pertenece(X,[X|_]).
pertenece(X,[_|T]):-pertenece(X,T).

opcion(2):-cargarbase,writeln('Ingresar una lista de codigos de auto: '), leer(Lista), 
writeln('Ingresar un año: '), read(A), buscarlista(Lista,A,Listanueva),writeln(Listanueva).

leer([H|T]):-read(H),H\=[],leer(T).
leer(T).


buscarlista([H|T],A,[H|T1]):-contarventa(H,A,Cant),
Cant>1,
buscarlista(T,A,T1).
buscarlista([],_,[]).

contarventa(H,A,Cant):-ventas(_,H,A),retract(ventas(_,H,A)),
contarventa(H,A,Cant1), Cant is Cant1 + 1.
contarventa(_,_,0).
opcion(_).








