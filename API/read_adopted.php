<?php
    
    include($_SERVER['DOCUMENT_ROOT']."/proyectoweb/models/dbconn.php");
    
    
    
    if(isset($pet_id)){
        $query = "SELECT * FROM adoptedpets where id_pet=$pet_id; ";
        $statement = $conn->prepare($query);
        $success = $statement->execute();
        if($success)
            //echo "success";
            $isAdopted = $statement -> fetch(PDO::FETCH_ASSOC);
        else {
            $isAdopted = 0;
            echo "FALLO";
        }
    }

    $query = "SELECT pet_name, adoptionDate FROM adoptedpets INNER JOIN petinfo ON adoptedpets.id_pet=petinfo.pet_id where id_adoptor=$id; ";
    $statement = $conn->prepare($query);
    $success = $statement->execute();
    if($success)
        //echo "success";
        $adoptionList = $statement -> fetchAll(PDO::FETCH_ASSOC);
    else {
        echo "FALLO";
    }
    

	
?>
