/*
    CONSGINA:
    https://drive.google.com/file/d/1x4X-0AfaKK3Zv-twZfsviXRlH6Xg2Oxt/view
*/

/*------------------------------------------ BASE DE CONOCIMIENTOS 1 -----------------------------------------------*/

% comio(Personaje, Bicho)
comio(pumba, vaquitaSanAntonio(gervasia,3)).
comio(timon, vaquitaSanAntonio(romualda,4)).
comio(simba, vaquitaSanAntonio(remeditos,4)).


comio(pumba, hormiga(federica)).
comio(pumba, hormiga(tuNoEresLaReina)).
comio(simba, hormiga(schwartzenegger)).
comio(simba, hormiga(niato)).
comio(simba, hormiga(lula)).

comio(pumba, cucaracha(ginger,15,6)).
comio(pumba, cucaracha(erikElRojo,25,70)).
comio(timon, cucaracha(gimeno,12,8)).
comio(timon, cucaracha(cucurucha,12,5)).


pesoHormiga(2).

% peso(Personaje, Peso)
peso(pumba, 100).
peso(timon, 50).
peso(simba, 200).

/*---------------------------------------------- FUNCIONES AUXILIARES ---------------------------------------------------------*/

esCucaracha(cucaracha(Nombre, _, _)) :-
    comio(_, cucaracha(Nombre, _, _)).

esHormiga(hormiga(Nombre)) :-
    comio(_, hormiga(Nombre)).

esVaquita(vaquitaSanAntonio(Nombre, _)) :-
    comio(_, vaquitaSanAntonio(Nombre, _)).

esPersonaje(Personaje) :-
    comio(Personaje, _).

/*-------------------------------------------------- PUNTO 1A ---------------------------------------------------------*/

jugosita(cucaracha(Nombre, Tamano, Peso)) :-
    esCucaracha(cucaracha(Nombre, Tamano, Peso)),
    comio(_, cucaracha(_, Tamano, OtroPeso)),
    Peso > OtroPeso.

/*-------------------------------------------------- PUNTO 1B ---------------------------------------------------------*/

hormigofilico(Personaje) :-
    esPersonaje(Personaje),
    findall(Hormiga, comio(Personaje, hormiga(_)), Comidas),
    length(Comidas, Cantidad),
    Cantidad >= 2. 

/*-------------------------------------------------- PUNTO 1C ---------------------------------------------------------*/

cucarachofobico(Personaje) :-
    esPersonaje(Personaje),
    not(comio(Personaje, cucaracha(_, _, _))).

/*-------------------------------------------------- PUNTO 1D ---------------------------------------------------------*/

/*d) Conocer al conjunto de los picarones. Un personaje es picarón si comió una cucaracha jugosita ó si se
come a Remeditos la vaquita. Además, pumba es picarón de por sí.
?- picarones(L).
L = [pumba, timon, simba]*/

picarones(pumba).

picarones(Personaje) :-
    esPersonaje(Personaje),
    jugosita(cucaracha(_, _, _)).

picarones(Personaje) :-
    esPersonaje(Personaje),
    comio(Personaje, vaquitaSanAntonio(remeditos, _)).

/*------------------------------------------ BASE DE CONOCIMIENTOS 2 -----------------------------------------------*/

% PERSIGUE
persigue(scar, timon).
persigue(scar, pumba).
persigue(shenzi, simba).
persigue(shenzi, scar).
persigue(banzai, timon).

comio(shenzi,hormiga(conCaraDeSimba)).

% PESO HIENAS  
peso(scar, 300).
peso(shenzi, 400).
peso(banzai, 500).

/*-------------------------------------------------- PUNTO 2A ---------------------------------------------------------*/

/*Se quiere saber cuánto engorda un personaje (sabiendo que engorda una cantidad igual a la suma de
los pesos de todos los bichos en su menú). Los bichos no engordan.
?- cuantoEngorda(Personaje, Peso).
Personaje= pumba
Peso = 83;
Personaje= timon
Peso = 17;
Personaje= simba
Peso = 10
*/

cuantoEngorda(Personaje, Peso) :-
    esPersonaje(Personaje),
    findall(Peso, comio(Personaje, cucaracha(_, _, Peso)), Pesos),
    sum_list(Pesos, Peso).


% SI EL PESO DE LA HORMIGA ES 2, COMO HAGO PARA AGREGARLO A LA LISTA DE PESOS?
cuantoEngorda(Personaje, Peso) :-
    esPersonaje(Personaje),
    findall(Peso, comio(Personaje, hormiga(_)), Pesos),
    length(Pesos, Cantidad),
    pesoHormiga(PesoHormiga),
    Peso is Cantidad * PesoHormiga.

cuantoEngorda(Personaje, Peso) :-
    esPersonaje(Personaje),
    findall(Peso, comio(Personaje, vaquitaSanAntonio(_, Peso)), Pesos),
    sum_list(Pesos, Peso).