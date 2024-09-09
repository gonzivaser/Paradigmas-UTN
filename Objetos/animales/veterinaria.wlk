/*------------------------------------------- VETERINARIA HUELLITAS ----------------------------------------------*/
object huellitas {
  const botiquin = ["Venda", "Venda", "Venda", "Pervinox", "Alchol", "Gasas"]

  method botiquin() {
    return botiquin
  }

  method agregarAlBotiquin(unElementoParaAgregar) {
    botiquin.add(unElementoParaAgregar)
  }

  method necesitaComprarVendas() {
    return botiquin.count({ unElemento => unElemento == "Venda" }) < 3
  } 
}