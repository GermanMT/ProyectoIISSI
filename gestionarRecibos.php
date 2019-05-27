<?php
    /*
     * #===========================================================#
     * #	Este fichero contiene las funciones de gestión     	   #	 
     * #	de Recibos de la capa de acceso a datos 	           #
     * #===========================================================#
     */
	function consultarTodosRecibos($conexion,$DNI) {
		$consulta = "SELECT * FROM RECIBOS"
			. " WHERE (RECIBOS.DNI_USUARIO = '".$DNI."')"
			. " ORDER BY Id_Recibo";
	    return $conexion->query($consulta);
	} 
?>