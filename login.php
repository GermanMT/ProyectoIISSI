<?php
	session_start();
  	
  	include_once("gestionBD.php");
 	include_once("gestionarUsuarios.php");
	
	require_once("conseguirDNI.php");
	require_once("conseguirTipoUsuario.php");
	require_once("conseguirIdCurso.php");
	
	unset($_SESSION["login"]);
	
	if (isset($_POST['submit'])){
		$usuario= $_POST['usuario'];
		$pass = $_POST['pass'];
		$tipoUsuario = $_POST['tipoUsuario'];
		
		$conexion = crearConexionBD();
		$DNI_Usuario = consultarDNI($conexion,$usuario,$pass);
		$Tipo_Usuario = consultarTipoUsuario($conexion,$usuario,$pass);
		$num_usuarios = consultarUsuario($conexion,$usuario,$pass,$tipoUsuario);
		$id_Curso = consultarIdCurso($conexion, $usuario, $pass);
		cerrarConexionBD($conexion);
		
		foreach($Tipo_Usuario as $tipo){	
	
			if ($num_usuarios == 0)
				$login = "error";	
			else {
				if($tipoUsuario == 'Alumno' AND $tipoUsuario == $tipo["TIPOUSUARIO"]){
					$_SESSION['loginAlumno'] = $usuario;
					foreach($DNI_Usuario as $DNI){
						foreach($id_Curso as $IDC){
							Header("Location: vistaAlumno.php?var=". base64_encode($DNI["DNI_USUARIO"]) ."&var2=". base64_encode($IDC["ID_CURSO"])); 
						}
					}
				}else if($tipoUsuario == 'Profesor' AND $tipoUsuario == $tipo["TIPOUSUARIO"]){
					$_SESSION['loginProfesor'] = $usuario;
					foreach($DNI_Usuario as $DNI){
						foreach($id_Curso as $IDC){
							Header("Location: vistaProfesor.php?var=". base64_encode($DNI["DNI_USUARIO"])."&var2=". base64_encode($IDC["ID_CURSO"])); 
						}
					}
				}else if($tipoUsuario == 'Admin' AND $tipoUsuario == $tipo["TIPOUSUARIO"]){
					$_SESSION['loginAdmin'] = $usuario;
					Header("Location: vistaAdmin.php"); 
				}else{
					$login = "error";
				}
			}	
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
		echo "Error en la contraseña, el tipo de usuario escogido o no existe el usuario.";
		echo "</div>";
	}	
	?>
	
	<!-- The HTML login form -->
	<form action="login.php" method="post">
		<div><label for="usuario">Usuario: </label><input type="text" name="usuario" id="usuario" /></div>
		<div><label for="pass">Contraseña: </label><input type="password" name="pass" id="pass" /></div>
		<div><label>Perfil:</label>
			<label>
				<input name="tipoUsuario" type="radio" value="Alumno"/>
				Alumno</label>
			<label>
				<input name="tipoUsuario" type="radio" value="Profesor"/>
				Profesor</label>
			<label>
				<input name="tipoUsuario" type="radio" value="Admin"/>
				Admin</label>
		</div>
		<input type="submit" name="submit" value="Logueate!" />
	</form>
		
	<p>¿No estás registrado? <a href="formulario.php">¡Registrate!</a></p>
</main>

</body>
</html>