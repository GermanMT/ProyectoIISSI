<?php
	session_start();

	require_once("gestionBD.php");
	require_once("gestionarRecibos.php");
	
	if (!isset($_SESSION['login']))
		Header("Location: login.php");
	else {
		$conexion = crearConexionBD();
		$filas = consultarTodosRecibos($conexion);
		cerrarConexionBD($conexion);
	}
?>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <title>VistaUsuario</title>
  <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <title>VistaUsuario</title>
  <link rel="stylesheet" href="CSS/styleIISSI.css">
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

	<?php
		foreach($filas as $fila) {
	?>

	<article class="recibo">
			<?php echo "<B>" . $fila["DNI_ALUMNO"] . "</B>, ".$fila["FECHA_RECIBO"] . ", " . $fila["POR_PAGAR"]; ?>
	</article>

	<?php } ?>
	</main>
</body>
</html>
