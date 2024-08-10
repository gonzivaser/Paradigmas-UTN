/*
    CONSGINA:
    https://drive.google.com/file/d/1xJNQzdkVdGVQcd_y4uTUKWyf0pt-OJSH/view
*/

/*------------------------------------------ BASE DE CONOCIMIENTOS -----------------------------------------------*/

/*
● accion(NombreDelJuego)
● mmorpg(NombreDelJuego, CantidadDeUsuarios)
● puzzle(NombreDelJuego, CantidadDeNiveles, Dificultad)
*/

% JUEGO
juego(accion(callOfDuty),5).
juego(accion(batmanAA),10).
juego(mmorpg(wow,5000000),30).
juego(mmorpg(lineage2,6000000), 15).
juego(puzzle(plantsVsZombies,40,media),10).
juego(puzzle(tetris,10,facil),0).


% OFERTA 
% oferta(NombreDelJuego, PorcentajeDeDescuento)
oferta(callOfDuty,10).
oferta(plantsVsZombies,50).


% USUARIO
% usuario(NombreDeUsuario, [JuegosQuePosee], [Compra(NombreDeJuegoAComprar)])
% usuario(NombreDeUsuario, [JuegosQuePosee], [Regalo(NombreDeJuegoARegalar, NombreDeUsuarioARegalar)])
usuario(nico,[batmanAA,plantsVsZombies,tetris],[compra(lineage2)]).
usuario(fede,[],[regalo(callOfDuty,nico),regalo(wow,nico)]).
usuario(rasta,[lineage2],[]).
usuario(agus,[],[]).
usuario(felipe,[plantsVsZombies],[compra(tetris)]).

/*------------------------------------------ FUNCIONES AUXILIARES -----------------------------------------------*/

esUsuario(NombreUsuario):-
    usuario(NombreUsuario,_,_).

esJuegoDeAccion(Juego):-
    juego(accion(Juego),_).

esJuegoMmorpg(Juego):-
    juego(mmorpg(Juego,_),_).

esJuegoPuzzle(Juego):-
    juego(puzzle(Juego,_,_),_).

/*-------------------------------------------------- PUNTO 1 ---------------------------------------------------------*/

precioJuego(Juego, Precio) :-
    juego(accion(Juego), Precio).

precioJuego(Juego, Precio) :-
    juego(mmorpg(Juego, _), Precio).

precioJuego(Juego, Precio) :-
    juego(puzzle(Juego, _, _), Precio).

cuantoSale(Juego, PrecioFinal) :-
    precioJuego(Juego, PrecioFinal),
    not(oferta(Juego, _)).

cuantoSale(Juego, PrecioFinal) :-
    precioJuego(Juego, Precio),
    oferta(Juego, Descuento),
    realizarDescuento(Precio, Descuento, PrecioFinal).

realizarDescuento(Precio, Descuento, PrecioFinal):-
    PrecioFinal is Precio - (Precio * Descuento / 100).

/*-------------------------------------------------- PUNTO 2 ---------------------------------------------------------*/

juegoPopular(NombreDeJuego) :-
    esJuegoDeAccion(NombreDeJuego).

juegoPopular(NombreDeJuego) :-
    juego(mmorpg(NombreDeJuego, CantidadDeUsuarios), _),
    CantidadDeUsuarios > 1000000.

juegoPopular(NombreDeJuego) :-
    juego(puzzle(NombreDeJuego, 25, _), _).  

juegoPopular(NombreDeJuego) :-
    juego(puzzle(NombreDeJuego, _, facil), _).

/*-------------------------------------------------- PUNTO 3 ---------------------------------------------------------*/

tieneUnBuenDescuento(Juego):-
    oferta(Juego, Porcentaje),
    Porcentaje >= 50.

/*-------------------------------------------------- PUNTO 4 ---------------------------------------------------------*/

adictoALosDescuentos(NombreDeUsuario) :-
    esUsuario(NombreDeUsuario), 
    usuario(NombreDeUsuario, _, Compras),
    listaDeJuegosAComprar(Compras, JuegosAComprar),
    JuegosAComprar \= [],
    forall(member(NombreDeJuego, JuegosAComprar), tieneUnBuenDescuento(NombreDeJuego)).

listaDeJuegosAComprar(Compras, JuegosAComprar) :-
    findall(Juego, (member(compra(Juego), Compras)), JuegosAComprar).

/*-------------------------------------------------- PUNTO 5 ---------------------------------------------------------*/

fanaticoDe(NombreDeUsuario, Genero) :- 
    esUsuario(NombreDeUsuario), 
    findall(Juego, (usuario(NombreDeUsuario, JuegosQuePosee, _), member(Juego, JuegosQuePosee), generoDelJuego(Juego, Genero)), JuegosDelGenero),
    length(JuegosDelGenero, Cantidad),
    Cantidad >= 2.

generoDelJuego(Juego, accion) :-
    esJuegoDeAccion(Juego).

generoDelJuego(Juego, mmorpg) :-
    esJuegoMmorpg(Juego).

generoDelJuego(Juego, puzzle) :-
    esJuegoPuzzle(Juego).

/*-------------------------------------------------- PUNTO 6 ---------------------------------------------------------*/

/*monotematico​/2: Un usuario es
monotemático para un género si únicamente
posee juegos de ese género.*/

/*-------------------------------------------------- PUNTO 7 ---------------------------------------------------------*/

/*buenosAmigos​/2: Dos usuarios son buenos
amigos si se van a regalar juegos populares
mútuamente.*/

