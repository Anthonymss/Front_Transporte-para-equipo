<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/tecnicocss/global.css"/>
        <link rel="stylesheet" href="../css/tecnicocss/reporteFallos.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <title>Reportar Fallo</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">

    </head>
    <body>
        <%@ include file="../Admin/base.jsp" %>
        <script>
            let enlaces = document.querySelectorAll('a');
            enlaces[4].classList.add('active');
        </script>
        <div class="contenedor">  
            <h1>Tipo de Informe</h1>      
            <div class="Reporte">
                <div class="card-body">
                    <form >
                        <div>
                            <label >ID del Vehiculo:</label>
                            <input type="number" class="form-control" required>
                        </div>
                        <div>
                            <label >ID del cliente:</label>
                            <input type="text" class="form-control" required>
                        </div>
                        <div >
                            <label for="descripcion">Descripción:</label>
                            <textarea class="form-control"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Solicitar</button>
                    </form>
                </div>
            </div>
            <h1 >Informe</h1>
            <div class="tablafallos">
                    <table class="table table-striped table-dark">
                        <thead>
                            <tr>
                                <th>ID  Vehiculo</th>
                                <th>ID Cliente</th>
                                <th>Descripción</th>
                                <th>Fecha</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>C01</td>
                                <td>V02</td>
                                <td>Los pagos aún no estan hechos</td>
                                <td>2024-05-20</td>
                            </tr>
                            <tr>
                                <td>C01</td>
                                <td>V01</td>
                                <td>El cliente cancelo todo por adelantado</td>
                                <td>2024-05-21</td>
                            </tr>
                            <tr>
                                <td>C02</td>
                                <td>C03</td>
                                <td>El cliente cancelo todo el pago por adelantado</td>
                                <td>2024-05-20</td>
                            </tr>
                            <tr>
                                <td>C02</td>
                                <td>V03</td>
                                <td>Faltan comprar repuestos para este vehiculo</td>
                                <td>2024-05-21</td>
                            </tr>
                            <tr>
                                <td>C03</td>
                                <td>V02</td>
                                <td>El cliente cancelo el 50% por adelantado</td>
                                <td>2024-05-20</td>
                            </tr>
                  
                        </tbody>
                
            </div>
        </div>
        
        
    </body>
</html>
