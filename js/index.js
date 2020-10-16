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