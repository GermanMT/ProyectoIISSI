<?php
  /*
     * #===========================================================#
     * #	Este fichero contiene las funciones de gestión
     * #	de usuarios de la capa de acceso a datos
     * #==========================================================#
     */

 function alta_alumno($conexion,$usuario) {
	try {
		$consulta = "CALL INSERTAR_ALUMNO(:DNI_Alumno, :Nombre, :Apellidos, :Edad, :Localidad, :TelefonoMovil,:TelefonoFijo, :Email, :NombrePadreMadre, :Usuario, :Pass)";
		$stmt=$conexion->prepare($consulta);
		$stmt->bindParam(':DNI_Alumno',$usuario["DNI_Alumno"]);
		$stmt->bindParam(':Nombre',$usuario["Nombre"]);
		$stmt->bindParam(':Apellidos',$usuario["Apellidos"]);
		$stmt->bindParam(':Edad',$usuario["Edad"]);
		$stmt->bindParam(':Localidad',$usuario["Localidad"]);
		$stmt->bindParam(':TelefonoMovil',$usuario["TelefonoMovil"]);
		$stmt->bindParam(':TelefonoFijo',$usuario["TelefonoFijo"]);
		$stmt->bindParam(':Email',$usuario["Email"]);
		$stmt->bindParam(':NombrePadreMadre',$usuario["NombrePadreMadre"]);
		$stmt->bindParam(':Usuario',$usuario["Usuario"]);
		$stmt->bindParam(':Pass',$usuario["Pass"]);
		
		$stmt->execute();
		return true;
	} catch(PDOException $e) {
		$_SESSION['excepcion'] = $e -> GetMessage();
		header("Location: excepcion.php");
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