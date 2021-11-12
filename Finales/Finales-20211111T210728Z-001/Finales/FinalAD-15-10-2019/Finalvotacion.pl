/*1-Lista de personas nacidas antes del año 1950 de una provincia(Se leia el nombre de una provincia).
  2-Mostrar el salario promedio de las personas con intencion de
  voto hacia un candidato ingresado de una provincia(Se leia el nombre
  de la provincia y del candidato).
*/

:-dynamic(provincia/2).
:-dynamic(localidad/3).
:-dynamic(persona/5).
:-dynamic(candidato/2).
:-dynamic(intencion_de_voto/2).

cargarbase:-
retractall(provincia(_,_)),
retractall(localidad(_,_,_)),
retractall(persona(_,_,_,_,_)),
retractall(candidato(_,_)),
retractall(intencion_de_voto(_,_)),
consult('C:/Users/Catriel/Desktop/FinalesResueltos/FinalAD-15-10-2019/bd.txt').

menu:-writeln('1-Lista de personas nacidas antes del año 1950 de una provincia.'),
writeln('2-Mostrar el salario promedio de las personas con intencion de voto hacia un candidato ingresado de una provincia.'),
read(Op),Op\=0,opcion(Op),menu.
menu:-write('Fin').

opcion(1):-cargarbase,writeln('Ingrese una provincia: '),
read(Prov),
buscarpersonas(Prov,Listapersonas),
writeln('Las personas nacidas antes del 1950 son: '),
write(Listapersonas).

buscarpersonas(Prov,[H|T]):-provincia(Ip,Prov),
localidad(Il,_,Ip),
persona(_,H,Fecha,_,Il),
sub_atom(Fecha,_,4,0,Fe),
Fe<1950,
retract(persona(_,H,Fecha,_,Il)),
buscarpersonas(Prov,T).
buscarpersonas(_,[]).

opcion(2):-cargarbase,writeln('Ingrese provincia: '),
read(Pro),
writeln('Ingrese candidato: '), 
read(Can),
promedios(Pro,Can,Cantidad,Salario),
Prome is Salario/Cantidad,
writeln(Prome).

promedios(Pro,Can,Cantidad,Salario):-
candidato(Ic,Can),
intencion_de_voto(Dni_p,Ic),
persona(Dni_p,_,_,Sala,Ilo),
localidad(Ilo,_,Iprov),
provincia(Iprov,Pro),
retract(intencion_de_voto(Dni_p,Ic)),
promedios(Pro,Can,Cantidad1,Salario1),
Cantidad is Cantidad1+1,
Salario is Salario1+Sala.
promedios(_,_,0,0).

opcion(_).





