<?php
  /*
     * #===========================================================#
     * #	Este fichero contiene las funciones de gestión
     * #	de usuarios de la capa de acceso a datos
     * #==========================================================#
     */

 function alta_alumno($conexion,$usuario) {

	try {
		$consulta = "INSERT INTO Alumnos (DNI_Alumno,Nombre,Apellidos,Edad,Localidad,Telefono_Movil,Telefono_Fijo,Email,Nombre_Padre_Madre,Usuario,Pass)";
		$stmt=$conexion->prepare($consulta);
		$stmt->bindParam(':DNI',$usuario["DNI"]);
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
		return false;
		// Si queremos visualizar la excepción durante la depuración: $e->getMessage();
    }
}
  
function consultarUsuario($conexion,$Usuario,$Pass) {
 	$consulta = "SELECT COUNT(*) AS TOTAL FROM Alumnos WHERE Usuario=:Usuario AND PASS=:pass";
	$stmt = $conexion->prepare($consulta);
	$stmt->bindParam(':Usuario',$Usuario);
	$stmt->bindParam(':Pass',$Pass);
	$stmt->execute();
	return $stmt->fetchColumn();
}

/* Función para validar la matriculación.
 ========================================================================== */
 function validacionRegistro($usuario) {
	$errores = array();
	
	
	if ($usuario["DNI"] == "") {
		$errores[] = "El DNI no puede estar vacío";
	} else if (!preg_match("/^[0-9]{8}[A-Z]$/", $usuario["DNI"])) {
		$errores[] = "El DNI debe contener 8 números y una letra mayúscula: " . $usuario["DNI"] . "";
	}
	
	if ($usuario["Nombre"] == "" || !preg_match("/^[A-Za-záéíóúÁÉÍÓÚ\s]+$/", $usuario["Nombre"])) {
		$errores[] = "El nombre no puede estar vacío o no ser alfabetico";
	}
	if ($usuario["Apellidos"] == "" || !preg_match("/^[A-Za-záéíóúÁÉÍÓÚ\s]+$/", $usuario["Apellidos"]) ) {
		$errores[] = "Los apellidos no puede estar vacío o no ser alfabeticos";
	}
	if ($usuario["Email"] == "") {
		$errores[] = "El email no puede estar vacío";
	} 
	if ($usuario["TelefonoMovil"] == "" or !is_numeric($usuario["TelefonoMovil"]) or strlen($usuario["TelefonoMovil"]) < 9) {
		$errores[] = "El teléfono móvil no es correcto";
	}
	if ($usuario["TelefonoFijo"] == "" or !is_numeric($usuario["TelefonoFijo"]) or strlen($usuario["TelefonoFijo"]) < 9) {
		$errores[] = "El teléfono fijo no es correcto";
	}
	
	if (!isset($usuario["Pass"]) || strlen($usuario["Pass"]) < 8) {
		$errores[] = "Contraseña no válida: debe tener al menos 8 caracteres";
	} else if (!preg_match("/[a-z]+/", $usuario["Pass"]) || !preg_match("/[A-Z]+/", $usuario["Pass"]) || !preg_match("/[0-9]+/", $usuario["Pass"])) {
		$errores[] = "Contraseña no válida: debe contener letras mayúsculas y minúsculas y dígitos";
	} else if ($usuario["Pass"] != $usuario["confirmpass"]) {
		$errores[] = "La confirmación de contraseña no coincide con la contraseña";
	}
	return $errores;
}
