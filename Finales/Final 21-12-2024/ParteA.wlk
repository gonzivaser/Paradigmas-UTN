class Cuenta {
    var property tipo
    var property usuarioPrincipal

    method estado() {
        return "Tipo: " + tipo + ", Usuario: " + usuarioPrincipal + tipo.informacionAdicional()
    }  

    method actualizarTipo(unTipo) {
        tipo = unTipo
    }
}

class Basica {
    var property limiteHoras
    var property horasConsumidas 

    method informacionAdicional() {
        return ", Horas Consumidas: " + (limiteHoras - horasConsumidas)
    }

    method reproducirContenido(unasHoras) {
        if(horasConsumidas + unasHoras > limiteHoras) {
            return "No se puede reproducir, se supera el límite de horas"
        }
        horasConsumidas = horasConsumidas + unasHoras
        else {
            return "Contenido Reproducido."
        }
    }
}

class Premium {
    var property limiteEspacio
    var property espacioConsumido

    method informacionAdicional() {
        return ", Espacio Disponible: " + (limiteEspacio - espacioConsumido) + "GB" 
    }

    method descargarContenido(unasGb) {
        if(espacioConsumido + unasGb > limiteEspacio) {
            return "No hay suficiente espacio"
        }
        
        espacioConsumido = espacioConsumido + unasGb
    }
}

class Familiar inherits Premium {
    var property perfiles = #{}

    override method informacionAdicional() {
        return ", Perfiles: " + perfiles.size()
    }
}