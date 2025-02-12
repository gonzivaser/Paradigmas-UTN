% EMPIEZA CODIGO CONSIGNA 

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

% TERMINA CODIGO CONSIGNA 

% 1
/*
   a) Falso, hay mucha repeticion de logica cuando se arma la lista de las bebidas alcholicas y de la longitud de 
      esta lista
   b) Falso, no es declarativa ya que no hay delegacion de logica alguna
   c) Verdadero, ya que si se tratara a la bebida de forma indistinta (aplicando polimorfismo), eliminaria la 
      repeticion de logica 
*/

% 2
/*
   El significado de esta consulta que se esta haciendo es que se muestren todos los nombres de las personas que 
   cumplen con las condiciones de la regla "tieneProblemas(Persona)"
*/

% 3
tieneProblemasMejorada(UnaPersona) :-
    toma(UnaPersona, _), 
    bebidasConAlcholQueToma(UnaPersona, CantidadDeBebidasConAlchol), 
    bebidasSinAlcholQueToma(UnaPersona, CantidadDeBebidasSinAlchol), 
    CantidadDeBebidasSinAlchol > CantidadDeBebidasConAlchol.


bebidasConAlcholQueToma(UnaPersona, CantidadDeBebidasConAlchol) :-
    findall(Bebida, (toma(UnaPersona, Bebida), tieneAlchol(Bebida)), BebidasConAlchol), 
    length(BebidasConAlchol, CantidadDeBebidasConAlchol).

bebidasSinAlcholQueToma(UnaPersona, CantidadDeBebidasSinAlchol) :-
    findall(Bebida, (toma(UnaPersona, Bebida), not(tieneAlchol(Bebida))), BebidasSinAlchol), 
    length(BebidasSinAlchol, CantidadDeBebidasSinAlchol).

tieneAlchol(UnaBebida) :-
    toma(_, vino(_, _)). 

tieneAlchol(UnaBebida) :-
    toma(_, cerveza(_, _, CantidadDeAlchol)), 
    CantidadDeAlchol > 0.


