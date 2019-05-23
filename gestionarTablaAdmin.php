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
	
	function modificarUsuario($conexion,$DNI_Usuario,$NOMBRE,$APELLIDOS,$EDAD,$LOCALIDAD,$TELEFONO_MOVIL,$TELEFONO_FIJO,$EMAIL,$NOMBRE_PADRE_MADRE) {
		try {
			$stmt=$conexion->prepare('CALL MODIFICAR_USUARIO(:DNI_Usuario,:NOMBRE,:APELLIDOS,:EDAD,:LOCALIDAD,:TELEFONO_MOVIL,:TELEFONO_FIJO,:EMAIL,:NOMBRE_PADRE_MADRE)');
			$stmt->bindParam(':DNI_Usuario',$DNI_Usuario);
			$stmt->bindParam(':NOMBRE',$NOMBRE);
			$stmt->bindParam(':APELLIDOS',$APELLIDOS);
			$stmt->bindParam(':EDAD',$EDAD);
			$stmt->bindParam(':LOCALIDAD',$LOCALIDAD);
			$stmt->bindParam(':TELEFONO_MOVIL',$TELEFONO_MOVIL);
			$stmt->bindParam(':TELEFONO_FIJO',$TELEFONO_FIJO);
			$stmt->bindParam(':EMAIL',$EMAIL);
			$stmt->bindParam(':NOMBRE_PADRE_MADRE',$NOMBRE_PADRE_MADRE);
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