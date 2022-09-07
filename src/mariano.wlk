import golosinas.*

object mariano {
	// para este objeto no damos pistas
	// definimos algunos métodos para que compile el test
	var golosinas = []
	var golosinasDesechadas = []
	
	method comprar(unaGolosina){golosinas.add(unaGolosina)}
	method comprarVarias(lista){golosinas.addAll(lista)}
	method vaciarBolsa(){golosinas.clear()}
	method desechar(unaGolosina){golosinas.remove(unaGolosina)
								 golosinasDesechadas.add(unaGolosina)	
	}
	method cantidadDeGolosinas(){golosinas.size()}
	method tieneLaGolosina(unaGolosina){golosinas.contains(unaGolosina)}
	method probarGolosina(){
		golosinas.forEach({g => g.mordisco()
								console.println(g.gusto()+" "+g.peso())
		})
	}
	method hayGolosinaSinTACC() =
					golosinas.any({g => g.libreGluten()})
					
	method hayGolosinaSinTACCconAll() =
					!golosinas.all({g => g.libreGluten()})
	
	method preciosCuidados() = 
					golosinas.all({g => g.precio() <= 10})
	method preciosCuidadosConAny() = 
					!golosinas.any({g => g.precio() > 10 })
	method golosinaDeSabor(unSabor) = 
					golosinas.find({g => g.gusto() == unSabor})
	method golosinasDeSabor(unSabor) =
					golosinas.filter({g => g.gusto() == unSabor})//Podemos definir un filtro
	
	method sabores() = golosinas.map({g => g.gusto()}).asSet()
	
	method golosinaMasCara() = golosinas.max({g => g.precio()})
	method golosinaMasCaraConUnMap() = 
					golosinas.map({g => g.precio()}).max()
					
	method precioGolosinaMasCara() = self.golosinaMasCara().precio()
	
	method pesoGolosinas() = golosinas.sum({g => g.peso()})
	
	method golosinasFaltantes(golosinasDeseadas) =	
							golosinasDeseadas.asSet().difference(golosinas.asSet())
							
	method golosinasQueTengo(golosinasQueTengo) =
							golosinas.asSet().defference(golosinasQueTengo.asSet())
							
	method gustosFaltantes(gustosDeseados) = 
							gustosDeseados.asSet().difference(self.sabores())//sabores() ya me devolvia un conjunto con los sabores de las golosinas
	
	method gastoEn(sabor) = self.golosinaDeSabor(sabor).sum({g => g.precio()})
	
	method precioGolosinaMasCaraConSabor(sabor) =
					self.golosinaDeSabor(sabor).max({g => g.precio()}).precio()
	
	method cantidadGolosinasDeSabor(unSabor) = 
					self.golosinasDeSabor(unSabor).size()
	
	
	method saborMasPopular() = 
			self.sabores().max({s => self.cantidadGolosinasDeSabor(s)})
	
	method comproYDesecho(golosina) = 
			golosinasDesechadas.contains(golosina)
	
}

