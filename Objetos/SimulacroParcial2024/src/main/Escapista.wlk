import main.Grupo.Grupo
import main.SalaDeEscape.SalaDeEscape


/*--------------------------------------------- CLASE ESCAPISTA --------------------------------------------------*/
class Escapista {
    var maestria 
    var salasDeLasQueEscapo = []
    var saldoDeSuBilletera

    // PUEDE SALIR DE UNA SALA
    method puedeSalirDe(unaSala) {
        return maestria.puedeSalirDe(unaSala, self)
    }

    // HIZO MUCHAS SALAS
    method hizoMuchasSalas() {
        return salasDeLasQueEscapo.size() >= 6
    }
    
    // SUBIR DE NIVEL DE MAESTRIA
    method subirDeNivelDeMaestria() {
        if (maestria.puedeSubirDeNivel() && self.hizoMuchasSalas()) {
            maestria = profesional
        }
    }

    // NOMBRE DE SALAS DE LAS QUE SALIO SIN REPETIDOS 
    method nombreDeSalasDeLasQueEscapo() {
        return salasDeLasQueEscapo.asSet({ unaSala => unaSala.nombre() })
    }

    // REGISTRAR SALA DE ESCAPE
    method registrarSalaDeEscape(unaSala) {
        salasDeLasQueEscapo.add(unaSala)
    }

    // PAGAR SALA 
    method pagar(unPrecio) {
        saldoDeSuBilletera -= unPrecio
    }

    // GETTER SALDO DE SU BILLETERA
    method saldoDeSuBilletera() {
        return saldoDeSuBilletera
    }
}

/*--------------------------------------------- OBJETO AMATEUR --------------------------------------------------*/
object amateur {
    // PUEDE SALIR DE UNA SALA 
    method puedeSalirDe(unaSala, unEscapista){
        return unaSala.noEsDificil() && unEscapista.hizoMuchasSalas()
    }

    // PUEDE SUBIR DE NIVEL DE MAESTRIA
    method puedeSubirDeNivel() {
        return true
    }
}


/*--------------------------------------------- OBJETO PROFESIONAL --------------------------------------------------*/
object profesional {
    // PUEDE SALIR DE UNA SALA
    method puedeSalirDe(unaSala, unEscapista){
        return true
    }

    // PUEDE SUBIR DE NIVEL DE MAESTRIA
    method puedeSubirDeNivel() {
        return false
    }
}