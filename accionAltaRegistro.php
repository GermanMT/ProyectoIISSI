<?php
//Inicio de sesiones
session_start();

//Includes
include_once ('gestionBD.php');
include_once ('gestionarUsuarios.php');

//Se comprueba que hemos llegado aquí por el formulario de matriculación y en tal caso se mete en la variable $usuario los datos del formulario, en caso contrario, se redirige a la página de matriculación
if (isset($_SESSION['formulario'])) {
	$usuario['DNI'] = $_REQUEST['DNI'];
	$usuario['Nombre'] = $_REQUEST['Nombre'];
	$usuario['Apellidos'] = $_REQUEST['Apellidos'];
	$usuario['Edad'] = $_REQUEST['Edad'];
	$usuario['Localidad'] = $_REQUEST['Localidad'];
	$usuario['TelefonoMovil'] = $_REQUEST['TelefonoMovil'];
	$usuario['TelefonoFijo'] = $_REQUEST['TelefonoFijo'];
	$usuario['Email'] = $_REQUEST['Email'];
	$usuario['NombrePadreMadre'] = $_REQUEST['NombrePadreMadre'];
	$usuario['Usuario'] = $_REQUEST['Usuario'];
	$usuario['Pass'] = $_REQUEST['Pass'];
	$usuario['confirmpass'] = $_REQUEST['confirmpass'];
	
	$_SESSION['formulario'] = $usuario;
} else {
	header('Location: formulario.php');
}

// Validamos el formulario en servidor
$errores = validacionRegistro($usuario);

//En el caso de que haya errores, se redirige a la página de matriculacion y se muestran los errores, en caso contrario se redirige a la página de exitoAltaMatricula
if (count($errores) > 0) {
	$_SESSION['errores'] = $errores;
	header('Location: formulario.php');
} else {
	unset($_SESSION['errores']);
	header('Location: exitoAltaRegistro.php');
}
?>