<?php	
	session_start();	
	
	if (isset($_SESSION["usuario"])) {
		$usuario = $_SESSION["usuario"];
		unset($_SESSION["usuario"]);
		
		require_once("gestionBD.php");
		require_once("gestionarTablaAdmin.php");
		
		$conexion = crearConexionBD();		
		$excepcion = quitarUsuario($conexion,$usuario["DNI_USUARIO"]);
		cerrarConexionBD($conexion);
			
		if ($excepcion<>"") {
			$_SESSION["excepcion"] = $excepcion;
			$_SESSION["destino"] = "vistaAdminCurso.php?var2=" . $_GET["var2"];
			Header("Location: excepcion.php");
		}
		else Header("Location: vistaAdminCurso.php?var2=" . $_GET["var2"]);
	}
	else Header("Location: vistaAdminCurso.php?var2=" . $_GET["var2"]); // Se ha tratado de acceder directamente a este PHP
?>