<?php
	session_start();

	require_once("gestionBD.php");
	require_once("gestionarProfesor.php");
	
	//require_once ('includes/funciones.php');	
	// Comprobar que hemos llegado a esta página porque se ha rellenado el formulario
	if (isset($_SESSION["formulario"])) {
		$usuario = $_SESSION["formulario"];
		unset($_SESSION["formulario"]);
	}else {
		header("Location: formularioProfesor.php");
	}
		//Se crea una conexión a la base de datos
	$conexion = crearConexionBD();

	//Se da de alta al profesor de la variable $usuario llamando a la función 'alta_profesor'
	$altaProfesor = alta_profesor($conexion, $usuario);

?>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <title>Gestión de la Academia: Alta de Profesor realizada con éxito</title>
</head>

<body>
	<?php
		include_once("cabecera.php");
	?>

	<main>

		<?php if ($altaProfesor) { ?>
			<span>¡Enhorabuena! Su proceso de matriculación de profesor se ha completado con éxito.</span><br /><br />
                
			   		Pulsa <a href="vistaAdmin.php">aquí</a> volver a la vista de Administrador.
				</div> -->
		<?php } else { 
			?>	
				
 				<h1>El profesor ya existe en la base de datos o no se ha podido crear con éxito.</h1>
				<div >				
					Pulsa <a href="formularioProfesor.php">aquí</a> para volver al formulario.
				</div>
		<?php } ?>

	</main>


</body>
</html>

