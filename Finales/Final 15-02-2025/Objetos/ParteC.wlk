// 1
/*
   a) Falso, no es necesario agregar una superclase para tratar a los eventos de manera polimorfica. Directamente se
      puede agregar un metodo, donde se trate a ambos tipos de eventos de manera polimorfica.
   b) Falso, ya que "estaLibre(unaFecha)" al no tratar de manera polimorfica a los eventos, la logica codificada en este
      metodo, no es apta para poder evaluar una lista de dias
*/

// 2
class Calendario {
    var eventos

    method estaLibre(unaFecha) {
        eventos.all({ unEvento => unEvento.tieneDisponibilidad(unaFecha) })
    }
}

class EventoDiaCompleto {
    var property fecha

    method tieneDisponibilidad(unaFecha) {
        return unaFecha != fecha
    } 
}

object recordatorio {
    method tieneDisponibilidad(unaFecha) {
        return true
    }
}

class EventoDeVariosDias {
    var property fechas

    method tieneDisponibilidad(unaFecha) {
        return !fechas.contains(unaFecha)
    } 
}