<?php
    if (isset($_GET["id"])) {
        $id = $_GET["id"];

        $servername = "localhost";
        $username = "root";
        $password = "";
        $database = "canciones";
    
    // Crear conexion
    $connection = new mysqli($servername, $username, $password, $database);

    $sql = "DELETE FROM cancion WHERE IDcanciones=$id";
    $connection->query($sql);
    
    }
    header("location:tus_cansiones.php");
    exit;
?>