import main.Escapista.Escapista
import main.SalaDeEscape.SalaDeEscape
import src.errores.NoPuedenPagarLaSalaPorSaldoInsuficienteException.NoPuedenPagarLaSalaPorSaldoInsuficienteException


/*--------------------------------------------- CLASE GRUPO --------------------------------------------------*/
class Grupo {
    var escapistas = #{}

    // PUEDEN SALIR DE UNA SALA DE ESCAPE 
    method puedenSalirDe(unaSala) {
        return escapistas.any({ unEscapista => unEscapista.puedeSalirDe(unaSala) })
    }

    // GUARDAR REGISTRO DE LA SALA QUE ESCAPARON EN CADA ESCAPISTA
    method agregarRegistroDe(unaSala) {
        escapistas.forEach({ unEscapista => unEscapista.registrarSalaDeEscape(unaSala) })
    }

    // MONTO A PAGAR POR CADA ESCAPISTA
    method montoAPagarPorEscapistaDe(unaSala) {
        return unaSala.precioTotal() / escapistas.size()
    }

    // PAGAR UNA SALA
    method pagar(unaSala) {
        if (self.puedenPagar(unaSala)) {
            escapistas.forEach({ unEscapista => unEscapista.pagar(self.montoAPagarPorEscapistaDe(unaSala)) })
        } else {
            throw new NoPuedenPagarLaSalaPorSaldoInsuficienteException()
        }
    }

    // PUEDEN PAGAR UNA SALA
    method puedenPagar(unaSala) {
        return self.puedenPagarDeFormaIndividual(unaSala) || self.puedenPagarDeFormaGrupal(unaSala)
    }

    method puedenPagarDeFormaIndividual(unaSala) {
        return escapistas.all({ unEscapista => unEscapista.saldoDeSuBilletera() >= self.montoAPagarPorEscapistaDe(unaSala) })
    }

    method puedenPagarDeFormaGrupal(unaSala) {
        return escapistas.sum({ unEscapista => unEscapista.saldoDeSuBilletera() }) >= unaSala.precioTotal()
    }

    // ESCAPAR DE UNA SALA 
    method escaparDe(unaSala) {
        if (self.puedenPagar(unaSala)) {
            self.pagar(unaSala)
            if (self.puedenSalirDe(unaSala)) {
                self.agregarRegistroDe(unaSala)
            }
        }
    }
}