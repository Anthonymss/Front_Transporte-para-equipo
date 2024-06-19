<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/tecnicocss/global.css"/>
        <link rel="stylesheet" href="../css/admincss/listaVehiculos.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
        
        <title>Lista de vehiculos</title>
    </head>
    <body>
        <%@ include file="../PersonalMantenimiento/adminBase.jsp" %>
        <div class="contenedor">
            <h1 class="titulo">Lista de vehiculos</h1>
            <div class="tablaDisposicion">
                <table class="table table-striped table-dark">
                    <thead class="thead-dark">
                        <tr>
                            <th>Id</th>
                            <th>Placa</th>
                            <th>Marca</th>
                            <th>Modelo</th>
                            <th>Año</th>
                            <th>Plan</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>A4V-370</td>
                            <td>Toyota</td>
                            <td>Corolla</td>
                            <td>2017</td>
                            <td>Mant002</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>A6M-572</td>
                            <td>Honda</td>
                            <td>Civic</td>
                            <td>2016</td>
                            <td>Mant001</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>A1L-420</td>
                            <td>Toyota</td>
                            <td>Yaris</td>
                            <td>2020</td>
                            <td>Mant003</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>AOL-510</td>
                            <td>Chevrolet</td>
                            <td>Onix</td>
                            <td>2019</td>
                            <td>Mant004</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="container text-center">
               <button onclick="location.href='registrarVehiculos.jsp'" type="button" id="guardar"  class="btn btn-primary">Registrar vehiculo</button>
        </div>
    </body>
</html>
