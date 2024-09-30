import NoPuedoIrmeDeAventurasException.*
import Beth.*

class Summer inherits Beth {
    override method irseDeAventuraCon(unRick) {
        if (self.esLunes()) {
            super(unRick)
        }  
        else {
            throw new NoPuedoIrmeDeAventurasException(message = "Solo me puedo ir de aventuras los Lunes")
        }
    }

    method esLunes() {
        return new Date().dayOfWeek() == "monday"
    }
}