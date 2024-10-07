import Juego.*
import gameFlix.*
import Cliente.*

class SuscripcionesPorCategoria {
    const categoria
    const precio

    method precio() {
        return precio
    }

    method puedeJugar(unJuego) {
        return unJuego.perteneceAUnaCategoria(categoria)
    }
}

object premium {
    method precio() {
        return 50
    }

    method puedeJugarAJuego(unJuego) {
        return true 
    }
}

object base {
    method precio() {
        return 25
    }

    method puedeJugarAJuego(unJuego) {
        return unJuego.saleMenosQue(30)
    }
}

const infantil = new SuscripcionesPorCategoria( precio = 10, categoria = "Infantil" )
const prueba = new SuscripcionesPorCategoria( precio = 0, categoria = "Demo" )