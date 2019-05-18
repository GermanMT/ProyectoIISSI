<?php
	session_start();

	require_once("gestionBD.php");
	require_once("gestionarTablaAdmin.php");
	
	if (!isset($_SESSION['login']))
		Header("Location: login.php");
	else {
		$conexion = crearConexionBD();
		$filas = consultarTablaAdmin($conexion);
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
                <div class="body_content">
                    <p><h1>Bienvenido</h1></p>
                    <div class="bottom_content">
                </div>
                </div>
                <table style="width:25%">
                	
  <!-- Mostrar la tabla de la vista Admin -->
		<tr>
	    <th>Cursos</th>
	    <th>Numero de alumnos</th> 
	    <th>Profesor</th>
	  </tr>
	</table>
	
	<?php
		foreach($filas1 as $fila) {
	?>
	
	<table style="width:25%">
	  <tr>
	    <td><?php echo $fila["ID_CURSO"]; ?></td>
		<td><?php echo $fila["NUM_ALUMNOS"]; ?></td>
		<td><?php echo $fila["NOMBRE"]; ?></td>
	  </tr>
	</table>
	<?php } ?>
	
	</main>
</body>
</html>