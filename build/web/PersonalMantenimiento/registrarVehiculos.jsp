<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/tecnicocss/global.css"/>
        <link rel="stylesheet" href="../css/admincss/registroVehiculos.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
        <title>Registrar Vehiculos</title>
    </head>
    <body>
        <%@ include file="../PersonalMantenimiento/adminBase.jsp" %>
        <div class="registro">
            <h2 class="titulo">Registro de vehiculo</h2>
            <div class="registro-vehiculo">
                <form id="problema-form">
                <label for="codigo">Codigo:</label>
                <input type="text" id="codigo" name="codigo" required>
                <label for="placa">Placa:</label>
                <input type="text" id="placa" name="placa" required>
                <label for="modelo">Modelo:</label>
                <input type="text" id="modelo" name="modelo" required>
                <label for="fecha">Año de fabricacion:</label>
                <input type="date" id="fecha" name="fecha" required>
                <label for="plan">Plan de mantenimiento:</label>
                <div class="input-group mb-3">
                <select class="form-select" id="inputGroupSelect01">
                <option value="1" selected>Mant001</option>
                <option value="2">Mant002</option>
                <option value="3">Mant003</option>
                <option value="3">Mant004</option>
                </select>
                </div>
                <button onclick="location.href='listaVehiculos.jsp'" type="button" id="guardar">Registrar</button>
                </form>
            </div>
        </div>
    </body>
</html>
