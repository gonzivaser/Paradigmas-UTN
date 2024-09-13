/*----------------------------------------------- VERDURIN --------------------------------------------------------*/
object verdurin {
    var cantidadDeCajones = 10
    const pesoDeUnCajon = 50
    var kilometrajeActual = 700000

    method cantidadDeCajones(unaCantidad) {
        cantidadDeCajones = unaCantidad
    }

    method velocidadMaxima() {
        return 80 - self.pesoDeCarga().div(500)
    }

    method pesoDeCarga() {
        return cantidadDeCajones * pesoDeUnCajon
    }

    method recorrer(unosKilometros, unaVelocidad) {
        kilometrajeActual = kilometrajeActual + unosKilometros
    }
}

/*----------------------------------------------- SCANION --------------------------------------------------------*/
object scanion5000 {
    const maximaCapacidad = 5000
    var desnsidadDeLiquido = 1

    method desnsidadDeLiquido(unaDensidad) {
        desnsidadDeLiquido = unaDensidad
    }

    method pesoDeCarga() {
        return maximaCapacidad * desnsidadDeLiquido
    }

    method velocidadMaxima() {
        return 140
    }

    method recorrer(unosKilometros, unaVelocidad) {
        // No hace nada
    }
}

/*----------------------------------------------- CAEREALITAS --------------------------------------------------------*/
object cerealitas {
    var nivelDeDeterioro = 0
    var property pesoDeCarga = 0 


    method velocidadMaxima() {
        if (nivelDeDeterioro < 10) {
            return 40
        } else {
            return 60 - nivelDeDeterioro
        }
    }

    method recorrer(unosKilometros, unaVelocidad) {
        nivelDeDeterioro = nivelDeDeterioro + (unaVelocidad - 45).max(0)
    }
}