/*
    CONSGINA:
    https://docs.google.com/document/d/15mo_2391atBqMjcYzLtKvGG6JiPzjbeyEGVlwZjv4B8/edit#heading=h.qr1tbl1vrwzf
*/

/*------------------------------------------ BASE DE CONOCIMIENTOS -----------------------------------------------*/

% PERSONAJES
personaje(pumkin,     ladron([licorerias, estacionesDeServicio])).
personaje(honeyBunny, ladron([licorerias, estacionesDeServicio])).
personaje(vincent,    mafioso(maton)).
personaje(jules,      mafioso(maton)).
personaje(marsellus,  mafioso(capo)).
personaje(winston,    mafioso(resuelveProblemas)).
personaje(mia,        actriz([foxForceFive])).
personaje(butch,      boxeador).

% PAREJA
pareja(marsellus, mia).
pareja(pumkin,    honeyBunny).

% TRABAJA PARA (Empleador, Empleado)
trabajaPara(marsellus, vincent).
trabajaPara(marsellus, jules).
trabajaPara(marsellus, winston).

% AMIGOS
amigo(vincent, jules).
amigo(jules, jimmie).
amigo(vincent, elVendedor).

% ENCARGO
% encargo(Solicitante, Encargado, Tarea). 
% las tareas pueden ser cuidar(Protegido), ayudar(Ayudado), buscar(Buscado, Lugar)
encargo(marsellus, vincent,   cuidar(mia)).
encargo(vincent,  elVendedor, cuidar(mia)).
encargo(marsellus, winston, ayudar(jules)).
encargo(marsellus, winston, ayudar(vincent)).
encargo(marsellus, vincent, buscar(butch, losAngeles)).


% CASOS PRUEBA
personaje(gonzi, ladron([licorerias, estacionesDeServicio])).
personaje(gad, mafioso(maton)).
trabajaPara(gonzi, gad).
trabajaPara(gad, gonzi).
amigo(gonzi, gad).


/*-------------------------------------------------- PUNTO 1 ---------------------------------------------------------*/

esPersonaje(Personaje) :-
    personaje(Personaje, _).

esPeligroso(Personaje) :-
    esPersonaje(Personaje),
    esMatonOLadronDeLicoreria(Personaje), 
    tieneEmpleadosQueRealizanActividadPeligrosa(Personaje).

tieneEmpleadosQueRealizanActividadPeligrosa(Personaje) :-
    trabajaPara(Personaje, Empleado),
    esMatonOLadronDeLicoreria(Empleado).

esMatonOLadronDeLicoreria(Personaje) :-
    esMaton(Personaje). 

esMatonOLadronDeLicoreria(Personaje) :-
    esLadronDeLicorerias(Personaje).

esMaton(Personaje) :-
    personaje(Personaje, mafioso(maton)).

esLadronDeLicorerias(Personaje) :-
    personaje(Personaje, ladron([licorerias, _])).


/*-------------------------------------------------- PUNTO 2 ---------------------------------------------------------*/

duoTemible(UnPersonaje, OtroPersonaje) :-
    esPersonaje(UnPersonaje),
    esPersonaje(OtroPersonaje),
    sonPeligrsos(UnPersonaje, OtroPersonaje),
    sonParejaOAmigos(UnPersonaje, OtroPersonaje).

sonPeligrsos(UnPersonaje, OtroPersonaje) :-
    esPeligroso(UnPersonaje),
    esPeligroso(OtroPersonaje).

sonParejaOAmigos(UnPersonaje, OtroPersonaje) :-
    pareja(UnPersonaje, OtroPersonaje). 

sonParejaOAmigos(UnPersonaje, OtroPersonaje) :-
    amigo(UnPersonaje, OtroPersonaje).

/*-------------------------------------------------- PUNTO 3 ---------------------------------------------------------*/

estaEnProblemas(butch).

estaEnProblemas(Personaje) :-
    esPersonaje(Personaje),
    cuidarAParejaOBuscarBoxeador(Personaje).

cuidarAParejaOBuscarBoxeador(Personaje) :-
    trabajaPara(Jefe, Personaje),
    esPeligroso(Jefe),
    encargo(Jefe, Personaje, cuidar(Pareja)),
    pareja(Jefe, Pareja).

cuidarAParejaOBuscarBoxeador(Personaje) :-
    encargo(_, Personaje, buscar(butch, _)).


/*-------------------------------------------------- PUNTO 4 ---------------------------------------------------------*/

sanCayetano(Personaje) :-
    esPersonaje(Personaje), 
    forall(tieneCerca(Personaje, OtroPersonaje), encargo(Personaje, OtroPersonaje, _)).

tieneCerca(Personaje, OtroPersonaje) :-
    amigo(Personaje, OtroPersonaje).

tieneCerca(Personaje, OtroPersonaje) :-
    trabajaPara(Personaje, OtroPersonaje).


/*-------------------------------------------------- PUNTO 5 ---------------------------------------------------------*/

/*masAtareado/1. Es el más atareado aquel que tenga más encargos que cualquier otro personaje.
*/

masAtareado(Personaje) :-
    esPersonaje(Personaje),
    cantidadDeEncargos(Personaje, Cantidad), 
    esPersonaje(OtroPersonaje), 
    forall(cantidadDeEncargos(OtroPersonaje, OtraCantidad), Cantidad >= OtraCantidad).

cantidadDeEncargos(Personaje, Cantidad) :-
    listaDeEncargos(Personaje, ListaDeEncargos),
    length(ListaDeEncargos, Cantidad).

listaDeEncargos(Personaje, ListaDeEncargos) :-
    findall(Encargo, encargo(_, Personaje, Encargo), ListaDeEncargos).


/*-------------------------------------------------- PUNTO 6 ---------------------------------------------------------*/

personajesRespetables(PersonajesRespetables) :-
    findall(Personaje, esRespetable(Personaje), PersonajesRespetables).

esRespetable(Personaje) :-
    personaje(Personaje, actriz(ListaDePeliculas)),
    length(ListaDePeliculas, CantidadDePeliculas),
    NivelDeRespeto is CantidadDePeliculas / 10,
    NivelDeRespeto > 9.

esRespetable(Personaje) :-
    personaje(Personaje, mafioso(resuelveProblemas)).

esRespetable(Personaje) :-
    personaje(Personaje, mafioso(capo)).

esRespetable(Personaje) :-
    personaje(Personaje, mafioso(maton)),
    NivelDeRespeto is 1.

/*-------------------------------------------------- PUNTO 7 ---------------------------------------------------------*/


sonPersonajes(Personaje, OtroPersonaje) :-
    esPersonaje(Personaje),
    esPersonaje(OtroPersonaje).

hartoDe(Personaje, OtroPersonaje) :-
    sonPersonajes(Personaje, OtroPersonaje),
    forall(encargo(Personaje, _, Tarea), requiereInteractuarConOtroPersonaje(Tarea, OtroPersonaje)).

requiereInteractuarConOtroPersonaje(cuidar(OtroPersonaje), OtroPersonaje).

requiereInteractuarConOtroPersonaje(ayudar(OtroPersonaje), OtroPersonaje).

requiereInteractuarConOtroPersonaje(buscar(OtroPersonaje, _), OtroPersonaje).

requiereInteractuarConOtroPersonaje(_, OtroPersonaje) :-
    amigo(OtroPersonaje, _).


/*-------------------------------------------------- PUNTO 8 ---------------------------------------------------------*/

caracteristicas(vincent,  [negro, muchoPelo, tieneCabeza]).
caracteristicas(jules,    [tieneCabeza, muchoPelo]).
caracteristicas(marvin,   [negro]).

/*Desarrollar duoDiferenciable/2, que relaciona a un dúo (dos amigos o una pareja) en el que uno tiene al menos una característica que el otro no. */
