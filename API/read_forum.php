<?php

    session_start();
    include($_SERVER['DOCUMENT_ROOT']."/proyectoweb/models/dbconn.php");
    include($_SERVER['DOCUMENT_ROOT']."/proyectoweb/controllers/functions.php");
    $user_data = check_login($conn)[0];
    $return_arr = array(); /* Guardará la info de cada entrada */

    $query =  "SELECT * FROM petinfo INNER JOIN photopet ON petinfo.pet_id=photopet.pet_id;";
    $statement = $conn->prepare($query);
    $success = $statement->execute();

    if($success == false){
        echo "fail";
        die;
    } else {
        while($row = $statement->fetch(PDO::FETCH_ASSOC)){
            $return_arr[] = array(
                "id" => $row['pet_id'],
                "img" =>  (".." . substr($row['pet_dir'], 27)),
                "type" => strtolower($row['pet_type']),
            );
        }
        echo json_encode($return_arr);
    }

?>