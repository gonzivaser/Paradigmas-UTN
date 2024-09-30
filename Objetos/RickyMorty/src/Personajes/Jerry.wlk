import NoPuedoIrmeDeAventurasException.*
object jerry {
    method irseDeAventurasCon(unRick) {
        throw new NoPuedoIrmeDeAventurasException(message = "No me puedo ir de aventuras!")
    }
}