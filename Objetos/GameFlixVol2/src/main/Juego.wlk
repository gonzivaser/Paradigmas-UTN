import main.Usuario.*
import main.Suscripcion.*

class Juego {
    var nombre 
    var precioEnMercado
    const categoria

    // PERTENECE A UNA CATEGORIA PARA QUE GAMEFLIX PUEDA FILTRAR
    method perteneceAUnaCategoria(unaCategoria) {
        return categoria == unaCategoria
    }

    // SE LLAMA SEGUN UN NOMBRE PARA QUE GAMEFLIX PUEDA DECIR SI SE ENCUENTRA DENTRO DE SU COLECCION
    method seLlama(unNombre) {
        return nombre == unNombre
    }

    // SALE MENOS
    method saleMenosQue(unPrecio) {
        return precioEnMercado < unPrecio
    }

    // QUE LOS USUARIOS JUEGUEN
    method afectarA(unUsuario, unasHoras)
}

class JuegoViolento inherits Juego {
    // USUARIO JUEGE A UN JUEGO VIOLENTO
    override method afectarA(unUsuario, unasHoras) {
        unUsuario.reducirHumor(10 * unasHoras)
    }
}

class Moba inherits Juego {
    // USUARIO JUEGUE AL MOBA
    override method afectarA(unUsuario, unasHoras) {
        unUsuario.pagar(30)
    }
}

class JuegoDeTerror inherits Juego {
    // USUARIO JUEGUE A UN JUEGO DE TERROR
    override method afectarA(unUsuario, unasHoras) {
        unUsuario.suscripcion(infantil)
    }
}

class JuegoEstrategico inherits Juego {
    // USUARIO JUEGUE A UN JUEGO ESTRATEGICO
    override method afectarA(unUsuario, unasHoras) {
        unUsuario.subirHumor(5 * unasHoras)
    }
}