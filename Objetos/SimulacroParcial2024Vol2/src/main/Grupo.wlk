import src.main.Escapista.Escapista
import src.main.SalaDeEscape.SalaDeEscape
import src.errores.NoPuedenPagarLaSalaPorSaldoInsuficienteException.NoPuedenPagarLaSalaPorSaldoInsuficienteException

/*--------------------------------------------- CLASE GRUPO ------------------------------------------------------*/
class Grupo {
    var escapistas = #{}

    // PUEDEN SALIR DE LA SALA 
    method puedenSalirDe(unaSala) {
        return escapistas.any({ unEscapista => unEscapista.puedeSalirDe(unaSala) })
    }

    // GUARDAR REGISTRO 
    method guardarRegistroDe(unaSala) {
        escapistas.forEach({ unEscapista => unEscapista.guardarRegistroDe(unaSala) })
    }

    // PAGAR SALA 
    method pagar(unaSala) {
        if (self.puedenPagar(unaSala)) {
            self.abonar(self.precioIndividualDe(unaSala))
        } else {
            throw new NoPuedenPagarLaSalaPorSaldoInsuficienteException()
        }
    }

    // COBRAR A ESCAPISTAS
    method abonar(unPrecio) {
        escapistas.forEach({ unEscapista => unEscapista.pagar(unPrecio) })
    }

    // PUEDEN PAGAR UNA SALA 
    method puedenPagar(unaSala) {
        return self.puedenPagarDeFormaIndividual(unaSala) || self.puedenPagarDeFormaGrupal(unaSala)
    }

    method precioIndividualDe(unaSala) {
        return unaSala.precioTotal() / escapistas.size()
    }

    method puedenPagarDeFormaIndividual(unaSala) {
        return escapistas.all({ unEscapista => unEscapista.puedePagar(self.precioIndividualDe(unaSala)) })
    }

    method puedenPagarDeFormaGrupal(unaSala) {
        return escapistas.sum({ unEscapista => unEscapista.saldoEnSuBilletera() }) >= unaSala.precioTotal()
    }

    // ESCAPAR DE UNA SALA 
    method escaparDe(unaSala) {
        self.pagar(unaSala)
        if (self.puedenSalirDe(unaSala)) {
            self.guardarRegistroDe(unaSala)
        }
    }
}