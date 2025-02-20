// 1
/*
    a) Falso, no se puede agregar facilmente ya que se esta usando un if, y seria algo complicado poder agregar. Porque 
       tambien no se esta tratando indistinto a los distintos tipos de linea.
    b) Falso, porque no hay maneja el tema de excepciones/errores, entonces directamente se gastaria en ambas lineas
*/

// 2
class Linea {
    var property plan
    var property numero

    method estado() {
        return "Tu plan es: " + plan + "tu numero es: " + numero + plan.informacionExtraSegunPlan()
    } 

    method usarInternet(unosKbs) {
        plan.usarInternetPorPlan(unosKbs)
    }
}

class Prepago {
    var property saldo 
    var property precioKb 

    method informacionExtraSegunPlan() {
        return "tu saldo es: " + saldo
    }

    method usarInternetPorPlan(unosKbs) {
        if(saldo < unosKbs * precioKb) {
            throw new Exception (message = "No alcanza el saldo")
        } 
        saldo -= unosKbs * precioKb
    }
}

class Factura {
    var property kbUsados 

    method informacionExtraSegunPlan() {
        return "usaste kbs: " + kbUsados
    }

    method usarInternetPorPlan(unosKbs) {
        kbUsados += unosKbs
    }
}

class Control inherits Factura{
    var property limiteKb

    override method usarInternetPorPlan(unosKbs) {
        if(limiteKb < kbUsados + unosKbs) {
            throw new Exception (message = "Se ha superado el limite")
        } 
        kbUsados += unosKbs
    } 
}