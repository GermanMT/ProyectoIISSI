<?php
	session_start();

	require_once("gestionBD.php");
	require_once("gestionarRecibos.php");
	require_once("gestionarHorariosAlumnos.php");
	
	if (!isset($_SESSION['login']))
		Header("Location: login.php");
	else {
		$conexion = crearConexionBD();
		$filas1 = consultarTodosRecibos($conexion);
		$filas2 = consultarTodosHorarios($conexion);
		cerrarConexionBD($conexion);
	}
?>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <title>VistaUsuario</title>
  <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <link rel="stylesheet" href="CSS/styleIISSI.css">
</head>
<body>
	<div class="header">
    	<div class="header_box">
        	<div class="logo">
            	<a href="IISSI.html">Academia 2G</a>
            </div>
            <div class="detail">
            	<div class="login" style=" width: 121.198">
                	<img src="images/logoAcademia.png">
                </div>
            </div>
        </div>
    </div>
    <main>
    	
    	<!-- Mostrar los horarios del alumno -->
	<table style="width:25%">
		<tr>
	    <th>Día</th>
	    <th>Hora de inicio</th> 
	    <th>Hora de fin</th>
	  </tr>
	</table>
	
	<?php
		foreach($filas2 as $fila) {
	?>
	
	<table style="width:25%">
	  <tr>
	    <td><?php echo $fila["DIA"]; ?></td>
		<td><?php echo $fila["HORA_INICIO"]; ?></td>
		<td><?php echo $fila["HORA_FIN"]; ?></td>
	  </tr>
	</table>
	<?php } ?>

    <!-- Mostrar los recibos del alumno -->
	<table style="width:25%">
		<tr>
	    <th>DNI</th>
	    <th>Fecha del recibo</th> 
	    <th>Importe</th>
	  </tr>
	</table>
	
	<?php
		foreach($filas1 as $fila) {
	?>
	
	<table style="width:25%">
	  <tr>
	    <td><?php echo $fila["DNI_USUARIO"]; ?></td>
		<td><?php echo $fila["FECHA_RECIBO"]; ?></td>
		<td><?php echo $fila["POR_PAGAR"]; ?></td>
	  </tr>
	</table>
	<?php } ?>
	
	</main>
</body>
</html>
