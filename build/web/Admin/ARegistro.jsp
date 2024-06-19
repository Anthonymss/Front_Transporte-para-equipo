<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="../css/tecnicocss/global.css"/>
          <link rel="stylesheet" href="../css/tecnicocss/OrdenarRespuestos.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Registro</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
</head>
<body>
<%@ include file="../Admin/base.jsp" %>
<script>
    let enlaces = document.querySelectorAll('a');
    enlaces[3].classList.add('active');
</script>
  <div class="contenedor">  
            <h1>Registro de Usuario</h1>      
            <div class="Solicitar">
                <div class="card-body">
                    <form id="solicitarRepuestoForm">
                        <div>
                            <label for="productoID">Codigo:</label>
                            <input type="text" class="form-control" id="productoID" name="productoID" required>
                        </div>
                        <div>
                            <label for="cantidadSolicitada">Nombres:</label>
                            <input type="number" class="form-control" id="cantidadSolicitada" name="cantidadSolicitada" required>
                        </div>
                        <div >
                            <label for="descripcion">Apellidos:</label>
                            <textarea class="form-control" id="descripcion" name="descripcion"></textarea>
                        </div>
                        <div >
                            <label for="descripcion">Correo Electronico:</label>
                            <textarea class="form-control" id="descripcion" name="descripcion"></textarea>
                        </div>
                        <div >
                            <label for="descripcion">Dirección:</label>
                            <textarea class="form-control" id="descripcion" name="descripcion"></textarea>
                        </div>
                        <div >
                            <label for="descripcion">Telefono:</label>
                            <textarea class="form-control" id="descripcion" name="descripcion"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Registrar Usuario</button>
                    </form>
                </div>
            </div>





</body>
</html>