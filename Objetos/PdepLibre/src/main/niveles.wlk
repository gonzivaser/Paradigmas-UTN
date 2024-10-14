import Cupon.*
import Usuario.*
import Producto.*
import pdepLibre.*


class NivelLimitado {
    const limiteDeProductos

    method puedeAgregarAlCarrito(unaCantidad) {
        return unaCantidad <= limiteDeProductos
    }
}

const bronce = new NivelLimitado(limiteDeProductos = 3)
const plata = new NivelLimitado(limiteDeProductos = 5)


object oro {
    method puedeAgregarAlCarrito(unaCantidad) {
        return true
    }
}