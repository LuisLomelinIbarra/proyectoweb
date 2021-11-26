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
    $gender=($_POST['gender'] == "Choose...") ? "Not defined" : $_POST['gender'];
    $type=($_POST['type'] == "Choose...") ? "Other" : $_POST['type'];
    $breed=($_POST['breed'] == "") ? "Not defined" : $_POST['breed'];
    $color=($_POST['type'] == "Choose...") ? "Other" : $_POST['color'];
    $compt=($_POST['compt'] == "") ? "Not defined" : $_POST['compt'];
    $vacc=($_POST['vacc'] == "Yes") ? 1 : 0;
    $hist=($_POST['hist'] == "") ? "Not defined" : $_POST['hist'];

	$query = "INSERT INTO petinfo (pet_posterid, pet_name, pet_age, pet_type, pet_breed, pet_color, pet_story, isVaccinated, compatibility, pet_gender) VALUES ('$pet_posterid', '$name', '$age', '$type', '$breed', '$color', '$hist', '$vacc', '$compt', '$gender')";
    $statement = $conn->prepare($query);
    $success = $statement->execute();
    if($success)
        echo "success";
    else {
        echo "FALLO";
    }
    header("Location: ../controllers/post_Pet.php");
    die;
?>

</body>
</html>