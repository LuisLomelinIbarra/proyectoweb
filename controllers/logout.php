<?php

session_start();
if(isset($_SESSION['usr_id'])){
    unset($_SESSION['usr_id']);
    echo $_SERVER['DOCUMENT_ROOT']."/proyectoweb/controllers/log_in.php";
    header("Location: log_in.php");
    die;
}
