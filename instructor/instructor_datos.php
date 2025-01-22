<?php

require_once('../config/configPDO.php');

try {
    // Habilitar manejo de errores en PDO
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Consulta para obtener los registros
    $sql = "SELECT * FROM instructor";
    $stmt = $pdo->query($sql);

    // Mostrar los resultados en una tabla
    if ($stmt->rowCount() > 0) {
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            echo "<tr>";
            echo "<td>" . htmlspecialchars($row['documento']) . "</td>";
            echo "<td>" . htmlspecialchars($row['nombres']) . "</td>";
            echo "<td>" . htmlspecialchars($row['apellidos']) . "</td>";
            echo "<td>" . htmlspecialchars($row['celular']) . "</td>";
            echo "<td>" . htmlspecialchars($row['correo_electronico']) . "</td>";
            echo "<td>" . htmlspecialchars($row['estado']) . "</td>";
            echo "<td>";
            echo "<button class='btn btn-warning btn-sm btn-editar' data-toggle='modal' data-target='#modalInstructor' 
                data-documento='" . htmlspecialchars($row['documento']) . "' 
                data-nombres='" . htmlspecialchars($row['nombres']) . "' 
                data-apellidos='" . htmlspecialchars($row['apellidos']) . "' 
                data-celular='" . htmlspecialchars($row['celular']) . "' 
                data-correo_electronico='" . htmlspecialchars($row['correo_electronico']) . "' 
                data-estado='" . htmlspecialchars($row['estado']) . "'>
                <i class='fas fa-edit'></i>
            </button>";
            echo "</td>";
            echo "</tr>";
        }
    } else {
        echo "<tr><td colspan='7'>No se encontraron registros</td></tr>";
    }
} catch (PDOException $e) {
    echo "Error en la consulta: " . $e->getMessage();
}
?>
