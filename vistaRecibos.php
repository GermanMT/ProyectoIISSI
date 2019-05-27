<?php  
	$v1=base64_decode($_GET['var']);
?>

<?php
	session_start();

	require_once("gestionBD.php");
	require_once("gestionarRecibos.php");
	
	if (!isset($_SESSION['login']))
		Header("Location: login.php");
	else {
		if (isset($_SESSION["recibos"])) {
			$recibo = $_SESSION["recibos"];
			unset($_SESSION["recibos"]);
		}
		$conexion = crearConexionBD();
		$filas1 = consultarTodosRecibos($conexion,$v1);
		$filas2 = consultarTodosAlumnosRecibos($conexion,$v1);
		cerrarConexionBD($conexion);
	}
	
	foreach($filas2 as $fila2) {
		$dni = $fila2["DNI_USUARIO"];
		$nombre = $fila2["NOMBRE"];
		$apellidos = $fila2["APELLIDOS"];
		$edad = $fila2["EDAD"];
	}
?>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="stylesheet" href="CSS/styleIISSI.css">
        <script type="text/javascript" src="./js/boton.js"></script>
        <title>VistaAdmin</title>
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
               
               		<!-- Mostrar recibos de los alumnos -->

		<p><h1>Recibos del Alumno:</h1></p>
		<table style="width:25%">

			<tr>
				<th>¿Pagado?</th>
		    	<th>DNI del alumno</th>
		    	<th>Nombre</th>
		    	<th>Apellidos</th>
		    	<th>Edad</th>
		    </tr>
		</table>
		
		<?php
			foreach($filas1 as $fila) {
		?>
		 
		<article>
			<form method="post" action="controladorRecibo.php">
				<div>
					<div>
							
						<input id="ID_RECIBO" name="ID_RECIBO"
							type="hidden" value="<?php echo $fila["ID_RECIBO"]; ?>"/>
						<input id="FECHA_RECIBO" name="FECHA_RECIBO"
							type="hidden" value="<?php echo $fila["FECHA_RECIBO"]; ?>"/>
						<input id="POR_PAGAR" name="POR_PAGAR"
							type="hidden" value="<?php echo $fila["POR_PAGAR"]; ?>"/> 
						<input id="CUENTA_BANCARIA" name="CUENTA_BANCARIA"
							type="hidden" value="<?php echo $fila["CUENTA_BANCARIA"]; ?>"/>
						<input id="HERMANOS" name="HERMANOS"
							type="hidden" value="<?php echo $fila["HERMANOS"]; ?>"/>
						<input id="PAGADO" name="PAGADO"
							type="hidden" value="<?php echo $fila["PAGADO"]; ?>"/>
						<input id="DNI_USUARIO" name="DNI_USUARIO"
							type="hidden" value="<?php echo $fila["DNI_USUARIO"]; ?>"/>
						<input id="FORMA_PAGO" name="FORMA_PAGO"
							type="hidden" value="<?php echo $fila["FORMA_PAGO"]; ?>"/>
							
	
					<?php if (isset($recibo) and ($recibo["ID_RECIBO"] == $fila["ID_RECIBO"])) { ?>
							<!-- Editando alumno -->
							<table style="width:25%">
								<tr>
								    <td><h3><input id="PAGADO" name="PAGADO" type="text" value="<?php echo $fila["PAGADO"]; ?>"/></h3></td>					    
								</tr>
							</table>
					<?php } else { ?>
						<!-- Mostrando alumno -->
							<input id="ID_RECIBO" name="ID_RECIBO" type="hidden" value="<?php echo $fila["ID_RECIBO"]; ?>"/>
							<table style="width:25%">
								<tr>
									<td><?php echo $fila["PAGADO"]; ?></td>
									<td><?php echo $dni; ?></td>
									<td><?php echo $nombre; ?></td>
									<td><?php echo $apellidos; ?></td>
									<td><?php echo $edad; ?></td>
								</tr>
							</table>
					<?php } ?>

					</div>
					
					<div id="botones_fila">
						<?php if (isset($recibo) and ($recibo["ID_RECIBO"] == $fila["ID_RECIBO"])) { ?>
							<button id="grabar" name="grabar" type="submit">
								<img src="images/bag_menuito.bmp" class="editar_fila" alt="Guardar modificación">
							</button>
						<?php } else { ?>
							<button id="editar" name="editar" type="submit">
								<img src="images/pencil_menuito.bmp" class="editar_fila" alt="Editar Alumno">
							</button>
							<?php } ?>
					</div>
				</div>
			</form>
		</article>
		<?php } ?>
    </body>
</html>