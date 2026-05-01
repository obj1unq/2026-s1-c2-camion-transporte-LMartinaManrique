import camion.*
import cosas.*
import caminos.*

object almacen{
    const property inventario = #{}

    method almacenarCosasDeCamion(){
        inventario.addAll(camion.cosas())
    }
    
    method almacenar(unaCosa){
        inventario.add(unaCosa)
    }
}
