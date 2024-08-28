/*
CONSIGNA: 
https://docs.google.com/document/d/1jhvpQfmiLEq7tlSJfT-b0f-aajmAlW7zfU-vsNVamGI/edit
*/

object manic {
    var estrellas = 0
    const globos = 60

    method encontrarEstrellas() {
        estrellas += 8
    }

    method regalarEstrella() {
        estrellas -= 1
    }

    method tieneTodoListo() {
        return estrellas > 0
    }

    method tieneSuficientesGlobos() = globos > 50
}


object chuy {
    method tieneTodoListo() = true
}

object capy {
    var latas = 0

    method recoletarLatas() {
        latas += 1
    }

    method reciclarLatas() {
        latas -= 5
    }

    method tieneNumeroParDeLatas() {
      return latas % 2 == 0
    }
    
    method tieneTodoListo() {
      return tieneNumeroParDeLatas()
    }
}

object fiesta {
    var property quienOrganiza = chuy

    method estaPreparada() {
      quienOrganiza.tieneTodoListo() && quienOrganiza.tieneSuficientesGlobos()
    }
}

