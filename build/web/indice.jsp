<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <a href="base.jsp">base</a>
        <a href="PersonalMantenimiento/TDisposicionTareas.jsp">Tecnico Principal</a>
        <a href="PersonalMantenimiento/controlAlmacen.jsp">Encargado del almacen</a>
        <a href="PersonalMantenimiento/listaVehiculos.jsp">Registro de vehiculos</a>
    </body>
    <script>
        let usuario = JSON.parse(sessionStorage.getItem('usuario'));
        console.log(usuario);
    </script>
</html>
