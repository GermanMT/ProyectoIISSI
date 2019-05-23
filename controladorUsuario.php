<?php	
	session_start();
	
	if (isset($_REQUEST["DNI_USUARIO"])){
		$usuario["DNI_USUARIO"] = $_REQUEST["DNI_USUARIO"];
		$usuario["NOMBRE"] = $_REQUEST["NOMBRE"];
		$usuario["APELLIDOS"] = $_REQUEST["APELLIDOS"];
		$usuario["EDAD"] = $_REQUEST["EDAD"];
		$usuario["LOCALIDAD"] = $_REQUEST["LOCALIDAD"];
		$usuario["TELEFONO_MOVIL"] = $_REQUEST["TELEFONO_MOVIL"];
		$usuario["TELEFONO_FIJO"] = $_REQUEST["TELEFONO_FIJO"];
		$usuario["EMAIL"] = $_REQUEST["EMAIL"];
		$usuario["NOMBRE_PADRE_MADRE"] = $_REQUEST["NOMBRE_PADRE_MADRE"];
		$usuario["USUARIO"] = $_REQUEST["USUARIO"];
		$usuario["PASS"] = $_REQUEST["PASS"];
		$usuario["TIPOUSUARIO"] = $_REQUEST["TIPOUSUARIO"];
		
		$_SESSION["usuario"] = $usuario;
		
		if (isset($_REQUEST["editar"])) Header("Location: vistaAdmin.php"); 
		else if (isset($_REQUEST["grabar"])) Header("Location: accion_modificar_usuario.php");
		else  /*if (isset($_REQUEST["borrar"])) */ Header("Location: accion_quitar_usuario.php"); 
	}
	else {
		Header("Location: vistaAdmin.php");
	}
?>
