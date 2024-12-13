// PARTE 1
/*
A - Falso, no se eliminaria la repeticion de logica ya que se escribiria en cada subclase generando una repeticion de logica
B - Falso, no se esta rompiendo porque cada vez que se quiere acceder a uno, se hace a traves de los getters de este
C - 
*/

// PARTE 2
class Pelicula {
    var personajes = []
    
    method protagonista() {
        return personajes.first()
    }

    method rompeEstereotipos() {
        if self.protagonista().sosActuado() && self.protagonista().genero() != "varon" && self.condicionExtra() {
            return true
        }
    }

    method condicionExtra() 
}

class PeliAventura inherits Pelicula {
    override method condicionExtra() {
        return self.protagonista().esRescatado().negate()
    }
}

class PeliTerror inherits Pelicula {
    override method condicionExtra() {
        return personajes.all({ p => p.esRescatado() })
    }
}

class PeliComedia inherits Pelicula {
    override method condicionExtra() {
        return personajes.size() == 1
    }
}

class PersonajeAnimado {
    method sosActuado() {
        return false
    }

    method esRescatado() {
        return false
    }
}

class PersonajeActuado {
    var genero 
    var esRescatado 
    
    method sosActuado() {
        return true
    }

    method genero() {
        return genero
    }

    method esRescatado() {
        return esRescatado
    }
}