class Materia{
	
}

class Carrera{
	// coleecion materias de su carrera
	//
}

class MateriaAprobada{
	var property materia
	var property nota
 
}
class Estudiante{
	var materiasAprobadas = #{} // Lista de MateriaAprobada
	var property carreras
	
	method aprobo(materia_) = materiasAprobadas.any({ materiaAprobada => materiaAprobada.materia() == materia_ }) 

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


}



