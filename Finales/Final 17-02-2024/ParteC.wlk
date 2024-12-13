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

    method cumpleCondicionDeRomperEsteorotipos() {
        if self.protagonista().sosActuado() && self.protagonista().sosHombre() {
            return true
        }
    }
}

class PeliAventura inherits Pelicula {
    method rompeEstereotipos() {

    }
}