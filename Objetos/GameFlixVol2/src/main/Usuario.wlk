import main.gameFlix.*
import Errores.NoTenesSuficienteDineroException.NoTenesSuficienteDineroException
import main.Suscripcion.*
import main.Juego.*

class Usuario {
    var suscripcion
    var dinero
    var humor

    // PEDIRLE A GAMEFLIX QUE FILTRE LOS JUEGOS DE UNA CATEGORIA
    method filtrarJuegosPor(unaCategoria) {
        return gameFlix.filtrarJuegosPorCategoria(unaCategoria)
    }

    // PEDIRLE A GAMEFLIX QUE BUSQUE UN JUEGO POR SU NOMBRE
    method buscarJuegoQueSeLlama(unNombre) {
        return gameFlix.juegoQueSeLlama(unNombre)
    }

    // PEDIRLE A GAMEFLIX QUE RECOMIENDE UN JUEGO AL AZAR
    method recomendarJuego() {
        return gameFlix.juegoAlAzar()
    }

    // PAGAR DISTINTAS COSAS
    method pagar(unaCantidad) {
        if (dinero < unaCantidad) {
            throw NoTenesSuficienteDineroException
        } else {
            dinero = dinero - unaCantidad
        }
    }

    // PAGAR SUSCRIPCION
    method pagarSuscripcion() {
        try {
            self.pagar(suscripcion.precio())
        }
        catch unError : NoTenesSuficienteDineroException {
            self.suscripcion(prueba)
        }
    }

    // SETTER SUSCRIPCION
    method suscripcion(unaSuscripcion) {
        suscripcion = unaSuscripcion
    }

    // REDUCIR HUMOR 
    method reducirHumor(unaCantidad) {
        humor = humor - unaCantidad
    }

    // AUMENTAR HUMOR
    method subirHumor(unaCantidad) {
        humor = humor + unaCantidad
    }

    // JUGAR A UN JUEGO PERMITIDO POR LA SUSCRIPCION
    method jugarA(unJuego, unasHoras) {
        if (suscripcion.puedeJugarA(unJuego)) {
            unJuego.afectarA(self, unasHoras)
        }
    }
}