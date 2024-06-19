<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/tecnicocss/global.css"/>
        <link rel="stylesheet" href="../css/admincss/agregarPlan.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
        <title>Agregar Plan de Mantenimiento</title>
    </head>
    <body>
        <%@ include file="../PersonalMantenimiento/adminBase.jsp" %>
        <div class="registro">
            <h2 class="titulo">Agregar Plan de Mantenimiento</h2>
            <div class="registro-plan">
                <form id="problema-form">
                <label for="codigo">Codigo:</label>
                <input type="text" id="codigo" name="codigo" required>
                <label for="trabajo">Trabajo a realizar:</label>
                <select class="form-select" id="inputGroupSelect01">
                <option value="1" selected>Cambio de aceite y filtro</option>
                <option value="2">Inspeccion y rotacion de neumaticos</option>
                <option value="3">Revision de frenos</option>
                <option value="4">Revision del estado de la bateria</option>
                </select>
                <label for="frecuencia">Frecuencia de KM:</label>
                <input type="text" id="frecuencia" name="frecuencia" required>
                <label for="marca">Marca:</label>
                <input type="text" id="marca" name="marca" required>
                <label for="modelo">Modelo:</label>
                <input type="text" id="modelo" name="modelo" required>
                <button onclick="location.href='listaVehiculos.jsp'" type="button" id="guardar">Agregar Plan</button>
                </form>
            </div>
        </div>
    </body>
</html>
