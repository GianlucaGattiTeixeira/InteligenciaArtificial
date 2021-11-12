/*
1) Ingresar el nombre de algún niño y según la edad, mostrar una lista
con las facunas que le faltan aplicarse. 2) Ingresar una enfermedad y
mostrar la cantidad de vacunas que la curan.
*/

:-dynamic(nino/3).
:-dynamic(vacuna_edad/3).
:-dynamic(vacuna/2).

cargarbase:-retractall(niño(_,_,_)),
    retractall(vacuna_edad(_,_,_)),
    retractall(vacuna(_,_)),
    consult('C:/Users/Catriel/Desktop/FinalesResueltos/Final-08-03-18/bd.txt').

menu:-writeln('Opciones: '),
    writeln(' 1 - Ingresar un niño y mostrar según su edad las vacunas que le faltan aplicarse.'),
    writeln(' 2 - Ingresar una enfermedad y mostrar la cantidad de vacunas que lacuran.'),
    read(Op),
    Op\=0,
    opcion(Op),
    menu.
mrnu:-write('Fin').

opcion(1):-cargarbase,
    writeln('Ingrese niño'),
    read(N),
    nino(N,E,Vacunas),
    faltanvacunas(E,Vacunas,Faltan),
    write('Las vacunas faltantes son: '),
    writeln(Faltan).

opcion(2):-cargarbase,
    writeln('Ingresar enfermedad: '),
    read(En),
    contarvacunas(En,Cant),
    writeln(Cant).


faltanvacunas(E,Vacunas,Lista):-vacuna_edad(Edad_desde,Edad_hasta,Total),
    E<Edad_hasta,
    E>Edad_desde,
    retract(vacuna_edad(Edad_desde,Edad_hasta,Total)),
    vacunas_faltantes(Vacunas,Total,Faltan),
    faltanvacunas(E,Vacunas,FaltanCola),
    concatenar(Faltan, FaltanCola, Lista).
faltanvacunas(_,_,[]).

vacunas_faltantes(Vacunas, [H|T], [H|T1]):- not(pertenece(H, Vacunas)),
    vacunas_faltantes(Vacunas, T, T1).
vacunas_faltantes(Vacunas, [_| T], Faltan) :- vacunas_faltantes(Vacunas, T, Faltan).
vacunas_faltantes(_, [], []).

pertenece(X,[X|_]).
pertenece(X,[_|T]):-pertenece(X,T).

concatenar([], Lista2, Lista2).
concatenar([H|T], Lista2, [H|R]) :- concatenar(T, Lista2, R).

contarvacunas(En,Cant):-vacuna(_,Lista),
    pertenece(En,Lista),
    retract(vacuna(_,Lista)),
    contarvacunas(En,Cant1),
    Cant is Cant1 + 1.
contarvacunas(_,0).
opcion(_).
