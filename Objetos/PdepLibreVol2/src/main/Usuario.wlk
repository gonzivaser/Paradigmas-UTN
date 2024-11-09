import src.main.Cupon.Cupon
import src.main.Producto.Producto
import src.errores.NoPuedeAgregarProductosAlCarritoException.NoPuedeAgregarProductosAlCarritoException

/*------------------------------------------------ CLASE USUARIO -------------------------------------------------*/
class Usuario {
    const nombre 
    var dineroDisponible 
    var puntos 
    var nivel 
    var productosEnCarrito = []
    var cupones = #{}

    // AGREGAR PRODUCTOS AL CARRITO 
    method agregarAlCarrito(unProducto) {
        if (nivel.puedeAgregarAlCarrito(self.cantidadDeProductosEnElCarrito())) {
            productosEnCarrito.add(unProducto)
        } else {
            throw new NoPuedeAgregarProductosAlCarritoException()
        }
    }

    // TAMAÑO DEL CARRITO
    method cantidadDeProductosEnElCarrito() {
        return productosEnCarrito.size()
    }

    // PRECIO DE CARRITO 
    method precioDeCarrito() {
        return productosEnCarrito.sum({ unProducto => unProducto.precioTotal() })
    }

    // DISMINUIR PRECIO DE SU DINERO
    method pagar(unPrecio) {
        dineroDisponible -= unPrecio
    }

    // SUMAR PUNTOS 
    method sumarPuntos(unPrecio, unPorcentaje) {
        puntos += (unPorcentaje / 100) * unPrecio
    }

    // CUPON AL AZAR QUE NO FUE USADO
    method cuponDisponible() {
        return cupones.filter({ unCupon => unCupon.noFueUsado() }).anyOne()
    }

    // COMPRAR PRODUCTOS DE SU CARRITO 
    method comprarProductosDeSuCarrito() {
        const cupon = self.cuponDisponible()
        const precioAPagar = cupon.aplicarA(self.precioDeCarrito())
        cupon.cuponFueUsado()
        self.pagar(precioAPagar)
        self.sumarPuntos(precioAPagar, 10)
    }

    // ES MOROSO
    method esMoroso() {
        return dineroDisponible < 0
    }

    // REDUCIR PUNTOS
    method reducirPuntos(unaCantidad) {
        puntos -= unaCantidad
    }

    // ELIMINAR CUPONES UTILIZADOS
    method eliminarCuponesUtilizados() {
        cupones = cupones.filter({ unCupon => unCupon.noFueUsado() })
    }
}


/*------------------------------------------------- NIVEL LIMITADO --------------------------------------------*/
class NivelLimitado {
    var limiteDeProductos

    // PUEDE AGREGAR AL CARRITO
    method puedeAgregarAlCarrito(unaCantidad) {
        return unaCantidad < limiteDeProductos
    }
}

const bronce = new NivelLimitado(limiteDeProductos = 1)
const plata = new NivelLimitado(limiteDeProductos = 5)

/*----------------------------------------------- OBJETO ORO -----------------------------------------------*/
object oro {
    // PUEDE AGREGAR AL CARRITO
    method puedeAgregarAlCarrito(unaCantidad) {
        return true
    }
}