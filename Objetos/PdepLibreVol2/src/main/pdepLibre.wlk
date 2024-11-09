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
    method nombreDeOfertaDeLosProductos() {
        return productos.map({ unProducto => unProducto.nombreEnOferta() })
    }

    // ACTUALIZAR EL NIVEL DE LOS USARIOS EN BASE A SUS PUNTOS 
    method actualizarNivelDeUsuarios() {
        usuarios.forEach({ unUsuario => unUsuario.actualizarNivel()})
    }

}