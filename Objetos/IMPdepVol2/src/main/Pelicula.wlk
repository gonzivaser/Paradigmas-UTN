import src.main.Artista.Artista
import src.main.imPdep.imPdep

/*--------------------------------------------- CLASE PELICULA --------------------------------------------------*/
class Pelicula {
    const nombre 
    var elenco = #{}

    // GETTER NOMBRE 
    method nombre() {
        return nombre
    }

    // GETTER ELENCO
    method elenco() {
        return elenco
    }

    // PRESUPUESTO DE PELICULA
    method presupuestoTotal() {
        return self.presupuestoDeActores() + (self.presupuestoDeActores() * 0.7)
    }

    method presupuestoDeActores() {
        return elenco.sum({ unActor => unActor.sueldo() })
    }

    // RECAUDACION DE PELICULA
    method recaudacionTotal() {
        return 1000000 + self.recaudacionExtraPorGenero()
    }

    method recaudacionExtraPorGenero()

    // GANANCIA DE PELICULA
    method gananciaTotal() {
        return self.recaudacionTotal() - self.presupuestoTotal()
    }

    // RODAR UNA PELICULA 
    method rodarPelicula() {
        elenco.forEach({ unActor => unActor.actuar() })
    }

    // PELICULAS ECONOMICAS
    method esEconomica() {
        return self.presupuestoTotal() < 500000
    }
}

/*------------------------------------------ CLASE PELICULA DE DRAMA ---------------------------------------------*/
class PeliculaDeDrama inherits Pelicula {   
    // RECAUDACION EXTRA POR GENERO
    override method recaudacionExtraPorGenero() {
        return nombre.size() * 100000
    }
}

/*------------------------------------------ CLASE PELICULA DE ACCION ---------------------------------------------*/
class PeliculaDeAccion inherits Pelicula {
    var vidriosRotos

    // PRESUPUESTO TOTAL
    override method presupuestoTotal() {
        return super() + (vidriosRotos * 1000)
    }

    // RECAUDACION EXTRA POR GENERO
    override method recaudacionExtraPorGenero() {
        return elenco.size() * 50000
    }
}

/*------------------------------------------ CLASE PELICULA DE TERROR ---------------------------------------------*/
class PeliculaDeTerror inherits Pelicula {
    var cantidadDeCuchos

    // RECAUDACION EXTRA POR GENERO
    override method recaudacionExtraPorGenero() {
        return cantidadDeCuchos * 20000
    }
}

/*------------------------------------------ CLASE PELICULA DE COMEDIA ---------------------------------------------*/
class PeliculaDeComedia inherits Pelicula {
    // RECAUDACION EXTRA POR GENERO
    override method recaudacionExtraPorGenero() {
        return 0
    }
}
