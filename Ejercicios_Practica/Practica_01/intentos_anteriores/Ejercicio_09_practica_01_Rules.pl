hijo(juan,miguel). 
hijo(jose,miguel). 
hijo(miguel,roberto). 
hijo(julio,roberto). 
hijo(roberto,carlos). 


descendiente(A,B) :- 
    hijo(A,B).
descendiente(A,B) :- 
    hijo(A,X),descendiente(X,B).

