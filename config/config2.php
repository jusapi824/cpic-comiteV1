<?php

$environment = 'production'; 

if ($environment == 'development') {
    $host = 'localhost';
    $nombre_db = 'comite';
    $usuario_db = 'root';
    $contrasenia_db = '';
} else {
    $host = 'sena_cpic-comitev1-mysql';
    $nombre_db = 'sena';
    $usuario_db = 'mysql';
    $contrasenia_db = '9359cb67a17cb22b7010';
}
