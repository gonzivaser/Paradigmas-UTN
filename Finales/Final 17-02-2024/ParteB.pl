% EMPIEZA CODIGO CONSIGNA
% tiene(Persona, Cosa). 
% vale(Cosa, Valor). 

tiene(gonzi, perro).
vale(perro, 100). 
tiene(santi, gato). 
vale(gato, 50). 

% TERMINA CODIGO CONSIGNA 

% 1
todoLoQueTieneEsMasValioso(Persona1, Persona2) :-
    forall((tiene(Persona1, Cosa1), vale(Cosa1, ValorCosaValiosa), tiene(Persona2, Cosa2), vale(Cosa2, OtroValor)), ValorCosaValiosa > OtroValor).


% 2
% a) 
% No es posible, ya que el "todoLoQueTieneEsMasValioso" no es inversible, y al no serlo, no permite hacer ese tipo de consultas
todoLoQueTieneEsMasValiosoVersion2(Persona1, Persona2) :-
    tiene(Persona1, Cosa1),
    tiene(Persona2, Cosa2), 
    forall((vale(Cosa1, ValorCosaValiosa), vale(Cosa2, OtroValor)), ValorCosaValiosa > OtroValor).

% b) 
% ?- todoLoQueTieneEsMasValiosoVersion2(UnaPersona, pedro).