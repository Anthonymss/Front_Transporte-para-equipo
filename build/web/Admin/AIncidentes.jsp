<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/tecnicocss/global.css"/>
        <link rel="stylesheet" href="../css/tecnicocss/reporteFallos.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">

    </head>
    <body>
        <%@ include file="../Admin/base.jsp" %>
        <script>
            let enlaces = document.querySelectorAll('a');
            enlaces[4].classList.add('active');
        </script>
        <div class="contenedor">  
            <h1>Tipo de Incidente</h1>      
            <div class="Reporte">
                <div class="card-body">
                    <form >
                        <div>
                            <label >ID del Técnico:</label>
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
            <h1 >Incidente</h1>
            <div class="tablafallos">
                    <table class="table table-striped table-dark">
                        <thead>
                            <tr>
                                <th>ID Tecnico</th>
                                <th>ID Cliente</th>
                                <th>Descripción</th>
                                <th>Fecha</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>T01</td>
                                <td>V02</td>
                                <td>El tecnico aún no avanzo con el mantemiento</td>
                                <td>2024-05-20</td>
                            </tr>
                            <tr>
                                <td>T01</td>
                                <td>V01</td>
                                <td>El tecnico no realizo ningun servicio</td>
                                <td>2024-05-21</td>
                            </tr>
                            <tr>
                                <td>T02</td>
                                <td>C03</td>
                                <td>El tecnico sufrio un accidente</td>
                                <td>2024-05-20</td>
                            </tr>
                            <tr>
                                <td>T02</td>
                                <td>V03</td>
                                <td>El tecnico no compro repuestos para este vehiculo</td>
                                <td>2024-05-21</td>
                            </tr>
                            <tr>
                                <td>T03</td>
                                <td>V02</td>
                                <td>El tecnico no se presento a trabajar</td>
                                <td>2024-05-20</td>
                            </tr>
                  
                        </tbody>
                
            </div>
        </div>
        
         <script>
        const urlBase = "http://localhost:9090/api/v1"; 
        let usuario = JSON.parse(sessionStorage.getItem('usuario'));
        let token = usuario ? usuario.token : null;

        document.addEventListener('DOMContentLoaded', () => {
            const formularioIncidente = document.getElementById('incidente-form');
            formularioIncidente.addEventListener('submit', function(event) {
                event.preventDefault();

                const idTecnico = document.getElementById('idTecnico').value;
                const idCliente = document.getElementById('idCliente').value;
                const descripcion = document.getElementById('descripcion').value;

                const nuevoIncidente = {
                    idTecnico: idTecnico,
                    idCliente: idCliente,
                    descripcion: descripcion
                };

                fetch(urlBase + "/incidentes", {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'Authorization': 'Bearer ' + token
                    },
                    body: JSON.stringify(nuevoIncidente)
                })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Error en la solicitud: ' + response.status);
                    }
                    return response.json();
                })
                .then(data => {
                    alert('Incidente registrado exitosamente.');
                    
                })
                .catch(error => console.error('Error al registrar incidente:', error));
            });
        });
    </script>
    </body>
</html>
