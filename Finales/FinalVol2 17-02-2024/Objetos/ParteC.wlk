// 1
/*
   a) Falso, ya que habria repeticion de logica en cada sublase de la superclase a la hora de hacer un override
   al metodo de "elProtagonistaNoEsVaron"
   b) Falso, no se esta rompiendo el encapsulamiento, porque los personajes cuentan con los getters correspondientes para 
      poder llamar a ese metodo o atributo
   c) Falso, no se esta haciendo un buen uso del polimorfismo porque 
*/


// 2

class Pelicula {
    var personajes = []
    
    method protagonista() {
        return personajes.first()
    }

    method rompeEstereotipos() {
        return self.esActuado() and self.noEsVaron() and self.condicionExtraSegunGenero()
    }

    method esActuado() {
        return self.protagonista().sosActuado()
    }

    method noEsVaron() {
        return self.protagonista().genero() != "varon"
    }

    method condicionExtraSegunGenero()
}

class PeliAventura inherits Pelicula {
    override method condicionExtraSegunGenero() {
        return self.protagonista().esRescatado().negate()
    }
}

class PeliTerror inherits Pelicula {
    override method condicionExtraSegunGenero() {
        return personajes.all({ unPersonaje => unPersonaje.esRescatado() })
    }
}

class PeliComedia inherits Pelicula {
    override method condicionExtraSegunGenero() {
        return personajes.size() == 1
    }
}

class Personaje {
    var sosActuado
    var esRescatado

    method sosActuado() {
        return sosActuado
    }

    method esRescatado() {
        return esRescatado
    }
}
        
class PersonajeActuado inherits Personaje {
    var genero

    method genero() {
        return genero
    }
}