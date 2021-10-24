% 1 - AlumnoMateria - 30/10/2019
% Se tienen alumnos, materias, carrera y resultado en examen final
% 1) Ingresar una materia,anio y lista de DNI de alumnos y devolver 2 listas, una con los nombre de los alumnos que aprobaron de esa materia y anio y otra con los que no.
% 2) Ingresar una lista de ids de materia y devolver una lista con las carreras que tengan toda esas listas de ids ingresadas.

%alumno(Dni,Nombre).
%materia(Cod_materia,Nombre_materia,1[Dni_alumno]n).
%carrera(Cod_carrera,Nombre_carrera,1[Cod_materia]n).
%examen_final(Dni_alumno,Cod_materia,Nota,Anio).

:-dynamic (alumno/2).
:-dynamic (materia/3).
:-dynamic (carrera/3).
:-dynamic (examen_final/4).

openDb:-
    retractall(alumno/2), 
    retractall(materia/3), 
    retractall(carrera/3),
    retractall(examen_final/4),
    consult('C:/Users/Gianluca/Desktop/Facultad/2020/Inteligencia artificial/Practicas/Finales/finales-utenianos/databases/db-utenianos-final-01').

leerLista([H|T]):-
    writeln('ingrese un elemento para la lista y [] para terminar'),
    read(H),
    H \= [],
    leerLista(T).
leerLista([]). 

ejercicio01:-
    openDb,
    writeln('ingrese materia'),
    read(Materia),
    writeln('ingrese anio'),
    read(Anio),
    writeln('ingrese la lista de dni de alumnos'),
    leerLista(ListaDni),
    recuperarAlumnosPorResultado(ListaDni, Materia, Anio, LA,LNA),
    writeln('los aprobados fueron: '), write(LA),
    writeln('los desaprobados fueron: '), write(LNA).

recuperarAlumnosPorResultado([],_,_,[],[]).
recuperarAlumnosPorResultado([Hdni|Tdni], Materia, Anio, [Nombre|Tap],ListaDap):-
    examen_final(Hdni, Materia, Nota, Anio),
    Nota >= 6,
    alumno(Hdni,Nombre),
    recuperarAlumnosPorResultado(Tdni, Materia, Anio, Tap,ListaDap).
recuperarAlumnosPorResultado([Hdni|Tdni], Materia, Anio, ListaAp,[Nombre|Tdap]):-
    examen_final(Hdni, Materia, _ , Anio),
    alumno(Hdni,Nombre),
    recuperarAlumnosPorResultado(Tdni, Materia, Anio, ListaAp, Tdap).

carrerasConTodasLasMaterias():-



pertenece([Elem|_],Elem).
pertenece([_|T],Elem):-
    pertenece(T,Elem).
    