import Juego.*
import gameFlix.*
import Suscripcion.*
import src.Errores.MeQuedeSinPlataException.MeQuedeSinPlataException

class Cliente {
    var humor 
    var dinero
    var suscripcion 

    method suscripcion(unaSuscripcion) {
        suscripcion = unaSuscripcion
    }

    method bajarHumor(unaCantidad) {
        humor -= unaCantidad
    }

    method subirHumor(unaCantidad) {
        humor += unaCantidad
    }

    method pagar(unaCantidad) {
        if (dinero < unaCantidad) {
            throw new Exception(message = "No tenes suficiente dinero")
        }
        
        dinero -= unaCantidad
    }

    method pagarSuscripcion() {
        try {
            self.pagar(suscripcion.precio())
        } catch unError : MeQuedeSinPlataException {
            self.suscripcion(prueba)
        }
    }
}