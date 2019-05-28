<?php  
	$v1=base64_decode($_GET['var']);

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
                        <a href="IISSI.html">Academia 2G</a>
                    </div>
                    <div class="detail">
                        <div class="login" style="
                        width: 121.198">
                            <img src="images/logoAcademia.png">
                            <a href="login.php" target="blank" style="
                            height: 0px;
                            padding-right: 20px;">Login</a>
                            <a href="formulario.php" target="blank">Register</a>
                        </div>
                    </div>
                </div>
            
            
                <div class="menu_bar">
                    <ul class="menus">
                        <li><a href="IISSI.html">Home</a></li>
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
               
               		<!-- Mostrar recibos de los alumnos -->

		<div align="center" style="margin-top:250px;"><p><h1>Recibos del alumno</h1></p></div>
		<table align="center" border="1" style="width:auto; height:20px;">

			<tr>
				<th>¿Pagado?</th>
		    	<th>DNI del alumno</th>
		    	<th>Nombre</th>
		    	<th>Apellidos</th>
		    	<th>Edad</th>
		    </tr>
		
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
							
								<tr>
								    <td><h3><input id="PAGADO" name="PAGADO" type="text" value="<?php echo $fila["PAGADO"]; ?>"/></h3></td>					    
								</tr>
							
					<?php } else { ?>
						<!-- Mostrando alumno -->
							<input id="ID_RECIBO" name="ID_RECIBO" type="hidden" value="<?php echo $fila["ID_RECIBO"]; ?>"/>
							
								<tr>
									<td><?php echo $fila["PAGADO"]; ?></td>
									<td><?php echo $dni; ?></td>
									<td><?php echo $nombre; ?></td>
									<td><?php echo $apellidos; ?></td>
									<td><?php echo $edad; ?></td>
								
							
					<?php } ?>

					</div>
					
					<div>
						<td>
						<?php if (isset($recibo) and ($recibo["ID_RECIBO"] == $fila["ID_RECIBO"])) { ?>
							<button id="grabar" name="grabar" class="boton_personalizado" type="submit">
									<p>Guardar modificación</p>
								</button>
							<?php } else { ?>
								<button id="editar" name="editar" class="boton_personalizado" type="submit">
									<p>Editar Recibo</p>
								</button>
							<?php } ?>
							</td>
							</tr>
					</div>
				</div>
			</form>
		</article>
		<?php } ?>
		</table>
    </body>
</html>