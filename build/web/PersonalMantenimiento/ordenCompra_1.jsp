<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/tecnicocss/global.css"/>
        <link rel="stylesheet" href="../css/tecnicocss/ordenCompra.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
        <title>Orden de compra</title>
    </head>
    <body>
        <%@ include file="../PersonalMantenimiento/almacenBase.jsp" %>
        <div class="contenedor">
            <br>
            <h1 class="titulo">Orden de compra</h1>
            <br>
            <div class="tablaDisposicion">
                <table class="table table-dark table-striped" id="mydataTable">
                    <thead>
                        <th>Id</th>
                        <th>Producto</th>
                        <th>Cantidad</th>
                        <th>Proveedor</th>
                    </thead>
                    <tbody>
                        <tr>
                          <td>202</td>
                          <td>Filtro de auto</td>
                          <td>6</td>
                          <td>Automax</td>
                        </tr>
                        <tr>
                          <td>789</td>
                          <td>Aceite</td>
                          <td>10</td>
                          <td>LubricantesPeru</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
        </div>
        <div class="container text-center">
               <button type="button" class="btn btn-primary" data-bs-toggle="modal">Comprar</button>
            </div>
        </div>
    </body>
</html>
