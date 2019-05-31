<?php	
	session_start();
	
	if (isset($_REQUEST["DNI_USUARIO"])){
		$usuario["DNI_USUARIO"] = $_REQUEST["DNI_USUARIO"];
		$usuario["NOMBRE"] = $_REQUEST["NOMBRE"];
		$usuario["APELLIDOS"] = $_REQUEST["APELLIDOS"];
		$usuario["TIPO_EXAMEN"] = $_REQUEST["TIPO_EXAMEN"];
		$usuario["NIVEL_EXAMEN"] = $_REQUEST["NIVEL_EXAMEN"];
		$usuario["ID_CURSO"] = $_REQUEST["ID_CURSO"];
		
		$_SESSION["usuario"] = $usuario;
		
		if($_REQUEST["TIPOUSUARIO"] == "Alumno"){
			if (isset($_REQUEST["editar"])) Header("Location: asignacionAlumno.php?var2=" .base64_encode($_REQUEST["ID_CURSO"]));
			else if (isset($_REQUEST["grabar"])) Header("Location: accion_asignar.php?var2=" .base64_encode($_REQUEST["ID_CURSO"])); 
		} else if($_REQUEST["TIPOUSUARIO"] == "Profesor"){
			if (isset($_REQUEST["editar"])) Header("Location: asignacionProfesor.php?var2=" .base64_encode($_REQUEST["ID_CURSO"]));
			else if (isset($_REQUEST["grabar"])) Header("Location: accion_asignar.php?var2=" .base64_encode($_REQUEST["ID_CURSO"]));
		}

	}
	else {
		Header("Location: accion_asignar.php?var2=" .base64_encode($_REQUEST["ID_CURSO"]));
	}
?>