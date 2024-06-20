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
        <%@ include file="../PersonalMantenimiento/tecnicoBase.jsp" %>
        <script>
            let enlaces = document.querySelectorAll('a');
            enlaces[4].classList.add('active');
        </script>
        <div class="contenedor">  
            <h1>Reportar Fallo</h1>      
            <div class="Reporte">
                <div class="card-body">
                    <form >
                        <div>
                            <label >ID del Vehiculo</label>
                            <input id="idvehiculo" type="number" class="form-control" required>
                        </div>
                        <div >
                            <label for="descripcion">descripcion</label>
                            <textarea id="descripcion" class="form-control"></textarea>
                        </div>
                        <button class="btn btn-primary" onclick="enviar()">Solicitar</button>
                    </form>
                </div>
            </div>
            <h1 >Fallos Reportados</h1>
            <div class="tablafallos">
                    <table class="table table-striped table-dark">
                        <thead>
                            <tr>
                                <th>id</th>
                                <th>Descripción</th>
                                <th>Fecha</th>
                                <th>Vehiculo</th>                                
                            </tr>
                        </thead>
                        <tbody id="tablaid">

                        </tbody>
                
            </div>
        </div>
        <script>
            const urlBase = "http://localhost:9090/api/v1";
            let usuario = JSON.parse(sessionStorage.getItem('usuario'));
            let id = usuario.id;
            let token = usuario.token;

            function enviar() {
                const descripcion = document.getElementById('descripcion').value;
                const idvehiculo = document.getElementById("idvehiculo").value;
                const Fallo = {
                    descripcion: descripcion,
                    vehiculo: { id: idvehiculo },
                    tecnico: { id: id }
                };

                fetch(urlBase + "/mantenimiento/reportes-fallos", {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'Authorization': 'Bearer ' + token
                    },
                    body: JSON.stringify(Fallo)
                })
                .then(response => response.json())
                .then(data => {
                    alert('Fallo registrado con ID: ' + data.id);
                    cargartabla();
                })
                .catch(error => console.error('Error al registrar el fallo:', error));
            }

            function cargartabla() {
                fetch(urlBase + "/mantenimiento/listarReportes/" + id, {
                    method: 'GET',
                    headers: {
                        'Authorization': 'Bearer ' + token
                    }
                })
                .then(response => response.json())
                .then(data => {
                    const tablaBody = document.getElementById('tablaid');
                    tablaBody.innerHTML = ''; 

                    data.forEach(report => {
                        const tr = document.createElement('tr');
                        tr.innerHTML = '<td>' + report.id + '</td>' +
                                       '<td>' + report.descripcion + '</td>' +
                                       '<td>' + report.fecha_reporte + '</td>' +
                                       '<td>' + report.vehiculo.marca + ' - ' + report.vehiculo.placa + '</td>';
                        tablaBody.appendChild(tr);
                    });
                })
                .catch(error => console.error('Error al cargar los reportes:', error));
            }

            cargartabla();
        </script>
        
    </body>
</html>
