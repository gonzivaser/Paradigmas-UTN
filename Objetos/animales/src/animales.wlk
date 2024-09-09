/*---------------------------------------------- ANIMAL NANO ---------------------------------------------------*/
object nano {
  var energia = 100
  const responsable = "Ro"

  method energia() {
    return energia
  }

  method responsable() {
    return responsable
  }

  method comer(unosGramos) {
    energia = energia + 2 * unosGramos
  }

  method galopar(unaDistancia) {
    energia -= unaDistancia
  }

  method estaFeliz() {
    return true
  }

  method curar() {
    self.galopar(3)
    self.comer(3000)
    self.galopar(5)
  }
}

/*---------------------------------------------- ANIMAL PEPITA ---------------------------------------------------*/
object pepita {
  var energia = 100
  var responsable = "Gus"
  var dondeEsta = "General las Heras"

  method energia() {
    return energia
  }

  method responsable() {
    return responsable
  }

  method dondeEsta() {
    return dondeEsta
  }

  method comer(unosGramos) {
    energia = energia + unosGramos.div(2)
  }

  method volarHacia(unaCiudad) {
    dondeEsta = unaCiudad
    energia = energia.div(2)
  }

  method estaFeliz() {
    return dondeEsta == "Lihuel Calel"
  }

  method curar() {
    self.volarHacia("Lihuel Calel")
  }
}

/*------------------------------------------------- ANIMAL KALI ------------------------------------------------------*/
object kali {
  var energia = 100
  var responsable = "Dani"
  var edad = 15

  method energia() {
    return energia
  }

  method responsable() {
    return responsable
  }

  method edad() {
    return edad
  }

  method comer(unosGramos) {
    energia += unosGramos
  }

  method cumplirAnios() {
    edad += 1
  }

  method estaFeliz() {
    return edad >= 3
  }

  method curar() {
    self.comer(400)
  }
}