//Enunciado
class Persona {
   var property edad
   var property consolas = []
   
   method puedeJugar(unJuego) {
      if(unJuego.tipo() == "Juego de mesa")
         return edad.between(unJuego.edadMinima(), unJuego.edadMaxima())
      if(unJuego.tipo() == "Videojuego") {
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

/* PUNTO 1
Declaratividad: los if(unJuego.tipo() == "tipo de juego") dentro de ellos no son delarativos, 
no explican el qué quiere lograr, directamente resuelve el cómo.

Polimorfismo: No hay polimorfismo que se aproveche, se podria implementar un metodo esJugable(Jugador)
que este dentro de los tipos de juegos y con eso ganariamos en polimorfismo, ya que todos los tipos 
de juegos entenderian el mismo mensaje solo que se implementaria distinto para cada uno.

Delegación: no existe delegación en el método puedeJugar(unJuego), directamente se resuelve toda
la logica en ese único método, no reparte responsabilidades.

Encapsulamiento: la variable edad esta sin "encapuslar" que esto permite asignarle valores
arbitrariamente sin que pasen por una validacion de por medio

Herencia: Se podría tener una clase de Juego y despues manejarse con el tipo a traves
de composicion y no crear una clase Videojuego que herede la clase Juego
*/


//PUNTO 2

class Persona1 {
   var property edad
   var property consolas = []  

   method puedeJugar(juego) = juego.esJugablePor(self)
}

class Juego1{
   method esJugablePor(jugador) 
   method edadAdecuada(jugador,juego) = jugador.edad().between(juego.edadMinima(), juego.edadMaxima())
}

class JuegoDeMesa inherits Juego1{
   var property edadMinima
   var property edadMaxima

   override method esJugablePor(jugador) = self.edadAdecuada(jugador,self)

}
class Pelota inherits Juego1{

   override method esJugablePor(jugador) = jugador.edad() > 1
}
class VideoJuego1 inherits Juego1{
   var genero
   var property consolasSoportadas =  []
   const edadMaxima = 80

   override method esJugablePor(jugador) = self.edadAdecuada(jugador, self) && 
                                          self.consolaCompatible(jugador)

   method consolaCompatible(jugador) = jugador.consolas().any{ 
         consola => consolasSoportadas.includes(consola) }
}

class Genero{
   var property titulo 
   var property edadMinima
}

/* 
Declaratividad: el metodo esJugablePor(jugador) esta bien explicado el que hace,  lo mismo
el metodo edadAdecuada(jugador,juego) y consolaCompatible(jugador)

Polimorfismo: esJugablePor(jugador) tiene la misma forma y el mensaje es entendido por mas
de una clase y cada tipo de juego lo implementa segun su logica propia, 
al igual que edadAdecuada(jugador,juego)

Delegación: el metodo esJugablePor(jugador) delega la logica a otros metodos como 
edadAdecuada(jugador,juego) y consolaCompatible(jugador) segun el caso.

Encapsulamiento: la variable edad esta sin "encapuslar" que esto permite asignarle valores
arbitrariamente sin que pasen por una validacion de por medio

Herencia: Se tiene una clase Juego y se hereda los atributos de esta a los distintos tipos 
de juego. Despues para el caso de los videojuegos se opto por manejar el genero por composicion
permitiendo asi cambiar el genero de un juego facilmente.
*/
