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
    var metodoDePago

    // TARIFA DE AUTO PARA QUE LA AUTOPISTA SE SUME A SU SALDO ESA TARIFA
    method tarifa()

    // PAGAR PEAJE PARA QUE SE APLIQUE LAS FORMAS DE PAGO
    method pagarPeaje() {
        metodoDePago.pagarSegunMetodo(self.tarifa())
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

class ConTelePeaje {
    var peajesDisponibles 

    method pagarSegunMetodo(unMonto) {
        peajesDisponibles -= 1
    }
}

class ConSube {
    var saldoSube

    method pagarSegunMetodo(unMonto) {
        saldoSube -= unMonto - (unMonto * 0.1)
    }
}

class ConEfectivo {
    var saldoEnEfectivo

    method pagarSegunMetodo(unMonto) {
        saldoEnEfectivo -= unMonto
    }
}
