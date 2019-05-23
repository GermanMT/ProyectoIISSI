<?php
    /*
     * #===========================================================#
     * #	Este fichero contiene las funciones de gestión     	   #	 
     * #	de horarios de alumnos de la capa de acceso a datos    #
     * #===========================================================#
     */
	function consultarTodosHorarios($conexion,$DNI) {
		$consulta = "SELECT * FROM HORARIO_ALUMNO"
			. " WHERE (HORARIO_ALUMNO.DNI_USUARIO = '".$DNI."')";
	    return $conexion->query($consulta);
	} 
?>