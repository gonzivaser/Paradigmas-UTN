class Personaje {
    const enemigos = #{}

    method recibirDano(unaCantidad) {
        // ASUMIR QUE FUNCIONA
    }

    method agregarEnemigo(unPersonaje) {
        enemigos.add(unPersonaje)
    }
}

class Villano inherits Personaje {
    var property arma 

    method atacar(unPersonaje) {
        unPersonaje.recibirDano(self.danoDeArma())
        unPersonaje.agregarEnemigo(self)
    }

    method danoDeArma() {
        return arma.danoBase() / arma.areaDeEfecto()
    }
}


class Heroe inherits Personaje {
    const habiliades = #{}
    const aliados = #{}

    method atacar(unPersonaje) {
        if (not enemigos.contains(unPersonaje)) {
            return "El personaje atacado no es un enemigo"
        }
        unPersonaje.recibirDano(self.poder())
        unPersonaje.agregarEnemigo(self)
    }

    method poder() {
        return aliados.size() * habiliades.sum({ h => h.poder() })
    }
}

class Arma {
    var property danoBase
    var property areaDeEfecto  
}

class Habilidad {
    var property poder
}

/*PUNTO 1
a) Verdadero, ya que si ataca a un personaje que no es enemigo, le sigue haciendo daño y lo agrega a la lista de enemigos
b) Verdadero, el metodo atacar se podria generalizar 
c) Falso, si hay problemas de delegacion en el metodo atacar de Heroe
d) Falso, 
e) 
*/


/*PUNTO 2*/
class PersonajeVol2 {
    const enemigos = #{}
    var claseDePersonaje

    method recibirDano(unaCantidad) {
        // ASUMIR QUE FUNCIONA
    }

    method agregarEnemigo(unPersonaje) {
        enemigos.add(unPersonaje)
    }

    method atacar() {
        return claseDePersonaje.atacarA(self)
    }
}

object heroeVol2 {
    method atacarA(unPersonaje) {
        if (unPersonaje.enemigos().contains(self)) {
            unPersonaje.recibirDano(self.poder())
            unPersonaje.agregarEnemigo(self)
        } else {
            return "El personaje atacado no es un enemigo"
        }
    }

    
}

object villanoVol2 {

}