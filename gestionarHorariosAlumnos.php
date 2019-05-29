<?php
    /*
     * #===========================================================#
     * #	Este fichero contiene las funciones de gestión     	   #	 
     * #	de horarios de alumnos de la capa de acceso a datos    #
     * #===========================================================#
     */
	function consultarTodosHorariosAlumnos($conexion,$IDC) {
		$consulta = "SELECT * FROM HORARIO_CURSO"
			. " WHERE (HORARIO_CURSO.ID_CURSO = '".$IDC."')";
	    return $conexion->query($consulta);
	} 
?>