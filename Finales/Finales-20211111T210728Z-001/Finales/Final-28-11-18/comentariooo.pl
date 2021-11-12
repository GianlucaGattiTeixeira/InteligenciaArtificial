/*1) Mostrar la cantidad(numero) de usuarios que esten activos que hayan hecho al menos 2 comentarios.
2) Para un usuario ingresado, mostrar una lista de usuarios que podrían
ser sus amigos.
Los usuarios que se listan NO tienen que estar en su lista de amigos
actualmente.
Ademas no tienen que haber realizado ningún comentario y tienen que ser
de la misma ciudad que el usuario ingresado.
*/

:-dynamic(usuario/5).
:-dynamic(comentarios/3).
:-dynamic(provincia/2).

cargarbase:-retractall(usuario(_,_,_,_)),retractall(comentarios(_,_,_)),
retractall(provincia(_,_)),consult('C:/Users/Catriel/Desktop/FinalesResueltos/Final-28-11-18/bd.txt').

menu:-writeln('1) Cantidad de usuarios activos y al menos hayan hecho 2 comentarios: '),
writeln('2) Para un usuario ingresado, mostrar una lista de usuarios que podrían
ser sus amigos. '), read(Op), Op\=0, opcion(Op),menu.
menu:-write('Fin').

opcion(1):-cargarbase,usuariosactivo(Cant),writeln(Cant).

usuariosactivo(Cant):-usuario(Idu,_,'activo',_,_),
contarcoment(Idu,Cantidad),Cantidad>=2,retract(usuario(Idu,_,'activo',_,_)),
usuariosactivo(Cant1), Cant is Cant1+1.
usuariosactivo(0).



contarcoment(Idu,Cantidad):-
comentarios(Idcomen,Idu,_),
retract(comentarios(Idcomen,Idu,_)),
contarcoment(Idu,Cantidad1),
Cantidad is Cantidad1 + 1.
contarcoment(_,0).

opcion(2):-cargarbase, writeln('Ingrese usuario: '), read(Usu),usuario(Usu,_,_,Ciu,Amigos),
posibleamigo(Usu,Ciu,Amigos,Lista),writeln(Lista).

posibleamigo(Usu,Ciu,Amigos,[H|T]):-usuario(H,_,_,Ciu,_),
not(pertenece(H,Amigos)),not(comentarios(_,H,_)),
retract(usuario(H,_,_,Ciu,_)),
posibleamigo(Usu,Ciu,Amigos,T).
posibleamigo(_,_,_,[]).



pertenece(X,[X|_]).
pertenece(X,[_|T]):-pertenece(X,T).

opcion(_).









