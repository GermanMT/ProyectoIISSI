<?php
	session_start();

	require_once("gestionBD.php");
	require_once("gestionarRecibos.php");
	require_once("gestionarHorariosAlumnos.php");
	
	if (!isset($_SESSION['loginAlumno']))
		Header("Location: login.php");
	else {
		$conexion = crearConexionBD();
		$DNI = base64_decode($_GET['var']);
		$IDC = base64_decode($_GET['var2']);
		$filas2 = consultarTodosRecibos($conexion,$DNI);
		$filas1 = consultarTodosHorariosAlumnos($conexion,$IDC);
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
            
            
                <div class="menu_bar">
                    <ul class="menus">
                        <li><a href="IISSI.php">Home</a></li>
                        <li><a href="#">Cursos Ofertados</a>
                            <ul class="sub-menu">
                                <li><a href="Niveles.html">Niveles</a></li>
                                <li><a href="Examenes.html">Exámenes</a></li>
                            </ul>
                        </li>
                        <li class="menu3"><a href="QuienesSomos.html">¿Quienes somos?</a></li>
                       <!--<li><a href="file:///C:/xampp/htdocs/sample/contact.html">Contact</a></li>
                    --> 
                    </ul>
                </div>
    <main>

    <!-- Mostrar los recibos del alumno -->
    
    
    <div align="center" style="margin-top:250px;"><p><h1>Recibos:</h1></p></div>
		<table align="center" border="1" style="width:auto; height:20px;">
	
		<tr>
	    <th>DNI</th>
	    <th>Fecha del recibo</th> 
	    <th>Importe</th>
	    <th>¿Pagado?</th>
	  </tr>
	
	
	<?php
		foreach($filas2 as $fila) {
	?>
	
	
	  <tr>
	    <td><?php echo $fila["DNI_USUARIO"]; ?></td>
		<td><?php echo $fila["FECHA_RECIBO"]; ?></td>
		<td><?php echo $fila["POR_PAGAR"]; ?></td>
		<td><?php echo $fila["PAGADO"]; ?></td>
	  </tr>
	  
	<?php } ?>
	</table>
	
	<!-- Mostrar los horarios del alumno -->
	
	 <div align="center"><p><h1>Horarios:</h1></p></div>
		<table align="center" border="1" style="width:auto; height:20px;">
			
		<tr>
	    <th>Dia</th>
	    <th>Hora de Inicio</th> 
	    <th>Hora de fin</th>
	  </tr>
	
	
	<?php
		foreach($filas1 as $fila) {
	?>
	
	
	  <tr>
	    <td><?php echo $fila["DIA"]; ?></td>
		<td><?php echo $fila["HORA_INICIO"]; ?></td>
		<td><?php echo $fila["HORA_FIN"]; ?></td>
	  </tr>
	
	<?php } ?>
	</table>
	
	
	</main>
</body>
</html>
