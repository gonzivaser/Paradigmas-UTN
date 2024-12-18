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


% PUNTO 1
% a) aptaParaAmargos/1: Relaciona una pelicula con los personajes que aparecen en ella, y esta es amarga si la lista de personajes que aparecen en la pelicula no tiene personajes animados.
%    seDivierte/1: Relaciona un personaje con los personajes animados con los que comparte pelicula, y se divierte si comparte pelicula con al menos un personaje animado.

% b) 
% i. ?- aptaParaAmargos(quienEnganio). FALSE
% ii. ?- aptaParaAmargos(buscandoANemo). TRUE
% iii. ?- seDivierte(rogerRabbit). TRUE
% iv. ?- seDivierte(dory). TRUE 

% c) 
% i. ?- aptaParaAmargos(_). --> Falso
% ii. ?- seDivierte(_). --> Falso


% PUNTO 2 
% aptaParaAmargos(Pelicula) --> El problema de declaratividad se da en el findall, ya que se esta utilizando una variable anonima para recorrer la lista de personajes que aparecen en la pelicula, y se esta preguntando si la cantidad de personajes que aparecen en la pelicula es 0, lo cual no es declarativo, ya que no se esta preguntando por la existencia de una pelicula que no tenga personajes animados, sino que se esta preguntando por la cantidad de personajes que aparecen en la pelicula.
% seDivierte(Personaje) --> El probelma de declaratividad se da tambien en el findall, ya que no se instancia el Personaje antes de entrar a este y se pregunta si comparte pelicula con al menos un personaje animado, lo cual no es declarativo, ya que no se esta preguntando por la existencia de un personaje que comparta pelicula con al menos un personaje animado, sino que se esta preguntando por la cantidad de personajes animados con los que comparte pelicula.


% PUNTO 3
aptaParaAmargosVol2(UnaPelicula) :-
    estaEn(UnaPelicula, _), 
    forall(estaEn(UnaPelicula, UnPersonaje), not(esAnimado(UnPersonaje))).

seDivierteVol2(UnPersonaje) :-
    estaEn(UnaPelicula, UnPersonaje), 
    estaEn(UnaPelicula, OtroPersonaje),
    esAnimado(OtroPersonaje),
    UnPersonaje \= OtroPersonaje.