import src.main.imPdep.imPdep
import src.main.Artista.Artista

/*---------------------------------------------- CLASE PELICULA --------------------------------------------------*/
class Pelicula {
    const nombre 
    var elenco = #{}

    // GETTER ELENCO
    method elenco() {
        return elenco
    }

    // GETTER NOMBRE
    method nombre() {
        return nombre
    }

    //PRESUPUESTO DE PELICULA
    method presupuestoTotal() {
        return self.presupuestoDeArtistas() * 1.7
    }

    method presupuestoDeArtistas() {
        return elenco.sum({ unArtista => unArtista.sueldo() })
    }

    //RECAUDACION DE PELICULA
    method recaudacionBase() {
        return 1000000
    }

    method recaudacionTotal() {
        return self.recaudacionBase() + self.recaudacionExtra() 
    }

    method recaudacionExtra() 

    // GANANCIAS DE UNA PELICULA
    method gananciaTotal() {
        return self.recaudacionTotal() - self.presupuestoTotal()
    }

    // RODAR UNA PELICULA
    method rodar() {
        elenco.forEach({ unArtista => unArtista.actuar() })
    }

    // PELICULA ECONOMICA
    method esEconomica() {
        return self.presupuestoTotal() < 500000
    }
}

/*----------------------------------------- CLASE PELICULA DRAMA -----------------------------------------------*/
class PeliculaDeDrama inherits Pelicula {
    override method recaudacionExtra() {
        return nombre.size() * 100000
    }
}

/*----------------------------------------- CLASE PELICULA ACCION -----------------------------------------------*/
class PeliculaDeAccion inherits Pelicula {
    var vidriosRotos

    override method presupuestoTotal() {
        return super() + vidriosRotos * 1000
    }

    override method recaudacionExtra() {
        return elenco.size() * 50000
    }
}

/*----------------------------------------- CLASE PELICULA TERROR -----------------------------------------------*/
class PeliculaDeTerror inherits Pelicula {
    var cantidadDeCuchos

    override method recaudacionExtra() {
        return cantidadDeCuchos * 20000
    }
}

/*----------------------------------------- CLASE PELICULA COMEDIA -----------------------------------------------*/
class PeliculaDeComedia inherits Pelicula {
    override method recaudacionExtra() {
        return 0
    }
}