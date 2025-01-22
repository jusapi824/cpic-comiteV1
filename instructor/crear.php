<?php
session_start();
$mensaje = "";
$mensajeTipo = ""; // 'success' o 'error'

require_once('../config/configMySqli.php');



// Procesar el formulario cuando se envíe (método POST)
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Recibir los datos del formulario
    $documento = $_POST['documento'] ?? null;
    $nombres = $_POST['nombres'] ?? null;
    $apellidos = $_POST['apellidos'] ?? null;
    $celular = $_POST['celular'] ?? null;
    $correo_electronico = $_POST['correo_electronico'] ?? null;
    $estado = $_POST['estado'] ?? null;

    // Verificar si todos los campos están completos
    if ($documento  && $nombres && $apellidos && $celular &&  $correo_electronico && $estado) {
        // Preparar la consulta para insertar los datos en la base de datos
        $stmt = $conn->prepare("INSERT INTO instructor ( documento,nombres, apellidos, celular,  correo_electronico,estado, fecha_creacion, fecha_actualizacion) VALUES (?, ?, ?, ?, ?, ?,?,?)");
        
        // Vincular los parámetros correctamente (todos como strings, excepto celular que puede ser numérico)
        $stmt->bind_param("ssssssss", $documento, $nombres, $apellidos, $celular, $correo_electronico, $estado,0,0);

        // Ejecutar la consulta e informar el resultado
        if ($stmt->execute()) {
            $_SESSION['mensaje'] = "Registro guardado con éxito";
            header("Location: instructor.php");
            exit();
            //$mensaje = "Registro guardado con éxito.";
            //$mensajeTipo = "success";  // Color verde para éxito
        } else {
            $_SESSION["mensaje"] = "Error al guardar el registro: " . $stmt->error;
        
        }

        // Cerrar la sentencia
        $stmt->close();
    } else {
        $_SESSION["mensaje"] = "Por favor, completa todos los campos.";

       
    }
}

// Cerrar la conexión
$conn->close();
?>



