% 17. En una base de hechos hay un registro de personas y viajes realizados:
% persona(nombre, [lista ciudades visitó])
% Construir una regla que permita verificar si una persona visitó una
% determinada ciudad (datos de entrada: nombre persona y ciudad).

%persona(nombre, [lista ciudades visitó])
persona(augusto, [cabral, rosario, clorinda, bariloche]).
persona(manuel, [florencia, roma, paris, pamplona]).
persona(leonardo, [napoles, madrid, paris]).

visito(Persona, Lugar):-
    persona(Persona,Lista),
    existe(Lista,Lugar).

existe([Elem|_],Elem).
existe([_|T],Elem):-
    existe(T,Elem)
.