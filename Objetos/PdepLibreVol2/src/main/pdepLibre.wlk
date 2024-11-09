/*------------------------------------------ OBJECT PDEP LIBRE ----------------------------------------------------*/
object pdepLibre {
    var usuarios = #{}
    var productos = []

    // REDUCIR PUNTOS A USUARIOS MOROSOS
    // AQUELLOS QUE TIENEN DINERO EN NUMERO NEGATIVO, SE LES BAJAN 1000 PUNTOS
    method reducirPuntosAUsuariosMorosos() {
        self.usuariosMorosos().forEach({ unUsuario => unUsuario.reducirPuntos(1000)})
    }

    method usuariosMorosos() {
        return usuarios.filter({ unUsuario => unUsuario.esMoroso()})
    }

    // ELIMINAR LOS CUPONES UTILIZADOS DE CADA USUARIO
    method eliminarCuponesUtilizados() {
        usuarios.forEach({ unUsuario => unUsuario.eliminarCuponesUtilizados()})
    }

    // NOMBRE DE OFERTA DE LOS PRODUCTOS 
    // QUE LOS PRODUCTOS MUEBLE Y INDUMENTARIA TENGAN ADELANTE DEL NOMBRE SUPEROFERTA
    method nombreDeOfertaDeLosProductos() {
        productos.filter({ unProducto => unProducto.nombreEnOferta() })
    }

}