import rodados.*

class Pedido {
    var property distancia
    var tiempoMaximo
    var property pasajeros
    const property coloresIncompatibles= #{}
    method tiempoMaximo() = tiempoMaximo
    method initialize() {
        if(!distancia.between(1, 1000)) {
            self.error(distancia.toString() + " no es una distancia valida")
        }
        if(!tiempoMaximo.between(1,100)) {
            self.error(tiempoMaximo.toString() + "no es un tiempo maximo valido")
        }
        if(!pasajeros.between(1,100)) {
            self.error(pasajeros.toString() + "no es una cantidad de pasajeros valida")
        }   
    }
    method velocidadRequerida() = distancia / tiempoMaximo
    method puedeSatisfacer(unAuto) {return
          unAuto.velocidadMaxima() >= self.velocidadRequerida() + 10
          && unAuto.capacidad() >= pasajeros  
          && ! coloresIncompatibles.contains(unAuto.color())
    }
    method agregarColorIncompatible(unColor) {coloresIncompatibles.add(unColor)}
    method acelerar() {tiempoMaximo = (tiempoMaximo - 1).max(0)}
    method relajar() {tiempoMaximo  = tiempoMaximo + 1}

}