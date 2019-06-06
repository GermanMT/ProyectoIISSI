<?php
    /*
     * #===========================================================#
     * #	Este fichero contiene las funciones de gestión     	   #	 
     * #	de Recibos de la capa de acceso a datos 	           #
     * #===========================================================#
     */
    function consultarCursoAlumnoRecibo($conexion,$DNI){
     	$consulta = "SELECT ID_CURSO FROM USUARIOS"
			. " WHERE (USUARIOS.DNI_USUARIO = '".$DNI."')";
	    return $conexion->query($consulta);
    }
	 
	function consultarTodosRecibos($conexion,$DNI) {
		$consulta = "SELECT * FROM RECIBOS"
			. " WHERE (RECIBOS.DNI_USUARIO = '".$DNI."')"
			. " ORDER BY Id_Recibo";
	    return $conexion->query($consulta);
	} 
	
	function consultarTodosAlumnosRecibos($conexion,$DNI) {
		$consulta = "SELECT * FROM USUARIOS"
			. " WHERE (USUARIOS.DNI_USUARIO = '".$DNI."')";
	    return $conexion->query($consulta);
	} 


function modificarRecibo($conexion,$ID_RECIBO,$PAGADO) {
		try {
			$stmt=$conexion->prepare('CALL MODIFICAR_RECIBO(:ID_RECIBO,:PAGADO)');
			$stmt->bindParam(':ID_RECIBO',$ID_RECIBO);
			$stmt->bindParam(':PAGADO',$PAGADO);
			$stmt->execute();
			return "";
		} catch(PDOException $e) {			
			return $e->getMessage();
		}
	}
?>