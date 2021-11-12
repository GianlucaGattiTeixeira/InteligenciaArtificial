/*1) Para un nivel ingresado devolver un listado con todos los colegios
que sean de Rosario, que ofrezcan el nivel ingresado y que tengan hasta 90 alumnos.

2) Dado un listado de Dni de alumnos ingresado, un Colegio y un Turno,
devolver otro listado de los alumnos que verdaderamente pertenezcan a ese
colegio y asistan a ese turno (de la lista de ingresada).

Por las dudas aclaro que un colegio tiene muchos niveles, un nivel tiene
muchos cursos, un curso tiene muchos turnos*/

:-dynamic(colegio/5).
:-dynamic(niveles/5).

cargarbase:-
retractall(colegio(_,_,_,_,_)),
retractall(niveles(_,_,_,_,_)),
consult('C:/Users/Catriel/Desktop/FinalesResueltos/Final-18-06-2019/bd.txt').

menu:-writeln('1-Para un nivel ingresado devolver un listado con todos los colegios que sean de Rosario, que ofrezcan el nivel ingresado y que tengan hasta 90 alumnos.'),
writeln('2-Dado un listado de Dni de alumnos ingresado, un Colegio y un Turno,devolver otro listado de los alumnos que verdaderamente pertenezcan a ese colegio y asistan a ese turno (de la lista de ingresada).'),read(Op),opcion(Op),menu.
menu:-write('Fin').
opcion(1):-cargarbase,writeln('Ingresar nivel: '),
read(Nivel),
buscarcolegio(Nivel,Listacolegio),
writeln(Listacolegio).

buscarcolegio(Nivel,[H|T]):-
colegio(H,_,_,'Rosario',Listanivel),
pertenece(Nivel,Listanivel),

retract(colegio(H,_,_,'Rosario',Listanivel)),
condicion(Nivel,H,Cantidad),
Cantidad>5,
buscarcolegio(Nivel,T).
buscarcolegio(_,[]).

pertenece(X,[X|_]).
pertenece(X,[_|T]):-pertenece(X,T).

condicion(Nivel,H,Cantidad):-niveles(H,Nivel,_,_,Alumnos),
retract(niveles(H,Nivel,_,_,Alumnos)),
contar(Alumnos,C),
condicion(Nivel,H,Cantidadaux),
Cantidad is Cantidadaux+C.
condicion(_,_,0).

contar([],0).
contar([_|T],C):-
    contar(T,CantA),
    C is CantA + 1.

opcion(2):-cargarbase,writeln('Ingrese dnis de alumnos:'),
leer(Alu),writeln('Ingrese un colegio: '),
read(Col),
write('Ingrese un turno'),
read(Tur),
buscarverdadero(Alu,Col,Tur,Listanueva),
writeln('Verdadero listado: '),
write(Listanueva).

leer([H|T]):-read(H),H\=[],leer(T).
leer([]).



buscarverdadero([H|T],Col,Tur,[H|T1]):-
niveles(Col,_,_,Tur,Listita),
pertenece(H,Listita),

buscarverdadero(T,Col,Tur,T1).
buscarverdadero([_|T],Col,Tur,Lis):-
buscarverdadero(T,Col,Tur,Lis).

buscarverdadero([],_,_,[]).
opcion(_).






