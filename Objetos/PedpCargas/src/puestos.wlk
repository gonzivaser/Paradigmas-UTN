import camiones.*
import pdepCargas.*

/*------------------------------------------- RUTA ATLANTICA -----------------------------------------------------*/
object rutaAtlantica {

    method dejarPasar(unCamion) {
        pdepCargas.pagarPeaje(self.tarifaDePeaje(unCamion))
        unCamion.recorrer(400, 75)
    }

    method tarifaDePeaje(unCamion) {
        return 7000 + unCamion.pesoDeCarga().div(1000) * 100
    }
}