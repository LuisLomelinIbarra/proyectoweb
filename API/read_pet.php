<?php
    
    include($_SERVER['DOCUMENT_ROOT']."/proyectoweb/models/dbconn.php");
    
    $pet_id = $_GET['id'];
    

	$query = "SELECT * FROM petinfo INNER JOIN photopet ON petinfo.pet_id=photopet.pet_id where petinfo.pet_id=$pet_id; ";
    $statement = $conn->prepare($query);
    $success = $statement->execute();
    if($success)
        //echo "success";
        $pet = $statement -> fetch(PDO::FETCH_ASSOC);
    else {
        echo "FALLO";
    }
?>
