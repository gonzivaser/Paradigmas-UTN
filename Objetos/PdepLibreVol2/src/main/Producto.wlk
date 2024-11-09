/*--------------------------------------------- CLASE PRODUCTO --------------------------------------------------*/
class Producto {
    const nombre 
    var precioBase

    // PRECIO PRODUCTO 
    method precioTotal() {
        return precioBase + (precioBase * 0.21) + self.precioExtraSegunProducto()
    }

    method precioExtraSegunProducto() 

    // NOMBRE EN OFERTA
    method nombreEnOferta() {
        return "SUPER OFERTA" + nombre
    }
}

/*------------------------------------------ CLASE PRODUCTO MUEBLE -----------------------------------------------*/
class Mueble inherits Producto {
    // PRECIO PRODUCTO 
    override method precioExtraSegunProducto() {
        return 1000
    }
}

/*---------------------------------------- CLASE PRODUCTO INDUMENTARIA -------------------------------------------*/
class Indumentaria inherits Producto {
    var esDeTemporadaActual 

    // PRECIO PRODUCTO 
    override method precioExtraSegunProducto() {
        if (esDeTemporadaActual) {
            return precioBase * 0.10
        } else {
            return 0
        }
    }
}

/*-------------------------------------------- CLASE PRODUCTO GANGA -----------------------------------------------*/
class Ganga inherits Producto {
    // PRECIO PRODUCTO 
    override method precioExtraSegunProducto() {
        return 0
    }

    override method precioTotal() {
        return 0
    }

    // NOMBRE EN OFERTA
    override method nombreEnOferta() {
        return super() + "COMPRAME POR FAVOR"
    }
}
