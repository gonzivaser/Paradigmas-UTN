/*------------------------------------------- CLASE SALA DE ESCAPE ---------------------------------------------*/
class SalaDeEscape {
    const nombre 
    const dificultad 

    // GETTER NOMBRE 
    method nombre() {
        return nombre
    }

    // PRECIO DE SALA DE ESCAPE
    method precioTotal() {
        return 10000 + self.precioExtraSegunGenero()
    }

    method precioExtraSegunGenero() 

    // ES SALA DIFICIL 
    method esDificil() {
        return dificultad > 7  
    }

    // NO ES SALA DIFICIL
    method noEsDificil() {
        return !self.esDificil()
    }
}

/*--------------------------------------- CLASE SALA DE ESCAPE DE ANIME ---------------------------------------*/
class SalaDeEscapeDeAnime inherits SalaDeEscape {
    // PRECIO EXTRA DE SALA DE ESCAPE DE ANIME
    override method precioExtraSegunGenero() {
        return 7000
    }
}

/*--------------------------------------- CLASE SALA DE ESCAPE DE HISTORIA ------------------------------------*/
class SalaDeEscapeDeHistoria inherits SalaDeEscape {
    var estaBasadaEnHechosReales

    // PRECIO EXTRA DE SALA DE ESCAPE DE HISTORIA
    override method precioExtraSegunGenero() {
        return dificultad * 0.314
    }

    // ES SALA DIFICIL
    override method esDificil() {
        return super() || !estaBasadaEnHechosReales
    }
}

/*--------------------------------------- CLASE SALA DE ESCAPE DE TERROR --------------------------------------*/
class SalaDeEscapeDeTerror inherits SalaDeEscape {
    var cantidadDeSustos

    // PRECIO EXTRA DE SALA DE ESCAPE DE TERROR
    override method precioExtraSegunGenero() {
        if (cantidadDeSustos > 5) {
            return cantidadDeSustos * 0.20
        } else {
            return 0
        }
    }

    // CANTIDAD DE SUSTOS MAYOR A 
    method cantidadDeSustosMayorA(unaCantidad) {
        return cantidadDeSustos > unaCantidad
    }

    // ES SALA DIFICIL
    override method esDificil() {
        return super() || self.cantidadDeSustosMayorA(5)
    }
}