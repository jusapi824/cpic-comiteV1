<?php
session_start();
// require_once('../config/config.php');

// Verifica si el usuario está autenticado
if (!isset($_SESSION['id'])) {
    // Si no está autenticado, redirige a la página de inicio de sesión
    header('Location: ../login.php');
    exit();
}

//session_start();

include('../config/modal.php');
?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página Principal</title>
    <!-- Enlace a los estilos de Font Awesome, Bootstrap y DataTables -->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="../css/ruang-admin.min.css" rel="stylesheet">
    <!-- Estilos de DataTables -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
    <!-- Agregar Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>


</head>

<body class="bg-green-50">
    <?php include('../config/sidebar.php'); ?>
    <!-- Contenedor principal -->
    <div id="content-wrapper" class="d-flex flex-column">
        <?php include('../config/topbar.php'); ?>
        <div class="container-fluid mt-5">
        <div class="row">
            <div class="col-md-12">
                <!-- Encabezado principal -->
                <div class="card shadow mb-4 bg-green-100">
                    <div class="card-header py-3 bg-green-600 text-white">
                        <h4 class="m-0 font-weight-bold">Reporte Instructor</h4>
                    </div>
                </div>
                <div class="card shadow mb-4 bg-green-100">
                    <div class="card-header py-3 bg-green-600 text-white mb-4 ">
                        <h4 class="m-0 font-weight-bold">Buscar registros</h4>
                        <!-- Formulario de búsqueda -->
                        <div class="mb-4">
                            <form action="buscar.php" method="GET" class="d-flex align-items-center gap-3">
                                <!-- Campo de texto para búsqueda -->
                                <div class="form-group mb-0 flex-grow-1">
                                    <label for="buscar" class="sr-only">Ingrese su búsqueda</label>
                                    <input type="text" id="buscar" name="buscar" class="form-control"
                                        placeholder="Buscar por nombre" required>
                                </div>

                                <!-- Botón de buscar -->
                                <button type="submit"
                                    class="btn bg-green-500 hover:bg-green-600 text-white d-flex align-items-center">
                                    <i class="fas fa-search mr-1"></i> Buscar
                                </button>

                                <!-- Botón de ingresar instructor -->
                                <button type="button"
                                    class="btn bg-green-500 hover:bg-green-600 text-white d-flex align-items-center"
                                    data-toggle="modal" data-target="#modalInstructor">
                                    <i class="fas fa-plus-circle"></i> Ingresar Instructor
                                </button>
                            </form>
                        </div>




                        <div class="modal fade" id="modalInstructor" tabindex="-1"
                            aria-labelledby="modalInstructor" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header bg-green-600 text-black">
                                        <h5 class="modal-title" id="modalInstructor">Ingresar Instructor
                                        </h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body bg-green-50 text-black ">
                                        <form method="POST">
                                            <div class="form-group">
                                                <label for="documento"  class="block text-green-700 text-sm font-bold mb-2">Documento</label>
                                                <input type="text" class="form-control" id="documento" name="documento"
                                                    required>
                                            </div>
                                            <div class="form-group">
                                                <label for="nombres"  class="block text-green-700 text-sm font-bold mb-2">Nombre</label>
                                                <input type="text" class="form-control" id="nombres" name="nombres"
                                                    required>
                                            </div>
                                            <div class="form-group">
                                                <label for="apellidos"  class="block text-green-700 text-sm font-bold mb-2">Apellidos</label>
                                                <input type="text" class="form-control" id="apellidos" name="apellidos"
                                                    required>
                                            </div>
                                            <div class="form-group">
                                                <label for="celular"  class="block text-green-700 text-sm font-bold mb-2">Celular</label>
                                                <input type="text" class="form-control" id="celular" name="celular"
                                                    required>
                                            </div>

                                            <div class="form-group">
                                                <label for="correo_electronico"  class="block text-green-700 text-sm font-bold mb-2">Correo Electrónico</label>
                                                <input type="email" class="form-control" id="correo_electronico"
                                                    name="correo_electronico" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="estado"  class="block text-green-700 text-sm font-bold mb-2">Estado</label>
                                                <select class="form-control" id="estado" name="estado">
                                                    <option value="" disabled selected>Seleccionar Estado</option>
                                                    <option value="Activo">Activo</option>
                                                    <option value="Inactivo">Inactivo</option>
                                                </select>
                                            </div>

                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                    data-dismiss="modal">Cerrar</button>
                                                <button type="submit"
                                                    class="btn bg-green-600 hover:bg-green-700 text-white">Guardar</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Tabla de registros -->
                    <div class="card bg-green-100">
                        <div class="card-header bg-green-600 text-white">
                            <h4 class="m-0 font-weight-bold">Registros Almacenados</h4>
                        </div>
                        <div class="card-body bg-green-50">
                            <table id="instructor" class="table table-bordered table-striped table-hover text-gray-800">
                                <thead class="bg-green-500 text-white">
                                    <tr>
                                        <th>Documento</th>
                                        <th>Nombre</th>
                                        <th>Apellidos</th>
                                        <th>Celular</th>
                                        <th>Correo electrónico</th>
                                        <th>Estado</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    // Incluye el archivo PHP donde se consulta la base de datos y se muestran los registros
                                    include 'instructor_datos.php';
                                    ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    

        <!-- Scripts -->
        <script src="../vendor/jquery/jquery.min.js"></script>
        <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
        <script src="../js/ruang-admin.min.js"></script>
        <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function () {
                // Inicializa DataTables sin el campo de búsqueda
                $('#instructor').DataTable({
                    "language": {
                        "url": "https://cdn.datatables.net/plug-ins/1.13.4/i18n/es_es.json"
                    },
                    "searching": false,  // Desactiva el campo de búsqueda
                    "order": [[1, 'asc']]  // Ordena por la segunda columna
                });
            });

            function cerrarModal() {
                window.location.href = 'instructor.php'; // Redireccionar después de cerrar el modal
            }
        </script>
         <script>
        $('#modalInstructor').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget); // Botón que activó el modal
            var modal = $(this);

            if (button.hasClass('btn-editar')) {
                // Si es un botón de editar, configuramos el modal para editar
                modal.find('.modal-title').text('Editar Instructor');
                modal.find('form').attr('action', 'editar.php');

                // Llenamos los campos con los datos del usuario
                modal.find('#documento').val(button.data('documento'));
                modal.find('#nombres').val(button.data('nombres'));
                modal.find('#apellidos').val(button.data('apellidos'));
                modal.find('#celular').val(button.data('celular'));
                modal.find('#correo_electronico').val(button.data('correo_electronico'));
                modal.find('#estado').val(button.data('estado'));
     

            } else {
                // Si es un botón de crear, configuramos el modal para crear
                modal.find('.modal-title').text('Ingresar Instructor');
                modal.find('form').attr('action', 'crear.php');

                // Limpiamos los campos del formulario
                modal.find('#documento').val('');
                modal.find('#nombres').val('');
                modal.find('#apellidos').val('');
                modal.find('#celular').val('');
                modal.find('#correo_electronico').val('');
                modal.find('#estado').val('');
            }
        });
    </script>
        <script src="../js/utils.js"></script>
</body>

</html>