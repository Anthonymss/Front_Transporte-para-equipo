<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/global.css">
        <title>Registrar usuario</title>
    </head>
    <body>
        <div class="menu">
          <h3>Administrador</h3>
            <div class="logo">
                <img src="../resources/avatar-modified.png" />
              </div>
            <br>
            <nav>
                <a href="#">Gestion de usuario</a>
                <a href="#">Control de acceso</a>
                <a href="#">Configuracion del sistema</a>
                <a href="#">Gestion de flota</a>
                <a href="#">Analisis y metricas</a>
                <a href="#">Programacion de mantenimiento</a>
                <a href="#">Generación de informes</a>
                <a href="#">Gestion de incidentes</a>
		</nav>
        </div>
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
