<?php
    /*
     * #===========================================================#
     * #	Este fichero contiene las funciones de gestión     	   #	 
     * #	de horarios de alumnos de la capa de acceso a datos    #
     * #===========================================================#
     */
	function consultarAlumnos($conexion) {
		$consulta = "SELECT * FROM Usuarios"
			. " WHERE (Usuarios.TipoUsuario = 'Alumno')";
	    return $conexion->query($consulta);
	} 
	
	function consultarProfesores($conexion) {
		$consulta = "SELECT * FROM Usuarios"
			. " WHERE (Usuarios.TipoUsuario = 'Profesor')";
	    return $conexion->query($consulta);
	} 
?>