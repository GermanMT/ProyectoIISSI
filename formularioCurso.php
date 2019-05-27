<?php
	session_start();

	require_once ('gestionBD.php');
	require_once ("gestionarUsuarios.php");
	
	// Si no existen datos del formulario en la sesión, se crea una entrada con valores por defecto
	if (!isset($_SESSION['formulario'])) {
		$formulario['FechaInicio'] = "";
		$formulario['FechaFin'] = "";
		$formulario['Apellidos'] = "";
		$formulario['Edad'] = "";
		$formulario['Localidad'] = "";
		$formulario['TelefonoMovil'] = "";
		$formulario['TelefonoFijo'] = "";
		$formulario['Email'] = "";
		$formulario['NombrePadreMadre'] = "";
		$formulario['Usuario'] = "";
		$formulario['Pass'] = "";
		$formulario['TipoUsuario'] = "Profesor";

		$_SESSION['formulario'] = $formulario;
	}
	// Si ya existían valores, los cogemos para inicializar el formulario
	else
		$formulario = $_SESSION['formulario'];
			
	// Si hay errores de validación, hay que mostrarlos y marcar los campos (El estilo viene dado y ya se explicará)
	if (isset($_SESSION["errores"]))
		$errores = $_SESSION["errores"];

	
?>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <link rel="stylesheet" type="text/css" href="CSS/styleIISSI.css" />
	<!--<script src="js/validacion_cliente_alta_usuario.js" type="text/javascript"></script>
  -->
  <title>Alta de Usuarios</title>
</head>

<body>
	<?php
		include_once("cabecera.php");
	?>
	
	<?php 
		// Mostrar los errores de validación (Si los hay)
		if (isset($errores) && count($errores)>0) { 
	    	echo "<div id=\"div_errores\" class=\"error\">";
			echo "<h4> Errores en el formulario:</h4>";
    		foreach($errores as $error) echo $error; 
    		echo "</div>";
  		}
	?>