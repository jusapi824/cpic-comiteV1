<?php
session_start();
require_once('../config/configMySqli.php');

require('../vendor/autoload.php');
use PhpOffice\PhpSpreadsheet\IOFactory;

if (isset($_FILES['archivo_excel']) && $_FILES['archivo_excel']['error'] == UPLOAD_ERR_OK) {
    $rutaArchivo = $_FILES['archivo_excel']['tmp_name'];

    // Verifica que el archivo sea Excel
    $tipoArchivo = $_FILES['archivo_excel']['type'];
    if (
        $tipoArchivo !== 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' &&
        $tipoArchivo !== 'application/vnd.ms-excel'
    ) {
        $_SESSION["mensaje"] = "El archivo cargado no es un archivo Excel válido.";
        header('Location: aprendiz.php');
        exit();
    }

    try {
        // Leer el archivo Excel
        $spreadsheet = IOFactory::load($rutaArchivo);
        $hoja = $spreadsheet->getActiveSheet();
        $datos = $hoja->toArray();

        // Procesar cada fila (omitir la cabecera)
        for ($i = 1; $i < count($datos); $i++) {
            $fila = $datos[$i];
            $tipo_documento = $fila[3];
            $documento = $fila[4];
            $nombres = $fila[0];
            $apellidos = $fila[1];
            $celular = $fila[2];
            $correo_electronico = $fila[5];
            $id_grupo = $fila[6];
            $jornada = $fila[7];
            $programa_formacion = $fila[8];
            $estado = $fila[9];

            // Insertar en la base de datos
            $stmt = $conn->prepare("INSERT INTO aprendiz (tipo_documento, documento, nombres, apellidos, celular, correo_electronico, estado, id_grupo, programa_formacion,jornada,fecha_creacion, fecha_actualizacion, usuario_crea, usuario_actualiza) VALUES (?, ?, ?, ?, ?,?,?,?,?,?,?,?,?,?)");

            $fechaCreacion = date("Y-m-d");
            $fechaActualizacion = date("Y-m-d");
            $usuarioCrea = $_SESSION['id'];
            $usuarioActualiza = "";
            $stmt->bind_param("ssssssssssssss", $tipo_documento, $documento, $nombres, $apellidos, $celular, $correo_electronico, $estado, $id_grupo, $programa_formacion, $jornada, $fechaCreacion, $fechaActualizacion, $usuarioCrea, $usuarioActualiza);




            // Ejecutar la consulta
            if (!$stmt->execute()) {
                $_SESSION["mensaje"] = "Error al insertar el registro: " . $stmt->error;
                header('Location: aprendiz.php');
                exit();
            }
        }

        $_SESSION["mensaje"] = "Datos importados con éxito.";
        header('Location: aprendiz.php');
        exit();
    } catch (Exception $e) {
        $_SESSION["mensaje"] = "Error al procesar el archivo: " . $e->getMessage();
        header('Location: aprendiz.php');
        exit();
    }
} else {
    $_SESSION["mensaje"] = "Error al cargar el archivo.";
    header('Location: aprendiz.php');
    exit();
}

// Cerrar la conexión
$conn->close();
?>