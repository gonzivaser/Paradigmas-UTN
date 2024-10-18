import main.Juego.*

class SuscripcionesPorCategoria {
    const categoria
    const precio

    method puedeJugarA(unJuego) {
        return unJuego.perteneceAUnaCategoria(categoria)
    }
}

const infantil = new SuscripcionesPorCategoria (categoria = "infantil", precio = 0)
const prueba = new SuscripcionesPorCategoria (categoria = "prueba", precio = 0)

object premium {
    const precio = 50

    method puedeJugarA(unJuego) {
        return true
    }
}

object base {
    const precio = 25

    method puedeJugarA(unJuego) {
        return unJuego.saleMenosQue(30)
    }
}

