<?php
	session_start();
  	
  	include_once("gestionBD.php");
 	include_once("gestionarUsuarios.php");
	
	if (isset($_POST['submit'])){
		$Usuario= $_POST['Usuario'];
		$Pass = $_POST['Pass'];

		$conexion = crearConexionBD();
		$num_usuarios = consultarUsuario($conexion,$Usuario,$Pass);
		cerrarConexionBD($conexion);	
	
		if ($num_usuarios == 0)
			$login = "error";	
		else {
			$_SESSION['login'] = $Usuario;
		/*	Header("Location: index.php"); */
		}	
	}

?>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <link rel="stylesheet" type="text/css" href="CSS/biblio.css" />
  <title>Gestión de la Academia: Login</title>
</head>

<body>

<?php
	include_once("cabecera.php");
?>

<main>
	<?php if (isset($login)) {
		echo "<div class=\"error\">";
		echo "Error en la contraseña o no existe el usuario.";
		echo "</div>";
	}	
	?>
	
	<!-- The HTML login form -->
	<form action="login.php" method="post">
		<div><label for="Usuario">Usuario: </label><input type="text" name="Usuario" id="Usuario" /></div>
		<div><label for="Pass">Contraseña: </label><input type="password" name="Pass" id="Pass" /></div>
		<input type="submit" name="submit" value="submit" />
	</form>
		
	<p>¿No estás registrado? <a href="formulario.php">¡Registrate!</a></p>
</main>


</body>
</html>

