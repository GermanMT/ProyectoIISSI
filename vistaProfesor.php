<?php
	session_start();

	require_once("gestionBD.php");
	require_once("gestionarHorarioProfesor.php");
	require_once("gestionarCurso.php");
	
	if (!isset($_SESSION['login']))
		Header("Location: login.php");
	else {
		$conexion = crearConexionBD();
		$DNI = base64_decode($_GET['var']);
		$filas1 = consultarTodosHorariosProfesor($conexion,$DNI);
		cerrarConexionBD($conexion);
	}
?>


<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

        <title>IISSI</title>
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
                
                <main>
                	<!--Mostrar tabla de horarios de un profesor-->

	<table style="width:25%">
		<tr>
	    <th>Dia</th>
	    <th>Hora de Inicio</th> 
	    <th>Hora de Fin</th>
	    <th>Curso</th>
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
		<td><a href="vistaCurso.php?var=<?php echo base64_encode($fila["ID_CURSO"]);?>"><?php echo $fila["ID_CURSO"]; ?></a></td>
	  </tr>
	</table>
	<?php } ?>
	
</main>
        </body>
</html>