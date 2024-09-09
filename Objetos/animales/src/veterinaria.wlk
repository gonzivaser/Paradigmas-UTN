import animales.kali
import animales.pepita
import animales.nano

/*------------------------------------------- VETERINARIA HUELLITAS ----------------------------------------------*/
object huellitas {
  const botiquin = ["Venda", "Venda", "Venda", "Pervinox", "Alchol", "Gasas"] // LISTA --> PUEDE HABER VALORES REPETIDOS
  const pacientes = #{nano, pepita, kali}  // CONJUNTO --> NO PUEDE HABER VALORES REPETIDOS

  // GETTERS
  method botiquin() {
    return botiquin
  }

  method pacientes() {
    return pacientes
  }

  // AGREGAR A COLECCION (LISTA O CONJUNTO)
  method agregarA(coleccion, unValor) {
    coleccion.add(unValor)
  }

  method agregarAlBotiquin(unElementoParaAgregar) {
    self.agregarA(botiquin, unElementoParaAgregar)
  }

  method agregarPaciente(unPaciente) {
    self.agregarA(pacientes, unPaciente)
  }

  // CONTAR ELEMENTOS DE UNA COLECCION
  method necesitaComprarVendas() {
    return botiquin.count({ unElemento => unElemento == "Venda" }) < 3
  } 

  method darDeAlta(unPaciente) {
    pacientes.remove(unPaciente)
  }

  method cantidadDePacientes() {
    return pacientes.size()
  }

  // CONEXION DE OBJETOS
  method pacientesRecuperados() {
    return pacientes.filter({ unPaciente => unPaciente.estaFeliz() })
  }

  method responsablesDePacientes () {
    return pacientes.map({ unPaciente => unPaciente.responsable() }).asSet()
  }

  method pacienteConMasEnergia() {
    return pacientes.max({ unPaciente => unPaciente.energia() })
  }

  method curarATodos() {
    pacientes.forEach({ unPaciente => unPaciente.curar() })
  }
}