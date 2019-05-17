<?php
    /*
     * #===========================================================#
     * #	Este fichero contiene las funciones de gestión     	   #	 
     * #	de Recibos de la capa de acceso a datos 	           #
     * #===========================================================#
     */
	function consultarTodosRecibos($conexion) {
		$consulta = "SELECT * FROM RECIBOS, ALUMNOS"
			. " WHERE (RECIBOS.DNI_ALUMNO = ALUMNOS.DNI_ALUMNO)"
			. " ORDER BY Id_Recibo";
	    return $conexion->query($consulta);
	} 
?>