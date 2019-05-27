<?php
    /*
     * #===========================================================#
     * #	Este fichero contiene las funciones de gestión     	   #	 
     * #	de DNI de la capa de acceso a datos 	               #
     * #===========================================================#
     */
	function consultarDNI($conexion,$usuario,$pass) {
		$consulta = "SELECT DNI_USUARIO FROM USUARIOS"
			. " WHERE (USUARIOS.USUARIO = '".$usuario."' AND USUARIOS.PASS = '".$pass."')";
	    return $conexion->query($consulta);
	} 
?>