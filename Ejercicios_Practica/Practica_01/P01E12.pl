% Hacer un programa que permita ingresar un número y calcule su
% sumatoria, es decir, la suma de sus términos descontados en una unidad
% hasta llegar a cero. Por ejemplo, si el número ingresado fuera 5, se deberá
% calcular la sumatoria 5+4+3+2+1 e informar como resultado 15.
% suma(N,Sum).
% . N es el número ingresado (argumento de entrada).
% . Sum es el resultado calculado (argumento de salida).

sumatoria(0,0).
sumatoria(Num, Sum):-
    NumAnt is Num - 1, sumatoria(NumAnt, SumAnt), Sum is SumAnt + Num.