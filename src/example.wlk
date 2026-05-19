object universidad{}
class Materia{
	var property carrera
	const property requerimientos = #{} // conjunto de materia
	const property estudiantesInscriptos = #{}
	const property cupo 
	const property listaDeEspera = []

	method puedeInscribirse(estudiante) =   estudiante.estaCursandoCarrera(carrera) &&
											not self.estaInscripto(estudiante) &&
											self.cumpleRequerimientos(estudiante)


	method cumpleRequerimientos(estudiante) = requerimientos.all({materia => estudiante.aprobo(materia)})

	method estaInscripto(estudiante) = estudiantesInscriptos.contains(estudiante) 

	method inscribir(estudiante){
		if (not self.cumpleRequerimientos(estudiante)){
			self.error("No cumple requerimientos previos")
		} 
		self.añadirAListaDeEsperaOInscribir(estudiante)
		//estudiantesInscriptos.add(estudiante) // poner en lista de espera o inscripto, hacer otro method
	} // sumar inscriptos + lista espera y que no superen el cupo
	method añadirAListaDeEsperaOInscribir(estudiante){
		if ((estudiantesInscriptos.length() + listaDeEspera.length())> cupo){
			listaDeEspera.add(estudiante)
		} else {
			estudiantesInscriptos.add(estudiante)
		}
	}
}
class Carrera{
	var property materias
}

class MateriaAprobada{
	var property materia
	var property nota
}
class Estudiante{
	const property materiasAprobadas = #{} // conjunto de MateriaAprobada
	const property carrerasInscriptas = #{} // conjunto de carrera
	const property materiasInscriptas = #{} 

	method aprobo(materia) = materiasAprobadas.any({ materiaAprobada => materiaAprobada.materia() == materia }) 

	method aprobar(materia, nota){
		if (self.aprobo(materia)){
			self.error("Ya aprobó esta materia")
		}
		self.agregarMateriaAprobada(materia, nota)
	}

	method agregarMateriaAprobada(materia, nota){
		materiasAprobadas.add(new MateriaAprobada(materia = materia, nota = nota))
	}

	method cantidadMateriasAprobadas() = materiasAprobadas.size()

	method promedio() = materiasAprobadas.average{ materiaAprobada => materiaAprobada.nota()}

	method estaCursandoCarrera(carrera) = carrerasInscriptas.contains(carrera)

}



