<?php
  /*
     * #===========================================================#
     * #	Este fichero contiene las funciones de gestión     	   # 
     * #	de horarios de profesores de la capa de acceso a datos #		
     * #===========================================================#
     */
function consultarTodosHorariosProfesor($conexion,$IDC) {
	$consulta = "SELECT * FROM HORARIO_CURSO "
		. " WHERE (HORARIO_CURSO.ID_CURSO = '".$IDC."')";
    return $conexion->query($consulta);
}
    
?>