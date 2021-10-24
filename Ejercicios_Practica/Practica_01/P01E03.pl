pertenece(brasil,grupo01).
pertenece(espana,grupo01).
pertenece(jamaica,grupo01).
pertenece(italia,grupo01).

pertenece(argentina,grupo02).
pertenece(nigeria,grupo02).
pertenece(holanda,grupo02).
pertenece(escocia,grupo02).

rivales(X, Z):-
    pertenece(X,Y) , pertenece(Z, Y).