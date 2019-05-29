<?php
  	/*
     * #===========================================================#
     * #	Este fichero contiene las funciones de gestión     	   #	 
     * #	de Cursos de la capa de acceso a datos 				   #
     * #===========================================================#
     */

		 
 function alta_curso($conexion,$usuario) {
	try {
		$consulta = "CALL INSERTAR_CURSO(:Fecha_Inicio, :Fecha_Fin, :Tipo_Examen, :Nivel_Ingles,:Id_Curso)";
		$stmt=$conexion->prepare($consulta);
		$stmt->bindParam(':Fecha_Inicio',$usuario["Fecha_Inicio"]);
		$stmt->bindParam(':Fecha_Fin',$usuario["Fecha_Fin"]);
		$stmt->bindParam(':Tipo_Examen',$usuario["Tipo_Examen"]);
		$stmt->bindParam(':Nivel_Ingles',$usuario["Nivel_Ingles"]);
		$stmt->bindParam(':Id_Curso',$usuario["Id_Curso"]);


		$stmt->execute();
		return true;
	} catch(PDOException $e) {
		$_SESSION['excepcion'] = $e -> GetMessage();
		header("Location: excepcion.php");
    }
}


	function consultarTodosCursosProfesor($conexion,$Id_Curso) {
		$consulta = "SELECT * FROM Cursos_Alumnos, Usuarios"
			. " WHERE (Cursos_Alumnos.ID_CURSO = '".$Id_Curso."') AND (Cursos_Alumnos.DNI_USUARIO = Usuarios.DNI_USUARIO)";
	    return $conexion->query($consulta);
	}
    
?>