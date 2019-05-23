<?php
    /*
     * #===========================================================#
     * #	Este fichero contiene las funciones de gestión     	   #	 
     * #	de Recibos de la capa de acceso a datos 	           #
     * #===========================================================#
     */
	function consultarTodosRecibos($conexion) {
		$consulta = "SELECT * FROM RECIBOS, USUARIOS"
			. " WHERE (RECIBOS.DNI_USUARIO = Usuarios.DNI_USUARIO)"
			. " ORDER BY Id_Recibo";
	    return $conexion->query($consulta);
	} 
?>