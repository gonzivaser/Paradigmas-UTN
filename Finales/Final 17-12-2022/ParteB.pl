% toma(Persona, Gaseosa). 
% toma(Persona, vino(Tipo, AñosDeAñejamiento)).
% toma(Persona, cerveza(Variedad, Amargor, PorcentajeAlcohol)).
% vino siempre tiene alchol 
% cerveza puede no tener alchol

toma(juan, coca). 
toma(juan, vino(malbec, 3)). 
toma(daiana, cerveza(golden, 18, 0)). 
toma(gisela, cerveza(ipa, 52, 7)). 
toma(edu, cerveza(stout, 28, 6)). 

tieneProblemas(Persona) :-
    findall(C, (toma(Persona, cerveza(C, _, A)), A > 0), Cs), 
    findall(V, toma(Persona, vino(V, _)), Vs),
    findall(T, toma(Persona, T), Ts),
    length(Cs, CCs),
    length(Vs, CVs),
    length(Ts, CTs),
    CTs is CCs + CVs.


% PUNTO 1
% a) Verdadero, no hay repeticion de logica porque las condiciones de filtrar en los findall varia segun la bebida
% b) Falso, no es declarativa ya que no hay derivacion de logica y no se entienden los nombres de las variables
% c) Verdadero, podria mejorarse con polimorfismo tratando de manera indistinta a las bebidas, por ejemplo tieneAlchol(UnaBebida)

% PUNTO 2
% ?- tieneProblemas(P). 
% Esta consulta, nos va a devolver las personas que tienen problemas con las bebidas alcoholicas


% PUNTO 3
tieneProblemasVol2(UnaPersona) :-
    toma(UnaPersona, _),
    bebidasConAlcholQueToma(UnaPersona, CantidadDeBebidasConAlchol),
    bebidasSinAlcholQueToma(UnaPersona, CantidadDeBebidasSinAlchol),
    CantidadDeBebidasConAlchol > CantidadDeBebidasSinAlchol.

bebidasConAlcholQueToma(UnaPersona, CantidadDeBebidasConAlchol) :-
    findall(Bebidas, (toma(UnaPersona, Bebidas), tieneAlchol(Bebidas)), BebidasConAlchol),
    length(BebidasConAlchol, CantidadDeBebidasConAlchol).


bebidasSinAlcholQueToma(UnaPersona, CantidadDeBebidasSinAlchol) :-
    findall(Bebidas, (toma(UnaPersona, Bebidas), not(tieneAlchol(Bebidas))), BebidasSinAlchol),
    length(BebidasSinAlchol, CantidadDeBebidasSinAlchol).
    

tieneAlchol(UnaBebida) :-
    toma(_, vino(_, _)). 

tieneAlchol(UnaBebida) :-
    toma(_, cerveza(_, _, NivelDeAlchol)), 
    NivelDeAlchol > 0.