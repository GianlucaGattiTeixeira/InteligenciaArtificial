/*1-Devolver una lista [] con códigos de instituciones que coincidan con la obra social y con el sector, ambos ingresados como datos de entradas.
 2-Devolver una lista [] con los códigos de instituciones en las que
 atiende un médico y según una obra social, también estos dos datos se
 ingresaban por teclado.
*/


:-dynamic(institutosalud/6).
:-dynamic(medico/4).

cargarbase:-retractall(institutodsalud(_,_,_,_,_,_)),retractall(medico(_,_,_,_)),
consult('C:/Users/Catriel/Desktop/FinalesResueltos/Final-22-02-2018/bd.txt').

menu:-writeln('1-Devolver una lista [] con códigos de instituciones que coincidan con la obra social y 
con el sector ingresados.'),
writeln('2-Devolver una lista [] con los códigos de instituciones 
en las que atiende un médico y según una obra social,
ambos datos ingreados por teclados'), read(Op),Op\=0,opcion(Op),menu.

opcion(1):-cargarbase,writeln('Ingresar obra social:'),read(Ob),writeln('Ingresar sector:'),read(Sec),
buscar(Ob,Sec,Lista),writeln('Las instituciones que coinciden: '),write(Lista).
menu:-write('Fin').

buscar(Ob,Sec,[H|T]):-institutosalud(H,_,_,_,Sec,Listaobra),pertenece(Ob,Listaobra),
retract(institutosalud(H,_,_,_,Sec,Listaobra)),buscar(Ob,Sec,T).
buscar(_,_,[]).

pertenece(X,[X|_]).
pertenece(X,[_|T]):-pertenece(X,T).

opcion(2):-cargarbase,writeln('Ingrese un medico:'),
read(Med),
writeln('Ingrese una obra social: '),
read(Obra),medico(_,Med,_,Listainst)
,buscarinstitucion(Listainst,Obra,Listita),
writeln('Las instituciones son: '),
write(Listita).

buscarinstitucion([H|T],Obra,[H|T1]):-
institutosalud(H,_,_,_,_,Obras),
pertenece(Obra,Obras),
retract(institutosalud(H,_,_,_,_,Obras)),
buscarinstitucion(T,Obra,T1).
buscarinstitucion([_|T],Obra,Lista):-
buscarinstitucion(T,Obra,Lista).
buscarinstitucion([],_,[]).
opcion(_).


