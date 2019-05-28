<?php
	session_start();

	require_once("gestionBD.php");
	require_once("gestionarTablaAdmin.php");
	require_once("paginacionConsulta.php");
	
	if (!isset($_SESSION['login']))
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
			. " WHERE (Usuarios.TipoUsuario = 'Alumno')";
	
		$total_registros = total_consulta($conexion, $query);
		$total_paginas = (int)($total_registros / $pag_tam);
	
		if ($total_registros % $pag_tam > 0)		$total_paginas++;
	
		if ($pagina_seleccionada > $total_paginas)		$pagina_seleccionada = $total_paginas;
	
		$paginacion["PAG_NUM"] = $pagina_seleccionada;
		$paginacion["PAG_TAM"] = $pag_tam;
		$_SESSION["paginacion"] = $paginacion;
	
		$filas1 = consulta_paginada($conexion, $query, $pagina_seleccionada, $pag_tam);
		
		// Paginación Profesores
		if (isset($_SESSION["paginacion"]))
			$paginacion2 = $_SESSION["paginacion"];
		
		$pagina_seleccionada2 = isset($_GET["PAG_NUM2"]) ? (int)$_GET["PAG_NUM2"] : (isset($paginacion2) ? (int)$paginacion2["PAG_NUM2"] : 1);
		$pag_tam2 = isset($_GET["PAG_TAM2"]) ? (int)$_GET["PAG_TAM2"] : (isset($paginacion2) ? (int)$paginacion2["PAG_TAM2"] : 5);
	
		if ($pagina_seleccionada2 < 1) 		$pagina_seleccionada2 = 1;
		if ($pag_tam2 < 1) 		$pag_tam2 = 5;
	
		unset($_SESSION["paginacion"]);
	
		$conexion = crearConexionBD();
	
		$query2 = "SELECT * FROM Usuarios"
			. " WHERE (Usuarios.TipoUsuario = 'Profesor')";
	
		$total_registros2 = total_consulta($conexion, $query2);
		$total_paginas2 = (int)($total_registros2 / $pag_tam2);
	
		if ($total_registros2 % $pag_tam2 > 0)		$total_paginas2++;
	
		if ($pagina_seleccionada2 > $total_paginas2)		$pagina_seleccionada2 = $total_paginas2;
	
		$paginacion2["PAG_NUM2"] = $pagina_seleccionada2;
		$paginacion2["PAG_TAM2"] = $pag_tam2;
		$_SESSION["paginacion"] = $paginacion2;
	
		$filas2 = consulta_paginada($conexion, $query2, $pagina_seleccionada2, $pag_tam2);
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
	    
	    <nav>
			<div align="center" style="margin-top: 250px;">
				<?php
					for( $pagina = 1; $pagina <= $total_paginas; $pagina++ )
						if ( $pagina == $pagina_seleccionada) { 	?>
							<span class="current"><?php echo $pagina; ?></span>
				<?php }	else { ?>
							<a href="vistaAdmin.php?PAG_NUM=<?php echo $pagina; ?>&PAG_TAM=<?php echo $pag_tam; ?>"><?php echo $pagina; ?></a>
				<?php } ?>
			</div>
			<form align="center" method="get" action="vistaAdmin.php">	
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
		<div align="center" style="margin-top:50px;"><p><h1>Alumnos:</h1></p></div>
		<table align="center" border="1" style="width:auto; height:20px;">

			<tr>
		    	<th>DNI del alumno</th>
		    	<th>Nombre</th>
		    	<th>Apellidos</th>
		    	<th>Edad</th>
		    	<th>Localidad</th>
		    	<th>Telefono Movil</th>
		    	<th>Telefono Fijo</th>
		    	<th>Email</th>
		    	<th>Tutor Legal</th>
		    </tr>
		<?php
			foreach($filas1 as $fila) {
		?>
		 
		

		<article>
			<form method="post" action="controladorUsuario.php">
				<div>
					<div>		
						<input id="DNI_USUARIO" name="DNI_USUARIO"
							type="hidden" value="<?php echo $fila["DNI_USUARIO"]; ?>"/>
						<input id="NOMBRE" name="NOMBRE"
							type="hidden" value="<?php echo $fila["NOMBRE"]; ?>"/>
						<input id="APELLIDOS" name="APELLIDOS"
							type="hidden" value="<?php echo $fila["APELLIDOS"]; ?>"/>
						<input id="EDAD" name="EDAD"
							type="hidden" value="<?php echo $fila["EDAD"]; ?>"/>
						<input id="LOCALIDAD" name="LOCALIDAD"
							type="hidden" value="<?php echo $fila["LOCALIDAD"]; ?>"/>
						<input id="TELEFONO_MOVIL" name="TELEFONO_MOVIL"
							type="hidden" value="<?php echo $fila["TELEFONO_MOVIL"]; ?>"/>
						<input id="TELEFONO_FIJO" name="TELEFONO_FIJO"
							type="hidden" value="<?php echo $fila["TELEFONO_FIJO"]; ?>"/>
						<input id="EMAIL" name="EMAIL"
							type="hidden" value="<?php echo $fila["EMAIL"]; ?>"/>
						<input id="NOMBRE_PADRE_MADRE" name="NOMBRE_PADRE_MADRE"
							type="hidden" value="<?php echo $fila["NOMBRE_PADRE_MADRE"]; ?>"/>
						<input id="USUARIO" name="USUARIO"
							type="hidden" value="<?php echo $fila["USUARIO"]; ?>"/>
						<input id="PASS" name="PASS"
							type="hidden" value="<?php echo $fila["PASS"]; ?>"/>
						<input id="TIPOUSUARIO" name="TIPOUSUARIO"
							type="hidden" value="<?php echo $fila["TIPOUSUARIO"]; ?>"/>
							
	
					<?php if (isset($usuario) and ($usuario["DNI_USUARIO"] == $fila["DNI_USUARIO"])) { ?>
							<!-- Editando alumno -->
							<tr>
								<td><h4><?php echo $fila["DNI_USUARIO"];?></h4></td>
								<td><h3><input id="NOMBRE" name="NOMBRE" type="text" value="<?php echo $fila["NOMBRE"]; ?>"/></h3></td>
								<td><h3><input id="APELLIDOS" name="APELLIDOS" type="text" value="<?php echo $fila["APELLIDOS"]; ?>"/></h3></td>
								<td><h3><input id="EDAD" name="EDAD" type="text" value="<?php echo $fila["EDAD"]; ?>"/></h3></td>
								<td><h3><input id="LOCALIDAD" name="LOCALIDAD" type="text" value="<?php echo $fila["LOCALIDAD"]; ?>"/></h3></td>
								<td><h3><input id="TELEFONO_MOVIL" name="TELEFONO_MOVIL" type="text" value="<?php echo $fila["TELEFONO_MOVIL"]; ?>"/></h3></td>
								<td><h3><input id="TELEFONO_FIJO" name="TELEFONO_FIJO" type="text" value="<?php echo $fila["TELEFONO_FIJO"]; ?>"/></h3></td>
								<td><h3><input id="EMAIL" name="EMAIL" type="text" value="<?php echo $fila["EMAIL"]; ?>"/></h3></td>
								<td><h3><input id="NOMBRE_PADRE_MADRE" name="NOMBRE_PADRE_MADRE" type="text" value="<?php echo $fila["NOMBRE_PADRE_MADRE"]; ?>"/></h3></td>
							</tr>
					<?php } else { ?>
						<!-- Mostrando alumno -->
							<input id="DNI_USUARIO" name="DNI_USUARIO" type="hidden" value="<?php echo $fila["DNI_USUARIO"]; ?>"/>
								<tr>
								   	<td><?php echo $fila["DNI_USUARIO"]; ?></td>
								    <td><?php echo $fila["NOMBRE"]; ?></td>
								    <td><?php echo $fila["APELLIDOS"]; ?></td>
								    <td><?php echo $fila["EDAD"]; ?></td>
								    <td><?php echo $fila["LOCALIDAD"]; ?></td>
								    <td><?php echo $fila["TELEFONO_MOVIL"]; ?></td>
								    <td><?php echo $fila["TELEFONO_FIJO"]; ?></td>
								    <td><?php echo $fila["EMAIL"]; ?></td>
								    <td><?php echo $fila["NOMBRE_PADRE_MADRE"]; ?></td>
								    <td><a href="vistaRecibos.php?var= <?php echo base64_encode($fila["DNI_USUARIO"]);?>">Recibos del Alumno</a></td>
					<?php } ?>
					</div>
					
					<div>
							<td>
							<?php if (isset($usuario) and ($usuario["DNI_USUARIO"] == $fila["DNI_USUARIO"])) { ?>
								<button id="grabar" name="grabar" class="boton_personalizado" type="submit">
									<p>Guardar modificación</p>
								</button>
							<?php } else { ?>
								<button id="editar" name="editar" class="boton_personalizado" type="submit">
									<p>Editar Alumno</p>
								</button>
							<?php } ?>
								<button id="borrar" name="borrar" class="boton_personalizado" type="submit">
									<p>Borrar Alumno</p>
								</button>
							</td>
						</tr>
					</div>
				</div>
			</form>
		</article>

		
		<?php } ?>
		</table>
		
		<nav>
			<div align="center" style="margin-top: 50px;">
				<?php
					for( $pagina2 = 1; $pagina2 <= $total_paginas2; $pagina2++ )
						if ( $pagina2 == $pagina_seleccionada2) { 	?>
							<span class="current"><?php echo $pagina2; ?></span>
				<?php }	else { ?>
							<a href="vistaAdmin.php?PAG_NUM2=<?php echo $pagina2; ?>&PAG_TAM2=<?php echo $pag_tam2; ?>"><?php echo $pagina2; ?></a>
				<?php } ?>
			</div>
			<form align="center" method="get" action="vistaAdmin.php">	
				<input id="PAG_NUM2" name="PAG_NUM2" type="hidden" value="<?php echo $pagina_seleccionada2?>"/>	
				Mostrando	
				<input id="PAG_TAM2" name="PAG_TAM2" type="number"	
					min="1" max="<?php echo $total_registros2; ?>"	
					value="<?php echo $pag_tam2?>" autofocus="autofocus" />	
				entradas de <?php echo $total_registros2?>	
				<input type="submit" class="boton_personalizado" value="Cambiar">
			</form>
		</nav> 
			
		<!-- Mostrar profesores de la academia -->
		<div align="center" style="margin-top: 50px;"><p><h1>Profesores:</h1></p></div>
	  	<table align="center" border="1" style="width:auto; height:20px;">
			<tr>
		    	<th>DNI del Profesor</th>
		    	<th>Nombre</th>
		    	<th>Apellidos</th>
		    	<th>Edad</th>
		    	<th>Localidad</th>
		    	<th>Telefono Movil</th>
		    	<th>Telefono Fijo</th>
		    	<th>Email</th>
		    </tr>
		
		<?php
			foreach($filas2 as $fila) {
		?>
		
		<article>
			<form method="post" action="controladorUsuario.php">
				<div>
					<div>
						<input id="DNI_USUARIO" name="DNI_USUARIO"
							type="hidden" value="<?php echo $fila["DNI_USUARIO"]; ?>"/>
						<input id="NOMBRE" name="NOMBRE"
							type="hidden" value="<?php echo $fila["NOMBRE"]; ?>"/>
						<input id="APELLIDOS" name="APELLIDOS"
							type="hidden" value="<?php echo $fila["APELLIDOS"]; ?>"/>
						<input id="EDAD" name="EDAD"
							type="hidden" value="<?php echo $fila["EDAD"]; ?>"/>
						<input id="LOCALIDAD" name="LOCALIDAD"
							type="hidden" value="<?php echo $fila["LOCALIDAD"]; ?>"/>
						<input id="TELEFONO_MOVIL" name="TELEFONO_MOVIL"
							type="hidden" value="<?php echo $fila["TELEFONO_MOVIL"]; ?>"/>
						<input id="TELEFONO_FIJO" name="TELEFONO_FIJO"
							type="hidden" value="<?php echo $fila["TELEFONO_FIJO"]; ?>"/>
						<input id="EMAIL" name="EMAIL"
							type="hidden" value="<?php echo $fila["EMAIL"]; ?>"/>
						<input id="USUARIO" name="USUARIO"
							type="hidden" value="<?php echo $fila["USUARIO"]; ?>"/>
						<input id="PASS" name="PASS"
							type="hidden" value="<?php echo $fila["PASS"]; ?>"/>
						<input id="TIPOUSUARIO" name="TIPOUSUARIO"
							type="hidden" value="<?php echo $fila["TIPOUSUARIO"]; ?>"/>
							
	
					<?php if (isset($usuario) and ($usuario["DNI_USUARIO"] == $fila["DNI_USUARIO"])) { ?>
						<!-- Editando profesor -->
							<tr>
								<td><h4><?php echo $fila["DNI_USUARIO"];?></h4></td>
								<td><h3><input id="NOMBRE" name="NOMBRE" type="text" value="<?php echo $fila["NOMBRE"]; ?>"/></h3></td>
								<td><h3><input id="APELLIDOS" name="APELLIDOS" type="text" value="<?php echo $fila["APELLIDOS"]; ?>"/></h3></td>
								<td><h3><input id="EDAD" name="EDAD" type="text" value="<?php echo $fila["EDAD"]; ?>"/></h3></td>
								<td><h3><input id="LOCALIDAD" name="LOCALIDAD" type="text" value="<?php echo $fila["LOCALIDAD"]; ?>"/></h3></td>
								<td><h3><input id="TELEFONO_MOVIL" name="TELEFONO_MOVIL" type="text" value="<?php echo $fila["TELEFONO_MOVIL"]; ?>"/></h3></td>
								<td><h3><input id="TELEFONO_FIJO" name="TELEFONO_FIJO" type="text" value="<?php echo $fila["TELEFONO_FIJO"]; ?>"/></h3></td>
								<td><h3><input id="EMAIL" name="EMAIL" type="text" value="<?php echo $fila["EMAIL"]; ?>"/></h3></td>
							</tr>
					<?php } else { ?>
						<!-- Mostrando profesor -->
							<input id="DNI_USUARIO" name="DNI_USUARIO" type="hidden" value="<?php echo $fila["DNI_USUARIO"]; ?>"/>
								<tr>
								   	<td><?php echo $fila["DNI_USUARIO"]; ?></td>
								    <td><?php echo $fila["NOMBRE"]; ?></td>
								    <td><?php echo $fila["APELLIDOS"]; ?></td>
								    <td><?php echo $fila["EDAD"]; ?></td>
								    <td><?php echo $fila["LOCALIDAD"]; ?></td>
								    <td><?php echo $fila["TELEFONO_MOVIL"]; ?></td>
								    <td><?php echo $fila["TELEFONO_FIJO"]; ?></td>
								    <td><?php echo $fila["EMAIL"]; ?></td>					
					<?php } ?>
					</div>
					
					<div>
							<td>
							<?php if (isset($usuario) and ($usuario["DNI_USUARIO"] == $fila["DNI_USUARIO"])) { ?>
								<button id="grabar" name="grabar" class="boton_personalizado" type="submit">
									<p>Guardar modificación</p>
								</button>
							<?php } else { ?>
								<button id="editar" name="editar" class="boton_personalizado" type="submit">
									<p>Editar Profesor</p>
								</button>
							<?php } ?>
								<button id="borrar" name="borrar" class="boton_personalizado" type="submit">
									<p>Borrar Profesor</p>
								</button>
							</td>
						</tr>
					</div>
				</div>
			</form>
		</article>
		
		<?php } ?>
		</table>
		<div align="center" style="margin-top: 15px;">
			<a href="formularioProfesor.php">Añade un profesor</a>
			<a href="formularioCurso.php">Añade un curso</a>
		</div>

		</main>
	</body>
</html>