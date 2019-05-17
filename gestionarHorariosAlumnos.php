<?php
    /*
     * #===========================================================#
     * #	Este fichero contiene las funciones de gestión     	   #	 
     * #	de horarios de alumnos de la capa de acceso a datos    #
     * #===========================================================#
     */
	function consultarTodosRecibos($conexion) {
		$consulta = "SELECT * FROM HORARIO_ALUMNO, ALUMNOS"
			. " WHERE (HORARIO_ALUMNO.DNI_ALUMNO = ALUMNOS.DNI_ALUMNO)";
	    return $conexion->query($consulta);
	} 
?>