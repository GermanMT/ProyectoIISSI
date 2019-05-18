<?php
	session_start();

	require_once("gestionBD.php");
	require_once("gestionarHorario.php");
	
	if (!isset($_SESSION['login']))
		Header("Location: login.php");
	else {
		$conexion = crearConexionBD();
		$filas = consultarTodosHorarios($conexion);
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
                    <p><h1>Horario de tus grupos:</h1></p>
                    <div class="bottom_content">
                </div>
                </div>
                
                <main>

	<?php
		foreach($filas as $fila) {
	?>

	<article class="libro">
			<?php echo "<B>" . $fila["Dia"] . "</B>, <EM>written by</EM> ".$fila["Hora_Inicio"] . ", " . $fila["Hora_Fin"] . ", " . $fila["Id_Curso"]; ?>
	</article>

	<?php } ?>
</main>
        </body>
</html>