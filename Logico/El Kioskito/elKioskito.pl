
/*------------------------------------------------- DEFINO HORARIOS ---------------------------------------------------*/

atiende(dodain, lunes, 9, 15).
atiende(lucas, martes, 10, 20).
atiende(juanC, sabado, 18, 22).
atiende(juanC, domingo, 18, 22).
atiende(juanFdS, jueves, 10, 20).
atiende(juanFdS, viernes, 12, 20).
atiende(leoC, lunes, 14, 18).
atiende(leoC, miercoles, 14, 18).
atiende(martu, miercoles, 23, 24).

/*------------------------------------------- PUNTO 1 : CALENTANDO MOTORES---------------------------------------------------*/

% -- ATIENDE VALE
atiende(vale, Dia, HoraInicio, HoraFin) :- 
    atiende(dodain, Dia, HoraInicio, HoraFin).

atiende(vale, Dia, HoraInicio, HoraFin) :- 
    atiende(juanC, Dia, HoraInicio, HoraFin).

% -- NADIE HACE EL MISMO HORARIO QUE LEOC --> NO LO AGREGO PORQUE ES INDISTINTO

% -- MAIU ESTA PENSANDO --> NO PONGO NADA PORQUE AL SER FALSO NO SE PUEDE AGREGAR A LA BASE DE CONOCIMIENTOS

/*----------------------------------------- PUNTO 2 : QUIEN ATIENDE EL KIOSKO ---------------------------------------------------*/

quienAtiende(Persona, Dia, Hora) :-
    atiende(Persona, Dia, HoraInicio, HoraFin), 
    between(HoraInicio, HoraFin, Hora).

/*--------------------------------------------- PUNTO 3 : FOREVER ALONE ---------------------------------------------------*/

estaForeverAlone(Persona, Dia, Hora) :-
    quienAtiende(Persona, Dia, Hora), 
    not((quienAtiende(OtraPersona, Dia, Hora), Persona \= OtraPersona)).

/*--------------------------------------- PUNTO 4 : POSIBILIDAD DE ATENCION ---------------------------------------------------*/ 

/*Dado un día, queremos relacionar qué personas podrían estar atendiendo el kiosko en algún momento de ese día. Por ejemplo, 
si preguntamos por el miércoles, tiene que darnos esta combinatoria:
nadie
dodain solo
dodain y leoC
dodain, vale, martu y leoC
vale y martu
etc.

Queremos saber todas las posibilidades de atención de ese día. La única restricción es que la persona atienda ese día (no puede aparecer lucas, por ejemplo, porque no atiende el miércoles).
*/

posibilidadDeAtencion(Dia, Personas) :-
    findall(Persona, quienAtiende(Persona, Dia, _), Personas).

/*--------------------------------------- PUNTO 5 : VENTAS / SUERTUDAS ---------------------------------------------------*/ 

% VENTAS DODAIN
venta(dodain, fecha(10, 8), [golosinas(1200), cigarrillos(jockey), golosinas(50)]).
venta(dodain, fecha(12, 8), [bebidas(8, alcoholicas), bebidas(1, noAlcoholica), golosinas(10)]).

% VENTAS MARTU
venta(martu, fecha(12, 8), [golosinas(1000), cigarrillos(chesterfield, colorado, parisiennes)]).

% VENTAS LUCAS
venta(lucas, fecha(11, 8), [golosinas(600)]).
venta(lucas, fecha(18, 8), [bebidas(2, noAlcoholica), cigarrillos(derby)]).

% CUANDO UNA VENTA ES IMPORTANTE
ventaImportante(golosinas(Monto)) :-
    Monto > 100.

ventaImportante(cigarrillos(Marcas)) :-
    length(Marcas, CantidadMarcas),
    CantidadMarcas > 2.

ventaImportante(bebidas(Cantidad, noAlcoholica)) :-
    Cantidad > 5.

ventaImportante(bebidas(_, alcoholicas)).

% SUERTUDA
esSuertuda(Persona) :-
    venta(Persona, _, Ventas), 
    forall(member(Venta, Ventas), ventaImportante(Venta)).
