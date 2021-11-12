% INTELIGENCIA ARTIFICIAL] Mesa especial - 25/08/2014
% Dada la siguiente BD:
%   personas(Nombre, Edad, [Profesiones],Ciudad).
%   cursos(Profesion, [Cursos]).
%   personas_cursos(Nombre,Profesion,[CursosRealizados]).
% 1) Ingresar una profesión (dato de entrada), y mostar la edad promedio de dicha profesion en la ciudad de Rosario.
% 2) Ingresar una profesión (dato de entrada), y mostrar para cada persona, la lista de cursos que le faltan realizar.
% 3) Mostrar la profesión con mayor cantidad de cursos

:-dynamic(personas/4).
:-dynamic(cursos/2).
:-dynamic(personas_cursos/3).

openDb:-
	retractall(personas),
	retractall(cursos),
	retractall(personas_cursos),
	consult('File Location').

menu:-
	writeln('ingrese una opcion, 1 promedio esdad de profesion, 2 cursos sin realizar, 3 salir '),
	read(Op),
	ejercicio(Op).

pertenece([Elem|_],Elem).
pertenece([_|T],Elem):-
	pertenece(T,Elem).



ejercicio(1):-
	writeln('ingrese uan profesion'),
	read(Prof),	
	promedioProfesion(Prof,Promedio),
	nl, write('El promedio es: '), write(Promedio),
	menu.

ejercicio(2):-
	writeln('ingrese uan profesion'),
	read(Prof),	
	cursosFaltantes(Prof),
	menu.

% ejercicio(3):-
% 	writeln('ingrese uan profesion'),
% 	read(Prof),	
% 	profesionConMasCursos(Prof),
% 	menu.


promedioProfesion(Prof, Prom):-
	edadTotalYCantElementosPorProfesion(Prof, Total, Cant),
	Prom is Total/Cant.

edadTotalYCantElementosPorProfesion(Prof, Total, CantElementos):-
	retract(personas(_, Edad, Profesiones, _)),
	pertenece(Profesiones,Prof),
	edadTotalYCantElementosPorProfesion(Prof,TotalAnt, CantAnt),
	Total is (TotalAnt + Edad),
	CantElementos is CantAnt + 1.
edadTotalYCantElementosPorProfesion(_,0,0).


cursosFaltantes(Prof):-
	retract(personas(Nombre, _, Profesiones, _)),
	pertenece(Prof, Profesiones),
	personas_cursos(Nombre, Prof, CursosRealizados),
	cursos(Prof, CursosProfesion),
	elementosFaltantes(CursosProfesion, CursosRealizados, Pendientes),
	nl, write('para '), write(Nombre), write(' los cursos pendientes son: '), write(Pendientes).


%recibe dos listas devueleve una tercera con los elementos que estan en la primera pero no en la segunda
elementosFaltantes(_,[],[]).
elementosFaltantes(ListaTodos,[Hsub|Tsub], [Hsub|T]):-
	pertenece(ListaTodos,Hsub),
	elementosFaltantes(ListaTodos,Tsub, T).
elementosFaltantes(ListaTodos,[_|Tsub],ListaResultante):-
	elementosFaltantes(ListaTodos, Tsub, ListaResultante).

contarElementos([],0).
contarElementos([_|T],Cant):-
	contarElementos(T ,CantAnt),
	Cant is CantAnt +1.

cursos(plomero,[1,2,3]).
cursos(gasista,[1,2,3,4,5]).
cursos(chef,[1,2]).
cursos(peluquero,[1,2,3,4]).

profesionConMasCursos(Prof, Cant):-
	retract(cursos(Prof, Cursos)),
	contarElementos(Cursos, Cant),
	profesionConMasCursos(_, CantPrev),
	% mayor(CantPrev,Cantidad, Cant).
	CantPrev < Cant.
profesionConMasCursos(Prof,Cant):-
	retract(cursos(_, _)),
	profesionConMasCursos(Prof, Cant).
profesionConMasCursos(_,0).
	

mayor(A,B,A):-
	A > B.
mayor(_,B,B).























	
	