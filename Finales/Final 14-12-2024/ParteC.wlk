class Parque {
    const property visitantes = []
    var property saldo = 0

    method cobrarEntrada() {
        visitantes.forEach({ v => self.cobrarleA(v) })
    } 

    method cobrarleA(unVisitante) {
        saldo = saldo + unVisitante.tarifa()
        unVisitante.pagarEntrada()
    }
}


/* PUNTO 1
a) Falso, el parque podria tener una lista de adultos y niños 
b) Falso, ya que aunque hay un intento de usar el polimorfismo como en tarifa() o pagarEntrada(), la cantidad de clases especificas da a entender el no buen uso de este
c) Verdadero, ya que todos harian lo mismo con "pagarEntrada()" se repetiria toda la logica ya que cada clase lo hace distinto pero con el mimso objetivo
d) Falso, ya que se usa herencia y no composicion
e) Falso, ya que la solucion propuesta no muestra manejo de errores 
*/

/* PUNTO 2 */
class Visitante {
    var formaDePago

    method tarifa() 
    method pagarEntrada()
}

class Nino inherits Visitante {
    var accesosDisponibles
    var saldo

    override method tarifa() {
        return 50 + formaDePago.valorAgregado(self)
    }

    method disminuirSaldo(unMonto) {
        saldo = saldo - unMonto * saldo
    }

    method disminuirAccesos(unaCantidad) {
        accesosDisponibles = accesosDisponibles - unaCantidad
    }
}

class Adulto inherits Visitante {
    var accesosDisponibles
    var saldo

    override method tarifa() {
        return 100 + formaDePago.valorAgregado(self)
    }  

    method disminuirSaldo(unMonto) {
        saldo = saldo - unMonto * saldo
    }

    method disminuirAccesos(unaCantidad) {
        accesosDisponibles = accesosDisponibles - unaCantidad
    }
}

object conEfectivo {
    method valorAgregado(unVisitante) {
        return 0
    }
}

object conPrepaga {
    method valorAgregado(unVisitante) {
        return unVisitante.disminuirSaldo(0.1)
    }
}

object conPaseRapido {
    method valorAgregado(unVisitante) {
        return unVisitante.disminuirAccesos(1)
    }
}