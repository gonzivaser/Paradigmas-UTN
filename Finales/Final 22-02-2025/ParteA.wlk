class Equipo {
    var jugadores

    method jugadoresBuenos() {
        return jugadores.filter({ unJugador => unJugador.esBueno() })
    }
}

class Jugador {
    var posicion 

    method esBueno() {
        return posicion.esBuenoParaSuPosicion()
    }

    method cambiarDePosicionA(unaPosicion) {
        posicion = unaPosicion
    }
}

class Arquero {
    var penalesAtajados 

    method esBuenoParaSuPosicion() {
        return penalesAtajados > 2
    }
}

class Defensor {
    var cantidadDeMarcas

    method esBuenoParaSuPosicion() {
        return cantidadDeMarcas > 2
    }
}

class Delantero {
    var cantidadDeGoles 

    method esBuenoParaSuPosicion() {
        return cantidadDeGoles > 10
    }
}

class Mediocampista inherits Defensor {
    var porcentajeDeBuenosPases

    override method esBuenoParaSuPosicion() {
        return super() and porcentajeDeBuenosPases > 0.75
    }
}