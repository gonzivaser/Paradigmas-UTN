/* PUNTO 1
a) Falso, podria directamente la autopista tener una lista de autos y camiones
b) Falso, habria mucha logica repetida en el metodo pagarPeaje()
c) Verdadero, ya que se esta utilizando herencia y no composicion
d) Falso, ya que no hay un manejo de errores que lo marque como tal
*/

// PUNTO 2
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
    method pagarPeaje()
    method tarifa()
}

class Auto inherits Vehiculo {
    var tarifa
}

class Camion inherits Vehiculo {
    var cantidadDeEjes
}