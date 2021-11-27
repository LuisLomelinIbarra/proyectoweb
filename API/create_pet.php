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

    $name=$_POST['name'];
    $age=$_POST['age'];
    $gender=(!isset($_POST['gender'])) ? "Not defined" : $_POST['gender'];
    $type=(!isset($_POST['type'])) ? "Other" : $_POST['type'];
    $breed=($_POST['breed'] == "") ? "Not defined" : $_POST['breed'];
    $color=(!isset($_POST['color'])) ? "Other" : $_POST['color'];
    $compt=($_POST['compt'] == "") ? "Not defined" : $_POST['compt'];
    $vacc=(!isset($_POST['vacc'])) ? 0 : $_POST['vacc'];
    $hist=($_POST['hist'] == "") ? "Not defined" : $_POST['hist'];

	$query = "INSERT INTO petinfo (pet_posterid, pet_name, pet_age, pet_type, pet_breed, pet_color, pet_story, isVaccinated, compatibility, pet_gender) VALUES ('$pet_posterid', '$name', '$age', '$type', '$breed', '$color', '$hist', '$vacc', '$compt', '$gender')";
    $statement = $conn->prepare($query);
    $success = $statement->execute();
    if($success){
        echo "success";
        $uploaddir = "../photos/user/" . $user_data['usr_username'].'/';
        $table = 'petinfo';
        $query = "select * from $table where pet_posterid = '$pet_posterid' AND pet_name='$name' AND pet_age='$age' AND pet_type='$type' AND pet_breed='$breed' AND pet_color='$color' AND compatibility='$compt' AND isVaccinated='$vacc' AND pet_gender='$gender';";
        $statement = $conn->prepare($query);
        $success = $statement->execute();
        $row = $statement->fetch(PDO::FETCH_ASSOC);      
        $petid = $row['pet_id'];
        if($_FILES['photo']['name'] != ""){
            $uploadfile = $uploaddir . basename($_FILES['photo']['name']);
        //echo $uploaddir;
            move_uploaded_file($_FILES['photo']['tmp_name'], $uploadfile);
        
            $table = "photopet";
            $query = "insert into $table (pet_id,pet_photoname,pet_dir) values ('$petid','photo','$uploadfile');";
            $statement = $conn->prepare($query);
            $success = $statement->execute();
        }else{
            $uploadfile = "../resources/Assets/logo.png";
        //echo $uploaddir;
            
        
            $table = "photopet";
            $query = "insert into $table (pet_id,pet_photoname,pet_dir) values ('$petid','photo','$uploadfile');";
            $statement = $conn->prepare($query);
            $success = $statement->execute();
        }
    }else {
        echo "FALLO";
    }
    header("Location: ../controllers/forum_.php");
    die;
?>

</body>
</html>