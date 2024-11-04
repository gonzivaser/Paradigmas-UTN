import src.main.Artista.Artista
import src.main.Pelicula.Pelicula

object imPdep {
    var peliculas = #{}

    // ARTISTAS 
    method artistas() {
        return peliculas.flatMap({ unaPelicula => unaPelicula.elenco() })
    }

    // PELICULAS ECONOMICAS
    method peliculasEconomicas() {
        return peliculas.filter({ unaPelicula => unaPelicula.esEconomica() })
    }

    // ARTISTA CON LA MEJOR PAGA
    method artistaConMejorPaga() {
        return self.artistas().max({ unArtista => unArtista.paga() })
    }

    // PELICULAS ECONOMICAS
    method nombresDePeliculasEconomicas() {
        return self.peliculasEconomicas().map({ unaPelicula => unaPelicula.nombre() })
    }

    // SUMA DE GANANCIAS DE PELICULAS ECONOMICAS
    method sumaDeGananciasDePeliculasEconomicas() {
        return self.peliculasEconomicas().sum({ unaPelicula => unaPelicula.gananciaTotal() })
    }

    // RECATEGORIZAR ARTISTAS 
    method recategorizarArtistas() {
        self.artistas().forEach({ unArtista => unArtista.recategorizar() })
    }
}