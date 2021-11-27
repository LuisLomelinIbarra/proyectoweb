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
    $user_data = check_login($conn)[0];
    
    $pet_posterid = $user_data['usr_id'];
    $pet_id = $_GET['id'];
    include($_SERVER['DOCUMENT_ROOT']."/proyectoweb/API/read_pet.php");
    
    $name=($_POST['name'] == "") ? $pet['pet_name'] : $_POST['name'];
    $age=($_POST['age'] == "") ? $pet['pet_age'] : $_POST['age'];
    $gender=(!isset($_POST['gender'])) ? $pet['pet_gender'] : $_POST['gender'];
    $type=(!isset($_POST['type'])) ? $pet['pet_type'] : $_POST['type'];
    $breed=($_POST['breed'] == "") ? $pet['pet_breed'] : $_POST['breed'];
    $color=(!isset($_POST['color'])) ? $pet['pet_color'] : $_POST['color'];
    $compt=($_POST['compt'] == "") ? $pet['compatibility'] : $_POST['compt'];
    $vacc=(!isset($_POST['vacc'])) ? $pet['isVaccinated'] : $_POST['vacc'];
    $hist=($_POST['hist'] == "") ? $pet['pet_story'] : $_POST['hist'];

	$query = "UPDATE petinfo SET pet_posterid='$pet_posterid', pet_name='$name', pet_age='$age', pet_type='$type', pet_breed='$breed', pet_color = '$color', pet_story='$hist', isVaccinated = '$vacc', compatibility='$compt', pet_gender='$gender' where pet_id='$pet_id';";
    $statement = $conn->prepare($query);
    $success = $statement->execute();
    if($success){
        echo "success";
        
        if($_FILES['photo']['name'] != ""){
            $uploaddir = "../photos/user/" . $user_data['usr_username'].'/';
            $uploadfile = $uploaddir . basename($_FILES['photo']['name']);
        //echo $uploaddir;
            move_uploaded_file($_FILES['photo']['tmp_name'], $uploadfile);
        
            $table = "photopet";
            $query = "UPDATE $table set pet_dir='$uploadfile' where pet_id='$pet_id';";
            $statement = $conn->prepare($query);
            $success = $statement->execute();
        }
    }else {
        echo "FALLO";
    }
    header("Location: ../controllers/pet_Profile.php?id=$pet_id");
    die;
?>

</body>
</html>