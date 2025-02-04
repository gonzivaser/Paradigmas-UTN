/*EMPIEZA CODIGO CONSIGNA*/
class Calendario {
    var eventos 
    
    method estaLibre(fecha) {
        eventos.all({ evento => evento.esRecordatorio() or (not evento.esRecordatorio() and evento.fecha() != fecha) })
    }
}

class EventoDiaCompleto {
    var property fecha

    method esRecordatorio() {
        return false
    } 
}

class Recordatorio {
    method esRecordatorio() {
        return true
    }
}
/*TERMINA CODIGO CONSIGNA*/

// 1
/*
  a) Falso, no es necesario agregar esa superclase porque los tipos de evento ya los esta tratando polimorficamente 
     a traves del metodo esRecordatorio()
  b) Falso, porque si class EventoVariosDias tiene una lista de fechas, en la parte de evento.fecha() devolveria una lista donde no se puede comparar directamente con fecha
*/

// 2
class CalendarioVol2 {
    var eventos 

    method estaLibre(unaFecha) {
        eventos.all({ unEvento => unEvento.tieneLibre(unaFecha) })
    }
}

class EventoDiaCompletoVol2 {
    var property fecha

    method tieneLibre(unaFecha) {
        return unaFecha != fecha
    }
}

class RecordatorioVol2 {
    method tieneLibre(unaFecha) {
        return true
    }
}