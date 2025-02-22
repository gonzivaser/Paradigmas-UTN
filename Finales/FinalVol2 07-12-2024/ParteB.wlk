class VideoJuego {
    var property titulo 
    var property desarrolladora
    var property generos = #{}
    var property añoDeLanzamiento

    // ES DESARROLLADOR POR 
    method esDesarrolladoPor(unaDesarrolladora) {
        return desarrolladora == unaDesarrolladora
    }

    // PERTENECE A GENERO
    method perteneceA(unGenero) {
        return generos.contains(unGenero)
    }

    // ES RECIENTE 
    method esReciente() {
        return añoDeLanzamiento > 2015
    }
}


object juan {
    method preferencias(unVideoJuego) {
        return 
    }
}

object maria {

}

object pedro {

}