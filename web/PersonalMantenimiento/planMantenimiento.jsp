<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/tecnicocss/global.css"/>
        <link rel="stylesheet" href="../css/admincss/mantenimiento.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">

        <title>Plan de Mantenimiento</title>
    </head>
    <body>
        <%@ include file="../PersonalMantenimiento/adminBase.jsp" %>
        <div class="contenedor">
            <h1 class="titulo">Lista de Planes</h1>
            <div class="tablaDisposicion">
                <table class="table table-striped table-dark">
                    <thead class="thead-dark">
                        <tr>
                            <th>Codigo</th>
                            <th>Trabajo</th>
                            <th>Frecuencia</th>
                            <th>Marca</th>
                            <th>Modelo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Mant001</td>
                            <td>Cambio de aceite y filtro</td>
                            <td>5000km</td>
                            <td>Honda</td>
                            <td>Civic</td>
                        </tr>
                        <tr>
                            <td>Mant002</td>
                            <td>Inspeccion y rotacion de neumaticos</td>
                            <td>5000km</td>
                            <td>Toyota</td>
                            <td>Corolla</td>
                        </tr>
                        <tr>
                            <td>Mant003</td>
                            <td>Revision de frenos</td>
                            <td>5000km</td>
                            <td>Toyota</td>
                            <td>Yaris</td>
                        </tr>
                        <tr>
                            <td>Mant004</td>
                            <td>Revision del estado de la bateria</td>
                            <td>5000km</td>
                            <td>Chevrolet</td>
                            <td>Onix</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="container text-center">
               <button onclick="location.href='agregarPlan.jsp'" type="button" id="guardar"  class="btn btn-primary">Agregar Plan</button>
        </div>
    </body>
</html>
