<?php

include($_SERVER['DOCUMENT_ROOT']."/proyectoweb/models/dbconn.php");
$table = "userinfo";
$usr = $_POST['usr'];
$pwd1 = $_POST['pwd1'];
$pwd2 = $_POST['pwd2'];

$query = "select * from $table where usr_email = '$usr' limit 1";
$statement = $conn->prepare($query);
$success = $statement->execute();
if ($success){
    $row = $statement->fetch(PDO::FETCH_ASSOC);
    //Si encontro al user row no debe de estar vacio
    if($row){
        if($pwd1==$pwd2){
            $query = "update $table SET usr_passcode = '$pwd1' where usr_email = '$usr'";
            $statement = $conn->prepare($query);
            $success = $statement->execute();
            echo "Password Reset";
        }else{
            echo "Passwords dont match";
        }
    }else{
        echo "User not found";
    }
}else{
    echo "Error in conecting to DB";
}

