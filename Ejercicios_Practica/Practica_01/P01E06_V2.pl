instrumento(carolina, guitarra).
instrumento(jose, guitarra).
instrumento(miguel, guitarra).
instrumento(mariano, cantante).
instrumento(silvia, cantante).
instrumento(mauro, cantante).
instrumento(eduardo, bateria).
instrumento(diego, bateria).
instrumento(laura, bateria).

localidad(carolina, rosario).
localidad(jose, rosario).
localidad(miguel, funes).
localidad(mariano, rosario).
localidad(silvia, funes).
localidad(mauro, funes).
localidad(eduardo, roldan).
localidad(diego, casilda).
localidad(laura, rosario).

banda(Ciudad):-
    localidad(X, Ciudad), localidad(Y, Ciudad), localidad(Z, Ciudad), instrumento(X, guitarra), instrumento(Y, bateria), instrumento(Z, cantante). 




