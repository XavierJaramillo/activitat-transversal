<?php

class dbDAO {
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
            $genere = $_POST['genere'];
            $edat = date_diff(date_create($data), date_create('now'))->y;

            // INSERTEM EL PARTICIPANT
            $query = "INSERT INTO `tbl_participant` (`id_participant`, `dni_participant`, `nom_participant`, `primer_cognom`, `segon_cognom`, `data_naixement`, `email_participant`, `sexe_participant`) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?);";
            $sentencia=$this->pdo->prepare($query);
            
            $sentencia->bindParam(1,$dni);
            $sentencia->bindParam(2,$nom);
            $sentencia->bindParam(3,$pCognom);
            $sentencia->bindParam(4,$sCognom);
            $sentencia->bindParam(5,$data);
            $sentencia->bindParam(6,$email);
            $sentencia->bindParam(7,$genere);

            $sentencia->execute();
            $id_participante = $this->pdo->lastInsertId();

            // INSERTEM INSCRIPCIO
            $query = "INSERT INTO `tbl_inscripcio`(`dorsal_participant`, `id_participant`, `id_cursa`, `id_categoria`, `isPagado`) VALUES (NULL,?,1,?,'No')";
            $sentencia=$this->pdo->prepare($query);
            
            $sentencia->bindParam(1,$id_participante);

            if($edat>=0 && $edat<=6 && $genere=="Home") {
                $id_categoria = 1;
            } else if($edat>=7 && $edat<=10 && $genere=="Home") {
                $id_categoria = 2;
            } else if($edat>=11 && $edat<=20 && $genere=="Home") {
                $id_categoria = 3;
            } else if($edat>=21 && $edat<=50 && $genere=="Home") {
                $id_categoria = 4;
            } else if($edat>=51 && $edat<=100 && $genere=="Home") {
                $id_categoria = 5;
            } else if($categoria == "Discapacitat" && $genere=="Home") {
                $id_categoria = 11;
            } else if($edat>=0 && $edat<=6 && $genere=="Dona") {
                $id_categoria = 5;
            } else if($edat>=7 && $edat<=10 && $genere=="Dona") {
                $id_categoria = 6;
            } else if($edat>=11 && $edat<=20 && $genere=="Dona") {
                $id_categoria = 7;
            } else if($edat>=21 && $edat<=50 && $genere=="Dona") {
                $id_categoria = 8;
            } else if($edat>=51 && $edat<=100 && $genere=="Dona") {
                $id_categoria = 9;
            } else if($categoria == "Discapacitat" && $genere=="Dona") {
                $id_categoria = 12;
            }
            $sentencia->bindParam(2,$id_categoria);

            $sentencia->execute();

            $this->pdo->commit();            

        } catch (Exception $e) {
            $this->pdo->rollBack();
            echo $e;
        }
    }

}