<?php
//Inicio de sesiones
	session_start();

//Includes
//include_once ('includes/funciones.php');
require_once ("gestionBD.php");

//Se comprueba que hemos llegado aquí por el formulario de matriculación y en tal caso se mete en la variable $usuario los datos del formulario, en caso contrario, se redirige a la página de matriculación
if (isset($_SESSION["formularioCurso"])) {
	$usuario["Fecha_Inicio"] = $_REQUEST["Fecha_Inicio"];
	$usuario["Fecha_Fin"] = $_REQUEST["Fecha_Fin"];
	$usuario["Tipo_Examen"] = $_REQUEST["Tipo_Examen"];
	$usuario["Nivel_Ingles"] = $_REQUEST["Nivel_Ingles"];
	$usuario["Id_Curso"] = $_REQUEST["Id_Curso"];

	
} else {
	header('Location: formularioCurso.php');
}

$_SESSION["formularioCurso"] = $usuario;

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

///////////////////////////////////////////////////////////////
// Validación en servidor del formulario de creación de curso//
///////////////////////////////////////////////////////////////
 function validacionRegistroCurso($conexion, $usuario) {
	$errores = array();
	
	/* || !preg_match("/^\d{2}/\d{2}/d{4}$/", $usuario["Fecha_Inicio"])*/
	if ($usuario["Fecha_Inicio"] == "" || !preg_match("/^\d{2}\/\d{2}\/\d{4}$/", $usuario["Fecha_Inicio"])) {
		$errores[] = "La fecha de inicio no puede estar vacía o no tener el formato dd/MM/YYYY";
	}
	if ($usuario["Fecha_Fin"] == "" || !preg_match("/^\d{2}\/\d{2}\/\d{4}$/", $usuario["Fecha_Fin"])) {
		$errores[] = "La fecha de fin no puede estar vacía o no tener el formato dd/MM/YYYY";
	}
	if ($usuario["Tipo_Examen"] == "") {
		$errores[] = "El tipo de exámen no puede estar vacío";
	}
	if ($usuario["Nivel_Ingles"] == "" ) {
		$errores[] = "El nivel de inglés no puede estar vacío";
	}
	if ($usuario["Id_Curso"] == "") {
		$errores[] = "El id Curso no puede estar vacío";
	}
	
	return $errores;

}
?>