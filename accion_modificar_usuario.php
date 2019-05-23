<?php	
	session_start();	
	
	if (isset($_SESSION["usuario"])) {
		$usuario = $_SESSION["usuario"];
		unset($_SESSION["usuario"]);
		
		require_once("gestionBD.php");
		require_once("gestionarTablaAdmin.php");
		
		$conexion = crearConexionBD();		
		$excepcion = modificarUsuario($conexion,$usuario["DNI_USUARIO"],$usuario["NOMBRE"],$usuario["APELLIDOS"]);
		cerrarConexionBD($conexion);
			
		if ($excepcion<>"") {
			$_SESSION["excepcion"] = $excepcion;
			$_SESSION["destino"] = "vistaAdmin.php";
			Header("Location: excepcion.php");
		}
		else
			Header("Location: vistaAdmin.php");
	} 
	else Header("Location: vistaAdmin.php"); // Se ha tratado de acceder directamente a este PHP
?>
