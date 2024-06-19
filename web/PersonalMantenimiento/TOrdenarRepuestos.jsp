<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/tecnicocss/global.css"/>
        <link rel="stylesheet" href="../css/tecnicocss/OrdenarRespuestos.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <title>Ordenar Respuestos</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">

    </head>
    <body>
        <%@ include file="../PersonalMantenimiento/tecnicoBase.jsp" %>
        <script>
            let enlaces = document.querySelectorAll('a');
            enlaces[2].classList.add('active');
        </script>
        <div class="contenedor">  
            <h1>Solicitar Repuesto</h1>      
            <div class="Solicitar">
                <div class="card-body">
                    <form id="solicitarRepuestoForm">
                        <div >
                            <label for="descripcion">descripcion</label>
                            <textarea class="form-control" id="descripcion" name="descripcion"></textarea>
                        </div>
                        <div>
                            <label >estado</label>
                            <input type="text" class="form-control" id="estado" name="productoID" required>
                        </div>
                        
                        <button type="submit" class="btn btn-primary" onclick="">Solicitar</button>
                    </form>
                </div>
            </div>
            <br><br><br><br><br>
            <h1>Historial de Solicitudes</h1>
            <div class="tablaSolicitudes">
                <div class="card-body">
                    <table class="table table-striped table-dark">
                        <thead class="thead-dark">
                            <tr>
                                <th>ID</th>
                                <th>Descripcion</th>
                                <th>estado</th>
                                <th>Nombre solicitante</th>
                                <th>Sucursal</th>
                            </tr>
                        </thead>
                        <tbody id="tablabody">
                            
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script>
            const urlBase = "http://localhost:9090/api/v1";
            let usuario = JSON.parse(sessionStorage.getItem('usuario'));
            let id=usuario.id
            let token=usuario.token;
            console.log(usuario);
            const tablaSolicitudes = document.getElementById('tablabody');
            document.addEventListener('DOMContentLoaded',()=>{
                if (!usuario || !tokenn) {
                    console.error('Usuario no autenticado');
                    alert('Usuario no autenticado. Por favor, inicie sesión nuevamente.');
                    window.location.href = '/login'; 
                    return;
                }
                fetch(urlBase.concat("/mantenimiento/solicitudes-repuestos/tecnico/".concat(id),
                    {
                        method: 'GET',
                        headers: 
                        {
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
                        tablaSolicitudes.innerHTML = '';
                        data.forEach(solicitud => {
                            const tr = document.createElement('tr');

                            tr.innerHTML = `
                                <td>`+solicitud.id+`</td>
                                <td>`+solicitud.descripcion+`</td>
                                <td>`+solicitud.estado+`</td>
                                <td>`+solicitud.tecnico.nombre + solicitud.tecnico.apellido+`</td>
                                <td>`+solicitud.tecnico.sucursal.nombre + solicitud.tecnico.sucursal.ciudad+`</td>
                            `;

                            tablaSolicitudes.appendChild(tr);
                        });
                    })
                    .catch(error => console.error('Error:', error));
            
        });
            //FORM
            document.addEventListener('DOMContentLoaded', function() {
    const formularioSolicitud = document.getElementById('solicitarRepuestoForm');

    formularioSolicitud.addEventListener('submit', function(event) {
        event.preventDefault();
        
        const descripcion = document.getElementById('descripcion').value;
        const estado = document.getElementById('estado').value; 

        const solicitudRepuesto = {
            descripcion: descripcion,
            estado: estado,
            tecnico: {
                id: 1 
            }
        };

        fetch('http://localhost:9090/api/v1/mantenimiento/solicitudes-repuestos', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(solicitudRepuesto)
        })
        .then(response => response.json())
        .then(data => {
            console.log('Solicitud de repuesto creada:', data);
    location.reload();
        })
        .catch(error => console.error('Error al crear la solicitud de repuesto:', error));
    });
});

           
        </script>
        
    </body>
</html>
