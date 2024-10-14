import Usuario.*
import Producto.*
import niveles.*
import pdepLibre.*


class Cupon {
    var fueUsado = false
    var porcentajeDeDescuento

    method estaDisponible() {
        return !fueUsado
    }

    method porcentajeDeDescuento() {
        return porcentajeDeDescuento
    }

    method precioConElDescuentoAplicado(unPrecio) {
        return unPrecio - (unPrecio * porcentajeDeDescuento)
    }

    method cuponFueUsado() {
        fueUsado = true
    }
}