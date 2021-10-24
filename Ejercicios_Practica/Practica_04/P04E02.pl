% 2. Hacer un programa que defina una Base de datos de personas de la siguiente forma:
% personas(codigo,nombre).
% El programa debe permitir ingresar un código y verificar si el mismo está definido en la BBDD. 
% De estarlo deberá informar a quién corresponde, de lo contrario deberá solicitar ingresar un nombre y registrar entonces la persona en la BBDD.

:-dynamic(personas/2).

abrirDb:-
    consult('C:/Users/Gianluca/Desktop/Facultad/2020/Inteligencia artificial/Practicas/Ejercicios_Practica/Practica_04/Databases/DB_P04E02.txt').       

menu:-
    abrirDb,
    writeln('ingrese el Id de una persona'),
    read(Id),
    idIngresado(Id).

idIngresado(Id):-
    retract(personas(Id,Nombre)), 
    nl,write('id: '),write(Id), write('nombre: '),write(Nombre),nl.
idIngresado(Id):-
    nl,write('inngrese el nombre de la persona para registrar con id: '),write(Id), write(' '),nl,
    read(Nombre),
    assert(personas(Id,Nombre)),
    tell('C:/Users/Gianluca/Desktop/Facultad/2020/Inteligencia artificial/Practicas/Ejercicios_Practica/Practica_04/Databases/DB_P04E02.txt'),
    listing(personas),
    told.

