<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="../css/tecnicocss/global.css"/>
<link rel="stylesheet" href="../css/tecnicocss/reporteFallos.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Control de Acceso</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
</head>
<body>
<%@ include file="../Admin/base.jsp" %>
<script>
    let enlaces = document.querySelectorAll('a');
    enlaces[3].classList.add('active');
</script>
<div class="contenedor">
    <h2>Control de acceso</h2>
    <div class="table-responsive">
        <table class="table table-striped table-dark">
            <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Tipo de usuario</th>
                <th>Acciones</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1</td>
                <td>Juan Pérez</td>
                <td>
                    <select>
                        <option value="admin" disabled>Admin</option>
                        <option value="tecnico" selected>Técnico</option>
                    </select>
                </td>
                <td>
                    <button class="btn btn-primary btn-sm">Modificar</button>
                    <button class="btn btn-danger btn-sm">Eliminar</button>
                </td>
            </tr>
            <tr>
                <td>2</td>
                <td>María López</td>
                <td>
                    <select>
                        <option value="admin" selected>Admin</option>
                        <option value="tecnico" disabled>Técnico</option>
                    </select>
                </td>
                <td>
                    <button class="btn btn-primary btn-sm" disabled>Modificar</button>
                    <button class="btn btn-danger btn-sm">Eliminar</button>
                </td>
            </tr>
            <tr>
                <td>3</td>
                <td>Carlos Ruiz</td>
                <td>
                    <select>
                        <option value="admin" disabled>Admin</option>
                        <option value="tecnico" selected>Técnico</option>
                    </select>
                </td>
                <td>
                    <button class="btn btn-primary btn-sm">Modificar</button>
                    <button class="btn btn-danger btn-sm">Eliminar</button>
                </td>
            </tr>
            <tr>
                <td>4</td>
                <td>Ana Martínez</td>
                <td>
                    <select>
                        <option value="admin" selected>Admin</option>
                        <option value="tecnico" disabled>Técnico</option>
                    </select>
                </td>
                <td>
                    <button class="btn btn-primary btn-sm" disabled>Modificar</button>
                    <button class="btn btn-danger btn-sm">Eliminar</button>
                </td>
            </tr>
            <!-- Añadir más filas según sea necesario -->
            </tbody>
        </table>
    </div>
    <div class="actions">
        <button class="btn btn-secondary">Restablecer</button>
        <button class="btn btn-success">Guardar</button>
    </div>
</div>
</body>
</html>