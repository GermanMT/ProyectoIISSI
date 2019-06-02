// Funciones de validación

	function validateForm() {
		var noValidation = document.getElementById("#formulario").novalidate;
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
		var clave = password;
		var seguridad = 0;
			if (clave.length!=0){
			   if (/[0-9]/.test(clave)){
				  seguridad += 20;
			   }
			   if (/[a-z]/.test(clave)){
				  seguridad += 10;
			   }
			   if(/[A_Z]/.test(clave)){
				seguridad += 20;
			   }
			   if (clave.length >= 4 && clave.length <= 5){
				  seguridad += 10;
			   }else{
				  if (clave.length >= 6 && clave.length <= 8){
					 seguridad += 20;
				  }else{
					 if (clave.length > 8){
						seguridad += 40;
					 }
				  }
			   }
			}
			return seguridad            
		 } 
	
	
	//Coloreado del campo de contraseña según su fortaleza
	function passwordColor(){
		var password = document.getElementById("Pass");
		var clave = password.value;
		var fortaleza = passwordStrength(clave);
		
		if(fortaleza<30){
			var type = "color1";
	   }else if(fortaleza >=30 && fortaleza<60){
			var type = "color2";
	   }else if(fortaleza>=60 && fortaleza<=90)
			var type = "color3";
	   else if(fortaleza > 90 ){
			var type = "color3";
	   }else if(passwordValidation()!=""){
		type = "color1";
	   }
	   
		password.className = type;
		return type;
	}

function validacionUsuario() {

	function validacionFormulario(){
		var exprNumero = /^([0-9])+$/;
		var exprDNI = /[0-9]{8}[A-Z]/;
		var exprEmail = /^([a-zA-Z0-9_\.\-])+\@gmail.com+$/;
		var exprTildes = /^[A-Za-záéíóúÁÉÍÓÚ\s]+$/;
		
		var DNI_Usuario = document.getElementById("DNI_Usuario");
		var Nombre = document.getElementById("Nombre");
		var Apellidos = document.getElementById("Apellidos");
		var Edad = document.getElementById("Edad");
		var Localidad = document.getElementById("Localidad");
		var TelefonoMovil = document.getElementById("TelefonoMovil");
		var TelefonoFijo = document.getElementById("TelefonoFijo");
		var Email = document.getElementById("Email");
		var NombrePadreMadre = document.getElementById("NombrePadreMadre");
		var Usuario = document.getElementById("Usuario");
		var Pass = document.getElementById("Pass");

		var resultado = true;

		if ($('#DNI_Usuario').val() == '') {
			DNI_Usuario.setCustomValidity('Introduzca su DNI');
			$('#DNI_Usuario').css("background-color", "#ffeeee");
			resultado = false;
		} else if (!($('#DNI_Usuario').val().trim().length == 9) || (!exprDNI.test($('#DNI_Usuario').val().trim()))) {
			DNI_Usuario.setCustomValidity('Introduzca un DNI válido');
			$('#DNI_Usuario').css("background-color", "#ffeeee");
			resultado = false;
		}  else {
			DNI_Usuario.setCustomValidity("");
			$('#DNI_Usuario').css("background-color", "white");
		}

		
		if ($('#Nombre').val().trim() == "") {
			Nombre.setCustomValidity("Introduzca su nombre.");
			$('#Nombre').css("background-color", "#ffeeee");
			resultado = false;
		}else if(!exprTildes.test($('#Nombre').val().trim())){
			Nombre.setCustomValidity("Introduzca un nombre válido.");
			$('#Nombre').css("background-color", "#ffeeee");
			resultado = false;
		} else {
			Nombre.setCustomValidity("");
			$('#Nombre').css("background-color", "white");
		}

		if ($('#Apellidos').val().trim() == '') {
			Apellidos.setCustomValidity('Introduzca sus apellidos.');
			$('#Apellidos').css("background-color", "#ffeeee");
			resultado = false;
		}else if(!exprTildes.test($('#Apellidos').val().trim())){
			Apellidos.setCustomValidity('Introduzca unos apellidos válidos.');
			$('#Apellidos').css("background-color", "#ffeeee");
			resultado = false;
		} else {
			Apellidos.setCustomValidity("");
			$('#Apellidos').css("background-color", "white");
		}

		if ($('#TelefonoMovil').val().trim() == '') {
			TelefonoMovil.setCustomValidity('Introduzca su número de teléfono.');
			$('#TelefonoMovil').css("background-color", "#ffeeee");
			resultado = false;
		} else if (!exprNumero.test($('#TelefonoMovil').val().trim())) {
			TelefonoMovil.setCustomValidity('Un número de teléfono solo puede contener números.');
			$('#TelefonoMovil').css("background-color", "#ffeeee");
			resultado = false;
		} else if ($('#TelefonoMovil').val().trim().length < 9) {
			TelefonoMovil.setCustomValidity('Introduzca un número de teléfono correcto');
			$('#TelefonoMovil').css("background-color", "#ffeeee");
			resultado = false;
		} else {
			TelefonoMovil.setCustomValidity("");
			$('#TelefonoMovil').css("background-color", "white");
		}

		if ($('#TelefonoFijo').val().trim() == '') {
			TelefonoFijo.setCustomValidity('Introduzca su número de teléfono.');
			$('#TelefonoFijo').css("background-color", "#ffeeee");
			resultado = false;
		} else if (!exprNumero.test($('#TelefonoFijo').val().trim())) {
			TelefonoFijo.setCustomValidity('Un número de teléfono solo puede contener números.');
			$('#Telefonofijo').css("background-color", "#ffeeee");
			resultado = false;
		} else if ($('#TelefonoFijo').val().trim().length < 9) {
			TelefonoFijo.setCustomValidity('Introduzca un número de teléfono correcto');
			$('#TelefonoFijo').css("background-color", "#ffeeee");
			resultado = false;
		} else {
			TelefonoFijo.setCustomValidity("");
			$('#TelefonoFijo').css("background-color", "white");
		}

		if ($('#Edad').val().trim() == '') {
			Edad.setCustomValidity('Introduzca su edad.');
			$('#Edad').css("background-color", "#ffeeee");
			resultado = false;
		} else if (!exprNumero.test($('#Edad').val().trim())) {
			Edad.setCustomValidity('La edad solo puede contener números.');
			$('#Edad').css("background-color", "#ffeeee");
			resultado = false;
		}else if ($('#Edad').val().trim() <  0 || $('#Edad').val().trim() >  100) {
			Edad.setCustomValidity('Introduzca su edad correcta');
			$('#Edad').css("background-color", "#ffeeee");
			resultado = false;
		}

		if ($('#Email').val().trim() == '') {
			Email.setCustomValidity('Introduzca su email.');
			$('#Email').css("background-color", "#ffeeee");
			resultado = false;
		} else if (!exprEmail.test($('#Email').val().trim())) {
			Email.setCustomValidity('Introduzca un email correcto.');
			$('#Email').css("background-color", "#ffeeee");
			resultado = false;
		} else {
			Email.setCustomValidity("");
			$('#Email').css("background-color", "white");
		}

		if ($('#Localidad').val().trim() == '') {
			Localidad.setCustomValidity('Introduzca su Localidad');
			$('#Localidad').css("background-color", "#ffeeee");
			resultado = false;
		} else {
			Localidad.setCustomValidity("");
			$('#Localidad').css("background-color", "white");
		}

		if ($('#NombrePadreMadre').val().trim() == "") {
			NombrePadreMadre.setCustomValidity("Introduzca su nombre.");
			$('#NombrePadreMadre').css("background-color", "#ffeeee");
			resultado = false;
		}else if(!exprTildes.test($('#NombrePadreMadre').val().trim())){
			NombrePadreMadre.setCustomValidity("Introduzca un nombre válido.");
			$('#NombrePadreMadre').css("background-color", "#ffeeee");
			resultado = false;
		} else {
			NombrePadreMadre.setCustomValidity("");
			$('#NombrePadreMadre').css("background-color", "white");
		}

		if ($('#Usuario').val().trim() == "") {
			Usuario.setCustomValidity("Introduzca su usuario.");
			$('#Usuario').css("background-color", "#ffeeee");
			resultado = false;
		}else {
			Usuario.setCustomValidity("");
			$('#Usuario').css("background-color", "white");
		}


		if ($("#Pass").val() == "") {
			Pass.setCustomValidity('Debes poner una contraseña.');
			$('#Pass').css("background-color", "#ffeeee");
			resultado = false;
		} else if ($("#Pass").val().length < 8) {
			Pass.setCustomValidity('La contraseña debe tener al menos 8 caracteres.');
			$('#Pass').css("background-color", "#ffeeee");
			resultado = false;
		} else if (!/[a-z]+/.test($("#Pass").val()) || !/[A-Z]+/.test($("#Pass").val()) || !/[0-9]+/.test($("#Pass").val())) {
			Pass.setCustomValidity('La contraseña debe incluir mayusculas, minusculas y un número.');
			$('#Pass').css("background-color", "#ffeeee");
			resultado = false;
		} else if ($("#Pass").val() != $("#confirmpass").val()) {
			Pass.setCustomValidity('La contraseña debe coincidir con la confirmacion de contraseña.');
			$('#Pass').css("background-color", "#ffeeee");
			$('#confirmpass').css("background-color", "#ffeeee");
			resultado = false;
		} else {
			Pass.setCustomValidity('');
			$('#Pass').css("background-color", "white");
			$('#confirmPass').css("background-color", "white");
		}

		return resultado;

	}

	$('.enviar').click(function() {
		validacionFormulario();
	})


}