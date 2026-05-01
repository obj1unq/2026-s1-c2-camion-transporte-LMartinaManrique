import cosas.*
import caminos.*
import destino.*
object camion {
	const property cosas = #{}
	method cargar(unaCosa) {
		self.verificarAlCargar(unaCosa)
		cosas.add(unaCosa)
	}

	method descargar(unaCosa){
		self.verificarAlDescargar(unaCosa)
		cosas.remove(unaCosa)
	
	}

	method verificarAlCargar(unaCosa){
		return if (self.estaEnCamion(unaCosa)){
			self.error("deja esa cosa ahi o veras")
		}
	}

	method verificarAlDescargar(unaCosa){
		return if(not self.estaEnCamion(unaCosa)){
			self.error("aqui no hay cosa, ¿lo ves?")
		}
	}

	method estaEnCamion(unaCosa){
		return cosas.contains(unaCosa)
	}

	method pesoDeCadaCosaEnCamion(){
		return cosas.map({unaCosa => unaCosa.peso()})
	}
	method esPesoDeCosasPar(){
		return self.pesoDeCadaCosaEnCamion().all({unaCosa => unaCosa.even()})
	}

	method hayCosaQuePesa(peso){
		return cosas.any{unaCosa => unaCosa.peso() == peso}
	}

	method pesoTotalDeCosas(){
		return cosas.sum{unaCosa => unaCosa.peso()}
	}
	method pesoTotalDeCamion(){
		return 1000 + self.pesoTotalDeCosas()
	}

	method tieneExcesoDePeso(){
		return self.pesoTotalDeCamion() > 2500
	}
	
	method cosaConPeligrosidad(nivelPeligrosidad){
		return cosas.find{unaCosa => unaCosa.nivelPeligrosidad() == nivelPeligrosidad}
	}

	method cosaConMasPeligrosidadDe(nivelPeligrosidad){
		return cosas.filter{unaCosa => unaCosa.nivelPeligrosidad() > nivelPeligrosidad}
	}
	
	method cosaConMasPeligrosidadQue(otraCosa){
		return cosas.filter{unaCosa => unaCosa.nivelPeligrosidad() > otraCosa.nivelPeligrosidad()}
	}

	method hayCosasConPeligrosidadmenorA(nivelPeligrosidad){
		return cosas.all{unaCosa => unaCosa.nivelPeligrosidad() < nivelPeligrosidad}
	}

	 method puedeCircularEnRuta(nivelPeligrosidad){
    	return self.hayCosasConPeligrosidadmenorA(nivelPeligrosidad) && !self.tieneExcesoDePeso()
  	}

	method tieneCosaConPesoEntre(valorX, valorY){
		return self.pesoDeCadaCosaEnCamion().any({ peso => peso.between(valorX, valorY) })
	}
	
	method cosaMasPesada() {
	  
	  self.validarSiEstaCargadoCon(self.cosas())
	  return cosas.max({ unaCosa => unaCosa.peso() })
	}

	method validarSiEstaCargadoCon(_cosas) {
	  
	  if (self.cosas().isEmpty()) {
		
		self.error("aqui no hay cosas, ¿lo ves?")
	  }
	}
	
	method bultosTotalesAtransportar() {
	  return cosas.sum{unaCosa => unaCosa.cantBultosAUtilizar()}
	}
	
	method sufrirAccidente(){
		cosas.forEach{unaCosa => unaCosa.sufrirAccidente()}
	}

	method almacenarCosasEn(destino){
		destino.almacenarCosasDeCamion()
		cosas.clear()
	}

	method transportar(destino,camino) {
		self.validarCamino(camino)
		self.almacenarCosasEn(destino)
	}

	method validarCamino(camino){
        if(not camino.soportaViaje()){
            self.error("no podes circular por acá")
        }
    }
	
}
