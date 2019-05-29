<?php
    /*
     * #===========================================================#
     * #	Este fichero contiene las funciones de gestión     	   #	 
     * #	de TipoUsuario de la capa de acceso a datos 	       #
     * #===========================================================#
     */
	function consultarTipoUsuario($conexion,$usuario,$pass) {
		$consulta = "SELECT TIPOUSUARIO FROM USUARIOS"
			. " WHERE (USUARIOS.USUARIO = '".$usuario."' AND USUARIOS.PASS = '".$pass."')";
	    return $conexion->query($consulta);
	} 
?>