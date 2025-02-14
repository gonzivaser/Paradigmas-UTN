// 1
/*
   a) Verdadero, pero al no haber ningun manejo de errores/excepciones se provoca esto
   b) Falso, no hay buen uso de polimorfismo, no se trata a los dos productos de manera indistinta, se estan aplicando
      ifs, lo que genera el no aprovechar el polimorfismo
   c) 
   d) Falso, no se esta rompiendo el encapsulamiento del cucurucho ya que al atributo que se esta accediendo de este 
      cuenta con los getters y setters correspondientes para que el encapsulamiento no sea roto
*/


// 2
class Heladeria {
    var facturado
    var stock

    method vender(unProducto) {
        if (stock >= unProducto.cantidadDeStockUsado()) {
            facturado += unProducto.costo()
            stock -= unProducto.cantidadDeStockUsado()
        } else {
            throw new Exception (message = "No hay stock disponible")
        }
    }
}

class KgDeHelado {
    method cantidadDeStockUsado() {
        return 1
    }

    method costo() {
        return 200
    }
}

class Cucurucho {
    var recargoPorCobertura

    method cantidadDeStockUsado() {
        return 0.2
    }

    method costo() {
        return 50 + recargoPorCobertura
    }
}
