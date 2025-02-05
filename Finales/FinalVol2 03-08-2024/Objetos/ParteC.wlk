// 1
/*
   a) Falso, no es necesario ya que la clase vehiculo, porque esta al no tener comportamiento seria una interfaz
   b) Falso, habria mucha repeticion de logica en pagarPeaje()
   c) Verdadero, ya que al usarse herencia y no composicion, pasa esto
   d) Falso, porque no no muestra ningun tipo de manejo de errores
*/

class Autopista {
    var vehiculos = []
    var saldo

    method cobrarPeaje() {
        vehiculos.forEach({ unVehiculo => self.cobrarleA(unVehiculo) })
    }

    method cobrarleA(unVehiculo) {
        saldo = saldo + unVehiculo.tarifa()
        unVehiculo.pagarPeaje()
    }
}

class Vehiculo {
    const tarifa 
    var efectivo
    var saldoSube
    var peajesDisponibles
    var metodoDePago

    // TARIFA DE AUTO PARA QUE LA AUTOPISTA SE SUME A SU SALDO ESA TARIFA
    method tarifa()

    // PAGAR PEAJE PARA QUE SE APLIQUE LAS FORMAS DE PAGO
    method pagarPeaje() {
        metodoDePago.pagarSegunMetodo(self)
    }

    // DISMINUIR PEAJES DISPONIBLES
    method disminuirPeajesDisponibles(unValor) {
        peajesDisponibles -= unValor
    }

    // DISMINUIR SALDO DE SUBE
    method disminuirSaldoDeSube() {
        saldoSube = saldoSube - tarifa - (tarifa * 0.1)
    }

    // DISMINUIR EFECTIVO
    method disminuirEfectivo() {
        efectivo -= tarifa
    }
}

class Auto inherits Vehiculo {
    override method tarifa() {
        return 10
    }
}

class Camion inherits Vehiculo {
    var cantidadDeEjes

    override method tarifa() {
        return 20 * cantidadDeEjes
    }
}

object conPass {
    method pagarSegunMetodo(unVehiculo) {
        unVehiculo.disminuirPeajesDisponibles(1)
    }
}

object conSube {
    method pagarSegunMetodo(unVehiculo) {
        unVehiculo.disminuirSaldo()
    }
}

object conEfectivo {
    method pagarSegunMetodo(unVehiculo) {
        unVehiculo.disminuirEfectivo()
    }
}