<?php
//Inicio de sesiones
	session_start();

//Includes
//include_once ('includes/funciones.php');
require_once ("gestionBD.php");

//Se comprueba que hemos llegado aquí por el formulario de matriculación y en tal caso se mete en la variable $usuario los datos del formulario, en caso contrario, se redirige a la página de matriculación
if (isset($_SESSION["formulario"])) {
	$usuario["Fecha_Inicio"] = $_REQUEST["Fecha_Inicio"];
	$usuario["Fecha_Fin"] = $_REQUEST["Fecha_Fin"];
	$usuario["Tipo_Examen"] = $_REQUEST["Tipo_Examen"];
	$usuario["Nivel_Ingles"] = $_REQUEST["Nivel_Ingles"];
	$usuario["Id_Curso"] = $_REQUEST["Id_Curso"];

	
} else {
	header('Location: formularioCurso.php');
}

$_SESSION["formulario"] = $usuario;

try{
	$conexion = crearConexionBD();
	$errores = validacionRegistroCurso($conexion, $usuario);
	cerrarConexionBD($conexion);
}catch(PDOException $e){
	/*Mensaje de depuracion */
	$_SESSION["errores"] = "<p>ERROR en la validacion: fallo en el acceso a la base de datos.</p><p>"
		.$e -> getMessage() ."</p>";
		Header('Location: formularioCurso.php');
}
//En el caso de que haya errores, se redirige a la página de matriculacion y se muestran los errores, en caso contrario se redirige a la página de exitoAltaMatricula
if (count($errores) > 0) {
	$_SESSION['errores'] = $errores;
	header('Location: formularioCurso.php');
} else {
	unset($_SESSION['errores']);
	header('Location: exitoCreacionCurso.php');
}

/* Función para validar la matriculación.
 ========================================================================== */
 function validacionRegistroCurso($conexion, $usuario) {
	$errores = array();
	if ($usuario["Fecha_Inicio"] == "") {
		$errores[] = "La fecha de inicio no puede estar vacía";
	}
	if ($usuario["Fecha_Fin"] == "") {
		$errores[] = "La fecha final no puede estar vacía";
	}

	return $errores;

}
?>