<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.TimeZone" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <link rel="stylesheet" href="../css/tecnicocss/global.css"/>
    <link rel="stylesheet" href="../css/tecnicocss/reporteFallos.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Configuración del sistema</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
</head>
<body>
<%@ include file="../Admin/base.jsp" %>
<script>
    let enlaces = document.querySelectorAll('a');
    enlaces[3].classList.add('active');
</script>
<div class="contenedor"> 
    <div class="Reporte">
  <h1 style="text-align: center;">Configuración del Sistema</h1>
<table style="margin: 0 auto;">
    
    <tr>
        <td colspan="2">
            <form action="guardarConfiguracion.jsp" method="post">
                <table>
                    <tr>
                        <td><label for="zonaHoraria">Zona Horaria:</label></td>
                        <td>
                            <select name="zonaHoraria" id="zonaHoraria">
                                <%-- Obtener las zonas horarias disponibles --%>
                                <% for (String id : TimeZone.getAvailableIDs()) { %>
                                    <option value="<%= id %>"><%= id %></option>
                                <% } %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="idioma">Idioma del Sistema:</label></td>
                        <td>
                            <select name="idioma" id="idioma">
                                <option value="es">Español</option>
                                <option value="en">Inglés</option>
                                <option value="fr">Francés</option>
                                <!-- Agrega más opciones según sea necesario -->
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="usuarioCorreo">Usuario de Correo:</label></td>
                        <td><input type="text" name="usuarioCorreo" id="usuarioCorreo"></td>
                    </tr>
                    <tr>
                        <td><label for="contrasenaCorreo">Contraseña de Correo:</label></td>
                        <td><input type="password" name="contrasenaCorreo" id="contrasenaCorreo"></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button type="reset">Restablecer</button>
                            <button type="submit">Guardar</button>
                        </td>
                    </tr>
                </table>
            </form>
        </td>
    </tr>
</table>
 </div>
</div>
</body>
</html>