
function validacionCurso() {

    function validacionFormularioCurso(){
     
        var exprFecha = /^\d{2}\/\d{2}\/\d{4}+$/;
        var exprId = /^([a-zA-Z0-9_\.\-])+$/;

        var Fecha_Inicio = document.getElementById("Fecha_Inicio");
        var Fecha_Fin = document.getElementById("Fecha_Fin");
        var Id_Curso = document.getElementById("Id_Curso");
       
    
        var resultado = true;
    
        
        if ($('#Fecha_Inicio').val().trim() == "") {
            Fecha_Inicio.setCustomValidity("Introduzca la fecha de inicio.");
            $('#Fecha_Inicio').css("background-color", "#ffeeee");
            resultado = false;
        }else if(!exprFecha.test($('#Fecha_Inicio').val().trim())){
            Fecha_Inicio.setCustomValidity("Introduzca una fecha válida (dd/MM/yyyy).");
            $('#Fecha_Inicio').css("background-color", "#ffeeee");
            resultado = false;
        } else {
            Fecha_Inicio.setCustomValidity("");
            $('#Fecha_Inicio').css("background-color", "white");
        }

        if ($('#Fecha_Fin').val().trim() == "") {
            Fecha_Fin.setCustomValidity("Introduzca la fecha de fin.");
            $('#Fecha_FIn').css("background-color", "#ffeeee");
            resultado = false;
        }else if(!exprFecha.test($('#Fecha_Fin').val().trim())){
            Fecha_Fin.setCustomValidity("Introduzca una fecha válida (dd/MM/yyyy).");
            $('#Fecha_Fin').css("background-color", "#ffeeee");
            resultado = false;
        } else {
            Fecha_Fin.setCustomValidity("");
            $('#Fecha_Fin').css("background-color", "white");
        }
    
        if ($('#Id_Curso').val().trim() == '') {
            Id_Curso.setCustomValidity('Introduzca un Id para el curso.');
            $('#Id_Curso').css("background-color", "#ffeeee");
            resultado = false;
        }else if(!exprId.test($('#Id_Curso').val().trim())){
            Id_Curso.setCustomValidity('Introduzca unos Id para el curso válido.');
            $('#Id_Curso').css("background-color", "#ffeeee");
            resultado = false;
        } else {
            Id_Curso.setCustomValidity("");
            $('#Id_Curso').css("background-color", "white");
        }
    
        return resultado;
    
    }
    
    $('.enviar').click(function() {
        validacionFormularioCurso();
    })
    
}