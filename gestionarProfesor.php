<?php
    /*
     * #===========================================================#
     * #	Este fichero contiene las funciones de gestión         #
     * #	de profesores de la capa de acceso a datos             #
     * #===========================================================#
     */

 function alta_profesor($conexion,$usuario) {
	try {
		$consulta = "CALL INSERTAR_PROFESOR(:DNI_Usuario, :Nombre, :Apellidos, :Edad, :Localidad, :TelefonoMovil,
		:TelefonoFijo, :Email, :Usuario, :Pass,:TipoUsuario,:Nivel_Examen)";
		$stmt=$conexion->prepare($consulta);
		$stmt->bindParam(':DNI_Usuario',$usuario["DNI_Usuario"]);
		$stmt->bindParam(':Nombre',$usuario["Nombre"]);
		$stmt->bindParam(':Apellidos',$usuario["Apellidos"]);
		$stmt->bindParam(':Edad',$usuario["Edad"]);
		$stmt->bindParam(':Localidad',$usuario["Localidad"]);
		$stmt->bindParam(':TelefonoMovil',$usuario["TelefonoMovil"]);
		$stmt->bindParam(':TelefonoFijo',$usuario["TelefonoFijo"]);
		$stmt->bindParam(':Email',$usuario["Email"]);
		$stmt->bindParam(':Usuario',$usuario["Usuario"]);
		$stmt->bindParam(':Pass',$usuario["Pass"]);
		$stmt->bindParam(':TipoUsuario',$usuario["TipoUsuario"]);
		$stmt->bindParam(':Nivel_Examen',$usuario["Nivel_Examen"]);
		
		$stmt->execute();
		return true;
	} catch(PDOException $e) {
	/*	$_SESSION['excepcion'] = $e -> GetMessage();
		header("Location: excepcion.php");
	*/
	return false;
	}
}
  
function consultarUsuario($conexion,$Usuario,$Pass) {
 	$consulta = "SELECT COUNT(*) AS TOTAL FROM USUARIOS WHERE Usuario=:Usuario AND PASS=:Pass";
	$stmt = $conexion->prepare($consulta);
	$stmt->bindParam(":Usuario",$Usuario);
	$stmt->bindParam(":Pass",$Pass);
	$stmt->execute();
	return $stmt->fetchColumn();
}

?>