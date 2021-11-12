/*personas(nombre, edad,[profesion],ciudad).
cursos(profesion,[cursos]).
personas_cursos(nombre,profesion,[cursosRealizados])
1) Ingresar una profesion(Dato de entrada), y mostrar la edad promedio
de dicha profesion en la ciudad de Rosario.
2) Ingresar una profesion(dato de entrada), y mostrar para cada persona, 
la lista de cursos que le faltan.*/


:-dynamic(personas/4).
:-dynamic(cursos/2).
:-dynamic(personas_cursos/3).

cargarbase:-retractall(personas(_,_,_,_)),retractall(cursos(_,_)),
retractall(personas_cursos(_,_,_)),consult('C:/Users/Catriel/Desktop/FinalesResueltos/Final-26-02-2019/bd.txt').

menu:-writeln('1.Edad promedio de una profesion en Rosario: '),writeln('2.Lista de cursos que faltan de una profesion: '),
write('Ingrese opcion:'),read(Op), Op \= 0, opcion(Op),menu.
menu:-write('Fin').

opcion(1):-cargarbase,write('Ingresar una profesion: '), read(Profesion),operacion(Profesion,Cont,Sum),
 Prom is (Sum/Cont), write('PROMEDIO:'), write(Prom).

operacion(Profesion,Cont,Sum):-personas(_,E,ListaProfe,'Rosario'),
pertenece(Profesion,ListaProfe),retract(personas(_,E,ListaProfe,'Rosario')),
operacion(Profesion,Cont1,Cont2), Cont is Cont1+1,Sum is Cont2 +E.
operacion(_,0,0).

pertenece(H,[H|_]).
pertenece(H,[_|T]):-pertenece(H,T).



opcion(2):-cargarbase,write('Ingresar una profesion: '), read(Profesion),comparar(Profesion).

comparar(Profesion):-
cursos(Profesion,Total),personas_cursos(N,Profesion,Ltengo),
retract(personas_cursos(N,Profesion,Ltengo)),
faltante(Ltengo,Total,Lfaltan),comparar(Profesion)
/*concatenar(Lfaltan, FaltanCola, Lista)*/
,writeln(N),
writeln(Lfaltan).
comparar(_).





faltante(Ltengo, [H|T], [H|T1]):- not(pertenece(H, Ltengo)),
   faltante(Ltengo, T, T1).
faltante(Ltengo, [_| T], Lfaltan) :- faltante(Ltengo, T, Lfaltan).
faltante(_, [], []).
opcion(_).


/*concatenar([], Lista2, Lista2).
concatenar([H|T], Lista2, [H|R]) :- concatenar(T, Lista2, R).*/





