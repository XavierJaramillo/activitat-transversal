/* NAV */
/* Toggle between adding and removing the "responsive" class to topnav when the user clicks on the icon */
function myFunction() {
    var x = document.getElementById("myTopnav");
    if (x.className === "topnav") {
        x.className += " responsive";
    } else {
        x.className = "topnav";
    }
}

function sobremi() {
    document.getElementById('misServiciosDiv').style.display = "none";
    document.getElementById('misProyectosDiv').style.display = "none";
    document.getElementById('sobremiDiv').style.display = "block";
}

function misservicios() {
    document.getElementById('misProyectosDiv').style.display = "none";
    document.getElementById('sobremiDiv').style.display = "none";
    document.getElementById('misServiciosDiv').style.display = "block";
}

function misproyectos() {
    document.getElementById('sobremiDiv').style.display = "none";
    document.getElementById('misServiciosDiv').style.display = "none";
    document.getElementById('misProyectosDiv').style.display = "block";
}

// VALIDACIONS
function validarDNI() {
    var dni = document.getElementById('dni').value;
    var dniInput = document.getElementById('dni');

    var dni_letters = "TRWAGMYFPDXBNJZSQVHLCKE";
    var letter = dni_letters.charAt(parseInt(dni, 10) % 23);

    if (letter == dni.charAt(8)) {
        return true;
    }
    dniInput.style.border = "2px solid red";

    return false;
}

function validarFor() {
    // variables 
    var email = document.getElementById("email").value;
    var nombre = document.getElementById("nom").value;
    var dni = document.getElementById("dni").value;
    var apellido = document.getElementById("primerCognom").value;
    var apellido2 = document.getElementById("segonCognom").value;
    var fecha = document.getElementById("data").value;

    if (dni == '') {
        document.getElementById("dni").style.border = "2px solid red";
    }
    if (nombre == '') {
        document.getElementById("nom").style.border = "2px solid red";
    }
    if (apellido == '') {
        document.getElementById("primerCognom").style.border = "2px solid red";
    }
    if (apellido2 == '') {
        document.getElementById("segonCognom").style.border = "2px solid red";
    }
    if (email == '') {
        document.getElementById("email").style.border = "2px solid red";
    }
    if (fecha == '') {
        document.getElementById("data").style.border = "2px solid red";
    }

    if (dni != '') {
        document.getElementById("dni").style.border = "white";
    }
    if (nombre != '') {
        document.getElementById("nom").style.border = "white";
    }
    if (apellido != '') {
        document.getElementById("primerCognom").style.border = "white";
    }
    if (apellido2 != '') {
        document.getElementById("segonCognom").style.border = "white";
    }
    if (email != '') {
        document.getElementById("email").style.border = "white";
    }
    if (fecha != '') {
        document.getElementById("data").style.border = "white";
    }

    var flag = validarDNI();
    if (!flag) {
        document.getElementById("dni").style.border = "2px solid red";
    } else {
        document.getElementById("dni").style.border = "transparent";

    }

    if (dni == '' || nombre == '' || apellido == '' || apellido2 == '' || email == '' || fecha == '') {
        document.getElementsByClassName('message').innerHTML = '<p style="color:red">Rellene los campos obligatorios.</p>';
        return false
    }

    return true;
}