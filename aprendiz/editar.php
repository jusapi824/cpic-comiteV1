<?php
session_start();
// Definir los valores para la conexión
require_once('../config/configMySqli.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Recibir los datos del formulario
    $documento = $_POST['documento'];
    $nombres = $_POST['nombres'];
    $apellidos = $_POST['apellidos'];
    $celular = $_POST['celular'];
    $correo_electronico = $_POST['correo_electronico'];
    $programa_formacion = $_POST['programa_formacion'];
    $id_grupo = $_POST['id_grupo'];
    $jornada = $_POST['jornada'];
    $estado = $_POST['estado'];

    $fechaActualizacion = date("Y-m-d");
    $usuarioActualiza = $_SESSION['id'];;


    // Actualizar los datos en la base de datos
    $update_sql = "UPDATE aprendiz SET nombres = ?, apellidos = ?, celular = ?, correo_electronico = ?, id_grupo = ?, jornada = ?, programa_formacion = ?,  estado = ?, fecha_actualizacion = ?,  usuario_actualiza = ? WHERE documento = ?";
    $update_stmt = $conn->prepare($update_sql);
    $update_stmt->bind_param("sssssssssss", $nombres, $apellidos, $celular, $correo_electronico, $id_grupo, $jornada, $programa_formacion, $estado, $fechaActualizacion, $usuarioActualiza, $documento);

    if ($update_stmt->execute()) {
        // Mensaje de éxito
        $_SESSION["mensaje"] = "Registro actualizado con éxito";
    } else {
        $_SESSION["mensaje"] = "Error al actualizar el registro. Por favor, intente nuevamente.";
    }
    header("Location: aprendiz.php");
    $update_stmt->close();

} 

// Cerrar la conexión
$conn->close();
?>