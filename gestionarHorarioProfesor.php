<?php
  /*
     * #===========================================================#
     * #	Este fichero contiene las funciones de gestión     	   # 
     * #	de horarios de profesores de la capa de acceso a datos #		
     * #===========================================================#
     */
function consultarTodosHorariosProfesor($conexion) {
	$consulta = "SELECT * FROM Cursos, Horario_Profesor "
		. " WHERE (Horario_Profesor.Id_Curso = Cursos.Id_Curso)";
    return $conexion->query($consulta);
}
    
?>