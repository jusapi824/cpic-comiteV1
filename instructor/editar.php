<?php
// Definir los valores para la conexión
session_start();
require_once('../config/configMySqli.php');
// Verificar la conexión

// Si se envió el formulario de edición
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Recibir los datos del formulario
    $nombres = $_POST['nombres'];
    $apellidos = $_POST['apellidos'];
    $celular = $_POST['celular'] ?? null;
    $correo_electronico = $_POST['correo_electronico'];
    $estado = $_POST['estado'];
    $documento = $_POST['documento'];

    $fechaActualizacion = date("Y-m-d");
    $usuarioActualiza = $_SESSION['id'];;

    // Actualizar los datos en la base de datos
    $update_sql = "UPDATE instructor SET nombres = ?, apellidos = ?, celular = ?, correo_electronico = ?, estado = ?,fecha_actualizacion =?, usuario_actualiza =? WHERE documento = ?";
    $update_stmt = $conn->prepare($update_sql);

    // Asegúrate de pasar todos los parámetros en el orden correcto
    $update_stmt->bind_param("ssssssss", $nombres, $apellidos, $celular, $correo_electronico, $estado, $fechaActualizacion , $usuarioActualiza, $documento);

    if ($update_stmt->execute()) {

        // Mensaje de éxito
        $_SESSION["mensaje"] = "Registro actualizado con éxito.";

    } else {
        // Mensaje de error
        $_SESSION["mensaje"] = "Error al actualizar el registro. Por favor, intente nuevamente.";

    }
}
header("Location: instructor.php");
$update_stmt->close();


// Cerrar la conexión
$conn->close();
?>