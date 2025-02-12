// 1
/*
   La solucion planteada cuenta con poca declaratividad porque no hay delegacion de logica en ningun momento, luego
   no se esta aprovechando el polimorfismo porque no se estan tratando de manera indistinta a los videojuegos. No se esta
   rompiendo el encapsulamiento de las clases pero si la clase Persona, esta haciendo cosas que no es responsabilidad de esta. 
*/


// 2
class Persona {
    var property edad
    var property consolas = []

    method puedeJugar(unJuego) {
        return unJuego.puedeJugarSegunCondiciones(self)
    }
}

object pelota {
    method puedeJugarSegunCondiciones(unaPersona) {
        return unaPersona.edad() > 1
    }
}

class JuegosDeMesa {
    var edadMinima
    var edadMaxima

    method puedeJugarSegunCondiciones(unaPersona) {
        return unaPersona.edad().between(edadMinima, edadMaxima)
    }
}

class VideoJuegos {
    var genero
    var consolaPosible

    method puedeJugarSegunCondiciones(unaPersona) {
        return genero.estaEnElRangoDeEdad(unaPersona.edad()) && self.tieneConsolaPosible(unaPersona.consolas())
    }

    method tieneConsolaPosible(unasConsolas) {
        return unasConsolas.contains(consolaPosible)
    }
}

class Genero {
    var edadMinima 

    method estaEnElRangoDeEdad(unaEdad) {
        return unaEdad.between(edadMinima, 80)
    }
}