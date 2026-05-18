object universidad{}
class Materia{
	var property carrera

}

class Carrera{
	var property materias
}

class MateriaAprobada{
	var property materia
	var property nota
}
class Estudiante{
	var property materiasAprobadas = #{} // Lista de MateriaAprobada
	var property carrerasInscriptas = #{}
	
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

	method puedeInscribirse(materia) = carrerasInscriptas.contains(materia.carrera()) 

}



