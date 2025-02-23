<?php
$environment = 'development'; 

if ($environment == 'development') {
    // Para conexiones 
    $host = "localhost";
    $usuario_db = "root";  // Usuario de MySQL en XAMPP (por defecto es "root")
    $contrasenia_db = "";  // Contraseña de MySQL (por defecto en XAMPP es vacía)
    $nombre_db = "comite";
} else {
    // Para conexiones 
    $host = "sena_cpic-comitev1-mysql";
    $usuario_db = "mysql";  // Usuario de MySQL en XAMPP (por defecto es "root")
    $contrasenia_db = "9359cb67a17cb22b7010";  // Contraseña de MySQL (por defecto en XAMPP es vacía)
    $nombre_db = "sena";
}

$conn = new mysqli($host, $usuario_db, $contrasenia_db, $nombre_db);
if ($conn->connect_error) {
    die("Error al conectar a la base de datos con mysqli: " . $conn->connect_error);
}
