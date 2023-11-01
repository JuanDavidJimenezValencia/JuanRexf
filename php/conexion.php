<?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $bd = "canciones";
    // Create connection
    $conexion = mysqli_connect($servername, $username, $password, $bd);
    // Check connection
    if (!$conexion) {
        die("Conexión fallida: " . mysqli_connect_error());
    }
    echo "Conexión establecida";
?>