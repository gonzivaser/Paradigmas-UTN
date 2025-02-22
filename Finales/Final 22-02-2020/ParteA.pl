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
   a) Falso, no es correcto, porque no se esta verificando que TODOS los inmuebles altos superan el precio.
   b) Falso, no es correcto, porque no se esta tratando a los diferentes inmuebles de manera indistinta
   c) Falso, solo es inversible para el parametro "Barrio", no para el parametro "Precio", ya que no se esta generando 
      en ningun momento.
*/

% 2
todosAltosConPrecioEnBienHecha(UnPrecio, UnBarrio) :-
    barrio(UnBarrio),
    forall((precio(UnInmueble, UnBarrio, OtroPrecio), OtroPrecio >= UnPrecio), esInmuebleAlto(UnInmueble)).

esInmuebleAlto(casa(_, PisosDeCasa)) :-
    PisosDeCasa > 3.
    
esInmuebleAlto(dpto(_, PisoDeDepto, _)) :-
    PisoDeDepto > 5.
    
esInmuebleAlto(ph(_, PisosDePh, _)) :-
    PisosDePh > 2.

barrio(UnBarrio) :-
    precio(_, UnBarrio, _).