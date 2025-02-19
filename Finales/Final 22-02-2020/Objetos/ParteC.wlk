// 1
/*
   a) Verdadero, ya que no hay manejo de excepcion o errores a la hora de que suceda eso
   b) Falso, no hay buen uso de polimorfismo ya que no se esta tratando a los productos de manera indistinta
   c) Falso, estan bien distribuidas ya que la Clase Heladeria esta siendo la encargada de aumentar la facturacion y de 
      disminuir el stock
   d) Falso, no se rompe el encapsulamiento del cucurucho porque tiene los getters y setters correspondientes para 
      que este no se rompa
*/


// 2 y 3
class Heladeria {
    var facturado 
    var stock 

    method venderPunto2(unProducto) {
        if (unProducto.stockRequerido() < stock) {
            facturado += unProducto.precio()
            stock -= unProducto.stockRequerido()
        } else {
            throw new Exception (message = "No hay stock suficiente")
        }
    }

    method venderPunto3(unProducto) {
        if(unProducto.stockRequerido() < stock) {
            if(unProducto.esDeGustosTradicionales()) {
                facturado += unProducto.precioConGustosTradicionales()
                stock -= unProducto.stockRequerido()
            } else {
                facturado += unProducto.precio()
                stock -= unProducto.stockRequerido()
            }
        } else {
            throw new Exception (message = "No hay stock suficiente")
        }
    }

}

class Cucurucho {
    var property recargoPorCobertura
    var property esDeGustosTradicionales 

    method stockRequerido() {
        return 0.2
    }

    method precio() {
        return 50 + recargoPorCobertura
    }

    method precioConGustosTradicionales() {
        return 50 + recargoPorCobertura - (50 * 0.2)
    }

}

class KgDeHelado {
    var property esDeGustosTradicionales 

    method stockRequerido() {
        return 1
    }

    method precio() {
        return 200
    }

    method precioConGustosTradicionales() {
        return 200 - (200 * 0.2)
    }
}