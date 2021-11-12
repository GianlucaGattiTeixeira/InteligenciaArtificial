/*
1) Ingresar una materia,anio y lista de DNI de alumnos y devolver 2
listas, una con los nombre de los alumnos que aprobaron de esa materia y
anio y otra con los que no.
2) Ingresar una lista de ids de materia y devolver una lista con las
carreras que tengan toda esas listas de ids ingresadas.

*/


:-dynamic(alumno/2).
:-dynamic(materia/3).
:-dynamic(carrera/3).
:-dynamic(examen_final/4).

cargarbase:-
    retractall(alumno(_,_)),
    retractall(materia(_,_,_)),
    retractall(carrera(_,_,_)),
    retractall(examen_final(_,_,_,_)),
    consult('C:/Users/Catriel/Desktop/FinalesResueltos/FinalAD-30-10-2019/bd.txt').

menu:-writeln('1-Ingresar una materia, un anio y una lista de dni de alumnos y se devolvera una lista con los alumnos que aprobaron y otra lista con los alumnos que no aprobaron.'),
    writeln('2-Ingresar una lista de ids materia y se devolvera una lista con las carreras que tengan todas esa lista de materias.'),
    read(Op),
    Op\=0,
    opcion(Op),
    menu.
menu:-write('Fin').



opcion(1):-
    cargarbase,
    write('Ingrese una materia:'),
    read(Ma),
    write('Ingrese un año:'),
    read(A),
    write('Ingrese una lista de Ids de alumnos:'),
    leer(Lista),
    materia(M,Ma,_),
    filtrar(M,A,Lista,Aprobado,Noaprobados),
    write('Alumnos que aprobaron:'),write(Aprobado),
    write('Alumnos que no aprobaron:'),write(Noaprobados).
leer([H|T]):-
    read(H),
    H\=[],
    leer(T).
leer([]).
filtrar(_,_,[],[],[]).
filtrar(M,A,[H|T],[H|T1],Noaprobados):-
    examen_final(H,M,N,A),
  
    
    N>5,
    filtrar(M,A,T,T1,Noaprobados).



filtrar(M,A,[H|T],Aprobado,[H|T2]):-
    examen_final(H,M,N,A),
  
    
   N<6,
    filtrar(M,A,T,Aprobado,T2).

pertenece(X,[X|_]).
pertenece(X,[_|T]):-pertenece(X,T).

opcion(2):-
    cargarbase,
    writeln('Ingresar una lista de ids materias: '),
    leer(Listamat),
    buscarcarreras(Listamat,Listacar),
    writeln('Las carrerras con todas esas materias son:'),
    writeln(Listacar).

    buscarcarreras(Listamat,[H|T1]):-
    carrera(_,H,Listita),
    buscar(Listamat,Listita),
    retract(carrera(_,H,Listita)),
    buscarcarreras(Listamat,T1).
    buscarcarreras(Listamat,[]).

    


   
buscar([H1|T],Listita):-
    
    pertenece(H1,Listita),
    buscar(T,Listita).

buscar([],_).
opcion(_).