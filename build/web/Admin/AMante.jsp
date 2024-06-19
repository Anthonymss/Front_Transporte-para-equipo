<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/tecnicocss/global.css"/>
        <link rel="stylesheet" href="../css/tecnicocss/pendientes.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <title>Tareas Pendientes</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">

    </head>
    <body>
        <%@ include file="../Admin/base.jsp" %>
        <script>
            let enlaces = document.querySelectorAll('a');
            enlaces[1].classList.add('active');
        </script>
        <div class="contenedor">
            <h1 class="titulo">Programación de mantenimiento</h1>
            <div class="tablaDisposicion">
                <table class="table table-striped table-dark">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">ID Cliente</th>
                            <th scope="col">ID Vehiculo</th>
                            <th scope="col">Nuevo Mantemiento</th>
                            <th scope="col">Gestionar</th>
                            <th scope="col">Fecha de Vencimiento</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">C01</th>
                            <td>V01</td>
                            <td>Revisar Frenos</td>
                            <td>Pendiente</td>
                            <td>2024-06-05</td>
                            <td><button class="btn btn-primary">Iniciar</button>
                                <button class="btn btn-success">Completar</button>
                                <button class="btn btn-info">Detalles</button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">C02</th>
                            <td>V02</td>
                            <td>Cambiar Aceite</td>
                            <td>En progreso</td>
                            <td>2024-06-05</td>
                            <td><button class="btn btn-primary">Iniciar</button>
                                <button class="btn btn-success">Completar</button>
                                <button class="btn btn-info">Detalles</button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">C03</th>
                            <td>V03</td>
                            <td>Reparar luces</td>
                            <td>Pendiente</td>
                            <td>2024-06-05</td>
                            <td><button class="btn btn-primary">Iniciar</button>
                                <button class="btn btn-success">Completar</button>
                                <button class="btn btn-info">Detalles</button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">C04</th>
                            <td>V04</td>
                            <td>Rotar neumáticos</td>
                            <td>Pendiente</td>
                            <td>2024-06-05</td>
                            <td><button class="btn btn-primary">Iniciar</button>
                                <button class="btn btn-success">Completar</button>
                                <button class="btn btn-info">Detalles</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
                
            </div>      
        </div>
        
    </body>
</html>
