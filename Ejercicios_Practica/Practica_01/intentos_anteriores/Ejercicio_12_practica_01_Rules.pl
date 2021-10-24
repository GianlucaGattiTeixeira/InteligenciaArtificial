
sumatoria(1,1).
sumatoria(N,F) :- Prev is N-1, sumatoria(Prev,FA), F is N + FA.