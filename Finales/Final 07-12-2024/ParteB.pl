% videoJuego(titulo, desarrolladora, [generos], lanzamiento). 
videoJuego(marioBros, nintendo, [plataformas], 1985).

% PUNTO 1 ; Definir a los jugadores e implementar polimorficamente sus formas de evaluar
% jugador(Nombre, [Preferencias]). 
jugador(juan, [desarrolladora(nintendo), genero(plataformas)]). 
jugador(maria, [lanzamiento(2017)]). 
jugador(pedro, [desarrolladora(rockstarGames), genero(mundoAbierto)]). 

% Formas de evaluar
% jugador(juan, X). -> X = [desarrolladora(nintendo), genero(plataformas)].

% PUNTO 2 ; Hacer un predicado preferidoDelComite/1 que se cumple para los videojuegos que son preferidos por todos los jugadores del comité.
preferidoDelComite(UnVideoJuego) :-
    videoJuego(UnVideoJuego, _, _, _),
    forall(jugador(_, Preferencias), cumplePreferencias(UnVideoJuego, Preferencias)).