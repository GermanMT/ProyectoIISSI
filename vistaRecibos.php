<?php 
	$v1=base64_decode($_GET['var']);

	session_start();

	require_once("gestionBD.php");
	require_once("gestionarRecibos.php");
	require_once("paginacionConsulta.php");
	
	if (!isset($_SESSION['loginAdmin']))
		Header("Location: login.php");
	else {
		if (isset($_SESSION["recibos"])) {
			$recibo = $_SESSION["recibos"];
			unset($_SESSION["recibos"]);
		}
		// Paginacion recibos
		if (isset($_SESSION["paginacion"]))
			$paginacion = $_SESSION["paginacion"];
		
		$pagina_seleccionada = isset($_GET["PAG_NUM3"]) ? (int)$_GET["PAG_NUM3"] : (isset($paginacion) ? (int)$paginacion["PAG_NUM3"] : 1);
		$pag_tam = isset($_GET["PAG_TAM3"]) ? (int)$_GET["PAG_TAM3"] : (isset($paginacion) ? (int)$paginacion["PAG_TAM3"] : 5);
	
		if ($pagina_seleccionada < 1) 		$pagina_seleccionada = 1;
		if ($pag_tam < 1) 		$pag_tam = 5;
	
		unset($_SESSION["paginacion"]);
	
		$conexion = crearConexionBD();
	
		$query = "SELECT * FROM RECIBOS"
			. " WHERE (RECIBOS.DNI_USUARIO = '".$v1."')";
	
		$total_registros = total_consulta($conexion, $query);
		$total_paginas = (int)($total_registros / $pag_tam);
	
		if ($total_registros % $pag_tam > 0)		$total_paginas++;
	
		if ($pagina_seleccionada > $total_paginas)		$pagina_seleccionada = $total_paginas;
	
		$paginacion["PAG_NUM3"] = $pagina_seleccionada;
		$paginacion["PAG_TAM3"] = $pag_tam;
		$_SESSION["paginacion"] = $paginacion;
	
		$filas1 = consulta_paginada($conexion, $query, $pagina_seleccionada, $pag_tam);
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
	    <main>
               
        <nav>
			<div align="center" style="margin-top: 250px;">
				<?php
					for( $pagina = 1; $pagina <= $total_paginas; $pagina++ )
						if ( $pagina == $pagina_seleccionada) { 	?>
							<span class="current"><?php echo $pagina; ?></span>
				<?php }	else { ?>
							<a href="vistaRecibos.php?var=<?php echo base64_encode($v1); ?>&PAG_NUM3=<?php echo $pagina; ?>&PAG_TAM3=<?php echo $pag_tam; ?>"><?php echo $pagina; ?></a>
				<?php } ?>
			</div>
			<form align="center" method="get" action="vistaRecibos.php">
				<input id="var" name="var" type="hidden" value="<?php echo base64_encode($v1)?>"/>			
				<input id="PAG_NUM3" name="PAG_NUM3" type="hidden" value="<?php echo $pagina_seleccionada?>"/>		
				Mostrando	
				<input id="PAG_TAM3" name="PAG_TAM3" type="number"	
					min="1" max="<?php echo $total_registros; ?>"	
					value="<?php echo $pag_tam?>" autofocus="autofocus" />	
				entradas de <?php echo $total_registros?>	
				<input type="submit" class="boton_personalizado" value="Cambiar">
			</form>
		</nav> 
		
        <!-- Mostrar recibos de los alumnos -->
		<div align="center" style="margin-top:20px;"><p><h1>Recibos del alumno</h1></p></div>
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
						<input id="DNI" name="DNI"
							type="hidden" value="<?php echo base64_encode($v1); ?>"/>	
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
						<!-- Editando recibo -->
							<tr>
								<td><h3><input id="PAGADO" name="PAGADO" type="text" value="<?php echo $fila["PAGADO"]; ?>"/></h3></td>					    
							</tr>
							
					<?php } else { ?>
						<!-- Mostrando recibo -->
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