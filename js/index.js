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
    var flag = true;

    if (letter == dni.charAt(8)) {
        dniInput.style.borderColor = 'transparent';
    } else {
        dniInput.style.borderColor = 'red';
        flag = false;
    }

    return flag;
}

function validarFor(event) {
    var inputs = document.getElementsByTagName('input');
    var flag = true;

    for (var i = 0; i < inputs.length; i++) {
        console.log(inputs[i].id)
        if (inputs[i].type == 'text' && inputs[i].value == "") {
            inputs[i].style.borderColor = "red";
            flag = false;
        } else if (inputs[i].type == 'email' && inputs[i].value == "") {
            inputs[i].style.borderColor = "red";
            flag = false;
        } else if (inputs[i].type == 'date' && inputs[i].value == "") {
            inputs[i].style.borderColor = "red";
            flag = false;
        } else {
            if (inputs[i].id != "dni") {
                inputs[i].style.borderColor = "transparent";
            }
        }
    }

    if (!validarDNI || !flag) {
        event.preventDefault();
    }
}