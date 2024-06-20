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
            <h1 class="titulo">Gestión de Flota</h1>
            <div class="tablaDisposicion">
                <table class="table table-striped table-dark">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Vehículos</th>
                            <th scope="col">Mantenimiento Programado</th>
                            <th scope="col">Gestionar</th>
                            <th scope="col">Fecha de Vencimiento</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">V01</th>
                            <td>Hyundai</td>
                            <td>Revisar Frenos</td>
                            <td>Pendiente</td>
                            <td>2024-06-05</td>
                            <td><button class="btn btn-primary">Iniciar</button>
                                <button class="btn btn-success">Completar</button>
                                <button class="btn btn-info">Detalles</button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">V02</th>
                            <td>Ford</td>
                            <td>Cambiar Aceite</td>
                            <td>En progreso</td>
                            <td>2024-06-05</td>
                            <td><button class="btn btn-primary">Iniciar</button>
                                <button class="btn btn-success">Completar</button>
                                <button class="btn btn-info">Detalles</button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">V03</th>
                            <td>Nisan</td>
                            <td>Reparar luces</td>
                            <td>Pendiente</td>
                            <td>2024-06-05</td>
                            <td><button class="btn btn-primary">Iniciar</button>
                                <button class="btn btn-success">Completar</button>
                                <button class="btn btn-info">Detalles</button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">V04</th>
                            <td>Audi</td>
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
        <script>
    const urlBase = "http://localhost:9090/api/v1"; 
    let usuario = JSON.parse(sessionStorage.getItem('usuario')); 
    let token = usuario ? usuario.token : null; 

    document.addEventListener('DOMContentLoaded', () => {
        if (!usuario || !token) {
            console.error('Usuario no autenticado');
            alert('Usuario no autenticado. Por favor, inicie sesión nuevamente.');
            window.location.href = '/login'; 
            return;
        }
      
        const formularioGestion = document.getElementById('formularioGestion');
        formularioGestion.addEventListener('submit', function(event) {
            event.preventDefault(); 

            
            const vehiculo = document.getElementById('vehiculo').value;
            const mantenimiento = document.getElementById('mantenimiento').value;
            const estado = document.getElementById('estado').value;
            const fechaVencimiento = document.getElementById('fechaVencimiento').value;

            
            const datosMantenimiento = {
                vehiculo: vehiculo,
                mantenimiento: mantenimiento,
                estado: estado,
                fechaVencimiento: fechaVencimiento
            };

           
            fetch(urlBase + "/gestionflota", {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': 'Bearer ' + token
                },
                body: JSON.stringify(datosMantenimiento)
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Error en la solicitud: ' + response.status);
                }
                return response.json();
            })
            .then(data => {
                alert('Datos de mantenimiento guardados exitosamente.');
                
            })
            .catch(error => console.error('Error al guardar los datos de mantenimiento:', error));
        });
    });
</script>
    </body>
</html>
