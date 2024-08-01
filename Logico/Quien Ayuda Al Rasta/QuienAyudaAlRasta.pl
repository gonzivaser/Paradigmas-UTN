/*
https://docs.google.com/document/d/1JVjGLws_uPKNGgB5XuSC32IsScqSt4lHwiP_VrUwyog/edit?usp=sharing
*/

/*--------------------------------------------------- PREDICADOS ----------------------------------------------------------*/

% estaEnElAula(Persona)
estaEnElAula(rasta).
estaEnElAula(pollito).
estaEnElAula(santi).

/*----------------------------------------------------- REGLAS ----------------------------------------------------------*/

% quiere(Persona, OtraPersona)
quiere(santi, Persona) :- 
    estaEnElAula(Persona),
    not(quiere(rasta, Persona)).

quiere(rasta, Persona) :- 
    estaEnElAula(Persona),
    Persona \= pollito.

quiere(pollito, Persona) :-
    quiere(rasta, Persona).


% tieneMenosSuerteQue(Persona, OtraPersona)
tieneMenosSuerteQue(Persona, rasta) :-
    estaEnElAula(Persona),
    not(quiere(pollito, Persona)).


% quiereAyudar(Persona, OtraPersona)
quiereAyudar(Persona, OtraPersona) :- 
    estaEnElAula(Persona),
    quiere(Persona, OtraPersona),
    tieneMenosSuerteQue(Persona, OtraPersona).


/*----------------------------------------------------- A ----------------------------------------------------------*/

alguienQueQuieraMilhouse :-
    quiere(_, milhouse).

quiereSanti(Persona) :-
    quiere(santi, Persona).

quienQuiereRasta(Persona) :-
    quiere(rasta, Persona).

personasQueSeQuieren(Persona, OtraPersona) :-
    quiere(Persona, OtraPersona).

esVerdadQuePollitoQuiereAAlguien :-
    quiere(pollito, _).