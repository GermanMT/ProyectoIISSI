<?php
  /*
     * #===========================================================#
     * #	Este fichero contiene las funciones de gestión     			 
     * #	de libros de la capa de acceso a datos 		
     * #==========================================================#
     */
function consultarTodosHorarios($conexion) {
	$consulta = "SELECT * FROM Cursos, Horarios "
		. " WHERE (Horarios.Id_Curso = Cursos.Id_Curso";
    return $conexion->query($consulta);
}
    
?>