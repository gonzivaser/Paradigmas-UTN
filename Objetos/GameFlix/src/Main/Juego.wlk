import gameFlix.*
import Cliente.*
import Suscripcion.*

class Juego {
    const nombre 
    const precio 
    const categoria


    method perteneceAUnaCategoria(unaCategoria) {
        return categoria == unaCategoria
    }

    method seLlama(unNombre) {
        return nombre == unNombre
    }

    method saleMenosQue(unaCantidad) {
        return precio <= unaCantidad
    }

    method afectarA(unCliente, unasHoras) 
}


class JuegoViolento inherits Juego {
    override method afectarA(unCliente, unasHoras) {
        unCliente.bajarHumor(10 * unasHoras)
    }
}

class Moba inherits Juego {
    override method afectarA(unCliente, unasHoras) {
        unCliente.pagar(30)
    }
}

class JuegoDeTerror inherits Juego {
    override method afectarA(unCliente, unasHoras) {
        unCliente.suscripcion(infantil)
    }
}

class JuegoEstrategico inherits Juego {
    override method afectarA(unCliente, unasHoras) {
        unCliente.subirHumor(5 * unasHoras)
    }
}