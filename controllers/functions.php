<?php



function check_login($conn){
    if(isset($_SESSION['usr_id'])){
        
        $table = "userinfo";
        $idvar = "usr_id";
        $id = $_SESSION['usr_id'];
        $query = "select * from $table where $idvar = '$id' limit 1;";
        $statement = $conn->prepare($query);
        $success = $statement->execute();
        if ($success){
            $rows = $statement->fetchAll(PDO::FETCH_ASSOC);
            if($rows){
                return $rows;
            }
        }
    }

    header("Location: controllers/log_in.php");
    die;

}


?>