/*
    https://docs.google.com/document/d/1TwZv6YwkrHtY2LFnoJfPioBcmFDajTBQqDDKigA1k6U/edit?usp=sharing
*/

/* ----------------------------------------- PUNTO 1 : PERSONAS --------------------------------------------------- */

% BAKUNIN
trabajaEn(bakunin, aviacionMilitar).
esBuenoEn(bakunin, conducirAutos).
historialCriminal(bakunin, roboDeAeronaves).
historialCriminal(bakunin, fraude).
historialCriminal(bakunin, tenenciaDeCafeina).


% RAVACHOL
trabajaEn(ravachol, inteligenciaMilitar).
esBuenoEn(ravachol, tiroAlBlanco).
ama(ravachol, juegosDeAzar).
ama(ravachol, ajedrez).
ama(ravachol, tiroAlBlanco).
historialCriminal(ravachol, falsificacionDeVacunas).
historialCriminal(ravachol, fraude).


% ROSA DUBOVSKY
quiereSer(rosaDubovsky, recolectorDeBasura).
quiereSer(rosaDubovsky, asesinaASueldo).
esBuenoEn(rosaDubovsky, construirPuentes).
esBuenoEn(rosaDubovsky, mirarPeppaPig).
ama(rosaDubovsky, construirPuentes).
ama(rosaDubovsky, mirarPeppaPig).
ama(rosaDubovsky, fisicaCuantica).


% EMMA GOLDMAN
trabajaEn(emmaGoldman, profesoraDeJudo).
trabajaEn(emmaGoldman, cineasta).
esBuenoEn(emmaGoldman, Actividad) :-
    esBuenoEn(judithButler, Actividad).
esBuenoEn(emmaGoldman, Actividad) :-
    esBuenoEn(elisaBachofen, Actividad).


% JUDITH BUTLER
trabajaEn(judithButler, profesoraDeJudo).
trabajaEn(judithButler, inteligenciaMilitar).
esBuenoEn(judithButler, judo).
ama(judithButler, judo).
ama(judithButler, carrerasDeAutomovilismo).
historialCriminal(judithButler, falsficacionDeCheques).
historialCriminal(judithButler, fraudes).


% ELISA BACHOFEN
trabajaEn(elisaBachofen, ingenieraMecanica).
ama(elisaBachofen, fuego).
ama(elisaBachofen, destruccion).
esBuenoEn(elisaBachofen, armarBombas).


% JUAN SURIANO
esBuenoEn(juanSuriano, judo).
esBuenoEn(juanSuriano, armarBombas).
ama(juanSuriano, judo).
historialCriminal(juanSuriano, falsificacionDeDinero).
historialCriminal(juanSuriano, fraude).