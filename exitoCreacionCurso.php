<?php
	session_start();

	require_once("gestionBD.php");
	require_once("gestionarUsuarios.php");
	
	//require_once ('includes/funciones.php');	
	// Comprobar que hemos llegado a esta página porque se ha rellenado el formulario
	if (isset($_SESSION["formulario"])) {
		$usuario = $_SESSION["formulario"];
		unset($_SESSION["formulario"]);
	}else {
		header("Location: formulario.php");
	}
		//Se crea una conexión a la base de datos
	$conexion = crearConexionBD();

	//Se da de alta al alumno de la variable $usuario llamando a la función 'alta_curso'
	$altaCurso = alta_curso($conexion, $usuario);

?>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <title>Gestión de la Academia: Alta de Usuario realizada con éxito</title>
</head>

<body>
	<?php
		include_once("cabecera.php");
	?>

	<main>

		<?php if ($altaCurso) { ?>
			<span>¡Enhorabuena! Su proceso de creación de curso se ha completado con éxito.</span><br /><br />
					
			<!--	$_SESSION['login'] = $nuevoUsuario['Usuario']; -->
 		
			<!--	<h1>Hola  ?php echo $nuevoUsuario["Nombre"]; ?>, gracias por registrarte</h1> -->
				<!--<div >	
			   		Pulsa <a href="consulta_libros.php">aquí</a> para acceder a la gestión de biblioteca.
				</div> -->
		<?php } else { 
			?>	
				
 				<h1>No se ha creado el curso.</h1>
				<div >				<!--<a href= "formulario.php">-->
					Pulsa <a href="formularioCurso.html">aquí</a> para volver al formulario.
				</div>
		<?php } ?>

	</main>


</body>
</html>

