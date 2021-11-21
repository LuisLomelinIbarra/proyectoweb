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
}
?>

<?php
if (isset($_POST['submit'])) {
    if ($result && $statement -> rowCount() > 0) { ?>

        <h2>Results</h2>

        <table>
            <thread>
                <tr>
                    <th>id</th>
                    <th>Nombre</th>
                    <th>email</th>
                </tr>
            </thread>
            <tbody>
                <?php foreach ($result as $fila) : ?>
                    <tr>
                        <td><?php echo $fila["id"]; ?></td>
                        <td><?php echo $fila["Nombre"]; ?></td>
                        <td><?php echo $fila["email"]; ?></td>
                    </tr>
                <?php endforeach; ?>
                </tbody>
                </table> 
                <?php }
                else { ?>
                    <blockquote>There's no users with this id <?php echo $_POST['id']; ?>.</blockquote>
                <?php }
} ?>

<h2>Search a user by id</h2>

<form method="post">
    <label for="id">id</label>
    <input type="text" id="id" name="id">
    <input type="submit" name="submit" value="search">
</form>

