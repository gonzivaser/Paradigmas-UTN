import src.main.Pelicula.Pelicula
import src.main.imPdep.imPdep
import src.errores.NoPuedeRecategorizarLaExperienciaPorqueYaEsUnaEstrellaException.NoPuedeRecategorizarLaExperienciaPorqueYaEsUnaEstrellaException

/*--------------------------------------------- CLASE ARTISTA --------------------------------------------------*/
class Artista {
    var experiencia 
    var cantidadDePeliculasQueActuo
    var ahorros 

    // SUELDO DE ARTISTA 
    method sueldo() {
        return experiencia.sueldoSegunExperiencia(self) 
    }

    // NIVEL DE FAMA 
    method nivelDeFama() {
        return cantidadDePeliculasQueActuo / 2
    }

    // RECATEGORIZAR EXPERIENCIA 
    method recategorizarExperiencia() {
        experiencia = experiencia.recategorizarExperienciaDe(self)
    }

    // ACTUAR
    method actuar() {
        cantidadDePeliculasQueActuo += 1
        ahorros += self.sueldo()
    }

    // GETTER CANTIDAD DE PELICULAS QUE ACTUO
    method cantidadDePeliculasQueActuo() {
        return cantidadDePeliculasQueActuo
    }
}

/*---------------------------------------- OBJETO EXPERIENCIA AMATEUR -------------------------------------------*/
object experienciaAmateur {
    // SUELDO 
    method sueldoSegunExperiencia(unArtista) {
        return 10000
    }

    // RECATEGORIZAR EXPERIENCIA
    method recategorizarExperienciaDe(unArtista) {
        if (unArtista.cantidadDePeliculasQueActuo() > 10) {
            return experienciaEstablecida
        } else {
            return self
        }
    }
}

/*---------------------------------------- OBJETO EXPERIENCIA ESTABLECIDA ----------------------------------------*/
object experienciaEstablecida {
    // SUELDO 
    method sueldoSegunExperiencia(unArtista) {
        if (unArtista.nivelDeFama() < 15) {
            return 15000
        } else {
            return unArtista.nivelDeFama() * 5000
        }
    }

    // RECATEGORIZAR EXPERIENCIA
    method recategorizarExperienciaDe(unArtista) {
        if (unArtista.nivelDeFama() > 10) {
            return experienciaEstrella
        } else {
            return self
        }
    }
}

/*---------------------------------------- OBJETO EXPERIENCIA ESTRELLA ----------------------------------------*/
object experienciaEstrella {
    // SUELDO 
    method sueldoSegunExperiencia(unArtista) {
        return unArtista.cantidadDePeliculasQueActuo() * 30000
    }

    // RECATEGORIZAR EXPERIENCIA
    method recategorizarExperienciaDe(unArtista) {
        throw new NoPuedeRecategorizarLaExperienciaPorqueYaEsUnaEstrellaException()
    }
}
