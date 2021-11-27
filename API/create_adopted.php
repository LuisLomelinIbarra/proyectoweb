<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Create</title>
</head>

<body>


<?php
    session_start();
    include($_SERVER['DOCUMENT_ROOT']."/proyectoweb/models/dbconn.php");
    include($_SERVER['DOCUMENT_ROOT']."/proyectoweb/controllers/functions.php");
    $pet_id = $_GET['petid'];
    $id = $_GET['usrid'];
    
	$query = "INSERT INTO adoptedpets (id_pet,id_adoptor,adoptionDate) VALUES ($pet_id, $id,now())";
    $statement = $conn->prepare($query);
    $success = $statement->execute();
    if($success){
        echo "success";
        
    }else {
        echo "FALLO";
    }
    header("Location: ../controllers/user_Profile.php");
    die;
?>

</body>
</html>