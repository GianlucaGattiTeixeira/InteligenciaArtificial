habitos(leon,alimentacion(carne,10)).
habitos(leon,bebida(agua,20)).
habitos(leon,descanso(8)).
habitos(tigre,alimentacion(carne,12)).
habitos(tigre,bebida(agua,22)).
habitos(tigre,descanso(12)).
habitos(mono,alimentacion(banana,6)).
habitos(mono,bebida(agua,6)).
habitos(mono,descanso(4)).
habitos(cordero,alimentacion(yuyo,6)).
habitos(cordero,bebida(agua,10)).
habitos(cordero,bebida(cocaCola,4)).
habitos(cordero,descanso(4)).



informarHabitos(Animal):-
    habitos(Animal,Habito),
    writeln(Habito), 
    fail.

informarAnimalesPorHabito(Habito):-
    habitos(Animal, Habito), 
    writeln(Animal),
    fail.
informarAnimalesPorHabito(_):-
    writeln('').