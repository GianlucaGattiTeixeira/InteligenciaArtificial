% Hacer un programa que permita ingresar un número y calcule la
% sumatoria de sus términos descontados en una unidad (hasta llegar a cero)
% pares e impares.
% suma(N,SumPares,SumImpares).
% . N es el número ingresado (argumento de entrada).
% . SumPares es uno de los resultados calculados (argumento de salida).
% . SumImpares es uno de los resultados calculados (argumento de salida).


sumatoria(0,0,0).
sumatoria(Num, SumPar, SumImpar):-
    P is Num mod 2,
    P = 0,
    Ant is Num - 1,
    sumatoria(Ant , SumParAnt, SumImparAnt),
    SumPar is SumParAnt + Num,
    SumImpar is SumImparAnt .
sumatoria(Num, SumPar, SumImpar):-
    Ant is Num - 1,
    sumatoria(Ant , SumParAnt, SumImparAnt),
    SumImpar is SumImparAnt + Num,  
    SumPar is SumParAnt.