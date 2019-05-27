<?php
  	/*
     * #===========================================================#
     * #	Este fichero contiene las funciones de gestión     	   #	 
     * #	de Cursos de la capa de acceso a datos 				   #
     * #===========================================================#
     */
	function consultarTodosCursosProfesor($conexion,$Id_Curso) {
		$consulta = "SELECT * FROM Cursos_Alumnos, Usuarios"
			. " WHERE (Cursos_Alumnos.ID_CURSO = '".$Id_Curso."') AND (Cursos_Alumnos.DNI_USUARIO = Usuarios.DNI_USUARIO)";
	    return $conexion->query($consulta);
	}
    
?>