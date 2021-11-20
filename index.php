<?php
    session_start();
    include($_SERVER['DOCUMENT_ROOT']."/proyectoweb/models/dbconn.php");
    include($_SERVER['DOCUMENT_ROOT']."/proyectoweb/controllers/functions.php");
    $user_data = check_login($conn);

?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title> AmiGO</title>
    </head>
    <body>
        <a href="controllers/logout.php">Logout</a>
        <h1>This is the index page</h1>

        <br>

        
    </body>
</html>