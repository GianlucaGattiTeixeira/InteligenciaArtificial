:-dynamic(catedra/1).
:-dynamic(comision/4).
:-dynamic(alumno/2).

abrir:-
    retractall(catedra(_)),
    retractall(comision(_,_,_,_)),
    retractall(alumno(_,_)),
    consult('C:/Users/PC/Desktop/IA/Catedras/bd.txt').

menu:-
    abrir,
    writeln('Consigna 1'),
    writeln('Consigna 2'),
    writeln('Salir 3'),
    read(Opcion),
    Opcion\=3,
    ejecutar(Opcion),
    menu.
menu.

ejecutar(1):-
    listar_catedras(Catedras),
    writeln(Catedras).
ejecutar(2):-
    writeln('Ingrese Legajo'),
    read(Legajo),
    catedras_alumno(Legajo,Catedras),
    writeln(Catedras).

catedras_alumno(Legajo,[H|T]):-
    catedra(H),
    comision(H,_,2017,Legajos),
    pertenece(Legajo,Legajos),
    retract(catedra(H)),
    retract(comision(H,_,2017,Legajos)),
    catedras_alumno(Legajo,T).
catedras_alumno(_,[]).

listar_catedras([H|T]):-
    catedra(H),
    comision(H,_,2017,Inscriptos),
    contar(Inscriptos,Total),
    Total>1,
    retract(comision(H,_,2017,Inscriptos)),
    retract(catedra(H)),
    listar_catedras(T).
listar_catedras([]).

contar([],0).
contar([_|T],Total):-
    contar(T,SubTotal),
    Total is SubTotal+1.

pertenece(X,[X|_]).
pertenece(X,[_|T]):-pertenece(X,T).
