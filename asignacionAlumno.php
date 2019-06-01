<?php
	session_start();

	require_once("gestionBD.php");
	require_once("paginacionConsulta.php");
	
	if (!isset($_SESSION['loginAdmin']))
		Header("Location: login.php");
	else {
		if (isset($_SESSION["usuario"])) {
			$usuario = $_SESSION["usuario"];
			unset($_SESSION["usuario"]);
		}
		
		// Paginacion Alumnos
		if (isset($_SESSION["paginacion"]))
			$paginacion = $_SESSION["paginacion"];
		
		$pagina_seleccionada = isset($_GET["PAG_NUM"]) ? (int)$_GET["PAG_NUM"] : (isset($paginacion) ? (int)$paginacion["PAG_NUM"] : 1);
		$pag_tam = isset($_GET["PAG_TAM"]) ? (int)$_GET["PAG_TAM"] : (isset($paginacion) ? (int)$paginacion["PAG_TAM"] : 5);
	
		if ($pagina_seleccionada < 1) 		$pagina_seleccionada = 1;
		if ($pag_tam < 1) 		$pag_tam = 5;
	
		unset($_SESSION["paginacion"]);
	
		$conexion = crearConexionBD();
	
		$query = "SELECT * FROM Usuarios"
			. " WHERE (Usuarios.TipoUsuario = 'Alumno' AND Usuarios.Id_Curso IS NULL)";
	
		$total_registros = total_consulta($conexion, $query);
		$total_paginas = (int)($total_registros / $pag_tam);
	
		if ($total_registros % $pag_tam > 0)		$total_paginas++;
	
		if ($pagina_seleccionada > $total_paginas)		$pagina_seleccionada = $total_paginas;
	
		$paginacion["PAG_NUM"] = $pagina_seleccionada;
		$paginacion["PAG_TAM"] = $pag_tam;
		$_SESSION["paginacion"] = $paginacion;
	
		$filas1 = consulta_paginada($conexion, $query, $pagina_seleccionada, $pag_tam);
		
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
	        <main> 
			    <nav>
					<div align="center" style="margin-top: 250px;">
						<?php
							for( $pagina = 1; $pagina <= $total_paginas; $pagina++ )
								if ( $pagina == $pagina_seleccionada) { 	?>
									<span class="current"><?php echo $pagina; ?></span>
						<?php }	else { ?>
									<a href="vistaAdminCurso.php?var2=<?php echo base64_encode($IDC); ?>&PAG_NUM=<?php echo $pagina; ?>&PAG_TAM=<?php echo $pag_tam; ?>"><?php echo $pagina; ?></a>
						<?php } ?>
					</div>
					<form align="center" method="get" action="vistaAdminCurso.php">	
						<input id="var2" name="var2" type="hidden" value="<?php echo base64_encode($IDC) ?>"/>
						<input id="PAG_NUM" name="PAG_NUM" type="hidden" value="<?php echo $pagina_seleccionada?>"/>	
						Mostrando	
						<input id="PAG_TAM" name="PAG_TAM" type="number"	
							min="1" max="<?php echo $total_registros; ?>"	
							value="<?php echo $pag_tam?>" autofocus="autofocus" />	
						entradas de <?php echo $total_registros?>	
						<input type="submit" class="boton_personalizado" value="Cambiar">
					</form>
				</nav>          
		                	
			<!-- Mostrar alumnos de la academia -->
			<div align="center" style="margin-top:50px;"><p><h1>Alumnos</h1></p></div>
				<table align="center" border="1" style="width:90%; height:20px;">
					<tr style="background-color: #87CEFA;">
				    	<th>DNI del alumno</th>
				    	<th>Nombre</th>
				    	<th>Apellidos</th>
				    	<th>Tipo de examen</th>
				    	<th>Nivel del examen</th>
				    	<th>Curso</th>
				    </tr>
			<?php
				foreach($filas1 as $fila) {
			?>
			<article>
				<form method="post" action="controladorAsignacion.php">
					<div>
						<div>		
							<input id="DNI_USUARIO" name="DNI_USUARIO"
								type="hidden" value="<?php echo $fila["DNI_USUARIO"]; ?>"/>
							<input id="NOMBRE" name="NOMBRE"
								type="hidden" value="<?php echo $fila["NOMBRE"]; ?>"/>
							<input id="APELLIDOS" name="APELLIDOS"
								type="hidden" value="<?php echo $fila["APELLIDOS"]; ?>"/>
							<input id="TIPO_EXAMEN" name="TIPO_EXAMEN"
								type="hidden" value="<?php echo $fila["TIPO_EXAMEN"]; ?>"/>
							<input id="NIVEL_EXAMEN" name="NIVEL_EXAMEN"
								type="hidden" value="<?php echo $fila["NIVEL_EXAMEN"]; ?>"/>
							<input id="TIPOUSUARIO" name="TIPOUSUARIO"
								type="hidden" value="<?php echo $fila["TIPOUSUARIO"]; ?>"/>
							<input id="ID_CURSO" name="ID_CURSO"
								type="hidden" value="<?php echo $fila["ID_CURSO"]; ?>"/>
								
		
						<?php if (isset($usuario) and ($usuario["DNI_USUARIO"] == $fila["DNI_USUARIO"])) { ?>
								<!-- Editando alumno -->
								<tr style="background-color: #E0FFFF;">
									<td><h4><?php echo $fila["DNI_USUARIO"];?></h4></td>
									<td><h4><?php echo $fila["NOMBRE"];?></h4></td>
									<td><h4><?php echo $fila["APELLIDOS"];?></h4></td>
									<td><h4><?php echo $fila["TIPO_EXAMEN"];?></h4></td>
									<td><h4><?php echo $fila["NIVEL_EXAMEN"];?></h4></td>
									<td><h3><input id="ID_CURSO" name="ID_CURSO" type="text" value="<?php echo $fila["ID_CURSO"]; ?>"/></h3></td>
								</tr>
						<?php } else { ?>
							<!-- Mostrando alumno -->
								<input id="DNI_Usuario" name="DNI_Usuario" type="hidden" value="<?php echo $fila["DNI_Usuario"]; ?>"/>
									<tr style="background-color: #E0FFFF;">
									   	<td><?php echo $fila["DNI_USUARIO"]; ?></td>
									    <td><?php echo $fila["NOMBRE"]; ?></td>
									    <td><?php echo $fila["APELLIDOS"]; ?></td>
									    <td><?php echo $fila["TIPO_EXAMEN"]; ?></td>
									    <td><?php echo $fila["NIVEL_EXAMEN"]; ?></td>
									    <td><?php echo $fila["ID_CURSO"]; ?></td>
						<?php } ?>
						</div>
						<div>
								<td>
								<?php if (isset($usuario) and ($usuario["DNI_USUARIO"] == $fila["DNI_USUARIO"])) { ?>
									<button id="grabar" name="grabar" class="boton_personalizado" type="submit">
										<p>Añadir alumno</p>
									</button>
								<?php } else { ?>
									<button id="editar" name="editar" class="boton_personalizado" type="submit">
										<p>Elegir Curso</p>
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
			</main>
		</div>
	</body>
</html>
?>