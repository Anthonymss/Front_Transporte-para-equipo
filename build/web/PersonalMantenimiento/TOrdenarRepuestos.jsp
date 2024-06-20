<%@ page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <div>
                            <label for="descripcion">Descripcion</label>
                            <textarea class="form-control" id="descripcion" name="descripcion"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Solicitar</button>
                    </form>
                </div>
            </div>
            <br><br><br><br><br>
            <h1>Agregar Productos a la Solicitud</h1>
            <div id="productosContainer"></div>
            <h1>Historial de Solicitudes</h1>
            <div class="tablaSolicitudes">
                <div class="card-body">
                    <table class="table table-striped table-dark">
                        <thead class="thead-dark">
                            <tr>
                                <th>ID</th>
                                <th>Descripcion</th>
                                <th>Estado</th>
                                <th>Nombre Solicitante</th>
                                <th>Sucursal</th>
                            </tr>
                        </thead>
                        <tbody id="tablabody"></tbody>
                    </table>
                </div>
            </div>
        </div>
        <script>
            const urlBase = "http://localhost:9090/api/v1";
            let usuario = JSON.parse(sessionStorage.getItem('usuario'));
            let id = usuario.id;
            let token = usuario.token;
            let solicitudId = null;

            document.addEventListener('DOMContentLoaded', () => {
                if (!usuario || !token) {
                    console.error('Usuario no autenticado');
                    alert('Usuario no autenticado. Por favor, inicie sesion nuevamente.');
                    window.location.href = '/login';
                    return;
                }

                fetch(urlBase + "/mantenimiento/solicitudes-repuestos/tecnico/" + id, {
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
                    const tablaSolicitudes = document.getElementById('tablabody');
                    tablaSolicitudes.innerHTML = '';
                    data.forEach(solicitud => {
                        const tr = document.createElement('tr');
                        tr.innerHTML = `
                            <td>` + solicitud.id + `</td>
                            <td>` + solicitud.descripcion + `</td>
                            <td>` + solicitud.estado + `</td>
                            <td>` + solicitud.tecnico.nombre + " " + solicitud.tecnico.apellido + `</td>
                            <td>` + solicitud.tecnico.sucursal.nombre + " " + solicitud.tecnico.sucursal.ciudad + `</td>
                        `;
                        tablaSolicitudes.appendChild(tr);
                    });
                })
                .catch(error => console.error('Error:', error));
            
                const formularioSolicitud = document.getElementById('solicitarRepuestoForm');
                formularioSolicitud.addEventListener('submit', function(event) {
                    event.preventDefault();
                    const descripcion = document.getElementById('descripcion').value;
                    const solicitudRepuesto = {
                        descripcion: descripcion,
                        estado: "Pendiente",
                        tecnico: { id: id }
                    };

                    fetch(urlBase + "/mantenimiento/solicitudes-repuestos", {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'Authorization': 'Bearer ' + token
                        },
                        body: JSON.stringify(solicitudRepuesto)
                    })
                    .then(response => response.json())
                    .then(data => {
                        solicitudId = data.id; 
                        alert('Solicitud de repuesto creada: ' + data.id);
                        cargarProductos(); 
                    })
                    .catch(error => console.error('Error al crear la solicitud de repuesto:', error));
                });
            });

            function cargarProductos() {
                fetch(urlBase + "/mantenimiento/productos-almacen/1", {
                    method: 'GET',
                    headers: {
                        'Authorization': 'Bearer ' + token
                    }
                })
                .then(response => response.json())
                .then(data => {
                    const productosContainer = document.getElementById('productosContainer');
                    productosContainer.innerHTML = '<table class="table table-striped"><thead><tr><th>ID</th><th>Nombre</th><th>Descripcion</th><th>Stock</th><th>Acciones</th></tr></thead><tbody id="productosBody"></tbody></table>';
                    const productosBody = document.getElementById('productosBody');
                    data.forEach(producto => {
                        const tr = document.createElement('tr');
                        tr.innerHTML = `
                            <td>` + producto.id + `</td>
                            <td>` + producto.nombre + `</td>
                            <td>` + producto.descripcion + `</td>
                            <td>` + producto.cantidad_en_stock + `</td>
                            <td><button class="btn btn-success" onclick="agregarProducto(` + producto.id + `)">Agregar</button></td>
                        `;
                        productosBody.appendChild(tr);
                    });
                })
                .catch(error => console.error('Error al cargar los productos:', error));
            }

            function agregarProducto(idProducto) {
                if (solicitudId === null) {
                    alert('Primero debe crear una solicitud.');
                    return;
                }

                fetch(urlBase + "/mantenimiento/agregarProducto/" + solicitudId + "/productos/" + idProducto, {
                    method: 'POST',
                    headers: {
                        'Authorization': 'Bearer ' + token
                    }
                })
                .then(response => {
                    if (response.ok) {
                        alert('Producto agregado a la solicitud.');
                    } else {
                        throw new Error('Error al agregar el producto: ' + response.status);
                    }
                })
                .catch(error => console.error('Error al agregar el producto:', error));
            }
        </script>
    </body>
</html>
