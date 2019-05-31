<?php
	
	session_start();

	require_once("gestionBD.php");
	require_once("gestionarCurso.php");
	
	if (!isset($_SESSION['loginProfesor']))
		Header("Location: login.php");
	else {
		$conexion = crearConexionBD();
		$v1=base64_decode($_GET['var']);
		$filas1 = consultarTodosCursosProfesor($conexion,$v1);
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

    <div class="body_content">
        <p><h1>Esta es la página de los alumnos del curso:</h1></p>
    </div>
    
 <main>
 	
<!--Mostar tabla de los cursos-->
	
	<div align="center" style="margin-top:300px;"><p><h1>Cursos</h1></p></div>
		<table align="center" border="1" style="width:auto; height:20px;">
		<tr style="background-color: #228B22;">
		    <th>Nombre</th>
		    <th>Apellidos</th> 
		    <th>DNI</th>
	  	</tr>
	
	<?php
		foreach($filas1 as $fila) {
	?>
	
	
	  <tr style="background-color: #98FB98;">
	    <td><?php echo $fila["NOMBRE"]; ?></td>
		<td><?php echo $fila["APELLIDOS"]; ?></td>
		<td><?php echo $fila["DNI_USUARIO"]; ?></td>
	  </tr>
	
	<?php } ?>
	</table>
</main>
        </body>
</html>