import src.main.imPdep.imPdep
import src.main.Pelicula.Pelicula
import src.errores.NoPuedeRecategorizarsePorqueEsUnaEstrellaException.NoPuedeRecategorizarsePorqueEsUnaEstrellaException

class Artista {
    var experiencia
    var cantidadDePeliculasQueActuo
    var ahorros

    // SUELDO DE UN ARTISTA
    method sueldo() {
        return experiencia.sueldoSegunExperiencia(self)
    }

    // RECATEGORIZAR EXPERIENCIA 
    method recategorizarExperiencia(){
        experiencia = experiencia.recategorizarExperienciaDeArtista(self)
    }

    // NIVEL DE FAMA
    method nivelDeFama() {
        return cantidadDePeliculasQueActuo / 2
    }

    // CANTIDAD DE PELICULAS QUE ACTUO
    method cantidadDePeliculasQueActuo() {
        return cantidadDePeliculasQueActuo
    }

    // ACTUAR
    method actuar(unaPelicula) {
        cantidadDePeliculasQueActuo += 1
        ahorros += self.sueldo()
    }
}

/*------------------------------------------ OBJETO EXPERIENCIA AMATEUR ------------------------------------------*/
object experienciaAmateur{

    // SUELDO SEGUN EXPERIENCIA
    method sueldoSegunExperiencia(unArtista) {
        return 10000
    }

    // RECATEGORIZAR EXPERIENCIA
    method recategorizarExperienciaDeArtista(unArtista) {
        if (unArtista.cantidadDePeliculasQueActuo() > 10) {
            return experienciaEstablecida
        } else {
            return self
        }
    }
}

/*---------------------------------------- OBJETO EXPERIENCIA ESTABLECIDA ----------------------------------------*/
object experienciaEstablecida {

    // SUELDO SEGUN EXPERIENCIA
    method sueldoSegunExperiencia(unArtista) {
        if (unArtista.nivelDeFama() < 15) {
            return 15000
        } else {
            return 5000 * unArtista.nivelDeFama()
        }
    }

    // RECATEGORIZAR EXPERIENCIA
    method recategorizarExperienciaDeArtista(unArtista) {
        if (unArtista.nivelDeFama() > 10) {
            return experienciaEstrella
        } else {
            return self
        }
    }
}

/*------------------------------------------ OBJETO EXPERIENCIA ESTRELLA -----------------------------------------*/
object experienciaEstrella {

    // SUELDO SEGUN EXPERIENCIA
    method sueldoSegunExperiencia(unArtista) {
        return 30000 * unArtista.cantidadDePeliculasQueActuo()
    }

    // RECATEGORIZAR EXPERIENCIA
    method recategorizarExperienciaDeArtista(unArtista) {
        throw new NoPuedeRecategorizarsePorqueEsUnaEstrellaException()
    }
}