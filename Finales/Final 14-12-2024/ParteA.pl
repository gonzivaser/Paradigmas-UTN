
% EMPIEZA CODIGO CONSIGNA
/*
puedeInscribirse(Atleta, Competencia, Fecha) :-
    inscripcionGeneral(Atleta, FechaInscripcion),
    not(participo(Atleta, Competencia, _)), 
    añosCalendarioTranscurridos(FechaInscripcion, Fecha, 0). 

puedeInscribirse(Atleta, Competencia, Fecha) :-
    inscripcionGeneral(Atleta, FechaInscripcion),
    not(participo(Atleta, Competencia, _)), 
    competenciaRequerida(CompetenciaPrevia, Competencia), 
    participo(Atleta, CompetenciaPrevia, _).

inscripcionGeneral(Atleta, Fecha). 
participo(Atleta, Competencia, Fecha). 
competenciaRequerida(CompetenciaPrevia, Competencia). 
añosCalendarioTranscurridos(FechaInscripcion, Fecha, 0).
*/
% TERMINA CODIGO CONSIGNA

% 1
/*
   Falso, no cumple con la logica pedida porque cuando se verifican las competencias requeridas. Un atleta puede participar 
   de una competencia siempre y cuando no haya pasado mas de un año y haya participado en TODAS las competencias 
   requeridas a la que quiere participar, entonces en la segunda regla no se esta manejando bien esa parte. Faltaria
   hacer un forall con las competencias requeridas para ver si puede participar.
*/

% 2
/*
   Como la inversibilidad de puedeInscribirse/3, depende de los predicados que utiliza, esta no seria del todo inversible 
   porque añosCalendarioTranscurridos no es completamente inversible, lo que haria que puedeInscribirse/3 no sera 
   inversible para todos sus parametros. 
   Para que puedeInscribirse/3 sea completamente inversible, modificaria el predicado de añosCalendarioTranscurridos 
   para que sea inversible para sus tres parametros.
*/

% 3
inscripcionGeneral(gonzi, 5).
participo(gonzi, futbol, 5).
competenciaRequerida(natacion, futbol).
anosCalendarioTranscurridos(5, 5, 0). 


puedeInscribirse(UnAtleta, UnaCompetencia, UnaFecha) :-
    inscripcionGeneral(UnAtleta, _), 
    competencia(UnaCompetencia), 
    fecha(UnaFecha), 
    noParticipoEn(UnaCompetencia, UnAtleta), 
    tieneInscripcionPermitida(UnAtleta, UnaCompetencia, UnaFecha). 

tieneInscripcionPermitida(UnAtleta, UnaCompetencia, _) :-
    forall(competenciaRequerida(CompetenciaPrevia, UnaCompetencia), participo(UnAtleta, CompetenciaPrevia, _)).

tieneInscripcionPermitida(UnAtleta, UnaCompetencia, UnaFecha) :-
    inscripcionGeneral(UnAtleta, FechaInscripcion), 
    anosCalendarioTranscurridos(FechaInscripcion, UnaFecha, 0).

fecha(UnaFecha) :-
    inscripcionGeneral(_, UnaFecha). 

competencia(UnaCompetencia) :-
    participo(_, UnaCompetencia, _). 

noParticipoEn(UnaCompetencia, UnAtleta) :-
    not(participo(UnAtleta, UnaCompetencia, _)).

