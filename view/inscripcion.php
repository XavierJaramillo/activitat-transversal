<!doctype html>
<html lang="es">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/7.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css" integrity="sha256-46qynGAkLSFpVbEBog43gvNhfrOj+BmwXdxFgVK/Kvc=" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Lora:wght@400;700&family=Roboto+Slab:wght@400;700&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

    <!-- CSS -->
    <link rel="stylesheet" href="../css/style.css">

    <!-- TEXT FONT -->
    <link href="https://fonts.googleapis.com/css2?family=Lora:wght@400;700&family=Roboto+Slab:wght@400;700&display=swap" rel="stylesheet">

    <title>XavierDev > Portfolio</title>
</head>

<body>

    <?php
    include_once "../model/funciones.php";
    if(isset($_POST["dni"])) {
        $dbDAO = new dbDAO();
        $dbDAO->addInscripcion();
    }
    ?>

    <!-- NAV -->
    <header id="header">
        <nav class="navbar sticky-top navbar-dark bg-dark navbar-expand-sm">
            <a class="navbar-brand" href="index.html">
                <img src="../img/logo.png" width="130" height="80" alt="Logo">
            </a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="navbar-collapse collapse justify-content-center" id="navbarNavDropdown">
                <div class="navbar-nav text-center">
                    <a class="nav-item nav-link" href="./index.html">Inici</a>
                    <a class="nav-item nav-link" href="#">Classificacions</a>
                    <a class="nav-item nav-link" href="../view/inscripcion.php">Inscripcions</a>
                    <a class="nav-item nav-link" href="#">Noticies</a>
                    <a class="nav-item nav-link" href="#">Galeria</a>
                </div>
            </div>

            <div class="botonesDerecha justify-content-right" id="navbarNavDropdown">
                <select name="idioma" id="idioma">
                        <option value="catalan">Català</option>
                        <option value="castellano">Castellano</option>
                        <option value="ingles">English</option>
                    </select>
                <button class="btn btn-secondary">Enviar</button>
            </div>

        </nav>
    </header>

    <div class="inscripcioDiv container-fluid py-5 px-5">

    <div class="row inscRow">
        <div class="col m-auto px-5 colImg">
            <img src="../img/imgInsc.png" class="img-fluid rounded" alt="Responsive image">
        </div>
        <div class="col m-auto px-5">
            <form id='form' action="./inscripcion.php" method="POST">
                <div class="container">
                    <div class="row">
                        <div class="col form-group"">
                        <p style="color:black;font-weight:bold;font-size:25px">Omple les teves dades!</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col form-group">
                            <input type="text" class="form-control" name="dni" id="dni" onfocusout="validarDNI()" placeholder="DNI">
                        </div>
                        <div class="col form-group">
                            <input type="text" class="form-control" name="nom" id="nom" placeholder="Nom...">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col form-group">
                            <input type="text" class="form-control" name="primerCognom" id="primerCognom" placeholder="Primer cognom...">
                        </div>
                        <div class="col form-group">
                            <input type="text" class="form-control" name="segonCognom" id="segonCognom" placeholder="Segon cognom...">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col form-group">
                            <input type="email" class="form-control" name="email" id="email" aria-describedby="emailHelp" placeholder="Email...">
                        </div>
                        <div class="col form-group">
                            <input type="date" class="form-control" name="data" id="data">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col form-group">
                        <select name="genere" class="form-control">
                            <option value="Home" selected>Home</option>
                            <option value="Dona">Dona</option>
                        </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col form-group">
                            <label style="color:black"><input type="checkbox" id="discapacitat" name="discapacitat" value="discapacitat"> Discapacitat</label><br>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col form-group">
                            <button name="button" type="submit" class="btn btn-primary">Registrar</button>
                        </div>
                        <div class="col form-group message">
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

    </div>

    <!-- Footer -->
    <footer class="page-footer font-small special-color-dark pt-4">

    <div class="container">
        <ul class="list-unstyled list-inline text-center">
            <li class="list-inline-item">
                <a href="#" class="btn-floating btn-fb mx-1">
                    <i class="fab fa-facebook-f"> </i>
                </a>
            </li>
            <li class="list-inline-item">
                <a href="#" class="btn-floating btn-tw mx-1">
                    <i class="fab fa-twitter"> </i>
                </a>
            </li>
            <li class="list-inline-item">
                <a href="#" class="btn-floating btn-dribbble mx-1">
                    <i class="fab fa-instagram"> </i>
                </a>
            </li>
        </ul>
    </div>

    <!-- Copyright -->
    <div class="footer-copyright text-center py-3">© 2020 Copyright:
        <a href="./index.html"> JaramilloDev</a>
    </div>

    </footer>

    <!--JS SRC-->
    <script src="../js/index.js"></script>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>

</html>