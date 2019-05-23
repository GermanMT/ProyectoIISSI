<?php
    /*
     * #===========================================================#
     * #	Este fichero contiene las funciones de gestión     	   #	 
     * #	de horarios de alumnos de la capa de acceso a datos    #
     * #===========================================================#
     */
	function consultarTodosHorarios($conexion) {
		$consulta = "SELECT * FROM HORARIO_ALUMNO, USUARIOS"
			. " WHERE (HORARIO_ALUMNO.DNI_USUARIO = Usuarios.DNI_USUARIO)";
	    return $conexion->query($consulta);
	} 
?>