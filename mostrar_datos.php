<?php
// Definir los valores para la conexión
require_once('config/configMySqli.php');

// Consulta para obtener los registros (ajusta esto si es necesario)
$sql = "SELECT * FROM informes";
$result = $conn->query($sql);

// Mostrar los resultados en una tabla
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row['fechaInforme'] . "</td>";
        echo "<td>" . $row['nombreAprendiz'] . "</td>";
        echo "<td>" . $row['documentoAprendiz'] . "</td>";
        echo "<td>" . $row['programaFormacion'] . "</td>";
        echo "<td>" . $row['idGrupo'] . "</td>";
        echo "<td>" . $row['descripcionQueja'] . "</td>";
        echo "<td>" . $row['testigosPruebas'] . "</td>";
        echo "<td>" . $row['correoQuejoso'] . "</td>";
        echo "<td>" . $row['nombreQuejoso'] . "</td>";
        echo "<td>" . $row['correoDocente'] . "</td>";
        echo "<td>" . $row['nombreDocente'] . "</td>";
        echo "</tr>";
    }
} else {
    echo "<tr><td colspan='11'>No se encontraron registros</td></tr>";
}

// Cerrar la conexión
$conn->close();
?>
