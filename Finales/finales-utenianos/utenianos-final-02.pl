% 2 - UsuarioProvinciaPais - 24/10/2018
% usuario(id, estado, edad, ciudad, [ids usuarios amigos]).
% provincia(id, nombre, [ids ciudades]).
% pais(id, nombre, [ids provincias]).
% El estado de un usuario puede ser activo o inactivo.
% 1) Mostrar la cantidad de usuarios activos que vivan en países que tengan más de 20 provincias.
% 2) Ingresar los datos de un usuario (id, estado, edad, ciudad, [ids usuarios amigos]) y guardarlo en la base de datos sólo si es argentino y mayor de 18 años.

:-dynamic(pais/3).
:-dynamic(provincia/3).
:-dynamic(usuario/6).

openDb:-
	retractall(usuario/5),
	retractall(provincia/3),
	retractall(pais/3),
	consult('C:/Users/Gianluca/Desktop/Facultad/2020/Inteligencia artificial/Practicas/InteligenciaArtificial/Finales/finales-utenianos/databases/db-utenianos-final-02.txt').

guardarUsuarioEnDb:-
	tell('C:/Users/Gianluca/Desktop/Facultad/2020/Inteligencia artificial/Practicas/InteligenciaArtificial/Finales/finales-utenianos/databases/db-utenianos-final-02.txt'),
	listing(usuario),
	told.

leerLista([H|T]):-
	writeln('ingrese un elemento para añadir a la lista o [] para terminar'),
	read(H),
	H \= [],
	leerLista(T).
leerLista([]).

lenght([],0).
lenght([_|T], Cant):-
	lenght(T, CantPrev),
	Cant is CantPrev + 1.

pertenece([H|_],H).
pertenece([_|T],Elem):-
	pertenece(T,Elem).

contEj01(Cant):-
	retract(usuario(_,_,_,Ciudad,_)),
	provincia(IdProv,_,Ciudades), 
	pertenece(Ciudades,Ciudad),
	pais(_,_ , Provincias),
	lenght(Provincias,CantProv),
	CantProv > 20,
	pertenece(Provincias, IdProv),
	contEj01(CantPrev),
	Cant is CantPrev + 1.
contEj01(0).


ej02:-
	writeln('ingrese id de usuario'),
	read(IdUsuario),
	writeln('ingrese estado usuario'),
	read(Estado),
	writeln('ingrese edad'),
	read(Edad),
	Edad >= 18,
	writeln('ingrese id ciudad'),
	read(IdCiudad),
	provincia(IdProv,_,Ciudades), 
	pertenece(Ciudades,IdCiudad),
	pais(_,'argentina' , Provincias),
	pertenece(Provincias, IdProv),
	writeln('ingrese lista de amigods'),
	leerLista(Amigos),
	assert(usuario(IdUsuario,Estado,Edad,IdCiudad,Amigos)),
	guardarUsuarioEnDb.

mostrarPersonas:-
	openDb,
	usuario(Id,_,_,_,_,_),
	nl,
	write('el usuario con id: '), write(Id), 
	fail.

	




