<?php
	session_start();

	require_once("gestionBD.php");
	require_once("gestionarTablaAdmin.php");
	
	if (!isset($_SESSION['login']))
		Header("Location: login.php");
	else {
		$conexion = crearConexionBD();
		$filas1 = consultarAlumnos($conexion);
		$filas2 = consultarProfesores($conexion);
		cerrarConexionBD($conexion);
	}
?>

<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

        <title>VistaAdmin</title>
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
                
    <div class="body_content">
    	<p><h1>Bienvenido</h1></p>
    </div>             
                	
	<!-- Mostrar alumnos de la academia -->
  	<table style="width:25%">
		<tr>
	    	<th>Alumnos</th>
	    </tr>
	</table>
	
	<?php
		foreach($filas1 as $fila) {
	?>
	
	<table style="width:25%">
		<tr>
	    	<td><?php echo $fila["NOMBRE"]; ?></td>
	    </tr>
	</table>
	<?php } ?>
	
	<!-- Mostrar profesores de la academia -->
  	<table style="width:25%">
		<tr>
	    	<th>Profesores</th>
	    </tr>
	</table>
	
	<?php
		foreach($filas2 as $fila) {
	?>
	
	<table style="width:25%">
		<tr>
	    	<td><?php echo $fila["NOMBRE"]; ?></td>
	    </tr>
	</table>
	<?php } ?>
	
	</main>
</body>
</html>