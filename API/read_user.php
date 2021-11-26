<?php

require "../models/dbconn.php";

if (isset($_POST['submit'])) {

    $sql = "SELECT * 
            FROM userinfo
            WHERE usr_id = :id";

    try{
        $statement = $conn -> prepare($sql);
        $statement -> bindParam( ':id',  $_POST['id'], PDO::PARAM_STR);
        $statement -> execute();

        $result = $statement -> fetchAll();
    }
    catch(PDOException $error){
        echo $error -> getMessage();
    }
}else{
    
    $sql = "SELECT * 
            FROM userinfo
            WHERE usr_id = $userid";

    try{
        $statement = $conn -> prepare($sql);
        
        $statement -> execute();

        $result = $statement -> fetch();
    }
    catch(PDOException $error){
        echo $error -> getMessage();
    }
}
?>



