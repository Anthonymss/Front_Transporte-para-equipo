<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" href="../css/tecnicocss/global.css"/>
        <link rel="stylesheet" href="../css/tecnicocss/disposicionTareas.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <title>Gestion de Usuarios</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">

    </head>
    <body>
        <%@ include file="../resources/base.jsp" %>
        <script src="../js/admin/base.js"></script>
           <div class="registro">
            <h2>Registro de usuario</h2>
            <div class="registro-usuario">
                <form id="problema-form">
                <label for="nombres">Codigo:</label>
                <input type="text" id="codigo" name="codigo" required>
                <label for="apellidos">Nombres:</label>
                <input type="text" id="nombres" name="nombres" required>
                <label for="vehiculo">Apellidos:</label>
                <input type="text" id="apellidos" name="apellidos" required>
                <label for="vehiculo">Correo electronico:</label>
                <input type="text" id="correo" name="correo" required>
                <label for="vehiculo">Direccion:</label>
                <input type="text" id="direccion" name="direccion" required>
                <label for="vehiculo">Telefono:</label>
                <input type="text" id="telefono" name="telefono" required>
                <button type="button" id="guardar">Registrar usuario</button>
                </form>
            </div>
        </div>
        
    </body>
</html>
