<?php
// Configuración de la conexión a la base de datos
$servername = "localhost";
$username = "root";
$password = "";
$bd = "canciones";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $bd);

// Verificar la conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Recoger datos del formulario
$nombreCancion = $_POST['nombre_cancion'];
$artista = $_POST['artista'];
$genero = $_POST['genero'];

// Subir archivo de canción
$archivoCancion = $_FILES['archivo_cancion']['name'];
$archivoCancionTemp = $_FILES['archivo_cancion']['tmp_name'];
$carpetaDestino = "sube_tu_cancion";

// Mover el archivo a la carpeta de destino
move_uploaded_file($archivoCancionTemp, $carpetaDestino . $archivoCancion);

// Insertar datos en la base de datos
$sql = "INSERT INTO cancion (IDcanciones, Nomcancion, IDautor , Idgenero, mp3) VALUES ('','$nombreCancion', '$artista', '$genero', '$archivoCancion')";

if ($conn->query($sql) === TRUE) {
	header("location: ../pajinas/inicio.html");
} else {
	header("location: ../pajinas/tus_canciones.php");
}

// Cerrar conexión
$conn->close();
?>

