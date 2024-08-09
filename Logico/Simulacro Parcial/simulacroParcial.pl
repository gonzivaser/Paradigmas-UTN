/*
    CONSGINA:
    https://docs.google.com/document/d/1Tvfqdj4N23O5NGJbbdBQGiDgMssnKvnhv0e4wkHvUpk/edit?usp=sharing
*/

/*------------------------------------------ BASE DE CONOCIMIENTOS -----------------------------------------------*/

% esPersonaje/1 nos permite saber qué personajes tendrá el juego
esPersonaje(aang).
esPersonaje(katara).
esPersonaje(zoka).
esPersonaje(appa).
esPersonaje(momo).
esPersonaje(toph).
esPersonaje(tayLee).
esPersonaje(zuko).
esPersonaje(azula).
esPersonaje(iroh).


% esElementoBasico/1 nos permite conocer los elementos básicos que pueden controlar algunos personajes
esElementoBasico(fuego).
esElementoBasico(agua).
esElementoBasico(tierra).
esElementoBasico(aire).


% elementoAvanzadoDe/2 relaciona un elemento básico con otro avanzado asociado
elementoAvanzadoDe(fuego, rayo).
elementoAvanzadoDe(agua, sangre).
elementoAvanzadoDe(tierra, metal).


% controla/2 relaciona un personaje con un elemento que controla
controla(zuko, rayo).
controla(toph, metal).
controla(katara, sangre).
controla(aang, aire).
controla(aang, agua).
controla(aang, tierra).
controla(aang, fuego).
controla(azula, rayo).
controla(iroh, rayo).


% visito/2 relaciona un personaje con un lugar que visitó. Los lugares son functores que tienen la siguiente forma:
% reinoTierra(nombreDelLugar, estructura)
% nacionDelFuego(nombreDelLugar, soldadosQueLoDefienden)
% tribuAgua(puntoCardinalDondeSeUbica)
% temploAire(puntoCardinalDondeSeUbica)
visito(aang, reinoTierra(baSingSe, [muro, zonaAgraria, sectorBajo, sectorMedio])).
visito(iroh, reinoTierra(baSingSe, [muro, zonaAgraria, sectorBajo, sectorMedio])).
visito(zuko, reinoTierra(baSingSe, [muro, zonaAgraria, sectorBajo, sectorMedio])).
visito(toph, reinoTierra(fortalezaDeGralFong, [cuartel, dormitorios, enfermeria, salaDeGuerra, templo, zonaDeRecreo])).
visito(aang, nacionDelFuego(palacioReal, 1000)).
visito(katara, tribuAgua(norte)).
visito(katara, tribuAgua(sur)).
visito(aang, temploAire(norte)).
visito(aang, temploAire(oeste)).
visito(aang, temploAire(este)).
visito(aang, temploAire(sur)).

/*------------------------------------------ FUNCIONES AUXILIARES ------------------------------------------------*/

sonPersonajes(Personaje, OtroPersonaje) :-
    esPersonaje(Personaje),
    esPersonaje(OtroPersonaje).

fueVisitadoReinoTierra(Lugar, Estructura) :-
    visito(_, reinoTierra(Lugar, Estructura)).

fueVisitado(Lugar) :-
    visito(_, Lugar).

/*------------------------------------------------- PUNTO 1 ------------------------------------------------------*/

esElAvatar(Personaje) :-
    esPersonaje(Personaje),
    controlaTodosLosElementosBasicos(Personaje).

controlaTodosLosElementosBasicos(Personaje) :-
    esPersonaje(Personaje),
    forall(esElementoBasico(Elemento), controla(Personaje, Elemento)).

/*------------------------------------------------- PUNTO 2 ------------------------------------------------------*/

controlaAlgunElementoBasico(Personaje) :-
    esPersonaje(Personaje),
    controla(Personaje, Elemento),
    esElementoBasico(Elemento).

controlaAlgunElementoAvanzado(Personaje) :-
    esPersonaje(Personaje),
    controla(Personaje, Elemento),
    elementoAvanzadoDe(_, Elemento).

noEsMaestro(Personaje) :-
    esPersonaje(Personaje),
    not(controlaAlgunElementoBasico(Personaje)),
    not(controlaAlgunElementoAvanzado(Personaje)).

esMaestroPrincipiante(Personaje) :-
    esPersonaje(Personaje),
    controlaAlgunElementoBasico(Personaje),
    not(controlaAlgunElementoAvanzado(Personaje)).

esMaestroAvanzado(Personaje) :-
    esPersonaje(Personaje),
    controlaAlgunElementoAvanzado(Personaje).

esMaestroAvanzado(Personaje) :-
    esElAvatar(Personaje).

/*------------------------------------------------- PUNTO 3 ------------------------------------------------------*/

sigueA(Seguido, Seguidor) :-
    sonPersonajes(Seguido, Seguidor),
    forall(visito(Seguido, Lugar), visito(Seguidor, Lugar)).

sigueA(aang, zuko).

/*------------------------------------------------- PUNTO 4 ------------------------------------------------------*/

% NACION DEL FUEGO --> Como no es digna de conocer, no lo agrego a la base de conocimientos

esDignoDeConocer(temploAire(_)).
esDignoDeConocer(tribuAgua(norte)).

esDignoDeConocer(reinoTierra(Lugar, Estructura)) :-
    fueVisitadoReinoTierra(Lugar, Estructura),
    noContieneMurosEnSuEstructura(reinoTierra(_, Estructura)).

noContieneMurosEnSuEstructura(reinoTierra(_, Estructura)) :-
    not(member(muro, Estructura)).

/*------------------------------------------------- PUNTO 5 ------------------------------------------------------*/

esPopular(Lugar) :-
    fueVisitado(Lugar), 
    listaDePersonajesQueVisitaron(Lugar, PersonajesQueVisitaron),
    cantidadDePersonajesQueVisitaron(PersonajesQueVisitaron, CantidadDePersonajesQueVisitaron),
    CantidadDePersonajesQueVisitaron >= 4.

listaDePersonajesQueVisitaron(Lugar, PersonajesQueVisitaron) :-
    fueVisitado(Lugar),
    findall(Personaje, visito(Personaje, Lugar), PersonajesQueVisitaron).

cantidadDePersonajesQueVisitaron(Lista, CantidadDePersonajesQueVisitaron) :-
    length(Lista, CantidadDePersonajesQueVisitaron).

/*------------------------------------------------- PUNTO 6 ------------------------------------------------------*/

% BUMI 
esPersonaje(bumi).
controla(bumi, tierra).
visito(bumi, reinoTierra(baSingSe, [muro, zonaAgraria, sectorBajo, sectorMedio])).

% SUKI
esPersonaje(suki).
visito(suki, nacionDelFuego(prisionDeMaximaSeguridad, 200)).




