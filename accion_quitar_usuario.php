<?php	
	session_start();	
	
	if (isset($_SESSION["usuario"])) {
		$usuario = $_SESSION["usuario"];
		unset($_SESSION["usuario"]);
		
		require_once("gestionBD.php");
		require_once("gestionarLibros.php");
		
		$conexion = crearConexionBD();		
		$excepcion = quitarUsuario($conexion,$usuario["DNI_Usuario"]);
		cerrarConexionBD($conexion);
			
		if ($excepcion<>"") {
			$_SESSION["excepcion"] = $excepcion;
			$_SESSION["destino"] = "vistaAdmin.php";
			Header("Location: excepcion.php");
		}
		else Header("Location: vistaAdmin.php");
	}
	else Header("Location: vistaAdmin.php"); // Se ha tratado de acceder directamente a este PHP
?>