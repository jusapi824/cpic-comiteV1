<?php
session_start();
$mensaje = "";
$mensajeTipo = ""; // 'success' o 'error'

// Datos de conexión
require_once('../config/configMySqli.php');


// Procesar el formulario cuando se envíe (método POST)
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Recibir los datos del formulario
    $nombres = $_POST['nombres'] ?? null;
    $apellidos = $_POST['apellidos'] ?? null;
    $celular = $_POST['celular'] ?? null;
    $documento = $_POST['documento'] ?? null;
    $tipo_documento = $_POST['tipo_documento'] ?? null;
    $correo_electronico = $_POST['correo_electronico'] ?? null;
    $id_grupo = $_POST['id_grupo'] ?? null;
    $jornada = $_POST['jornada'] ?? null;
    $programa_formacion = $_POST['programa_formacion'] ?? null;
    $estado = $_POST['estado'] ?? null;

    // Verificar si todos los campos están completos
    if ($nombres && $apellidos && $celular && $tipo_documento && $documento && $correo_electronico && $id_grupo && $jornada &&$programa_formacion  && $estado) {
        // Preparar la consulta para insertar los datos en la base de datos
        $stmt = $conn->prepare("INSERT INTO aprendiz (nombres, apellidos, celular, tipo_documento, documento, correo_electronico, id_grupo, jornada,programa_formacion, estado, fecha_creacion, fecha_actualizacion, usuario_crea, usuario_actualiza) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?,?)");
        
        $fechaCreacion = date("aaaa-mm-dd");
        $fechaActualizacion = date("aaaa-mm-dd");
        $usuarioCrea = "";
        $usuarioActualiza = "";
        // Vincular los parámetros correctamente (todos como strings, excepto celular que puede ser numérico)
        $stmt->bind_param( 'ssssssssssssss',$nombres, $apellidos, $celular,  $tipo_documento, $documento, $correo_electronico, $id_grupo, $jornada, $programa_formacion,$estado, $fechaCreacion,$fechaActualizacion,$usuarioCrea,$usuarioActualiza);

        // Ejecutar la consulta e informar el resultado
        if ($stmt->execute()) {
            $_SESSION['mensaje'] = "Registro guardado con éxito";
            header("Location: aprendiz.php");
            exit();
            //$mensaje = "Registro guardado con éxito.";
            //$mensajeTipo = "success";  // Color verde para éxito
        } else {
            $mensaje = "Error al guardar el registro: " . $stmt->error;
            $mensajeTipo = "error";    // Color rojo para error
        }

        // Cerrar la sentencia
        $stmt->close();
    } else {
        $mensaje = "Por favor, completa todos los campos.";
        $mensajeTipo = "error"; // Color rojo para error
    }
}

// Cerrar la conexión
$conn->close();
?>

<!-- Mostrar mensaje de éxito o error con Tailwind CSS -->
<?php if ($mensaje): ?>
    <div class="max-w-xl mx-auto my-4 p-4 rounded-md 
        <?php echo $mensajeTipo == 'success' ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700'; ?> 
        border border-solid border-<?php echo $mensajeTipo == 'success' ? 'green' : 'red'; ?>-400">
        <strong><?php echo $mensaje; ?></strong>
    </div>
<?php endif; ?>

