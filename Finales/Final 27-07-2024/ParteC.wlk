/*class Linea {
    var property plan 
    var property numero 
    var property saldo 
    var property precioKb
    var property kbUsados
    var property limiteKb

    method estado() {
        if (plan == "prepago") {
            return "Tu plan es: " + plan + "tu numero es: " + numero + "tu saldo es: " + saldo 
        } else {
            return "Tu plan es: " + plan + "tu numero es: " + numero + "usaste kbs: " + kbUsados 
        }
    }

    method usarInternet(kbs) {
        if (plan == "prepago") {
            if (saldo < kbs * precioKb) {
                return "No alcanza el saldo"
            }
            saldo = saldo - kbs * precioKb
        } else if (plan == "factura") {
            kbUsados = kbUsados + kbs
        } else {
            if (limiteKb < kbUsados + kbs) {
                return "Se ha superado el limite"
            }
            kbUsados = kbUsados + kbs
        }
    }
}
*/

/* PUNTO 1
a) Falso, no se podria usar sin modificar el metodo usarInternet
b) Falso, al no haber un manejo de errores en el metodo usarInternet, se gastaria el saldo a ambas
*/


/*PUNTO 2*/
class Linea {
    var property plan 
    var property numero 
    var property saldo 
    var property precioKb
    var property kbUsados
    var property limiteKb

    method estado() {
        return plan.mostrarEstado(self)
    }

    method usarInternet(unosKbs) {
        return plan.usarInternet(self, unosKbs)
    }
}

object lineaPrepaga {
    method mostrarEstado(unaLinea) {
        return "Tu plan es: " + unaLinea.plan() + "tu numero es: " + unaLinea.numero() + "tu saldo es: " + unaLinea.saldo() 
    }

    method usarInternet(unaLinea, unosKbs) {
        if (unaLinea.saldo() < unosKbs * unaLinea.precioKb()) {
            return "No alcanza el saldo"
        } 
        unaLinea.saldo() -= unosKbs * unaLinea.precioKb()
    }
}

object lineaFactura {
    method mostrarEstado(unaLinea) {
        return "Tu plan es: " + unaLinea.plan() + "tu numero es: " + unaLinea.numero() + "usaste kbs: " + unaLinea.kbUsados() 
    }

    method usarInternet(unaLinea, unosKbs) {
        unaLinea.kbUsados() += unosKbs
    }
}

object lineaControl {
    method mostrarEstado(unaLinea) {
        return "Tu plan es: " + unaLinea.plan() + "tu numero es: " + unaLinea.numero() + "usaste kbs: " + unaLinea.kbUsados() 
    }

    method usarInternet(unaLinea, unosKbs) {
        if (unaLinea.limiteKb() < unaLinea.kbUsados() + unosKbs) {
            return "Se ha superado el limite"
        }
        unaLinea.kbUsados() += unosKbs
    }
}
