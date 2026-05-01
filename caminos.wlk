import camion.*
import cosas.*
import destino.*

object ruta9{

method soportaViaje(){
    return camion.puedeCircularEnRuta(20)
}
}

object caminosVecinales{
    var property pesoMaxPermitido = 0
   method soportaViaje(){
    return camion.pesoTotalDeCamion() <= pesoMaxPermitido
} 

}