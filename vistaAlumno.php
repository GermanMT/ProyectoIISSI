<?php
	session_start();

	require_once("gestionBD.php");
	require_once("gestionarRecibos.php");
	require_once("gestionarHorariosAlumnos.php");
	
	if (!isset($_SESSION['login']))
		Header("Location: login.php");
	else {
		$conexion = crearConexionBD();
		$filas2 = consultarTodosRecibos($conexion);
		$filas1 = consultarTodosHorarios($conexion);
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

    <!-- Mostrar los recibos del alumno -->
    <div class="body_content">
        <p><h1>Recibos</h1></p>
    </div>
    
	<table style="width:25%">
		<tr>
	    <th>DNI</th>
	    <th>Fecha del recibo</th> 
	    <th>Importe</th>
	    <th>¿Pagado?</th>
	  </tr>
	</table>
	
	<?php
		foreach($filas2 as $fila) {
	?>
	
	<table style="width:25%">
	  <tr>

	    <td><?php echo $fila["DNI_USUARIO"]; ?></td>
		<td><?php echo $fila["FECHA_RECIBO"]; ?></td>
		<td><?php echo $fila["POR_PAGAR"]; ?></td>
		<td><?php echo $fila["PAGADO"]; ?></td>
	  </tr>
	</table>
	<?php } ?>
	
	<!-- Mostrar los horarios del alumno -->
	
	<div class="body_content">
        <p><h1>Horario</h1></p>
    </div>
    
	<table style="width:25%">
		<tr>
	    <th>Dia</th>
	    <th>Hora de Inicio</th> 
	    <th>Hora de fin</th>
	  </tr>
	</table>
	
	<?php
		foreach($filas1 as $fila) {
	?>
	
	<table style="width:25%">
	  <tr>
	    <td><?php echo $fila["DIA"]; ?></td>
		<td><?php echo $fila["HORA_INICIO"]; ?></td>
		<td><?php echo $fila["HORA_FIN"]; ?></td>
	  </tr>
	</table>
	<?php } ?>
	
	</main>
</body>
</html>
