import src.Errores.NoPuedeAgregarAlCarritoException.NoPuedeAgregarALCarritoException
import Cupon.*
import Producto.*
import niveles.*
import pdepLibre.*

class Usuario {
    const nombre
    var dineroDisponible
    var puntos 
    var nivel 
    const carrito = []
    const cupones = []


    //AGREGAR AL CARRITO
    method agregarAlCarrito(unProducto) {
        if (nivel.puedeAgregarAlCarrito(carrito.size())) {
            carrito.add(unProducto)
        } else {
            throw new NoPuedeAgregarALCarritoException()
        }
    }


    // COMPRAR CARRITO
    method comprarCarrito() {
        const cupon = self.cuponDisponible()
        const precioAPagar = cupon.precioConElDescuentoAplicado(self.precioDelCarrito())
        cupon.cuponFueUsado()
        dineroDisponible -= precioAPagar
        self.sumarPuntos(precioAPagar)
    }

    method cuponDisponible() {
        return cupones.filter{ unCupon => unCupon.estaDisponible() }.anyOne()
    }

    method precioDelCarrito() {
        return carrito.sum{ unProducto => unProducto.precio() }
    }

    method sumarPuntos(unPrecio) {
        puntos += unPrecio * 0.1
    }


    // ES MOROSO Y REDUCIR PUNTOS
    method esMoroso() {
        return dineroDisponible < 0
    }

    method reducirPuntos() {
        puntos -= 1000
    }

    // ELIMINAR CUPONES USADOS
    method eliminarCuponesUsados() {
        cupones.removeAllSuchThat({ unCupon => !unCupon.estaDisponible() })
    }

    // ACTUALIZAR NIVEL
    method actualizarNivel() {
        nivel = self.nivelSegunPuntos()
    }

    method nivelSegunPuntos() {
        if (puntos < 5000) {
            return bronce
        }
        else if (puntos < 15000) {
            return plata
        }
        else {
            return bronce
        }
    }
}