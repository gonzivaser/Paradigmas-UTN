% EMPIEZA CODIGO CONSIGNA

% estaEn(Pelicula, Personaje). 
estaEn(buscandoANemo, nemo).
estaEn(buscandoANemo, dory).
estaEn(quienEnganio, rogerRabbit). 
estaEn(quienEnganio, doom).
estaEn(quienEnganio, eddie).
estaEn(quienEnganio, chuck).

% esAnimado(Personaje). 
esAnimado(nemo).
esAnimado(dory).
esAnimado(rogerRabbit).
esAnimado(doom).


aptaParaAmargos(Pelicula) :-
    findall(Personaje, (estaEn(Pelicula, Personaje), esAnimado(Personaje)), Personajes),
    length(Personajes, CantidadPersonajes),
    CantidadPersonajes = 0.

seDivierte(Personaje) :-
    findall(Animado, (estaEn(Pelicula1, Personaje), estaEn(Pelicula2, Animado), Pelicula1 = Pelicula2, esAnimado(Animado)), Compas),
    length(Compas, CantidadCompas),
    CantidadCompas >= 1.

% TERRMINA CODIGO CONSIGNA 

% 1
/*
   a) El predicado aptoParaAmargos lo que hace es hacer una lista de personajes animados, y si la lista tiene una longitud
      de 0, es aptaParaAmargos entonces. 
      El predicado seDvierte lo que haces es hacer una lista de compañeros animados que tendria un personaje en una pelicula.
      Si la longitud de la lista de compañeros animados es mayor o igual a 1, el personaje se divierte 
    
   b) No existen peliculas que no tengan personajes animados. Asi que creo una --> estaEn(rambo, rocky).
   ?- aptaParaAmargos(buscandoANemo). --> Falso ya que esta nemo que es animado, entonces no es apta para amargos
   ?- aptaParaAmargos(rambo). --> Verdadero, ya que rambo es una pelicula que no cuenta con personajes animados  
   ?- seDivierte(rocky). --> Falso ya que no hay personajes animados en rambo
   ?- seDvierte(nemo). --> Verdadero, ya que tiene mas de 1 personaje animado como compañero  

   c) ?- aptaParaAmargos(Pelicula). --> Falso, ya que no hay ninguna pelicula que no cunete con personajes animados
      ?- seDivierte(Personaje). --> Verdadero, porque todas las peliculas en la base de conocimientos tienen personajes
                                    animados, entonces todos los personajes se divierten
*/


% 2
/*
   Hay mal uso de declaratividad en las soluciones propuestas porque no hay delegacion de logica en los predicados dados. 
   Y tambien mal uso de pattern matching ya que no se ligan las cosas antes de entrar al findall por ejemplo. 
*/

% 3
aptaParaAmargosBienHecha(UnaPelicula) :-
    estaEn(UnaPelicula, _),
    forall(estaEn(UnaPelicula, UnPersonaje), not(esAnimado(UnPersonaje))). 

seDivierteBienHecha(UnPersonaje) :-
    estaEn(UnaPelicula, UnPersonaje), 
    estaEn(UnaPelicula, OtroPersonaje), 
    esAnimado(OtroPersonaje), 
    UnPersonaje \= OtroPersonaje.



