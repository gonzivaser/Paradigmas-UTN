class Calendario {
    var eventos 

    method estaLibre(fecha) {
        return eventos.all({ evento => evento.esRecordatorio() or (not evento.esRecordatorio() and evento.fecha() != fecha) })
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

// PARTE 1
// a) Falso ya que la clase calendario los esta tratando polimorficamente a traves del metodo esRecordatorio()
// b) Falso, porque si class EventoVariosDias tiene una lista de fechas, en la parte de evento.fecha() devolveria una lista donde no se puede comparar directamente con fecha

// PARTE 2
class CalendarioVol2 {
    var eventos

    method estaLibre(unaFecha) {
        return eventos.all({  unEvento => unEvento.tieneLibre(unaFecha) })
    }
}

class EventoDiaCompletoVol2 {
    var property fecha

    method tieneLibre(unaFecha) {
        return fecha != unaFecha
    }
}


class RecordatorioVol2 {
    var property fecha

    method tieneLibre(unaFecha) {
        return true
    }
}