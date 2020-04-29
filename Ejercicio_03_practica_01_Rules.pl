pertenece(brasil,grupo01).
pertenece(espana,grupo01).
pertenece(jamaica,grupo01).
pertenece(italia,grupo01).

pertenece(argentina,grupo02).
pertenece(nigeria,grupo02).
pertenece(holanda,grupo02).
pertenece(escocia,grupo02).

rivales(X,Y):-
    pertenece(X,Z1), pertenece(Y,Z2), Z1=Z2, X\=Y.

% el grupo de brasil se buguea cuando preguntas y responde con un cuarto argumento false