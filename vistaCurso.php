<?php
	$v1=base64_decode($_GET['var']);
	
	session_start();

	require_once("gestionBD.php");
	require_once("gestionarCurso.php");
	
	if (!isset($_SESSION['login']))
		Header("Location: login.php");
	else {
		$conexion = crearConexionBD();
		$filas1 = consultarTodosCursosProfesor($conexion,$v1);
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
        <p><h1>Esta es la página de los alumnos del curso:</h1></p>
    </div>
    
 <main>
 	
<!--Mostar tabla de los cursos-->
	
	<table style="width:25%">
		<tr>
	    <th>Nombre</th>
	    <th>Apellidos</th> 
	    <th>DNI</th>
	  </tr>
	</table>
	
	<?php
		foreach($filas1 as $fila) {
	?>
	
	<table style="width:25%">
	  <tr>
	    <td><?php echo $fila["NOMBRE"]; ?></td>
		<td><?php echo $fila["APELLIDOS"]; ?></td>
		<td><?php echo $fila["DNI_USUARIO"]; ?></td>
	  </tr>
	</table>
	<?php } ?>
</main>
        </body>
</html>