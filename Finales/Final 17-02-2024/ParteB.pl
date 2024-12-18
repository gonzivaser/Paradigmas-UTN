% tiene(Persona, Cosa). 
% vale(Cosa, Valor). 

tiene(ana, auto).
tiene(mariela, avion). 
vale(auto, 100). 
vale(avion, 200). 

% PUNTO 1
%todoLoQueTieneEsMasValioso(Persona1, Persona2) :-
 %   forall((tiene(Persona1, CosaValiosa), vale(CosaValiosa, ValorCosaValiosa), tiene(Persona2, OtraCosa), vale(OtraCosa, ValorOtraCosa)), ValorCosaValiosa > OtroValor).

% PUNTO 2
% a) No es posible, ya que todoLoQueTieneEsMasValioso/2 no es inversible, entonces no lo permite.
todoLoQueTieneEsMasValiosoVol2(Persona1, Persona2) :-
    tiene(Persona1, CosaValiosa), 
    tiene(Persona2, OtraCosa),
    forall((vale(CosaValiosa, ValorCosaValiosa), vale(OtraCosa, ValorOtraCosa)), ValorCosaValiosa > ValorOtraCosa).

% b) 
% ?- todoLoQueTieneEsMasValiosoVol2(pedro, _).