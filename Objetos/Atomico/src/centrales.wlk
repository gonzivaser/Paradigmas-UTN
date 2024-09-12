import ciudades.*

/*----------------------------------------------- BURNS ----------------------------------------------------------*/
object burns {
  var cantidadDeVarillasDeUranio = 100

  method produccionEnergetica() {
    return 0.1 * cantidadDeVarillasDeUranio
  }

  method contaminacion() {
    return cantidadDeVarillasDeUranio > 20
  }
}

/*----------------------------------------------- EX-BOSQUE ------------------------------------------------------*/
object exBosque {
  const capacidadEnToneladas = 1000

  method produccionEnergetica() {
    return 0.5 + springfield.riquezaDeSuelo() * capacidadEnToneladas
  }

  method contaminacion() {
    return true
  }
}

/*----------------------------------------------- EL SUSPIRO -----------------------------------------------------*/
object elSuspiro {
  var cantidadDeTurbinas = 1

  method instalarTurbinas(unaCantidad) {
    cantidadDeTurbinas += unaCantidad
  }

  method produccionEnergetica() {
    return cantidadDeTurbinas * (0.2 * springfield.vientos())
  }

  method contaminacion() {
    return false
  }
}

/*----------------------------------------------- HIDROELECTRICA -----------------------------------------------------*/
object hidroelectrica {
  method produccionEnergetica() {
    return 2 * albuquerque.caudal()
  }
}