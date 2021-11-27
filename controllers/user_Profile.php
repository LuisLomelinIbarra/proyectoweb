<?php
    session_start();
    include($_SERVER['DOCUMENT_ROOT']."/proyectoweb/models/dbconn.php");
    include($_SERVER['DOCUMENT_ROOT']."/proyectoweb/controllers/functions.php");
    $user_data = check_login($conn)[0];

    $id = $user_data['usr_id'];
    $query = "select usr_dir from photosuser where usr_id = '$id' and usr_photoname = 'profpic' limit 1";
    $statement = $conn->prepare($query);
    $success = $statement->execute();

    if ($success) {
        $row = $statement->fetch(PDO::FETCH_ASSOC);
        if(!isset($row["usr_dir"]) || $row["usr_dir"] == '-' ){
            $rest = "../resources/Assets/account.png";
        }else{
            $rest =  $row["usr_dir"];
        }
        
        
    }

    include($_SERVER['DOCUMENT_ROOT'] . "/proyectoweb/API/read_adopted.php");


    include($_SERVER['DOCUMENT_ROOT']."/proyectoweb/views/userProfile.html");

?>