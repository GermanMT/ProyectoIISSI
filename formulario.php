<?php
	session_start();

	require_once ('gestionBD.php');
	require_once ("gestionarUsuarios.php");
	
	// Si no existen datos del formulario en la sesión, se crea una entrada con valores por defecto
	if (!isset($_SESSION['formulario'])) {
		$formulario['DNI'] = "";
		$formulario['Nombre'] = "";
		$formulario['Apellidos'] = "";
		$formulario['Edad'] = "";
		$formulario['Localidad'] = "";
		$formulario['TelefonoMovil'] = "";
		$formulario['TelefonoFijo'] = "";
		$formulario['Email'] = "";
		$formulario['NombrePadreMadre'] = "";
		$formulario['Usuario'] = "";
		$formulario['Pass'] = "";
		$formulario['TipoUsuario'] = "Alumno";
		$formulario['Tipo_Examen'] = "Aptis";
		$formulario['Nivel_Examen'] = "B1";

		$_SESSION['formulario'] = $formulario;
	}
	// Si ya existían valores, los cogemos para inicializar el formulario
	else
		$formulario = $_SESSION['formulario'];
			
	// Si hay errores de validación, hay que mostrarlos y marcar los campos (El estilo viene dado y ya se explicará)
	if (isset($_SESSION["errores"]))
		$errores = $_SESSION["errores"];

	// Creamos una conexión con la BD
	$conexion = crearConexionBD();
?>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <link rel="stylesheet" type="text/css" href="CSS/styleIISSI.css" />
  <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js'></script> 
 <!-- <script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>	-->
  <script src="js/validacion_cliente_alta_usuario.js" type="text/javascript"></script>
  <script>
	$(document).ready(function() {
	colorContraseña();
	});
  </script>
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
	<hr size="60" noshade="noshade"/ style="margin-top: 180px;">  
	<div class="body_content_Form" style="margin-top: -10px;">    
	<main>
	<!-- Detrás de "POST"   action="validacion_alta_usuario.php" onsubmit="return validateForm()" -->
	<form id="formulario" class="formulario" method="get" onsubmit="return validateForm()" novalidate>
		<p><i>Los campos obligatorios están marcados con </i><em>*</em></p>
		<fieldset><legend>Datos personales</legend>
			<div><label for="DNI">DNI<em>*</em></label>
			<input id="DNI_Usuario" name="DNI_Usuario" type="text" placeholder="12345678X" pattern="^[0-9]{8}[A-Z]" title="Ocho dígitos seguidos de una letra mayúscula" 
			value="<?php echo $formulario['DNI'];?>" required>
			</div>

			<div><label for="Nombre">Nombre:<em>*</em></label>
			<input id="Nombre" name="Nombre" type="text" size="30" value="<?php echo $formulario['Nombre'];?>" required/>
			</div>

			<div><label for="Apellidos">Apellidos:<em>*</em></label>
			<input id="Apellidos" name="Apellidos" type="text" size="50" value="<?php echo $formulario['Apellidos'];?>"/>
			</div>

			<div><label for="Edad">Edad:</label>
			<input id="Edad" name="Edad" type="text" value="<?php echo $formulario['Edad'];?>"/>
			</div>

			<div><label for="Localidad">Localidad:</label>
			<input id="Localidad" name="Localidad" type="text" value="<?php echo $formulario['Localidad'];?>"/>
			</div>

			<div><label for="TelefonoMovil">Teléfono Móvil:<em>*</em></label>
			<input id="TelefonoMovil" name="TelefonoMovil" type="text" value="<?php echo $formulario['TelefonoMovil'];?>"/>
			</div>

			<div><label for="TelefonoFijo">Telefono Fijo:</label>
			<input id="TelefonoFijo" name="TelefonoFijo" type="text" value="<?php echo $formulario['TelefonoFijo'];?>"/>
			</div>

			<div><label for="Email">Email:<em>(Debe de terminar en @gmail.com)</em></label>
			<input id="Email" name="Email"  type="email" placeholder="usuario@dominio.extension" value="<?php echo $formulario['Email'];?>" required/><br>
			</div>

			<div><label for="NombrePadreMadre">Nombre Padre o Madre:</label>
			<input id="NombrePadreMadre" name="NombrePadreMadre" type="text" value="<?php echo $formulario['NombrePadreMadre'];?>"/>
			</div>

			<div><label>TipoUsuario:<em>*</em></label>
			<label>
				<input name="TipoUsuario" type="radio" value="Alumno" <?php if($formulario['TipoUsuario']=='Alumno') echo ' checked ';?>/>
				Alumno</label>
			</div>

			<fieldset><legend>Datos del Tipo y Nivel de Exámen</legend>

			<div><label>Tipo Examen:<em>*</em></label>
			<label>
					<input name="Tipo_Examen" type="radio" value="Trinity" <?php if($formulario['Tipo_Examen']=='Trinity') echo ' checked ';?>/>
					Trinity
				</label>
				<label>
					<input name="Tipo_Examen" type="radio" value="Cambridge" <?php if($formulario['Tipo_Examen']=='Cambridge') echo ' checked ';?>/>
					Cambridge
				</label>
				<label>
					<input name="Tipo_Examen" type="radio" value="Aptis" <?php if($formulario['Tipo_Examen']=='Aptis') echo ' checked ';?>/>
					Aptis
				</label>
			</div>

			<div><label>Nivel Inglés:<em>*</em></label>
			<label>
					<input name="Nivel_Examen" type="radio" value="B1" <?php if($formulario['Nivel_Examen']=='B1') echo ' checked ';?>/>
					B1
				</label>
				<label>
					<input name="Nivel_Examen" type="radio" value="B2" <?php if($formulario['Nivel_Examen']=='B2') echo ' checked ';?>/>
					B2
				</label>
				<label>
					<input name="Nivel_Examen" type="radio" value="C1" <?php if($formulario['Nivel_Examen']=='C1') echo ' checked ';?>/>
					C1
				</label>
			</div>

		</fieldset>

		<fieldset><legend>Datos de cuenta</legend>

			<div><label for="Usuario">Nombre Usuario:<em>*</em></label>
				<input id="Usuario" name="Usuario" type="text" size="20" value="<?php echo $formulario['Usuario'];?>" />
			</div>
			<div><label for="Pass">Password:<em>*</em></label>
				<input type="password" name="Pass" id="Pass"  value="<?php echo $formulario['Pass'];?>" required placeholder="Mínimo 8 caracteres entre letras y dígitos" 
				onkeyup= "document.getElementById('fortaleza').innerText = 
				passwordStrength(this.value)"
				/>
				
				<span id ="fortaleza"></span>
				
			</div>
			<div><label for="confirmpass">Confirmar Password: </label>
			<input type="password" name="confirmpass" id="confirmpass" placeholder="Confirmación de contraseña" required
			oninput = "if(!passwordConfirmation()) this.setCustomValidity('Password y confirmación diferentes')
					else this.setCustomValidity('')"
			/>
			</div>

			<!--<div><label for="confirmpass">Confirmar Password: </label>
			<input type="password" name="confirmpass" id="confirmpass" placeholder="Confirmación de contraseña" required/>
			</div>-->
		</fieldset>

		<div><input type="submit" value="Enviar" formaction="accionAltaRegistro.php" /></div>

	</form>
	<a class="button" href="IISSI.php"><button type="button" class="read_more">Vuelve Atrás</button></a>

	<?php
		
		cerrarConexionBD($conexion);
	?>
	</main>
	</div>
	</body>
</html>