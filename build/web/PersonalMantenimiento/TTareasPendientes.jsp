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
        <%@ include file="../PersonalMantenimiento/tecnicoBase.jsp" %>
        <script>
            let enlaces = document.querySelectorAll('a');
            enlaces[1].classList.add('active');
        </script>
        <div class="contenedor">
            <h1 class="titulo">Pendientes</h1>
            <div class="tablaDisposicion">
                <table class="table table-striped table-dark">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Descripción</th>
                            <th scope="col">Estado</th>
                            <th scope="col">Vehículo</th>
                            <th scope="col">Sucursal</th>
                            <th scope="col">Acción</th>
                        </tr>
                    </thead>
                    <tbody id="tablaTareas">
                        
                    </tbody>
                </table>
                
            </div>      
        </div>
        <script>
            const urlBase = "http://localhost:9090/api/v1";
            let usuario = JSON.parse(sessionStorage.getItem('usuario'));
            let id=usuario.id
            let token=usuario.token;
            
            console.log(usuario);
            document.addEventListener('DOMContentLoaded', () =>{
                if (!usuario || !token) {
                            console.error('Usuario no autenticado');
                            alert('Usuario no autenticado. Por favor, inicie sesión nuevamente.');
                            window.location.href = '/login'; 
                            return;
                }
                
                    fetch(urlBase.concat("/mantenimiento/tareas/tecnico/").concat(id),{
                        method: 'GET',
                        headers: {
                            'Authorization': 'Bearer ' + token
                        }
                    })
                    .then(response => {
                            if (!response.ok) {
                                throw new Error('Error en la solicitud: ' + response.status);
                            }
                            return response.json();
                    })
                    .then(data => {
                    const tareas = Object.values(data); 
                    const tbody = document.getElementById('tablaTareas');
                    tbody.innerHTML = '';

                    tareas.forEach(tarea => {
                        const tr = document.createElement('tr');
                            tr.innerHTML = '<th scope="row">' + tarea.id + '</th>' +
                            '<td>' + tarea.descripcion + '</td>' +
                            '<td>' + tarea.estado + '</td>' +
                            '<td>' + tarea.orden_trabajo.descripcion + '</td>' +
                            '<td>' + tarea.orden_trabajo.estado + '</td>' +
                            '<td>' +
                                '<button class="btn btn-primary" onclick="actualizarEstadoTarea('+tarea.id+')">Completar</button>' +
                            '</td>';

                        tbody.appendChild(tr);
                        });
                    })
                    .catch(error => console.error('Error:', error));
    });
//                                                        <button class="btn btn-info">Detalles</button>
//        <button class="btn btn-success" onclick="completarTarea(${tarea.id})">Completar</button>                                 <button class="btn btn-info">Detalles</button>


            function actualizarEstadoTarea(tareaId) {
                fetch(urlBase.concat("/mantenimiento/tareas/").concat(tareaId).concat("/estado?estado=COMPLETADO"), 
                {
                    method: 'PUT',
                    headers: {
                        'Content-Type': 'application/json',
                        'Authorization': 'Bearer ' + token
                    },
                    body: JSON.stringify({ estado: 'COMPLETADO' })
                })
                .then(response => response.json())
                .then(data => {
                    console.log('Tarea actualizada:', data);
                })
                .catch(error => console.error('Error:', error));
            }

        </script>
        
    </body>
</html>
