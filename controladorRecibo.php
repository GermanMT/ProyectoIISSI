<?php	
	session_start();
	
	if (isset($_REQUEST["ID_RECIBO"])){
		$recibo["ID_RECIBO"] = $_REQUEST["ID_RECIBO"];
		$recibo["FECHA_RECIBO"] = $_REQUEST["FECHA_RECIBO"];
		$recibo["POR_PAGAR"] = $_REQUEST["POR_PAGAR"];
		$recibo["CUENTA_BANCARIA"] = $_REQUEST["CUENTA_BANCARIA"];
		$recibo["HERMANOS"] = $_REQUEST["HERMANOS"];
		$recibo["PAGADO"] = $_REQUEST["PAGADO"];
		$recibo["DNI_USUARIO"] = $_REQUEST["DNI_USUARIO"];
		$recibo["FORMA_PAGO"] = $_REQUEST["FORMA_PAGO"];
	
		
		$_SESSION["recibos"] = $recibo;
		
		if (isset($_REQUEST["editar"])) Header("Location: vistaRecibos.php"); 
		else if (isset($_REQUEST["grabar"])) Header("Location: accion_modificar_recibo.php");
		
	}
	else {
		Header("Location: vistaRecibos.php");
	}
?>
