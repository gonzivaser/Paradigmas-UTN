% UN ATLETA PUEDE INSCRIBIRSE CUANDO: 
% - HA COMPLETADO LA INSCRIPCION GENERAL AL TORNEO 
% - NO HA PARTICIPADO TODAVIA EN ESA COMPETENCIA
% - HA PARTICIPADO EN TODAS LAS COMPETENCIAS REQUERIDAS COMO CONDICION PREVIA PARA ESA COMPETENCIA, A MENOS QUE LA INSCRIPCION GENERAL 
%   AL TORNEO SE HAYA REALIZADO HACE MENOS DE UN AÑO CALENDARIO, EN CUYO CASO LAS COMPETENCIAS PREVIAS NO SON REQUERIDAS


% inscripcionGeneral(Atleta, Fecha). RELACIONA UN ATLETA Y LA FECHA EN LA QUE SE INSCRIBIO AL TORNEO. ES INVERSIBLE 
% participo(Atleta, Competencia, Fecha). RELACIONA UN ATLETA, UNA COMPETENCIA Y LA FECHA EN LA QUE PARTICIPO. ES INVERSIBLE
% competenciaRequerida(CompetenciaPrevia, Competencia). RELACIONA DOS COMPETENCIAS TALES QUE LA PRIMERA ES CONDICION PARA LA SEGUNDA. ES INVERSIBLE
% añosCalendarioTranscurridos(Fecha1, Fecha2, Años). RELACIONA DOS FECHAS CUALQUIERA CON LOS AÑOS CALENDARIO QUE TRANSCURRIERON ENTRE ELLAS ENTRE AMBAS. SOLO ES INVERSIBLE PARA SU TERCER PARAMETRO

inscripcionGeneral(sebi, fecha(12,12,2023)).
participo(sebi, futbol, fecha(12,12,2023)).
competenciaRequerida(futbol, natacion).
anosCalendarioTranscurridos(fecha(12,12,2023), fecha(12,12,2024), 1).

puedeInscribirse(Atleta, Competencia, Fecha) :-
    inscripcionGeneral(Atleta, Fecha),
    not(participo(Atleta, Competencia, _)),
    anosCalendarioTranscurridos(FehcaInscripcion, Fecha, 0). 


puedeInscribirse(Atleta, Competencia, _) :-
    inscripcionGeneral(Atleta, _),
    not(participo(Atleta, Competencia, _)), 
    competenciaRequerida(CompetenciaPrevia, Competencia), 
    participo(Atleta, CompetenciaPrevia, _).


% 1) ¿La solucion propuesta cumple con la logica pedida? Justifique y plantee algun ejemplo que sirva para fundamentar esa respuesta
% Si, la solucion propuesta cumple con la logica pedida. La primera clausula se encarga de verificar que el atleta se haya inscripto al torneo, que no haya participado en la competencia y que la inscripcion general haya sido hace menos de un año.
% La segunda clausula se encarga de verificar que el atleta se haya inscripto al torneo, que no haya participado en la competencia y que haya participado en todas las competencias requeridas como condicion previa para esa competencia.

% 2) Analice inversivilidad de puedeInscribirse/3. En caso de que no sea inversible para uno o mas parametros, explique que seria necesario modificar o agregar para que lo sea. 
% No es inversible porque en ambas clausulas faltan valores para que tome Competencia. 
% Como lo arreglaria: 

competencia(futbol).
competencia(natacion).

% AGREGARIA ESTO PARA QUE SEA INVERSIBLE

% 3) Realice cualqueir correccion que considere necesaria sobre puedeInscribirse/3, considerando las respuestas anteriores y eliminando cualquier repeticion logica

puedeInscribirse(UnAtleta, UnaCompetencia, UnaFecha) :-
    inscripcionGeneral(UnAtleta, UnaFecha), 
    competencia(UnaCompetencia), 
    not(participo(UnAtleta, UnaCompetencia, _)),
    anosCalendarioTranscurridos(UnaFecha, UnaFecha, 0).

puedeInscribirse(UnAtleta, UnaCompetencia, _) :-
    inscripcionGeneral(UnAtleta, _),
    competencia(UnaCompetencia),
    competenciaRequerida(CompetenciaPrevia, UnaCompetencia),
    participo(UnAtleta, CompetenciaPrevia, _),
    competencia(CompetenciaPrevia), 
    not(participo(UnAtleta, UnaCompetencia, _)).
