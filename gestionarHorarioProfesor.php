<?php
  /*
     * #===========================================================#
     * #	Este fichero contiene las funciones de gestión     	   # 
     * #	de horarios de profesores de la capa de acceso a datos #		
     * #===========================================================#
     */
function consultarTodosHorariosProfesor($conexion,$DNI) {
	$consulta = "SELECT * FROM Horario_Profesor "
		. " WHERE (Horario_Profesor.DNI_USUARIO = '".$DNI."')";
    return $conexion->query($consulta);
}
    
?>