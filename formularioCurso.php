<?php
	session_start();

	require_once ('gestionBD.php');
	require_once ("gestionarUsuarios.php");
	
	// Si no existen datos del formulario en la sesión, se crea una entrada con valores por defecto
	if (!isset($_SESSION['formulario'])) {
		$formulario['Fecha_Inicio'] = "";
		$formulario['Fecha_Fin'] = "";
		$formulario['Tipo_Examen'] = "Trinity";
		$formulario['Nivel_Ingles'] = "B1";
		$formulario['Id_Curso'] = "B1 Grupo 1";
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
  <title>Creación de Curso</title>
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

	<!-- Detrás de "POST"   action="validacion_alta_usuario.php" onsubmit="return validateForm()" -->
	<form id="formulario" class="formulario" method="get" novalidate>
		<p><i>Los campos obligatorios están marcados con </i><em>*</em></p>
		<fieldset><legend>Datos del Curso</legend>
			
			<div><label for="Fecha_Inicio">Fecha Inicio:<em>*</em></label>
			<input id="Fecha_Inicio" name="Fecha_Inicio" type="text" size="30" value="<?php echo $formulario['Fecha_Inicio'];?>" required/>
			</div>

			<div><label for="Fecha_Fin">Fecha Fin:</label>
			<input id="Fecha_Fin" name="Fecha_Fin" type="text" size="50" value="<?php echo $formulario['Fecha_Fin'];?>"/>
			</div>

			<div><label>Tipo Examen:</label>
				<label>
					<input name="Tipo_Examen" type="radio" value="B1" <?php if($formulario['Tipo_Examen']=='B1') echo ' checked ';?>/>
					B1
				</label>
				<label>
					<input name="Tipo_Examen" type="radio" value="B2" <?php if($formulario['Tipo_Examen']=='B2') echo ' checked ';?>/>
					B2
				</label>
				<label>
					<input name="Tipo_Examen" type="radio" value="C1" <?php if($formulario['Tipo_Examen']=='C1') echo ' checked ';?>/>
					C1
				</label>
			</div>

			<div><label>Nivel Inglés:</label>
				<label>
					<input name="Nivel_Ingles" type="radio" value="Trinity" <?php if($formulario['Nivel_Ingles']=='Trinity') echo ' checked ';?>/>
					Trinity
				</label>
				<label>
					<input name="Nivel_Ingles" type="radio" value="Cambridge" <?php if($formulario['Nivel_Ingles']=='Cambridge') echo ' checked ';?>/>
					Cambridge
				</label>
				<label>
					<input name="Nivel_Ingles" type="radio" value="Aptis" <?php if($formulario['Nivel_Ingles']=='Aptis') echo ' checked ';?>/>
					Aptis
				</label>
			</div>

			<div><label for="Id_Curso">Id Curso:</label>
			<input id="Id_Curso" name="Id_Curso" type="text" size="50" value="<?php echo $formulario['Id_Curso'];?>"/>
			</div>


		<div><input type="submit" value="Enviar" formaction="accionAltaCurso.php" /></div>

	</form>
	
	</body>
</html>