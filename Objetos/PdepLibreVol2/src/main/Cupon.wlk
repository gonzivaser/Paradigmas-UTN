/*------------------------------------------------ CLASE CUPON ---------------------------------------------------*/
class Cupon {
    var fueUsado 
    var porcentajeDeDescuento

    // CUPON NO USADO
    method noFueUsado() {
        return !fueUsado
    }

    // APLICAR CUPON
    method aplicarA(unPrecio) {
        return unPrecio - (unPrecio * porcentajeDeDescuento)
    }

    // MARCAR CUPON COMO USADO
    method cuponFueUsado() {
        fueUsado = true
    }
}