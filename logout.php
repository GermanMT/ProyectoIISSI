<?php
	session_start();
    
    if (isset($_SESSION['loginAdmin']))
        unset($_SESSION['loginAdmin']);
	
	if (isset($_SESSION['loginAlumno']))
        unset($_SESSION['loginAlumno']);
	
	if (isset($_SESSION['loginProfesor']))
        unset($_SESSION['loginProfesor']);
    
    header("Location: login.php");
?>
