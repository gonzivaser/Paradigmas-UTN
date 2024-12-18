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

cumplePreferencias(UnVideoJuego, Preferencias) :-
    member(Preferencia, Preferencias).


% PUNTO 3 
ovejaNegra(UnVideoJuego) :-
    videoJuego(UnVideoJuego, _, _, _),
    forall(jugador(_, Preferencias), not(cumplePreferencias(UnVideoJuego, Preferencias))).


% PUNTO 4
% Ejemplos de consulta:
% preferidoDelComite(_). ; preferidosDelComite(X) ; preferidoDelComite(marioBros).
% ovejaNegra(_). ; ovejaNegra(X) ; ovejaNegra(marioBros).

% Inversivilidad: 
% preferidoDelComite: Es inversible, ya que se puede consultar por el videojuego que es preferido por todos los jugadores del comité.
% ovejaNegra: Es inversible, ya que se puede consultar por el videojuego que no es preferido por ningun jugador del comité.
