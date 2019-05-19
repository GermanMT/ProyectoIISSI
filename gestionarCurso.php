<?php
  /*
     * #===========================================================#
     * #	Este fichero contiene las funciones de gestión     			 
     * #	de Cursos de la capa de acceso a datos 		
     * #==========================================================#
     */
function consultarTodosCursosProfesor($conexion) {
	$consulta = "SELECT * FROM Cursos_Alumnos, Usuarios "
		. " WHERE (Cursos_Alumnos.DNI_Usuario = Usuarios.DNI_Usuario)";
    return $conexion->query($consulta);
}
    
?>