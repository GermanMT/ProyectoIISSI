<?php
    /*
     * #===========================================================#
     * #	Este fichero contiene las funciones de gestión     	   #	 
     * #	de un administrador de la capa de acceso a datos       #
     * #===========================================================#
     */
	function consultarAlumnos($conexion) {
		$consulta = "SELECT * FROM Usuarios"
			. " WHERE (Usuarios.TipoUsuario = 'Alumno')";
	    return $conexion->query($consulta);
	} 
	
	function quitarUsuario($conexion,$DNI_Usuario) {
		try {
			$stmt=$conexion->prepare('CALL QUITAR_USUARIO(:DNI_USUARIO)');
			$stmt->bindParam(':DNI_USUARIO',$DNI_Usuario);
			$stmt->execute();
			return "";
		} catch(PDOException $e) {
			return $e->getMessage();
	    }
	}
	
	function consultarProfesores($conexion) {
		$consulta = "SELECT * FROM Usuarios"
			. " WHERE (Usuarios.TipoUsuario = 'Profesor')";
	    return $conexion->query($consulta);
	} 
?>