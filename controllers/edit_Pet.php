<?php
    session_start();
    include($_SERVER['DOCUMENT_ROOT']."/proyectoweb/models/dbconn.php");
    include($_SERVER['DOCUMENT_ROOT']."/proyectoweb/controllers/functions.php");
    $user_data = check_login($conn)[0];

    $id = $user_data['usr_id'];
    $query = "select usr_dir from photosuser where usr_id = '$id' and usr_photoname = 'profpic' limit 1";
    $statement = $conn->prepare($query);
    $success = $statement->execute();
    $pet_id = $_GET['id'];
    if ($success) {
        $row = $statement->fetch(PDO::FETCH_ASSOC);
        $rest = $row["usr_dir"];
    }

    
    include($_SERVER['DOCUMENT_ROOT']."/proyectoweb/views/editPet.html");

?>