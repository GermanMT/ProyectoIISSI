<?php
	
	session_start();

	require_once("gestionBD.php");
	require_once("gestionarCurso.php");
	
	if (!isset($_SESSION['login']))
		Header("Location: login.php");
	else {
		$conexion = crearConexionBD();
		$filas1 = consultarTodosCursosAdmin($conexion);
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
							
 <main>

	<div align="center" style="margin-top: 200px;"><p><h1>Cursos</h1></p></div>
		<table align="center" border="1" style="width:auto; height:20px;">
		<tr>
	    <th>Curso</th>
	    <th>Fecha de Inicio</th> 
	    <th>Fecha de Fin</th>
	    <th>Tipo de Examen</th>
	    <th>Nivel de Examen</th>
	  </tr>
	
	
	<?php
		foreach($filas1 as $fila) {
	?>
	
	  <tr>
	    <td><a href="vistaAdminCurso.php?var2=<?php echo base64_encode($fila["ID_CURSO"]);?>"><?php echo $fila["ID_CURSO"]; ?></a></td>
		<td><?php echo $fila["FECHA_INICIO"]; ?></td>
		<td><?php echo $fila["FECHA_FIN"]; ?></td>
		<td><?php echo $fila["TIPO_EXAMEN"]; ?></td>
		<td><?php echo $fila["NIVEL_EXAMEN"]; ?></td>
	  </tr>
	
	<?php } ?>
	</table>
</main>
</div>
</body>
</html>