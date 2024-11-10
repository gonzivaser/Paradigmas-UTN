import src.main.SalaDeEscape.SalaDeEscape

/*-------------------------------------------- CLASE ESCAPISTA --------------------------------------------------*/
class Escapista {
    var maestria
    var salasDeLasQueSalio = []
    var saldoEnSuBilletera

    // GETTER SALDO EN SU BILLETERA
    method saldoEnSuBilletera() {
        return saldoEnSuBilletera
    }

    // PUEDE SALIR DE UNA SALA 
    method puedeSalirDe(unaSala) {
        return maestria.puedeSalirDe(unaSala, self)
    }

    // CANTIDAD DE SALAS MAYOR A 
    method cantidadDeSalasMayorA(unaCantidad) {
        return salasDeLasQueSalio.size() >= unaCantidad
    }

    // SUBIR NIVEL DE MAESTRIA
    method subirNivelDeMaestria() {
        if (maestria.puedeSubirNivelDeMaestria() && self.cantidadDeSalasMayorA(6)) {
            maestria = maestriaProfesional
        } else {
            maestria = maestriaAmateur
        }
    }

    // NOMBRE DE LAS SALAS QUE SALIO
    method nombreDeSalasDeLasQueSalio() {
        return salasDeLasQueSalio.asSet({ unaSala => unaSala.nombre() })
    }

    // GUARDAR REGISTRO DE LA SALA QUE SALIO
    method guardarRegistroDe(unaSala) {
        salasDeLasQueSalio.add(unaSala)
    }

    // PAGAR SALA 
    method pagar(unPrecio) {
        saldoEnSuBilletera -= unPrecio
    }

    // TIENE DINERO SUFICIENTE
    method puedePagar(unPrecio) {
        return saldoEnSuBilletera >= unPrecio
    }
}

/*------------------------------------------ OBJETO MAESTRIA AMATEUR --------------------------------------------*/
object maestriaAmateur {
    // PUEDE SALIR DE UNA SALA
    method puedeSalirDe(unaSala, unEscapista) {
        return unaSala.noEsDificil() || unEscapista.cantidadDeSalasMayorA(6)
    }

    // PUEDE SUBIR NIVEL DE MAESTRIA
    method puedeSubirNivelDeMaestria() {
        return true
    }
}

/*----------------------------------------- OBJETO MAESTRIA PROFESIONAL -----------------------------------------*/
object maestriaProfesional {
    // PUEDE SALIR DE UNA SALA
    method puedeSalirDe(unaSala, unEscapista) {
        return true
    }

    // PUEDE SUBIR NIVEL DE MAESTRIA
    method puedeSubirNivelDeMaestria() {
        return false
    }
}