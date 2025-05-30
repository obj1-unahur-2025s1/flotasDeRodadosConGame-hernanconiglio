import rodados.*
class Dependencia {
    const property flota = []
    var property empleados
    const pedidos = []

    method agregarPedido(unPedido) {pedidos.add(unPedido)}
    method quitarPedido(unPedido) {pedidos.remove(unPedido)}
    method agregarAFlota(rodado) {
        flota.add(rodado)
        }    
    method quitarDeFlota(rodado) {flota.remove(rodado)}
    method pesoTotalFlota() = flota.sum({r=>r.peso()})
    method estaBienEquipada() = self.tieneAlMenosRodados(3) && self.todosVanAlMenosAkm(100)

    method tieneAlMenosRodados(cantidad) = flota.size() >= cantidad
    method todosVanAlMenosAkm(km) = flota.all({r=>r.velocidadMaxima() >= km})
    method capacidadTotalEnColor(color) = self.rodadosDelColor(color).sum({r=>r.capacidad()})
    method rodadosDelColor(color) = flota.filter({r=>r.color() == color})
    method colorDelRodadoMasRapido() = self.rodadoMasRapido().color()
    method rodadoMasRapido() = flota.max({r=>r.velocidadMaxima()})
    method capacidadFaltante() = 0.max(empleados - self.capacidadFlota())
    method capacidadFlota() = flota.sum({r=>r.capacidad()})
    method esGrande() = empleados >= 40 && self.tieneAlMenosRodados(5)
    method totalPasajerosEnPedidos() = pedidos.sum({p=>p.pasajeros()})
    method pedidosNoPuedenSerSatisfechos() {return
        pedidos.filter({p=> not self.hayAlgunRodadoQueSatisfaceUnPedido(p)})
    }
    method hayAlgunRodadoQueSatisfaceUnPedido(unPedido) {return
        flota.any({r=>unPedido.puedeSatisfacer(r)})
    }

    method todosLosPedidosTienenIncompatible(unColor) {return
        pedidos.all({p=>p.coloresIncompatibles().contains(unColor)})
    }

    method relajarTodosLosPedidos() {
        pedidos.forEach({p=>p.relajar()})
    }
}