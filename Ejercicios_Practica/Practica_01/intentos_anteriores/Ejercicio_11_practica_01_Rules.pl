
factorial(0,1).
factorial(N,F) :- Prev is N-1, factorial(Prev, FA), F is N * FA.