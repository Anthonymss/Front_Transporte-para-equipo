<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/tecnicocss/global.css"/>
        <link rel="stylesheet" href="../css/tecnicocss/GestionarRepuestos.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <title>Gestionar Repuestos</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">

    </head>
    <body>
        <%@ include file="../PersonalMantenimiento/tecnicoBase.jsp" %>
        <script>
            let enlaces = document.querySelectorAll('a');
            enlaces[3].classList.add('active');
        </script>
        <div class="contenedor">
            <h1 class="titulo">Gestionar Repuestos Pendientes</h1>

                <div class="tablaDisposicion">
                    <table class="table table-striped table-dark">
                        <thead class="thead-dark">
                            <tr>
                                <th>ID</th>
                                <th>Descripcion</th>
                                <th>estado</th>
                                <th>Nombre solicitante</th>
                                <th>Sucursal</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody id="tablabody">
                            
                        </tbody>
                    </table>
                </div>
            </div>
        <script >
            document.addEventListener('DOMContentLoaded', function() {
            const tablaSolicitudes = document.getElementById('tablabody');

            function cargarSolicitudesPorTecnico() {
                fetch(`http://localhost:9090/api/v1/mantenimiento/solicitudes-repuestos`)
                    .then(response => response.json())
                    .then(data => {
                        tablaSolicitudes.innerHTML = '';
                        data.forEach(solicitud => {
                            const tr = document.createElement('tr');
                            console.log(solicitud);
                            tr.innerHTML = `
                                <td>`+solicitud.id+`</td>
                                <td>`+solicitud.descripcion+`</td>
                                <td>`+solicitud.estado+`</td>
                                <td>`+solicitud.tecnico.nombre + solicitud.tecnico.apellido+`</td>
                                <td>`+solicitud.tecnico.sucursal.nombre + solicitud.tecnico.sucursal.ciudad+`</td>
                                <td>
                                    <button type="button" class="btn btn-danger btn-sm" onclick="eliminarSolicitud(this)">Eliminar</button>
                                </td>
                            `;
                            tablaSolicitudes.appendChild(tr);
                        });
                    })
                    .catch(error => console.error('Error:', error));
            }

            cargarSolicitudesPorTecnico();
        });
        
        //kill
        function eliminarSolicitud(button) {
            var row = button.parentNode.parentNode;
            var solicitudId = row.cells[0].textContent;

            fetch(`http://localhost:9090/api/v1/mantenimiento/solicitudes-repuestos/`+solicitudId, {
                method: 'DELETE'
            })
            .then(response => {
                if (response.ok) {
                    console.log('Solicitud eliminada correctamente');
                    row.remove();
                    location.reload();
                } else {
                    console.error('Error al eliminar la solicitud');
                }
            })
            .catch(error => console.error('Error:', error));
        }

        </script>
        
    </body>
</html>
