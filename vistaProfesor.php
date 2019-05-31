<?php
	session_start();

	require_once("gestionBD.php");
	require_once("gestionarHorarioProfesor.php");
	require_once("gestionarCurso.php");
	
	if (!isset($_SESSION['loginProfesor']))
		Header("Location: login.php");
	else {
		$conexion = crearConexionBD();
		$DNI = base64_decode($_GET['var']);
		$IDC = base64_decode($_GET['var2']);
		$filas1 = consultarTodosHorariosProfesor($conexion,$IDC);
		cerrarConexionBD($conexion);
		//datos: #98FB98
		// cabecera: #228B22
	}
?>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

        <title>IISSI</title>
        <link rel="stylesheet" href="CSS/styleIISSI.css">
    </head>
    <style>
    	table {
  			border-collapse: collapse;
		}
		table, td, th {
 	    	border: 1px solid black;
		}
	</style>
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

    <div class="body_content" align="center">
        <p><h1>Bienvenido</h1></p>
    
                
                <main>
                	<!--Mostrar tabla de horarios de un profesor-->

	<div align="center" style="margin-top: 50px;"><p><h1>Horarios:</h1></p></div>
		<table align="center" border="1" style="width:auto; height:20px;">
		<tr style="background-color: #228B22;">
		    <th>Dia</th>
		    <th>Hora de Inicio</th> 
		    <th>Hora de Fin</th>
		    <th>Curso</th>
	  	</tr>
	
	
	<?php
		foreach($filas1 as $fila) {
	?>
	
	  <tr style="background-color: #98FB98;">
	    <td><?php echo $fila["DIA"]; ?></td>
		<td><?php echo $fila["HORA_INICIO"]; ?></td>
		<td><?php echo $fila["HORA_FIN"]; ?></td>
		<td><a href="vistaCurso.php?var=<?php echo base64_encode($fila["ID_CURSO"]);?>"><?php echo $fila["ID_CURSO"]; ?></a></td>
	  </tr>
	
	<?php } ?>
	</table>
</main>
</div>
        </body>
</html>