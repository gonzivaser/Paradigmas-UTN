% videoJuego(titulo, desarrolladora, [generos], lanzamiento). 
videoJuego(gta, rockstar, [accion], 2015).


% 1
% juador(Nombre, [preferencias]). 
jugador(juan, [desarrolladora(nintendo), genero(plataformas)]). 
jugador(maria, [reciente]).
jugador(pedro, [desarrolladora(rockstar), genero(mundoAbierto)]). 

% FORMA DE EVALUAR
cumplePreferencias(UnJugador, UnTitulo) :-
    jugador(UnJugador, Preferencias), 
    member(Preferencia, Preferencias), 
    prefiere(UnTitulo, Preferencia).


prefiere(UnTitulo, desarrolladora(UnaDesarrolladora)) :-
    videoJuego(_, UnaDesarrolladora, _, _).

prefiere(UnTitulo, reciente) :-
    videoJuego(_, _, _, AnoDeLanzamiento), 
    AnoDeLanzamiento > 2015.

prefiere(UnTitulo, genero(UnGenero)) :-
    videoJuego(_, _, Generos, _), 
    member(UnGenero, Generos).


% 2
preferidoDelComite(UnTitulo) :-
    videoJuego(UnTitulo, _, _, _), 
    forall(jugador(Jugador, _), cumplePreferencias(Jugador, UnTitulo)). 

% 3
ovejaNegra(UnTitulo) :-
    videoJuego(UnTitulo, _, _, _), 
    not(cumplePreferencias(_, UnTitulo)). 

% 4
/*
    ?- preferidoDelComite(gta). 
    ?- ovejaNegra(UnTitulo).
    Ambos predicados son inversibles, ya que se genera el titulo antes de entrar al forall en el caso de preferidoDelComite
    y antes de entrar al not, en el caso de la ovejaNegra
*/
