import NoPuedoIrmeDeAventurasException.*
class Rick {
    var nivelDeDemencia 
    const acompaniante

    method irDeAventuras() {
        try {
            acompaniante.irseDeAventurasCon(self)   
        } catch unaException : NoPuedoIrmeDeAventurasException {
            self.noPuedoIrDeAventuras()
        }
    }

    method modificarNivelDeDemencia(unaCantidad) {
        nivelDeDemencia = nivelDeDemencia + unaCantidad
    }

    method noPuedoIrDeAventuras() {
        self.modificarNivelDeDemencia(1000)
    }
}