<?php
	session_start();

	require_once("gestionBD.php");
	require_once("gestionarProfesor.php");
	
	//require_once ('includes/funciones.php');	
	// Comprobar que hemos llegado a esta página porque se ha rellenado el formulario
	if (isset($_SESSION["formularioProfesor"])) {
		$usuario = $_SESSION["formularioProfesor"];
		unset($_SESSION["formularioProfesor"]);
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
	
	<hr size="60" noshade="noshade" style="margin-top: 180px;">  
	<div class="body_content_ExitoProfesor" style="margin-top: -10px;">    
	<main>

		<?php if ($altaProfesor) { ?>
			<div align="center" class="heading">
			<span><h1>¡Enhorabuena! Su proceso de matriculación de profesor se ha completado con éxito.</h1></span><br /><br />
                
			   		<h3>Pulsa <a href="vistaAdmin.php">aquí</a> volver a la vista de Administrador.</h3>
				</div> 
			</div>
		<?php } else { 
			?>	
				<div align="center" class="heading">
 				<h1>El profesor ya existe en la base de datos o no se ha podido crear con éxito.</h1>
				<div >				
					Pulsa <a href="formularioProfesor.php">aquí</a> para volver al formulario.
				</div>
				</div>
		<?php } ?>

	</main>

</div>
</body>
</html>


