<?php
//Inicio de sesiones
	session_start();

//Includes
//include_once ('includes/funciones.php');
require_once ("gestionBD.php");

//Se comprueba que hemos llegado aquí por el formulario de matriculación y en tal caso se mete en la variable $usuario los datos del formulario, en caso contrario, se redirige a la página de matriculación
if (isset($_SESSION["formularioProfesor"])) {
	$usuario["DNI_Usuario"] = $_REQUEST["DNI_Usuario"];
	$usuario["Nombre"] = $_REQUEST["Nombre"];
	$usuario["Apellidos"] = $_REQUEST["Apellidos"];
	$usuario["Edad"] = $_REQUEST["Edad"];
	$usuario["Localidad"] = $_REQUEST["Localidad"];
	$usuario["TelefonoMovil"] = $_REQUEST["TelefonoMovil"];
	$usuario["TelefonoFijo"] = $_REQUEST["TelefonoFijo"];
	$usuario["Email"] = $_REQUEST["Email"];
	$usuario["Usuario"] = $_REQUEST["Usuario"];
	$usuario["Pass"] = $_REQUEST["Pass"];
	$usuario["confirmpass"] = $_REQUEST["confirmpass"];
	$usuario["TipoUsuario"] = $_REQUEST["TipoUsuario"];
	$usuario["Nivel_Examen"] = $_REQUEST["Nivel_Examen"];
	
} else {
	header('Location: formularioProfesor.php');
}

$_SESSION["formularioProfesor"] = $usuario;

try{
	$conexion = crearConexionBD();
	$errores = validacionRegistro($conexion, $usuario);
	cerrarConexionBD($conexion);
}catch(PDOException $e){
	/*Mensaje de depuracion */
/*	$_SESSION["errores"] = "<p>ERROR en la validacion: fallo en el acceso a la base de datos.</p><p>"
		.$e -> getMessage() ."</p>";
		Header('Location: formularioProfesor.php');*/	
	return false;
}
//En el caso de que haya errores, se redirige a la página de matriculacion y se muestran los errores, en caso contrario se redirige a la página de exitoAltaMatricula
if (count($errores) > 0) {
	$_SESSION['errores'] = $errores;
	header('Location: exitoAltaProfesor.php');
} else {
	unset($_SESSION['errores']);
	header('Location: exitoAltaProfesor.php');
}

//////////////////////////////////////////////////////////////
// Validación en servidor del formulario de alta de profesor//
//////////////////////////////////////////////////////////////
 function validacionRegistro($conexion, $usuario) {
	$errores = array();
	
	if ($usuario["DNI_Usuario"] == "") {
		$errores[] = "El DNI no puede estar vacío";
	} else if (!preg_match("/^[0-9]{8}[A-Z]$/", $usuario["DNI_Usuario"])) {
		$errores[] = "El DNI debe contener 8 números y una letra mayúscula: " . $usuario["DNI_Usuario"] . "";
	}
	if ($usuario["Nombre"] == "" || !preg_match("/^[A-Za-záéíóúÁÉÍÓÚ\s]+$/", $usuario["Nombre"])) {
		$errores[] = "El nombre no puede estar vacío o no ser alfabetico";
	}
	if ($usuario["Apellidos"] == "" || !preg_match("/^[A-Za-záéíóúÁÉÍÓÚ\s]+$/", $usuario["Apellidos"]) ) {
		$errores[] = "Los apellidos no puede estar vacío o no ser alfabeticos";
	}
	if ($usuario["Email"] == "") {
		$errores[] = "El email no puede estar vacío";
	}else if(!preg_match("/^([a-zA-Z0-9_\.\-])+\@gmail.com+$/", $usuario["Email"])){
		$errores[] = "El email debe acabar en @gmail.com: " . $usuario["Email"] . "";
	}
	if ($usuario["Localidad"] == "" || !preg_match("/^[A-Za-záéíóúÁÉÍÓÚ\s]+$/", $usuario["Localidad"])) {
		$errores[] = "La localidad no puede estar vacía o no ser alfabetico";
	}
	if ($usuario["TelefonoMovil"] == "" or !is_numeric($usuario["TelefonoMovil"]) 
	or strlen($usuario["TelefonoMovil"]) < 9 or strlen($usuario["TelefonoMovil"]) > 9) {
		$errores[] = "El teléfono móvil no es correcto";
	}
	if (!isset($usuario["Pass"]) || strlen($usuario["Pass"]) < 8) {
		$errores[] = "Contraseña no válida: debe tener al menos 8 caracteres";
	} else if (!preg_match("/[a-z]+/", $usuario["Pass"]) 
			|| !preg_match("/[A-Z]+/", $usuario["Pass"]) 
			|| !preg_match("/[0-9]+/", $usuario["Pass"])) {
		$errores[] = "Contraseña no válida: debe contener letras mayúsculas y minúsculas y dígitos";
	} else if ($usuario["Pass"] != $usuario["confirmpass"]) {
		$errores[] = "La confirmación de contraseña no coincide con la contraseña";
	} 
	
	return $errores;
 }
