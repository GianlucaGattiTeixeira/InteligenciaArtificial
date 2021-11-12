/*1-Listar las canciones que le guste a más del 80 porciento de los invitados.
  2-Listar las canciones de genero Vals que duren mas de 15 minutos.
*/

:-dynamic(cancion/5).
:-dynamic(invitados/2).

cargarbase:-retractall(cancion(_,_,_,_,_)),
retractall(invitado(_,_)),consult('C:/Users/Catriel/Desktop/FinalesResueltos/Final-17-12-2015/bd.txt').

menu:-writeln('1-Listar las canciones que le guste a más del 80 porciento de los invitados.'),
writeln('2-Listar las canciones de genero Vals que duren mas de 15 minutos.'),
read(Op),Op\=0,opcion(Op),menu.

opcion(1):-cargarbase,contarinvitados(Contar),contarcanciones(Contar,Listaaa),
writeln(Listaaa).


contarinvitados(Contar):-
invitado(_,_),
retract(invitado(_,_)),
contarinvitados(Contar1),
Contar is Contar1 +1.
contarinvitados(0).

contarcanciones(Contar,[H|T]):-cancion(H,_,_,_,_),
retract(cancion(H,_,_,_,_)),
contarcan(H,Canti),
 (Canti/Contar) > 0.8 ,

contarcanciones(Contar,T).
contarcanciones(_,[]).

contarcan(H,Canti):-
invitado(_,Li),
pertenece(H,Li),
retract(invitado(_,Li)),
contarcan(H,Canti1),
Canti is Canti1 +1.
contarcan(_,0).




pertenece(X,[X|_]).
pertenece(X,[_|T]):-pertenece(X,T).

opcion(2):-cargarbase,buscarvals(Lista),writeln(Lista).

buscarvals([H|T]):-cancion(_,H,_,Dur,'Vals'),
retract(cancion(_,H,_,Dur,'Vals')),
Dur>15,
buscarvals(T).
buscarvals([]).