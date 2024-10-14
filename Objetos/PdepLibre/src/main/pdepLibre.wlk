import Cupon.*
import Usuario.*
import Producto.*
import niveles.*

object pdepLibre {
    const productos = []
    const usuarios = #{}

    // REDUCIR PUNTOS A USUARIOS MOROSOS 
    method penalizarAUsuariosMorosos() {
        self.usuariosMorosos().forEach( { unUsuario => unUsuario.reducirPuntos() } )
    }

    method usuariosMorosos() {
        return usuarios.filter( { unUsuario => unUsuario.esMoroso() } )
    }

    // ELIMINAR CUPONES USADOS
    method eliminarCuponesUsados() {
        usuarios.forEach( { unUsuario => unUsuario.eliminarCuponesUsados() } )
    }

    // OBTENER NOMBRES DE OFERTA DE PRODUCTOS
    method nombresDeProductoDeOferta() {
        return productos.map( { unProducto => unProducto.nombreDeOferta() } )
    }

    // ACTUALIZAR LOS NIVELES DE TODOS SUS USUARIOS
    method actualizarNivelesDeUsuarios() {
        usuarios.forEach( { unUsuario => unUsuario.actualizarNivel() } )
    }
}