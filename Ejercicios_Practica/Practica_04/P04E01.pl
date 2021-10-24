% 1. Hacer un programa que permita definir las cuentas a pagar del mes (luz, agua, alquiler, teléfono, cable, supermercado, etc.)
%  de un grupo de personas. A su vez, deberá permitir ingresar el nombre de una de ellas e informar de todos sus gastos.

% gasto(nombre_persona,mes,rubro,monto).
:-dynamic(gastos/4).

abrirDb:-
    consult('C:/Users/Gianluca/Desktop/Facultad/2020/Inteligencia artificial/Practicas/Ejercicios_Practica/Practica_04/Databases/DB_P04E01.txt').

menu:-
    abrirDb,
    writeln('Ingrese opción: '),
    writeln('1.Ingresar nueva cuenta a pagar'),
    writeln('2.Ingresar persona para ver sus cuentas'),
    writeln('3.Salir'),
    read(Op),
    ejecutar(Op).

ejecutar(1):-
    writeln('ingrese su nombre: '),
    read(Nombre),
    writeln('ingrese mes: '),
    read(Mes), 
    writeln('ingrese rubro de gasto: '),
    read(Rubro), 
    writeln('ingrese monto: '),
    read(Monto),
    assert(gasto(Nombre,Mes, Rubro, Monto)), 
    guardarGasto.

ejecutar(2):-
    writeln('ingresar el nombre de la persona a ver sus cuentas: '),
    read(Nombre),
    listarGastos(Nombre).

listarGastos(Nombre):-
    retract(gasto(Nombre,Me,Ru,Mo)),
    write('gasto para '),write(Nombre),write(', El mes '),write(Me),write(', para el rubro '),write(Ru),write(', por el monto de '),write(Mo), nl,
    listarGastos(Nombre).
listarGastos(_).

guardarGasto:-
    tell('C:/Users/Gianluca/Desktop/Facultad/2020/Inteligencia artificial/Practicas/Ejercicios_Practica/Practica_04/Databases/DB_P04E01.txt'), 
    listing(gasto),
    told.

