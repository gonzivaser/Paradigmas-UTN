import Recuerdo.*

class Persona {
    var nivelDeFelicidad
    var emocionDominante
    var recuerdosDelDia = []
    var pensamientosCentrales = #{}


    //Cuando ella vive un evento, el recuerdo asociado se agrega a sus recuerdos del día, incluyendo una descripción, la fecha y la emoción dominante de Riley en ese momento.
    method vivirEvento(recuerdo) {
        recuerdosDelDia.push(recuerdo)
    }
}