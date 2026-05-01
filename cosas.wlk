object knightRider {
	method peso() {
		 return 500
		}
	method nivelPeligrosidad() {
		 return 10 
		}
	method cantBultosAUtilizar(){
		return 1
	}

	method sufrirAccidente(){

	}
}

object arenaAGranel {
	var property peso = 1

	method nivelPeligrosidad() {
		 return 1
	}

	method cantBultosAUtilizar(){
		return 1
	}

	method sufrirAccidente(){
		peso = peso + 20
	}
}

object bumblebee {
	var property modoMontaje = modoRobot
	method peso() {
		 return 800 
	}

	method nivelPeligrosidad() {
        return modoMontaje.peligrosidad()
    }

	method cantBultosAUtilizar(){
		return 2
	}

	method sufrirAccidente(){
		modoMontaje.cambiarModoMontaje()
	}
}

object modoRobot {
    method peligrosidad(){
		return 30
	}
	method cambiarModoMontaje(){
		bumblebee.modoMontaje(modoAuto)
	}
}

object modoAuto {
    method peligrosidad(){
		return 15
	}

	method cambiarModoMontaje(){
		bumblebee.modoMontaje(modoRobot)
	}
}

object paqueteLadrillos{
	var property cantLadrillos = 2

	method peso(){
		return 2 * self.cantLadrillos()
	}

	method nivelPeligrosidad(){
		return 2
	}

	method cantBultosAUtilizar(){
		return if(self.cantLadrillos() <= 100){
			1
		}
		else if(self.cantLadrillos() <=300){
			2
		}
		else{
			3
		}
	}

	method sufrirAccidente(){
		if(cantLadrillos<= 12){
			cantLadrillos = 0
		}
		else{
			cantLadrillos = cantLadrillos - 12
		}
	}
}

object bateria{
	var property hayMisiles = true

	method peso(){
		return if(self.hayMisiles()){
			300
		}
		else{
			200
		}
	}

	method nivelPeligrosidad(){
		return if(self.hayMisiles()){
			100
		}
		else{
			0
		}
	}
	method cantBultosAUtilizar(){
		return if(self.hayMisiles()){
			2
		}
		else{
			1
		}
	}

	method sufrirAccidente(){
		if(self.hayMisiles()){
			hayMisiles = false
		}
	}
}

object residuosRadiactivos{
	var property peso = 21

	method nivelPeligrosidad(){
		return 200
	}

	method cantBultosAUtilizar(){
		return 1
	}

	method sufrirAccidente(){
		peso = peso + 15
	}	
}

object contenedorPortuario{
	const property cosas = #{}

	method cargarCosa(unaCosa){
		cosas.add(unaCosa)
	}

	method peso(){
		return 100 + self.pesoTotalDeCosas()
	}

	method pesoTotalDeCosas(){
		return cosas.sum{unaCosa => unaCosa.peso()}
	}

	method peligrosidadDeCosas(){
		return cosas.map{unaCosa => unaCosa.nivelPeligrosidad()}
	}

	method nivelPeligrosidad(){
		return self.peligrosidadDeCosas().maxIfEmpty{0}
	}

	method cantBultosAUtilizar(){
		return 1 + self.cantBultosDeCosas()
	}

	method cantBultosDeCosas(){
	  return cosas.sum{unaCosa => unaCosa.cantBultosAUtilizar()}
	}
	
	method sufrirAccidente(){
		cosas.forEach{unaCosa => unaCosa.sufrirAccidente()}
	}
}

object embalajeDeSeguridad{
	var property cosaEnvuelta = null

	method peso() {
	  return self.cosaEnvuelta().peso()
	}

	method nivelPeligrosidad(){
		return self.cosaEnvuelta().nivelPeligrosidad() / 2
	}
	method cantBultosAUtilizar(){
		return 2
	}

	method sufrirAccidente(){
		
	}
}