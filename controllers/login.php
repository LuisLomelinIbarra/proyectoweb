<?php
session_start();
include($_SERVER['DOCUMENT_ROOT']."/proyectoweb/models/dbconn.php");
include($_SERVER['DOCUMENT_ROOT']."/proyectoweb/controllers/functions.php");
include($_SERVER['DOCUMENT_ROOT']."/proyectoweb/models/dbconn.php");
$table = "userinfo";
$usr = $_POST['usr'];
$pwd = $_POST['pwd'];
//echo " PWD : $pwd USR:   $usr";
$query = "select * from $table where usr_email = '$usr' limit 1";
$statement = $conn->prepare($query);
$success = $statement->execute();
if ($success){
    $row = $statement->fetch(PDO::FETCH_ASSOC);
    //Si encontro al user row no debe de estar vacio
    if($row){
        if($row['usr_passcode']==$pwd){
            $_SESSION['usr_id'] = $row['usr_id'];
            
            echo "Login successful";
        }else{
            echo "Login credentials invalid";
        }
    }else{
        echo "Login credentials invalid";
    }
}else{
    echo "Error in conecting to DB";
}
