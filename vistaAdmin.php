<?php
	
	session_start();

	require_once("gestionBD.php");
	require_once("gestionarCurso.php");
	
	if (!isset($_SESSION['loginAdmin']))
		Header("Location: login.php");
	else {
		$conexion = crearConexionBD();
		$filas1 = consultarTodosCursosAdmin($conexion);
		cerrarConexionBD($conexion);
	}
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <title>IISSI</title>
        <link rel="stylesheet" href="CSS/styleIISSI.css">
        <style>
	    	table {
	  			border-collapse: collapse;
			}
			table, td, th {
	 	    	border: 1px solid black;
			}
		</style>
    </head>
	<body>
        <div class = "main">
			<div class="header">
                <div class="header_box">
                    <div class="logo">
                        <a href="IISSI.php">Academia 2G</a>
                    </div>
                    <div class="detail">
                        <div class="login" style="
                        width: 121.198">
                            <img src="images/logoAcademia.png">
                            <a href="logout.php" target="blank" style="
                            height: 0px;
                            padding-right: 20px;">Cerrar Sesión</a>
                        </div>
                    </div>
                </div>
                
       	<hr size="60" noshade="noshade"/ style="margin-top: 180px;">  
  		 <div class="body_content_Admin" style="margin-top: -10px;">
				<!--Mostrando los cursos-->
				<main>
				<div align="center" style="margin-top: 100px;"><p><h1>Cursos:</h1></p></div>
					<table align="center">
						<tr style="background-color: #87CEFA;">
						    <th>Curso</th>
						    <th>Fecha de Inicio</th> 
						    <th>Fecha de Fin</th>
						    <th>Tipo de Examen</th>
						    <th>Nivel de Examen</th>
					    </tr>
				<?php
					foreach($filas1 as $fila) {
				?>
						<tr style="background-color: #E0FFFF;">
							<td><a href="vistaAdminCurso.php?var2=<?php echo base64_encode($fila["ID_CURSO"]);?>"><?php echo $fila["ID_CURSO"]; ?></a></td>
							<td><?php echo $fila["FECHA_INICIO"]; ?></td>
							<td><?php echo $fila["FECHA_FIN"]; ?></td>
							<td><?php echo $fila["TIPO_EXAMEN"]; ?></td>
							<td><?php echo $fila["NIVEL_EXAMEN"]; ?></td>
						</tr>
				<?php } ?>
					</table>
			
		
			<div align="center" style="margin-top: 80px;">
				<a href="formularioCurso.php" class="boton_1">Crea un curso</a>
			</div>
			
			<div align="center" style="margin-top: 15px;">
				<a href="formularioProfesor.php" class="boton_1">Crea un profesor</a>
			</div>
			
			<div align="center" style="margin-top: 15px;">
				<a href="asignacionAlumno.php" class="boton_1">Añade un Alumno</a>
			</div>
			
			<div align="center" style="margin-top: 15px;">
				<a href="asignacionAlumno.php" class="boton_1">Añade un Profesor</a>
			</div>
		
			</main>
		</div>
	</body>
</html>