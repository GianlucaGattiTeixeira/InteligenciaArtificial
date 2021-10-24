% Ingresar una lista de enteros e informar cuál es el menor de todos los números.

menu:-
  write('Ingrese una lista de números enteros (con [] finaliza): '),
  leer(LISTA),
  nl,
  menor(LISTA,9999999,MENOR),
  write('El menor de los elementos ingresados en la lista es: '),
  writeln(MENOR).

leer([H|T]):-
  read(H),
  H \= [],
  leer(T).
leer([]).



menor([],MENOR,MENOR).
menor([H|T],MENOR,MEN):-
  H =< MENOR,
  menor(T,H,MEN).
menor([_|T],MENOR,MEN):-
  menor(T,MENOR,MEN).
