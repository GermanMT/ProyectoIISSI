// Funciones de validación

	function validateForm() {
		var noValidation = document.getElementById("#altaUsuario").novalidate;
		 // Comprobar que el atributo "novalidate" está desactivado para eralizar la validación en cliente
		if (!noValidation){
		// Comprobar que la longitud de la contraseña es >=8, que contiene letras mayúsculas y minúsculas y números
			var error1 = passwordValidation();
	        
			var error2 = passwordConfirmation();
        
			return (error1.length==0) && (error2.length==0);
		}
		return true;
	}

	// Comprobamos la restricciones del password y aplicacamos clases CSS mediante JQuery
	function passwordValidation(){
		var password = document.getElementById("Pass");
		var pwd = password.value;
		var valid = true;

		// Comprobamos la longitud de la contraseña
		valid = valid && (pwd.length>=8);
		
		// Comprobamos si contiene letras mayúsculas, minúsculas y números
		var hasNumber = /\d/;
		var hasUpperCases = /[A-Z]/;
		var hasLowerCases = /[a-z]/;
		valid = valid && (hasNumber.test(pwd)) && (hasUpperCases.test(pwd)) && (hasLowerCases.test(pwd));
		
		// Si no cumple las restricciones, devolvemos un error
		if(!valid){
			var error = "Por favor, introduce una contraseña válida. Tamaño >= 8, dígitos y letras mayúsculas minúsculas";
		}else{
			var error = "";
		}
	        password.setCustomValidity(error);
		return error;
	}
	
	//Campos de contraseña y confirmación de contraseña iguales
	function passwordConfirmation(){
		// Obtenemos el campo de password y su valor
        var password = document.getElementById("Pass");
		var pwd = password.value;
		// Obtenemos el campo de confirmación de password y su valor
		var passconfirm = document.getElementById("confirmpass");
		var confirmation = passconfirm.value;

		// Los comparamos
		if (pwd != confirmation) {
			var error = "Introduce la misma contraseña!";
		}else{
			var error = "";
		}

		passconfirm.setCustomValidity(error);

		return error;
	}

	//Calculamos la fortaleza de una contraseña: frecuencia de repetición de caracteres
	function passwordStrength(password){
    		// Creamos un Map donde almacenar las ocurrencias de cada carácter
    		var letters = {};

    		// Recorremos la contraseña carácter por carácter
    		var length = password.length;
    		for(x = 0, length; x < length; x++) {
        		// Consultamos el carácter en la posición x
        		var l = password.charAt(x);

        		// Si NO existe en el Map, inicializamos su contador a uno
        		// Si ya existía, incrementamos el contador en uno
        		letters[l] = (isNaN(letters[l])? 1 : letters[l] + 1);
    		}

    		// Devolvemos el cociente entre el número de caracteres únicos (las claves del Map)
		// y la longitud de la contraseña
    		return Object.keys(letters).length / length;
	}
	
	// EJERCICIO 4: Coloreado del campo de contraseña según su fortaleza
/*	function passwordColor(){
		var passField = document.getElementById("Pass");
		var strength = passwordStrength(passField.value);
		
		if(!isNaN(strength)){
			var type = "weakpass";
			if(passwordValidation()!=""){
				type = "weakpass";
			}else if(strength > 0.7){
				type = "strongpass";
			}else if(strength > 0.4){
				type = "middlepass";
			}
		}else{
			type = "nanpass";
		}
		passField.className = type;
		
		return type;
	}
*/
	/*Funcion para darle color al imput según su fortaleza*/ 
function colorContraseña(){
	$("#Pass").keyup(function(){
		
		var clave = $("#Pass").val();
		if(seguridad_clave(clave)<10){
			 $("#Pass").css("background-color","red");
		}else if(seguridad_clave(clave)>=0.1 && seguridad_clave(clave)<30){
			$("#Pass").css("background-color","#ffaf7f");
		}else if(seguridad_clave(clave)>=0.3 && seguridad_clave(clave)<40){
			$("#Pass").css("background-color","#ffc976");
		}else if(seguridad_clave(clave)>=0.4 && seguridad_clave(clave)<60){
			$("#Pass").css("background-color","#fffd88");
		}else if(seguridad_clave(clave)>=0.6 && seguridad_clave(clave)<=70){
			$("#Pass").css("background-color","#eff580");
		}else if(seguridad_clave(clave)>0.7 && seguridad_clave(clave)<=90)
			$("#Pass").css("background-color","#cde762");
		else if(seguridad_clave(clave)>0.9 ){
			$("#Pass").css("background-color","#8bff65");
		}
		
	})
}