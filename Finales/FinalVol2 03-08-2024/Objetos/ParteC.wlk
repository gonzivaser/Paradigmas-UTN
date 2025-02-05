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

class Auto {
    var tarifa
    var metodo

    method tarifa() {
        return tarifa
    }
}

class Camion {
    var cantEjes
    var tarifa
    var metodo

    method tarifa() {
        return tarifa * cantEjes
    }

    method pagarPeaje() {
        metodo.pagarAplicandoFormaDePago()
    }
}

object conPass {
    var cantidadPeajes = 100

    
}

object conSube {
    var saldoSube = 100
}

object conEfectivo {
    var efectivo = 100
}