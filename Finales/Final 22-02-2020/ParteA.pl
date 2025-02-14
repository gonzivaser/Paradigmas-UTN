% EMPIEZA CODIGO CONSIGNA 

% precio(casa(ambientes, pisos), barrio, precio). 
% precio(depto(ambientes, piso, totalUnidades), barrio, precio). 
% precio(ph(ambientes, pisos, totalUnidades), barrio, precio).

precio(casa(4, 3), flores, 1400000).
precio(depto(4, 6, 28), palermo, 1800000). 
precio(ph(4, 2, 4), flores, 1200000).

todosAltosConPrecioEn(Precio, Barrio) :-
    precio(casa(_, Pisos), Barrio, Precio1), 
    Precio1 >= Precio,
    Pisos > 3, 
    precio(depto(_, Piso, _), Barrio, Precio2), 
    Precio2 >= Precio,
    Piso > 5, 
    precio(ph(_, PisosPh, _), Barrio, Precio3), 
    Precio3 >= Precio,
    PisosPh >= 2. 

% TERMINA CODIGO CONSIGNA

% 1
/*
   a) Verdadero,La solucion propuesta es correcta, pero con mucha repeticion de logica y falta de delegacion de esta
   b) Falso, no es correcto, no se esta tratando polimorficamente a los distintos tipos de bienes.
   c) Falso, el predicado no es inversible para lo que seria el Precio. No se asegura la existencia del Precio en ningun 
      momento.  
*/

% 2
todosAltosConPrecioEnVol2(UnPrecio, UnBarrio) :-
    precio(_, UnBarrio, UnPrecio).

bienAlto(Barrio, casa(_, Pisos)) :-
    Pisos > 3.

bienAlto(Barrio, depto(_, Pisos, _)) :-
    Pisos > 5. 

bienAlto(Barrio, ph(_, Pisos, _)) :-
    Pisos >= 2.