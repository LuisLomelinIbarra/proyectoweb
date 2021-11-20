<?php

header("Content-type: multipart/form-data");
include($_SERVER['DOCUMENT_ROOT']."/proyectoweb/models/dbconn.php");
$table = "userinfo";

//var_dump($_POST);
//echo $_POST['usr'];
//var_dump($_FILES);
$usr = $_POST['usr'];
$pwd = $_POST['pwd'];
$email = $_POST['email'];
$phone = $_POST['phone'];
$age = $_POST['age'];
$fname = $_POST['fullname'];



$query = "select * from $table where usr_username = '$usr' limit 1";
$statement = $conn->prepare($query);
$success = $statement->execute();
if ($success){
    $row = $statement->fetch(PDO::FETCH_ASSOC);
    //Si encontro al user row no debe de estar vacio
    if(!$row){
        $query = "insert into $table (usr_name, usr_age, usr_phone, usr_email, usr_passcode,usr_username) values ('$fname',$age, $phone, '$email', '$pwd','$usr');";
        $statement = $conn->prepare($query);
        $success = $statement->execute();
        if ($success){
            if(file_exists($_FILES['profpic']['tmp_name'])){
                $uploaddir = $_SERVER['DOCUMENT_ROOT']."/proyectoweb/photos/user/" . $usr.'/';
                mkdir($uploaddir, 0777, true);

                $uploadfile = $uploaddir . basename($_FILES['profpic']['name']);
                //echo $uploaddir;
                move_uploaded_file($_FILES['profpic']['tmp_name'], $uploadfile);
                $query = "select * from $table where usr_username = '$usr' limit 1";
                $statement = $conn->prepare($query);
                $success = $statement->execute();
                $row = $statement->fetch(PDO::FETCH_ASSOC);
                
                $usrid = $row['usr_id'];
                ;
                $table = "photosuser";
                $query = "insert into $table (usr_id,usr_photoname,usr_dir) values ('$usrid','profpic','$uploadfile');";
                $statement = $conn->prepare($query);
                $success = $statement->execute();
            }
            
            echo "User Created";
            
            die;
        }else{
            echo "Failed to add the user to the database";
        }
    }else{
        echo "Username is invalid or is in use, please choose another one";
        
    }
}else{
    echo "Error in connecting with the db"; //An error message just in case
}


