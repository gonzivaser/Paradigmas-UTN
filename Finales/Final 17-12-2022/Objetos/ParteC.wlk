/*class Persona {
    var property edad 
    var property consolas = []

    method puedeJugar(unJuego) {
        if (unJuego.tipo() = "Juego de mesa") {
            return edad.between(unJuego.edadMinima(), unJuego.edadMaxima())
        } 
        if (unJuego.tipo() = "Videojuego") {
            if(edad.between(unJuego.genero().edadMinima()), 80) {
                consolas.forEach({ consola => unJuego.consolasPosibles().forEach({ otraConsola => if(consola = otraConsola) return true }) })
            }
        }
        return false 
    }  else return false
}
*/


/* PUNTO 1
La solucion propuesta es poco declarativa ya que no hay delegacion de logica, tambien el uso de muchos if hace que la solucion sea confusa. 
Ademas, no se aprovecha el uso del polimorfismo para delegar la logica de los juegos en las clases correspondientes. 
Por otro lado, el encapsulamiento no es algo que se esta rompiendo ya que las clases tienen los getters y setters correspondientes. 
Y por ultimo, la herencia, no tiene sentido hacer una clase juego que no tiene metodos para despues hacer otra clase viedojuego.
*/


/*PUNTO 2*/

class Persona {
    var property edad 
    var property consolas = []
    var juegoDeseado

    method puedeJugar() {
        return juegoDeseado.cumpleRequerimientosParaJugar(self)
    }
}

object pelota {
    method cumpleRequerimientosParaJugar(unaPersona) {
        return unaPersona.edad() > 1
    }
}

class JuegoDeMesa {
    var edadMinima
    var edadMaxima

    method cumpleRequerimientosParaJugar(unaPersona) {
        return unaPersona.edad().between(edadMinima, edadMaxima)
    }
}

class VideoJuego {
    var genero
    var consolaRequerida

    method cumpleRequerimientosParaJugar(unaPersona) {
        return cumpleConEdadRequerida(unaPersona) && cumpleConConsolaRequerida(unaPersona)
    }

    method cumpleConEdadRequerida(unaPersona) {
        return unaPersona.edad().between(genero.edadMinima(), 80)
    }

    method cumpleConConsolaRequerida(unaPersona) {
        return unaPersona.consolas().contains(consolaRequerida)
    }
}
