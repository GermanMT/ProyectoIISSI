<?php	
	session_start();	
	
	if (isset($_SESSION["recibos"])) {
		$recibo = $_SESSION["recibos"];
		unset($_SESSION["recibos"]);
		
		require_once("gestionBD.php");
		require_once("gestionarRecibos.php");
		
		$conexion = crearConexionBD();		

		$excepcion = modificarRecibo($conexion,$recibo["ID_RECIBO"],$recibo["PAGADO"]);

		cerrarConexionBD($conexion);
			
		if ($excepcion<>"") {
			$_SESSION["excepcion"] = $excepcion;
			$_SESSION["destino"] = "vistaRecibos.php" . $_GET["var"];
			Header("Location: excepcion.php");
		}
		else
			Header("Location: vistaRecibos.php?var=" . $_GET["var"]);
	} 
	else Header("Location: vistaRecibos.php" . $_GET["var"]); // Se ha tratado de acceder directamente a este PHP
?>
