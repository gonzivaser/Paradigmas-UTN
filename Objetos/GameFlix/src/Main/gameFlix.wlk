import Juego.*
import Cliente.*
import src.Errores.ElJuegoNoExisteException.ElJuegoNoExisteException

object gameFlix {
    const juegos = #{}
    var clientes = #{}

    method juegosDeCategoria(unaCategoria) {
        return juegos.filter({ unJuego => unJuego.perteneceAUnaCategoria(unaCategoria) })
    }

    method juegoQueSeLlama(unNombre) {
        return juegos.findOrElse({ unJuego => unJuego.seLlama(unNombre) }, { throw new Exception(message = "El juego no existe!") })
    }

    method juegoRecomendado() {
        return juegos.anyOne()
    }

    method cobrarSuscripciones() {
        clientes.forEach({ unCliente => unCliente.pagarSuscripcion() })
    }

}