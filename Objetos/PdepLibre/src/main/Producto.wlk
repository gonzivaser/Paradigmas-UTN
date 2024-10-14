import Cupon.*
import Usuario.*
import niveles.*
import pdepLibre.*


class Producto {
    var nombre 
    const precioBase

    method precio() {
        return precioBase + (precioBase * 0.21)
    }

    method nombreDeOferta() {
        return "SUPER OFERTA" + nombre
    }
}

class Mueble inherits Producto {
    override method precio() {
        return super() + 1000
    }
}

class Indumentaria inherits Producto {
    var esDeTemporadaActual

    override method precio() {
        if(esDeTemporadaActual) {
            return super() + (super() * 0.1)
        }  
        
        return super()
    }
}

class Gangas inherits Producto {
    override method precio() {
        return 0
    }

    override method nombreDeOferta() {
        return super() + "COMPRAME POR FAVOR"
    }
}

