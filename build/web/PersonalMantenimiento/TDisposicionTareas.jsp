<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/tecnicocss/global.css"/>
        <link rel="stylesheet" href="../css/tecnicocss/disposicionTareas.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <title>Disposicion Tareas</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">

    </head>
    <body>
        <%@ include file="../PersonalMantenimiento/tecnicoBase.jsp" %>
        <script src="../js/tecnicos/disposiciontareas.js"></script>
        <div class="contenedor">
            <h1 class="titulo">Disposicion Tareas</h1>
            <div class="tablaDisposicion">
                <table class="table table-striped table-dark">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Descripción</th>
                            <th scope="col">Estado</th>
                            <th scope="col">Vehículo</th>
                            <th scope="col">Sucursal</th>
                            <th scope="col">Técnico</th>
                            <th scope="col">Acción</th>
                        </tr>
                    </thead>
                    <tbody id="tareas-tbody">
                    </tbody>
                    <script>
                    const urlBase = "http://localhost:9090/api/v1";
                    usuario = JSON.parse(sessionStorage.getItem('usuario'));
                    const tokenn=usuario.token
                    let tecnicoId = null;

                    document.addEventListener('DOMContentLoaded', () =>{
                        if (!usuario || !tokenn) {
                            console.error('Usuario no autenticado');
                            alert('Usuario no autenticado. Por favor, inicie sesión nuevamente.');
                            window.location.href = '/login'; 
                            return;
                        }

                        tecnicoId = usuario.id;

                        fetch(urlBase.concat("/mantenimiento/tareas"), {
                            method: 'GET',
                            headers: {
                                'Authorization': 'Bearer ' + tokenn
                            }
                        })
                        .then(response => {
                            if (!response.ok) {
                                throw new Error('Error en la solicitud: ' + response.status);
                            }
                            return response.json();
                        })
                        .then(data => {
                            console.log(data);
                            const tbody = document.getElementById('tareas-tbody');
                            tbody.innerHTML = '';

                            data.forEach(tarea => {
                                const tr = document.createElement('tr');
                                const tecnicoInfo = tarea.tecnico ? tarea.tecnico.nombre + ' ' + tarea.tecnico.apellido : 'No asignado';
                                const asignarBoton = tarea.tecnico ? 
                                    '<button class="btn btn-primary" disabled>Asignado</button>' : 
                                    '<button class="btn btn-primary" onclick="asignarTecnico(' + tarea.id + ')">Elegir</button>';

                                tr.innerHTML = `
                                    <th scope="row">` + tarea.id + `</th>
                                    <td>` + tarea.descripcion + `</td>
                                    <td>` + tarea.estado + `</td>
                                    <td>` + tarea.orden_trabajo.vehiculo.placa + ` ` + tarea.orden_trabajo.vehiculo.marca + ` ` + tarea.orden_trabajo.vehiculo.modelo + `</td>
                                    <td>` + tarea.orden_trabajo.vehiculo.sucursal.nombre + ` (` + tarea.orden_trabajo.vehiculo.sucursal.ciudad + `)</td>
                                    <td>` + tecnicoInfo + `</td>
                                    <td>` + asignarBoton + `</td>
                                `;
                                tbody.appendChild(tr);
                            });
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            alert('Error al cargar las tareas: ' + error.message);
                        });
                    });
                    
                    function asignarTecnico(tareaId) {
                        if (tecnicoId) {
                            fetch(urlBase + "/mantenimiento/" + tareaId + "/asignar", {
                                method: 'PUT',
                                headers: {
                                    'Content-Type': 'application/json',
                                    'Authorization': 'Bearer ' + tokenn
                                },
                                body: JSON.stringify({ tecnicoId: parseInt(tecnicoId) })
                            })
                            .then(response => {
                                if (!response.ok) {
                                    throw new Error('Hubo un problema al asignar el técnico');
                                }
                                return response.json();
                            })
                            .then(data => {
                                alert('Técnico asignado correctamente');
                                location.reload();
                            })
                            .catch(error => {
                                console.error('Error:', error.message);
                                alert('Error al asignar el técnico: ' + error.message);
                            });
                        } else {
                            console.error('ID no válido');
                        }
                    }                 
                    </script>
                </table>
                
            </div>      
        </div>
        
    </body>
</html>
