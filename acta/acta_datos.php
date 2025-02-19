<?php
require_once('../config/configMySqli.php');

// Consulta para obtener los registros (ajusta esto si es necesario)
$sql = "SELECT * FROM aprendiz";
$result = $conn->query($sql);

// Mostrar los resultados en una tabla
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row['nombres'] . "</td>";
        echo "<td>" . $row['apellidos'] . "</td>";
        echo "<td>" . $row['celular'] . "</td>";
        echo "<td>" . $row['documento'] . "</td>";
        echo "<td>" . $row['correo_electronico'] . "</td>";
        echo "<td>" . $row['id_grupo'] . "</td>";
        echo "<td>" . $row['jornada'] . "</td>";
        echo "<td>" . $row['programa_formacion'] . "</td>";
        echo "<td>" . $row['estado'] . "</td>";
        
        
        echo "<td>";
        echo "<a href='editar.php?documento=" . $row['documento'] . "' class='btn btn-warning btn-sm' title='Editar'><i class='fas fa-edit'></i></a> ";
        echo "<a href='eliminar.php?documento=" . $row['documento'] . "' class='btn btn-danger btn-sm' title='Eliminar' onclick='return confirm(\"¿Estás seguro de que deseas eliminar este registro?\");'><i class='fas fa-trash-alt'></i></a>";
        echo "</td>";
        echo "</tr>";
    }
} else {
    echo "<tr><td colspan='11'>No se encontraron registros</td></tr>";
}

// Cerrar la conexión
$conn->close();
?>