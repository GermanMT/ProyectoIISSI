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
                
	    <div class="body_content">
	    	<p><h1>Bienvenido</h1></p>
	    </div>             
                	
		<!-- Mostrar alumnos de la academia -->
		<p><h1>Alumnos:</h1></p>
		<table style="width:25%">
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
		</table>
		
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
							<table style="width:25%">
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
							</table>
					<?php } else { ?>
						<!-- Mostrando alumno -->
						<input id="DNI_USUARIO" name="DNI_USUARIO" type="hidden" value="<?php echo $fila["DNI_USUARIO"]; ?>"/>
						<table style="width:25%">
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
							</tr>
						</table>
					<?php } ?>
					</div>
					
					<div id="botones_fila">
						<?php if (isset($usuario) and ($usuario["DNI_USUARIO"] == $fila["DNI_USUARIO"])) { ?>
							<button id="grabar" name="grabar" type="submit">
								<img src="images/bag_menuito.bmp" class="editar_fila" alt="Guardar modificación">
							</button>
						<?php } else { ?>
							<button id="editar" name="editar" type="submit">
								<img src="images/pencil_menuito.bmp" class="editar_fila" alt="Editar Alumno">
							</button>
						<?php } ?>
							<button id="borrar" name="borrar" type="submit">
								<img src="images/remove_menuito.bmp" class="editar_fila" alt="Borrar Alumno">
							</button>
					</div>
				</div>
			</form>
		</article>
		
		<?php } ?>
			
		<!-- Mostrar profesores de la academia -->
		<p><h1>Profesores:</h1></p>
	  	<table style="width:25%">
			<tr>
		    	<th>DNI del Profesor</th>
		    	<th>Nombre</th>
		    	<th>Apellidos</th>
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