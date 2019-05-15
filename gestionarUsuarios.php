<?php
  /*
     * #===========================================================#
     * #	Este fichero contiene las funciones de gestión
     * #	de usuarios de la capa de acceso a datos
     * #==========================================================#
     */

 function alta_usuario($conexion,$usuario) {

	try {
		$consulta = "CALL INSERTAR_ALUMNO(:DNI_Alumno,:Nombre,:Apellidos,:Edad,:Localidad,:Telefono_Movil,:Telefono_Fijo,:Email,:Nombre_Padre_Madre,:Usuario,:Pass)";
		$stmt=$conexion->prepare($consulta);
		$stmt->bindParam(':DNI_Alumno',$usuario["DNI"]);
		$stmt->bindParam(':Nombre',$usuario["Nombre"]);
		$stmt->bindParam(':Apellidos',$usuario["Apellidos"]);
		$stmt->bindParam(':Edad',$usuario["Edad"]);
		$stmt->bindParam(':Localidad',$usuario["Localidad"]);
		$stmt->bindParam(':Telefono_Movil',$usuario["Telefono Movil"]);
		$stmt->bindParam(':Telefono_Fijo',$usuario["Telefono Fijo"]);
		$stmt->bindParam(':Email',$usuario["Email"]);
		$stmt->bindParam(':Nombre_Padre_Madre',$usuario["Nombre Padre o Madre"]);
		$stmt->bindParam(':Usuario',$usuario["Usuario"]);
		$stmt->bindParam(':Pass',$usuario["Pass"]);
		
		$stmt->execute();
		return true;
	} catch(PDOException $e) {
		return false;
		// Si queremos visualizar la excepción durante la depuración: $e->getMessage();
    }
}
  
function consultarUsuario($conexion,$Usuario,$Pass) {
 	$consulta = "SELECT COUNT(*) AS TOTAL FROM USUARIOS WHERE Usuario=:Usuario AND PASS=:pass";
	$stmt = $conexion->prepare($consulta);
	$stmt->bindParam(':Usuario',$Usuario);
	$stmt->bindParam(':Pass',$Pass);
	$stmt->execute();
	return $stmt->fetchColumn();
}

