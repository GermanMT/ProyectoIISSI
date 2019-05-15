<?php
	session_start();

	require_once("gestionBD.php");
	require_once("gestionarUsuarios.php");

	// Si no existen datos del formulario en la sesión, se crea una entrada con valores por defecto
	if (!isset($_SESSION['formulario'])) {
		$formulario['DNI'] = "";
		$formulario['Nombre'] = "";
		$formulario['Apellidos'] = "";
		$formulario['Edad'] = "";
		$formulario['Localidad'] = "";
		$formulario['Telefono Movil'] = "";
		$formulario['Telefono Fijo'] = "";
		$formulario['Email'] = "";
		$formulario['Nombre Padre o Madre'] = "";
		$formulario['Usuario'] = "";
		$formulario['Pass'] = "";

	
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
	<script src="js/validacion_cliente_alta_usuario.js" type="text/javascript"></script>
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
	
	<!-- EJERCICIO 3: invocar la validación de formulario en Javascript antes de enviarlo -->
	<form id="altaUsuario" method="get" action="validacion_alta_usuario.php" onsubmit="return validateForm()">
		<p><i>Los campos obligatorios están marcados con </i><em>*</em></p>
		<fieldset><legend>Datos personales</legend>
			<div></div><label for="DNI">DNI<em>*</em></label>
			<input id="DNI" name="DNI" type="text" placeholder="12345678X" pattern="^[0-9]{8}[A-Z]" title="Ocho dígitos seguidos de una letra mayúscula" value="<?php echo $formulario['DNI'];?>" required>
			</div>

			<div><label for="Nombre">Nombre:<em>*</em></label>
			<input id="Nombre" name="Nombre" type="text" size="40" value="<?php echo $formulario['Nombre'];?>" required/>
			</div>

			<div><label for="Apellidos">Apellidos:</label>
			<input id="Apellidos" name="Apellidos" type="text" size="80" value="<?php echo $formulario['Apellidos'];?>"/>
			</div>

			<div><label for="Edad">Edad:</label>
			<input id="Edad" name="Edad" type="text" value="<?php echo $formulario['Edad'];?>"/>
			</div>

			<div><label for="Localidad">Localidad:</label>
			<input id="Localidad" name="Localidad" type="text" value="<?php echo $formulario['Localidad'];?>"/>
			</div>

			<div><label for="Telefono Movil">Teléfono Móvil:</label>
			<input id="Telefono Movil" name="Telefono Movil" type="text" value="<?php echo $formulario['Telefono Movil'];?>"/>
			</div>

			<div><label for="Telefono Fijo">Telefono Fijo:</label>
			<input id="Telefono Fijo" name="Telefono Fijo" type="text" value="<?php echo $formulario['Telefono Fijo'];?>"/>
			</div>

			<div><label for="Email">Email:<em>*</em></label>
			<input id="Email" name="Email"  type="email" placeholder="usuario@dominio.extension" value="<?php echo $formulario['Email'];?>" required/><br>
			</div>

			<div><label for="Nombre Padre o Madre">Nombre Padre o Madre:</label>
			<input id="Nombre Padre o Madre" name="Nombre Padre o Madre" type="text" value="<?php echo $formulario['Nombre Padre o Madre'];?>"/>
			</div>

		</fieldset>

		<fieldset><legend>Datos de cuenta</legend>

			<div><label for="Usuario">Nombre Usuario:<em>*</em></label>
				<input id="Usuario" name="Usuario" type="text" size="20" value="<?php echo $formulario['Usuario'];?>" />
			</div>
			<div><label for="Pass">Password:<em>*</em></label>
                <!-- EJERCICIO 2 apartados B y C -->
				<input type="password" name="Pass" id="Pass" required placeholder="Mínimo 8 caracteres entre letras y dígitos" 
				onkeyup= "document.getElementById('fortaleza').innerText = 
				passwordStrength(this.value)"
				/>
				
				<span id ="fortaleza"></span>
				
			</div>
			<div><label for="confirmpass">Confirmar Password:<em>*</em></label>
			<input type="password" name="confirmpass" id="confirmpass" placeholder="Confirmación de contraseña" required
			oninput = "if(!passwordConfirmation()) this.setCustomValidity('Password y confirmación diferentes')
					else this.setCustomValidity('')"
			/>
			<!--
			<div><label for="confirmpass">Confirmar Password: </label>
			<input type="password" name="confirmpass" id="confirmpass" placeholder="Confirmación de contraseña" required/>
			</div>
			</div>
		-->
		</fieldset>

		<div><input type="submit" value="Enviar" /></div>

	</form>
	
	<?php
		cerrarConexionBD($conexion);
	?>
	</body>
</html>