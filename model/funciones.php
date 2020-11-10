<?php

class objetoDAO {
    // ATRIBUTOS
    private $pdo;

    // CONSTRUCTOR
    public function __construct(){
        include '../db/connection.php';
        $this->pdo=$pdo;
    }

    function addInscripcion() {
        include_once '../db/connection.php';
        
        try {
            $this->pdo->beginTransaction();
            $dni = $_POST['dni'];
            $nom = $_POST['nom'];
            $pCognom = $_POST['primerCognom'];
            $sCognom = $_POST['segonCognom'];
            $data = $_POST['data'];
            $email = $_POST['email'];
            $genere = $_POST['genero'];
            $categoria = $_POST['categoria'];

            $birthDate = explode("/", $data);
            //get age from date or birthdate
            $edat = (date("md", date("U", mktime(0, 0, 0, $birthDate[0], $birthDate[1], $birthDate[2]))) > date("md")
                ? ((date("Y") - $birthDate[2]) - 1)
                : (date("Y") - $birthDate[2]));
            echo "Age is:" . $age;

            if ($idMantenimiento != NULL) {
                // INICIAMOS LA CATEGORIA
                $query = "INSERT INTO `tbl_categoria`(`id_categoria`, `nombre_categoria`, `rango_edad`, `sexo_categoria`) VALUES (NULL, ?, ?, ?, ?)";
                $sentencia=$this->pdo->prepare($query);
                
                if($edat>0 && $edat<=6) {
                    $sentencia->bindParam(1,'Alevin');
                } else if($edat>=7 && $edat<=10) {
                    $sentencia->bindParam(1,'Infantil');
                } else if($edat>=11 && $edat<=20) {
                    $sentencia->bindParam(1,'Cadete');
                } else if($edat>=21 && $edat<=50) {
                    $sentencia->bindParam(1,'Juvenil');
                } else if($edat>=51 && $edat<=100) {
                    $sentencia->bindParam(1,'Senior');
                } else {
                    $sentencia->bindParam(1,'Discapacitat');
                }
                
                $sentencia->bindParam(2,$categoria);
                $sentencia->bindParam(3,$genere);
                
                $sentencia->execute();
                // $id_categoria = $sentencia

                // INICIAMOS EL PARTICIPANT
                $query = "INSERT INTO `tbl_participant`(`id_participant`, `data_naixement`, `sexe`, `dorsal_participant`, `id_categoria`) VALUES (NULL, ?, ?, ?, ?)";
                $sentencia=$this->pdo->prepare($query);
                
                $sentencia->bindParam(1,$date);
                $sentencia->bindParam(2,$genere);
                $sentencia->bindParam(3,$dorsal);
                
                $sentencia->execute();

                $this->pdo->commit();
                header('Location: ../view/index.html');
            }else {
                echo "<p class='msgMantenimiento'>Usted no es de mantenimiento</p>";
                echo "<div class='btnVolverDiv'><a href='../view/zonaRestaurante.php?espacio={$espacio}' class='btnVolver'>Volver</a></div>";
            }

        } catch (Exception $e) {
            $this->pdo->rollBack();
            echo $e;
        }
    }

}