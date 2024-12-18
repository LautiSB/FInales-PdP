class Persona {
   var property edad
   var property consolas = []
   
   method puedeJugar(unJuego) {
      if(unJuego.tipo() = "Juego de mesa")
         return edad.between(unJuego.edadMinima(), unJuego.edadMaxima())
      if(unJuego.tipo() = "Videojuego") {
         if(edad.between(unJuego.genero().edadMinima(),80)) {
            consolas.forEach{
               consola => unJuego.consolasPosibles().forEach{
                  otraConsola => if(consola == otraConsola) return true
               }
            }
            return false
         } else return false
      }  
      return edad > 1 //si llega hasta acá, es porque es una pelota         
   } 
}

class Juego {
   var property tipo
   var property edadMinima
   var property edadMaxima   
}

class Videojuego inherits Juego {
   var property consolasPosibles 
   var property genero 
}

class genero {
   var property titulo
   var property edadMinima  
}