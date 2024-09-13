import camiones.*

/*-------------------------------------------- PDEP CARGAS ---------------------------------------------------------*/
object pdepCargas {
    var patrimonioEmpresa = 10000.max(0)

    method pagarPeaje(unaCantidad) {
        patrimonioEmpresa = patrimonioEmpresa - unaCantidad
    }
}