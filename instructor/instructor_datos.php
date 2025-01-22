<?php

require_once('../config/configMySqli.php');

// Consulta para obtener los registros (ajusta esto si es necesario)
$sql = "SELECT * FROM instructor";
$result = $conn->query($sql);

// Mostrar los resultados en una tabla
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row['documento'] . "</td>";
        echo "<td>" . $row['nombres'] . "</td>";
        echo "<td>" . $row['apellidos'] . "</td>";
        echo "<td>" . $row['celular'] . "</td>"; 
        echo "<td>" . $row['correo_electronico'] . "</td>";
        echo "<td>" . $row['estado'] . "</td>";
        echo "<td>";
        
        
        echo "<button class='btn btn-warning btn-sm btn-editar' data-toggle='modal' data-target='#modalInstructor' 
        data-documento='{$row['documento']}' 
        data-nombres='{$row['nombres']}' 
        data-apellidos='{$row['apellidos']}' 
        data-celular='{$row['celular']}' 
        data-correo_electronico='{$row['correo_electronico']}' 
        data-estado='{$row['estado']}'>
    <i class='fas fa-edit'></i>  <!-- Ícono de Editar -->
</button> ";
echo "</td>";
echo "</tr>";
    }
} else {
    echo "<tr><td colspan='11'>No se encontraron registros</td></tr>";
}

// Cerrar la conexión
$conn->close();
?>


