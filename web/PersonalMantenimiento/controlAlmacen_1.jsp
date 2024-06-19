<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/tecnicocss/global.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
        <title>Control de almacen</title>
    </head>
    <body>
        <%@ include file="../PersonalMantenimiento/almacenBase.jsp" %>
        <div class="registro">
            <br>
            <h2>Control de almacen</h2>
          <br>
            <div class="container text-center">
            <div class="row align-items-start">
            <div class="col">
              <a>Almacen: </a><select name="select">
                <option value="value1" selected>Almacen 1</option>
                <option value="value2" >Almacen 2</option>
                <option value="value3">Almacen 3</option>
                </select>
            </div>
          <div class="col">
          </div>
          <div class="col">
      <button type="button" class="btn btn-success btnAdd" data-bs-toggle="modal" data-bs-target="#exampleModal">Comprar</button>
          </div>
          </div>
              <br>
          </div>
          
          <div class="table-responsive">
                <table class="table table-dark table-striped" id="mydataTable">
                    <thead>
                        <th>Fecha</th>
                        <th>Solicitante</th>
                        <th>Producto</th>
                        <th>Cantidad</th>
                        <th>Precio</th>
                        <th>Stock minimo</th>
                    </thead>
                    <tbody>
                        <tr>
                          <td>15/05/2024</td>
                          <td>Luis Fernandez</td>
                          <td>Filtro de auto</td>
                          <td>12</td>
                          <td>15.80</td>
                          <td>5</td>
                        </tr>
                        <tr>
                          <td>15/05/2024</td>
                          <td>Luis Fernandez</td>
                          <td>Lubricante para auto</td>
                          <td>4</td>
                          <td>25.00</td>
                          <td>8</td>
                        </tr>
                    </tbody>
                </table>
            <div class="container text-center">
               <button type="button" class="btn btn-secondary btnAdd" data-bs-toggle="modal">Atras</button>
            </div>
            </div>
        </div>
        </div>
    </body>
</html>