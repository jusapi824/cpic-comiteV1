<?php
$environment = 'production'; 

if ($environment == 'development') {
    // Para conexiones 
    $servername = "localhost";
    $username = "root";  // Usuario de MySQL en XAMPP (por defecto es "root")
    $password = "";  // Contraseña de MySQL (por defecto en XAMPP es vacía)
    $dbname = "comite";
} else {
    // Para conexiones 
    $servername = "sena_cpic-comitev1-mysql";
    $username = "mysql";  // Usuario de MySQL en XAMPP (por defecto es "root")
    $password = "9359cb67a17cb22b7010";  // Contraseña de MySQL (por defecto en XAMPP es vacía)
    $dbname = "sena";
}

$conn = new mysqli($host, $usuario_db, $contrasenia_db, $nombre_db);
if ($conn->connect_error) {
    die("Error al conectar a la base de datos con mysqli: " . $conn->connect_error);
}
