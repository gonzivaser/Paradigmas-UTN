import centrales.*

/*----------------------------------------------- SPRINGFIELD ----------------------------------------------------*/
object springfield {
  const vientos = 10
  const riquezaDeSuelo = 0.9
  const centrales = #{burns, exBosque, elSuspiro}

  method vientos () {
    return vientos
  }

  method riquezaDeSuelo () {
    return riquezaDeSuelo
  }

  // PUNTO 1 -- Se desea saber la producción energética de una central en Springfield.
  method produccionEnergeticaDe(unaCentral) {
    return unaCentral.produccionEnergetica()
  }

  // PUNTO 2 -- Se desean conocer las centrales contaminantes de Springfield.
  method centralesContaminantes() {
    return centrales.filter { central => central.contaminacion() }
  }

  // PUNTO 3 -- Se desea saber si Springfield cubrió sus necesidades con su suministro.
  method cubrioNecesidades(unaNecesidad) {
    return centrales.sum { central => central.produccionEnergetica() } >= unaNecesidad
  }

  // PUNTO 4 -- Springfield necesita saber si está en el horno. Está en el horno cuando las centrales contaminantes aportan más del 50% de lo necesario, ó si todas las centrales son contaminantes.
  method estaAlHorno(unaNecesidad) {
    return centrales.all{ central => central.contaminacion() } || self.cantidadDeAporteContaminante() > unaNecesidad / 2
  }

  method cantidadDeAporteContaminante() {
    return centrales.filter { central => central.contaminacion() }.sum { central => central.produccionEnergetica() }
  }

  // PUNTO 5 -- LA CENTRAL QUE MAS PRODUCE ENERGIA
  method centralQueMasProduce() {
    return centrales.max { central => central.produccionEnergetica() }
  }
}

/*----------------------------------------------- ALBUQUERQUE ----------------------------------------------------*/
object albuquerque {
  const caudal = 150
  var central = hidroelectrica

  method caudal () {
    return caudal
  }

  // PUNTO 5 -- LA CENTRAL QUE MAS PRODUCE ENERGIA
  method centralQueMasProduce() {
    return central
  }
}