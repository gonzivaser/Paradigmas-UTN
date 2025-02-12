// 1
/*
   a) Falso, no es necesario, porque en la lista de visitantes del parque, no importa si es chico o adulto
   b) Verdadero, ya que se esta tratando polimorficamente a los vistantes sin importar si es chico o adulto
   c) Verdadero, habra mucha repeticion de logica en el metodo "pagarEntrada()" ya que van a haber dos clases con 
      el mismo metodo de pago en el cual solo cambiarian valores enteros.
   d) Falso, no se podra hacer porque en este modelo se esta utilizando herencia y no composicion, y como consecuencia 
      en caso de que se quiera hacer eso, no va a ser posible. 
   e) Falso, ya que en ningun lado se muestra como es el manejo de errores del sistema
*/

// 2
class Parque {
    const property visitantes = #{}
    var property saldo = 0

    method cobrarEntrada() {
        visitantes.forEach({ unVisitante => self.cobrarleA(unVisitante) })
    }  

    method cobrarleA(unVisitante) {
        saldo = saldo + unVisitante.tarifa()
        unVisitante.pagarEntrada()
    }
}

class Visitante {
    var metodoDePago

    method tarifa()

    method pagarEntrada() {
        metodoDePago.pagarSegunMetodo(self.tarifa())
    }
}

class Niño inherits Visitante {
    override method tarifa() {
        return 50
    }
}

class Adulto inherits Visitante {
    override method tarifa() {
        return 100
    }
}

class ConPaseRapido {
    var accesosDisponibles

    method pagarSegunMetodo(unMonto) {
        accesosDisponibles -= 1
    }
}

class ConTarjeta {
    var saldoTarjeta

    method pagarSegunMetodo(unMonto) {
        saldoTarjeta = unMonto - (unMonto * 0.1)
    }
}

// 3
/*
   En el caso de la solucion propuesta, habria que agregar nuevas clases como PersonasMayores y Adolescentes, y despues
   habria que agregar nuevas clases para los metodos de pago segun el tipo de visitante. 
   En la solucion que propuse yo, solo habria que agregar dos clases nuevas que serian PersonasMayores y Adolescenetes
   que esten heredadas por parte de la clase Visitante.
*/