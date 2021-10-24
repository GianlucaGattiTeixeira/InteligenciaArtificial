sumatoria(0,0,0).
sumatoria(N,P,I) :-
    R is N mod 2 ,
    R = 0,
    Prev is N-1,
    sumatoria(Prev,PA,IA),
    P is N + PA,
    I is IA.
sumatoria(N,P,I) :-
    Prev is N-1,
    sumatoria(Prev,PA,IA),
    I is N + IA,
    P is PA.