<?php
	session_start();

	unset($_SESSION["loginAdmin"]);
	unset($_SESSION["loginAlumno"]);
	unset($_SESSION["loginProfesor"]);
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

        <title>Academia2G</title>
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
                            <a href="login.php" target="blank" style="
                            height: 0px;
                            padding-right: 20px;">Login</a>
                            <a href="formulario.php" target="blank">Register</a>
                        </div>
                    </div>
                </div>
            
            
                <div class="menu_bar">
                    <ul class="menus">
                        <li><a href="IISSI.php">Home</a></li>
                        <li><a href="#">Cursos Ofertados</a>
                            <ul class="sub-menu">
                                <li><a href="Niveles.html">Niveles</a></li>
                                <li><a href="Examenes.html">Exámenes</a></li>
                            </ul>
                        </li>
                        <li class="menu3"><a href="QuienesSomos.html">¿Quienes somos?</a></li> 
                    </ul>
                </div>
            </div>
        
            <div class="body_content">
                        <div class="bottom_content">
                            <div class="left_content_box">
                                <fieldset>
                                <div class="left_info_text">
                                    <p>
                                            ¡Bienvenido a nuestra Academia! <br> 
                                            La sede principal de 2G está situada en Arahal (Sevilla). Contamos con un personal cualificado que te ayudará en todo lo posible para que seas capaz de sacarte tu título de Inglés deseado. Ofertamos distintos niveles de Inglés (B1, B2, C1) y distintos tipos de exámen (Trinity, Aptis, Cambridge).
                                            Apuntate al que necesites y haremos todo lo posible para que lo apruebes sin problemas. Cualquier información adicional, acuda al apartado de Información que está todo más detallado.
                                    </p>
                                <a class="button" href="QuienesSomos.html"><button type="button" class="read_more">READ MORE</button></a>
                                </div>
                            </fieldset>
                            </div>
                            <div class="right_content_box">
                                    <fieldset>    
                                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1725.1227775424315!2d-5.5515176800580335!3d37.25295692265177!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd129b5b563de6b7%3A0xcc95320bcf6a52b1!2s2G+Consultores!5e0!3m2!1ses!2ses!4v1557337832801!5m2!1ses!2ses" width="400" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>
                                    </fieldset>
                            </div>
                    </div>
                </div>
            </div>
    </body>
</html>