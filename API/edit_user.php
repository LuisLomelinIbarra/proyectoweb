<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Edit</title>
</head>

<body>


<?php
    session_start();
    include($_SERVER['DOCUMENT_ROOT']."/proyectoweb/models/dbconn.php");
    include($_SERVER['DOCUMENT_ROOT']."/proyectoweb/controllers/functions.php");
    $user_data = check_login($conn)[0];

    $id = $user_data['usr_id'];

    $name=($_POST['name'] == "") ? $user_data['usr_name'] : $_POST['name'];
    $age=($_POST['age'] == "") ? $user_data['usr_age'] : $_POST['age'];
    $phone=($_POST['phone'] == "") ? $user_data['usr_phone'] : $_POST['phone'];
    $email=($_POST['email'] == "") ? $user_data['usr_email'] : $_POST['email'];

	$query = "UPDATE userinfo SET usr_name='$name',usr_age='$age',usr_phone='$phone',usr_email='$email' WHERE usr_id=$id;";
    $statement = $conn->prepare($query);
    $success = $statement->execute();
    if($success){
        echo "success";
                if($_FILES['photo']['name']!=""){
                    $uploaddir = "../photos/user/" . $user_data['usr_username'] .'/';
                    $table = "photosuser";
                    $uploadfile = $uploaddir . basename($_FILES['picture']['name']);
                    //echo $uploaddir;
                    move_uploaded_file($_FILES['picture']['tmp_name'], $uploadfile);
                    $query = "UPDATE $table set usr_dir='$uploadfile' where usr_id = '$id' and usr_photoname ='profpic';";
                    $statement = $conn->prepare($query);
                    $success = $statement->execute();
                    $row = $statement->fetch(PDO::FETCH_ASSOC);
                }
                
                
                
    }else {
        echo "FALLO";
    }
    header("Location: ../controllers/user_Profile.php");
    die;
?>

</body>
</html>