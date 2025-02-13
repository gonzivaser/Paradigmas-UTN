// 1
// a)
class VideoJuego {
    var property titulo
    var property desarrolladora
    var property generos = #{}
    var property anoDeLanzamiento   

    method esDesarrolladoPor(unaDesarrolladora) {
        return desarrolladora == unaDesarrolladora
    }

    method perteneceAGenero(unGenero) {
        return generos.contains(unGenero)
    }

    method esReciente() {
        return anoDeLanzamiento > 2015
    }
}

object juan {
    method cumplePreferencia(unVideoJuego) {
        return unVideoJuego.esDesarrolladoPor("Nintendo") or unVideoJuego.perteneceAGenero("Plataformas")
    }
}

object maria {
    method cumplePreferencia(unVideoJuego) {
        return unVideoJuego.esReciente()
    }
}

object pedro {
    method cumplePreferencia(unVideoJuego) {
        return unVideoJuego.esDesarrolladoPor("RockstarGames") or unVideoJuego.perteneceAGenero("MundoAbierto")
    }
}

// b)
class Comite {
    var property videoJuegos = #{}
    var property jugadoresDelComite = #{}

    method preferidosDelComite() {
        return videoJuegos.filter({ unVideoJuego => self.esPreferidoPorTodos(unVideoJuego) })
    }

    method esPreferidoPorTodos(unVideoJuego) {
        return jugadoresDelComite.all({ unJugador => unJugador.cumplePreferencia(unVideoJuego) })
    }
}

// c) 
/*
   Los objetos que se ven involucrados en la resolucion del problema serian los jugadores (pedro, maria y juan)
*/

// d)
/*
   Si es posible, ya que a los jugadores se los trata de manera polimorfica, a traves de "cumplePreferencia". Entonces
   el jugador va a evaluar como quiera sus preferencias
*/

// 2
class ComiteExigente inherits Comite {
    override method preferidosDelComite() {
        return super() and videoJuegos.filter({ unVideoJuego => self.perteneceADosGenerosDestacados(unVideoJuego) })
    }

    method perteneceADosGenerosDestacados(unVideoJuego) {
        return unVideoJuego.tieneDosGenerosDestacados()
    }
}

class VideoJuegoPunto2 {
    var generos

    method tieneDosGenerosDestacados() {
        return generos.filter({ unGenero => unGenero.esDestacado() })
    }
}

class Genero {
    var esDestacado

    method esDestacado() {
        return esDestacado
    }
}

// 3
/*
   Polimorfismo, ya que se trata a los jugadores de manera indistinta. 
   Herencia, el comite exigente es heredado por comite ya que tienen comportamiento similar.
*/