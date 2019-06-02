<?php
	session_start();

	require_once("gestionBD.php");
	require_once("gestionarCurso.php");
	
	//require_once ('includes/funciones.php');	
	// Comprobar que hemos llegado a esta página porque se ha rellenado el formulario
	if (isset($_SESSION["formularioCurso"])) {
		$usuario = $_SESSION["formularioCurso"];
		unset($_SESSION["formularioCurso"]);
	}else {
		header("Location: formularioCurso.php");
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
  <title>Gestión de la Academia: Creación de curso realizada con éxito</title>
</head>

<body>
	<?php
		include_once("cabecera.php");
	?>
	
	<hr size="60" noshade="noshade" style="margin-top: 180px;">  
	<div class="body_content_ExitoCurso" style="margin-top: -10px;">    
	<main>
		<?php if ($altaCurso) { ?>
			<div align="center" class="heading">
			<span><h1>¡Enhorabuena! Su proceso de creación de curso se ha completado con éxito.</h1></span><br /><br />
			<div ><h3>	
					Pulsa <a href="vistaAdmin.php">aquí</a> para volver a la vista de Administrador.
					</h3>		
				</div>
			</div>
		<?php } else { 
			?>	
				<div align="center" class="heading">
 				<h1>No se ha creado el curso.</h1>
				<div >				
					Pulsa <a href="formularioCurso.php">aquí</a> para volver al formulario.
				</div>
				</div>
		<?php } ?>

	</main>

</div>
</body>
</html>


