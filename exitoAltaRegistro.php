<?php
//Inicio de sesiones
session_start();

//Includes
include_once ('gestionBD.php');
include_once ('gestionarUsuarios.php');

//Se comprueba que hemos llegado aquí por el formulario de matriculación y en tal caso se mete en la variable $usuario los datos del formulario y se elimina su sesión, en caso contrario, se redirige a la página de matriculación
if (isset($_SESSION['formulario'])) {
	$usuario = $_SESSION['formulario'];
	unset($_SESSION['formulario']);
} else {
	header('Location: formulario.php');
}

//Se crea una conexión a la base de datos
$conexion = crearConexionBD();

//Se da de alta al alumno de la variable $usuario llamando a la función 'alta_alumno'
$altaAlumno = alta_alumno($conexion, $usuario);

//Se cierra la conexión a la base de datos
cerrarConexionBD($conexion);

?>
<!DOCTYPE HTML>
<html lang='es'>
	<head>
		<title>Alta de alumno realizada con éxito</title>
		<meta charset='utf-8' />
		<meta name='viewport' content='width=device-width, initial-scale=1.0' />
		<link rel='shortcut icon' type='image/x-icon' href='img/favicon.ico'>
		<link rel='stylesheet' type='text/css' href='css/styleIISSI.css' />
	<!--	<script type='text/javascript' src='js/funcionesJQuery.js'></script> -->
	</head>
	<body>
		<!--Cabecera-->
		<?php include_once ('cabecera.php'); ?>

		
		<!--Contenido principal-->
		<main>
			<article>
				<div class='contenedor'>
					<section class='col-100 tablet-100 movil-100'>
						<?php 
						if($altaAlumno){ ?>
							<div class='exito alinearCentro reescalarImagen'>
								<span>¡Enhorabuena! Su proceso de matriculación se ha completado con éxito.</span><br /><br />
								<img src='img/varios/confirmar.png' alt='Confirmado' />
							</div>
						<?php 
						} else{ ?>
							<div class='exito alinearCentro reescalarImagen'>
								<span>Ha ocurrido un error a la hora de matricularse.</span><br /><br />
								<img src='img/varios/denegar.png' alt='Denegado' />
							</div>
						<?php
						} ?>
					</section>
				</div>
			</article>
		</main>
		<div class='clear'></div>

	</body>
</html>