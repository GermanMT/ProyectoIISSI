<?php	
	session_start();	
	
	if (isset($_SESSION["recibos"])) {
		$recibo = $_SESSION["recibos"];
		unset($_SESSION["recibos"]);
		
		require_once("gestionBD.php");
		require_once("gestionarRecibos.php");
		
		$conexion = crearConexionBD();		

		$excepcion = modificarRecibo($conexion,$recibo["PAGADO"]);

		cerrarConexionBD($conexion);
			
		if ($excepcion<>"") {
			$_SESSION["excepcion"] = $excepcion;
			$_SESSION["destino"] = "vistaRecibos.php";
			Header("Location: excepcion.php");
		}
		else
			Header("Location: vistaRecibos.php");
	} 
	else Header("Location: vistaRecibos.php"); // Se ha tratado de acceder directamente a este PHP
?>
