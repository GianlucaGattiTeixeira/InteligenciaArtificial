menu:-
    write('Ingrese una lista de números enteros (con [] finaliza): '),
    leer(LISTA),
    nl,
    mayor(LISTA,0,MAYOR),
    write('El mayor de los elementos ingresados en la lista es: '),
    writeln(MAYOR).
  
  leer([H|T]):-
    read(H),
    H \= [],
    leer(T).
  leer([]).
  
  mayor([],MAYOR,MAYOR).
  mayor([H|T],MAYOR,MAY):-
    H >= MAYOR,
    mayor(T,H,MAY).
  mayor([_|T],MAYOR,MAY):-
    mayor(T,MAYOR,MAY).
  