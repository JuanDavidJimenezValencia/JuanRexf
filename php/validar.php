<?php
$usuario=$_POST['usuario'];
$contraseña=$_POST['contraseña'];
session_start();
$_SESSION['usuario']=$usuario;

 //conectar a la base de datos

include ('conexion.php');

$consulta="SELECT * FROM usuario WHERE nomUsuario='$usuario' and passUsuario='$contraseña'";
$resultado=mysqli_query($conexion,$consulta);
$tabla=mysqli_fetch_array($resultado);



    if ($usuario=$tabla['usuario']){
        header("location:../pajinas/regis.html");
    }else{
    header("location:../pajinas/inicio.html");
        }
    

mysqli_free_result($resultado);
mysqli_close($conexion);

?>