import main.Grupo.Grupo
import main.Escapista.Escapista

/*------------------------------------------------ CLASE SALA DE ESCAPE ----------------------------------------------*/
class SalaDeEscape {
    const nombre 
    const dificultad

    // PRECIO DE SALAS
    method precioBase() {
        return 10000
    }

    method precioExtraSegunGenero()

    method precioTotal() {
        return self.precioBase() + self.precioExtraSegunGenero()
    }

    // SALA DIFICIL
    method esDificil() {
        return dificultad > 7 && self.condicionExtraSegunGenero()
    }

    method condicionExtraSegunGenero()

    // SALA NO ES DIFICIL
    method noEsDificil() {
        return !self.esDificil()
    }

    // GETTER NOMBRE
    method nombre() {
        return nombre
    }
}


/*------------------------------------------- CLASE SALA DE ESCAPE DE ANIME ----------------------------------------------*/
class SalaDeEscapeDeAnime inherits SalaDeEscape {
    // PRECIO DE SALA
    override method precioExtraSegunGenero() {
        return 7000
    }

    // ES SALA DIFICIL
    override method condicionExtraSegunGenero() {
        return true
    }
}

/*------------------------------------------- CLASE SALA DE ESCAPE DE HISTORIA ----------------------------------------------*/
class SalaDeEscapeDeHistoria inherits SalaDeEscape {
    const estaBasadaEnHechosReales

    // PRECIO DE SALA 
    override method precioExtraSegunGenero() {
        return dificultad * 0.314
    }

    // ES SALA DIFICIL
    override method condicionExtraSegunGenero() {
        return !estaBasadaEnHechosReales
    }
}

/*------------------------------------------- CLASE SALA DE ESCAPE DE TERROR ----------------------------------------------*/
class SalaDeEscapeDeTerror inherits SalaDeEscape {
    var cantidadDeSustos

    // CANTIDAD DE SUSTOS MAYOR A 
    method cantidadDeSustosMayorA(unaCantidad) {
        return cantidadDeSustos > unaCantidad
    }

    // PRECIO DE SALA
    override method precioExtraSegunGenero() {
        if (self.cantidadDeSustosMayorA(5)) {
            return cantidadDeSustos * 0.2
        } else {
            return 0
        }
    }

    // ES SALA DIFICIL
    override method condicionExtraSegunGenero() {
        return self.cantidadDeSustosMayorA(5)
    }
}