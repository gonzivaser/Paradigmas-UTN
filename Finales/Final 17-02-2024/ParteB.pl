tiene(sebi, brisa).
vale(brisa, 30000).
tiene(gonzi, uma).
vale(uma, 10000).

% PUNTO 1
todoLoQueTieneEsMasValioso(Persona1, Persona2) :-
    tiene(Persona1, _),
    tiene(Persona2, _),
    Persona1 \= Persona2,
    forall((tiene(Persona1, CosaValiosa), vale(CosaValiosa, ValorCosaValiosa), tiene(Persona2, OtraCosa), vale(OtraCosa, OtroValor)), ValorCosaValiosa > OtroValor).


% PUNTO 2
% EL PREDICADO COMO ESTA EL ENUNCIADO NO ES INVERSIBLE 

% PUNTO 3
% todoLoQueTieneEsMasValioso(pedro, Persona2)