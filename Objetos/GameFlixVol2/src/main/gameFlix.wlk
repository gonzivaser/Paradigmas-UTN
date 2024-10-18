import main.Juego.*
import Errores.NoSeEncuentraElJuegoEnLaColeccionException.NoSeEncuentraElJuegoEnLaColeccionException

object gameFlix {
    const juegos = []
    const usuarios = #{}

    // FILTRAR LOS JUEGOS DE UNA CATEGORIA DETERMINADA
    method filtrarJuegosPorCategoria(unaCategoria) {
        return juegos.filter( { unJuego => unJuego.perteneceAUnaCategoria(unaCategoria) } )
    }

    // BUSCAR UN JUEGO POR SU NOMBRE DENTRO DE LA COLECCION
    method juegoQueSeLlama(unNombre) {
        return juegos.findOrElse({ unJuego => unJuego.seLlama(unNombre)}, { throw NoSeEncuentraElJuegoEnLaColeccionException })
    }

    // RECOMENDAR UN JUEGO AL AZAR DE LA COLECCION
    method juegoAlAzar() {
        return juegos.anyOne()
    }

    // COBRAR A LOS CLIENTES
    method cobrarSuscripcion() {
        usuarios.forEach({ unUsuario => unUsuario.pagarSuscripcion() })
    }
}