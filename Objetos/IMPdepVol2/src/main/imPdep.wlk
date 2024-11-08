import src.main.Pelicula.Pelicula
import src.main.Artista.Artista

/*--------------------------------------------- OBJETO IMPDEP --------------------------------------------------*/
object imPdep {
    var peliculas = #{}

    // LISTA DE ARTISTAS
    method artistas() {
        return peliculas.flatMap({ unaPelicula => unaPelicula.elenco() })
    }

    // ARTISTA CON MEJOR PAGA 
    method artistaConMejorPaga() {
        return self.artistas().max({ unArtista => unArtista.sueldo() })
    }

    // LISTA DE PELICULAS ECONOMICAS
    method peliculasEconomicas() {
        return peliculas.filter({ unaPelicula => unaPelicula.esEconomica() })
    }

    // NOMBRE DE LAS PELICULAS ECONOMICAS
    method nombrePeliculasEconomicas() {
        return self.peliculasEconomicas().map({ unaPelicula => unaPelicula.nombre() })
    }

    // SUMA DE LAS GANANCIAS DE LAS PELICULAS ECONOMICAS 
    method sumaGananciasPeliculasEconomicas() {
        return self.peliculasEconomicas().sum({ unaPelicula => unaPelicula.gananciaTotal() })
    }

    // RECATEGORIZAR ARTISTAS 
    method recategorizarArtistasDeLaPlataforma() {
        return self.artistas().forEach({ unArtista => unArtista.recategorizar() })
    }
}