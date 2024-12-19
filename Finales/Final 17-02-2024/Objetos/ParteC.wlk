class Pelicula {
    var personajes = []
    
    method protagonista() {
        return personajes.first()
    }
}

class PeliAventura inherits Pelicula {
    method rompeEstereotipos() {
        return self.protagonista().sosActuado() and self.protagonista().genero() != "varon" and self.protagonista().esRescatado().negate()
    }
}

class PeliTerror inherits Pelicula {
    method rompeEstereotipos() {
        return self.protagonista().sosActuado() and self.protagonista().genero() == "varon" and personajes.all({ p => p.esRescatado() })
    }
}

class PeliComedia inherits Pelicula {
    method rompeEstereotipos() {
        return self.protagonista().sosActuado() and self.protagonista().genero() == "varon" and personajes.size() == 1
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


/* PUNTO 1

a) Falso, se seguiria repitiendo logica en protagonista.sosActuado()
b) Falso, ya que estos tienen los getters correspondientes, asi que no se romperia encapsulamiento
c) Falso, no hay un buen uso del polimorfismo, 

*/

/* PUNTO 2*/
class PeliculaVol2 {
    var personajes = []
    
    method protagonista() {
        return personajes.first()
    }

    method noEsVaron() {
        return self.protagonista().genero() != "varon"
    }

    method rompeEstereotipos() {
        return self.protagonista().sosActuado() and self.noEsVaron() and self.condicionExtraSegunGenero()
    }

    method condicionExtraSegunGenero() 
}

class PeliAventuraVol2 inherits PeliculaVol2 {
    override method condicionExtraSegunGenero() {
        return self.protagonista().esRescatado().negate()
    }
}

class PeliTerrorVol2 inherits PeliculaVol2 {
    override method condicionExtraSegunGenero() {
        return personajes.all({ p => p.esRescatado() })
    }
}

class PeliComediaVol2 inherits PeliculaVol2 {
    override method condicionExtraSegunGenero() {
        return personajes.size() == 1
    }
}