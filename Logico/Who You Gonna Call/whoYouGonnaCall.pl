/*
    CONSGINA:
    https://docs.google.com/document/d/1GBORNTd2fujNy0Zs6v7AKXxRmC9wVICX2Y-pr7d1PwE/edit?usp=sharing
*/

/*
    POSIBLE RESOLUCION: 
    https://github.com/pdep-mit/ejemplos-de-clase-prolog/commit/60f4cd6227ab868b9476263836e143c4d66762f3
*/

/*------------------------------------------ BASE DE CONOCIMIENTOS -----------------------------------------------*/

herramientasRequeridas(ordenarCuarto, [aspiradora(100), trapeador, plumero]).
herramientasRequeridas(limpiarTecho, [escoba, pala]).
herramientasRequeridas(cortarPasto, [bordedadora]).
herramientasRequeridas(limpiarBanio, [sopapa, trapeador]).
herramientasRequeridas(encerarPisos, [lustradpesora, cera, aspiradora(300)]).

/*-------------------------------------------------- PUNTO 1 ---------------------------------------------------------*/

egon(aspiradora(200)).
egon(trapeador).
peter(trapeador).
winston(varitaNeutrones).

/*-------------------------------------------------- PUNTO 2 ---------------------------------------------------------*/

/*Definir un predicado que determine si un integrante satisface la necesidad de una herramienta requerida. 
Esto será cierto si tiene dicha herramienta, teniendo en cuenta que si la herramienta requerida es una aspiradora, 
el integrante debe tener una con potencia igual o superior a la requerida.
Nota: No se pretende que sea inversible respecto a la herramienta requerida.*/




