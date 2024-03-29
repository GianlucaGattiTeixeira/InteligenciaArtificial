:-dynamic(cliente/3).
:-dynamic(practica/5).

abrir:-
    retractall(cliente(_,_,_)),
    retractall(practica(_,_,_,_,_)),
    consult('C:/Users/PC/Desktop/IA/Clientes/bd.txt').

menu:-
    abrir,
    writeln('Consigna 1'),
    writeln('Salir 2'),
    read(Opcion),
    Opcion\=2,
    ejecutar(Opcion),
    menu.
menu.

ejecutar(1):-
    writeln('Ingrese DNI'),
    read(Dni),
    consultar_asistencia(Dni,Asistencias,Faltas),
    enunciar(Asistencias,Faltas).

ConsultarAsistencia(Dni,Asistencias,Faltas):-
    practica(_,_,_,Dni,si),
    retract(practica(_,_,_,Dni,si)),
    consultar_asistencia(Dni,Asist,Faltas),
    Asistencias is Asist+1.
consultar_asistencia(Dni,Asistencias,Faltas):-
    practica(_,_,_,Dni,no),
    retract(practica(_,_,_,Dni,no)),
    consultar_asistencia(Dni,Asistencias,Falt),
    Faltas is Falt+1.
consultar_asistencia(_,0,0).

enunciar(0,0):-
    writeln('No se encontraron registros').
enunciar(Asistencias,Faltas):-
    Total is Asistencias+Faltas,
    Porc is Faltas/Total*100,
    Porc>=80,
    writeln('No es posible faltar').
enunciar(Asistencias,Faltas):-
    Total is Asistencias+Faltas,
    Porc is Faltas/Total*100,
    Porc>0,
    Porc<80,
    writeln('Es posible faltar').


