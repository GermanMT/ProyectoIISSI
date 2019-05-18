<?php
    /*
     * #===========================================================#
     * #	Este fichero contiene las funciones de gestión     	   #	 
     * #	de horario de profesores de la capa de acceso a datos  #	
     * #===========================================================#
     */
	function consultarTodosHorarios($conexion) {
		$consulta = "SELECT * FROM Cursos, Horario_Curso , Usuarios"
			. " WHERE (Horario_Curso.Id_Curso = Cursos.Id_Curso AND Usuarios.DNI_Usuario = Cursos.DNI_Usuario)";
	    return $conexion->query($consulta);
	}
?>