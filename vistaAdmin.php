<?php
	session_start();

	require_once("gestionBD.php");
	require_once("gestionarTablaAdmin.php");
	
	if (!isset($_SESSION['login']))
		Header("Location: login.php");
	else {
		if (isset($_SESSION["usuario"])) {
			$usuario = $_SESSION["usuario"];
			unset($_SESSION["usuario"]);
		}
		
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
        <script type="text/javascript" src="./js/boton.js"></script>
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
	
	<div id="botones_fila">
		<?php if (isset($usuario) and ($usuario["DNI_USUARIO"] == $fila["DNI_USUARIO"])) { ?>
			<button id="grabar" name="grabar" type="submit" class="editar_fila">
				<img src="images/bag_menuito.bmp" class="editar_fila" alt="Guardar modificación">
			</button>
		<?php } else { ?>
			<button id="editar" name="editar" type="submit" class="editar_fila">
				<img src="images/pencil_menuito.bmp" class="editar_fila" alt="Editar Alumno">
			</button>
		<?php } ?>
			<button id="borrar" name="borrar" type="submit" class="editar_fila">
				<img src="images/remove_menuito.bmp" class="editar_fila" alt="Borrar Alumno">
			</button>
	</div>
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