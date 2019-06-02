<?php
  /*
     * #===========================================================#
     * #	Este fichero contiene las funciones de gestión     	   # 
     * #	de Id de curso de la capa de acceso a datos            #		
     * #===========================================================#
     */
function consultarIdCurso($conexion,$usuario,$pass) {
	$consulta = "SELECT ID_CURSO FROM USUARIOS "
		. " WHERE (USUARIOS.USUARIO = '".$usuario."' AND USUARIOS.PASS = '".$pass."')";
    return $conexion->query($consulta);
}
    
?>