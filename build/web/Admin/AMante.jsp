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
            <h1 class="titulo">Programación de mantenimiento</h1>
            <div class="tablaDisposicion">
                <table class="table table-striped table-dark">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">ID Cliente</th>
                            <th scope="col">ID Vehiculo</th>
                            <th scope="col">Nuevo Mantemiento</th>
                            <th scope="col">Gestionar</th>
                            <th scope="col">Fecha de Vencimiento</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">C01</th>
                            <td>V01</td>
                            <td>Revisar Frenos</td>
                            <td>Pendiente</td>
                            <td>2024-06-05</td>
                            <td><button class="btn btn-primary">Iniciar</button>
                                <button class="btn btn-success">Completar</button>
                                <button class="btn btn-info">Detalles</button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">C02</th>
                            <td>V02</td>
                            <td>Cambiar Aceite</td>
                            <td>En progreso</td>
                            <td>2024-06-05</td>
                            <td><button class="btn btn-primary">Iniciar</button>
                                <button class="btn btn-success">Completar</button>
                                <button class="btn btn-info">Detalles</button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">C03</th>
                            <td>V03</td>
                            <td>Reparar luces</td>
                            <td>Pendiente</td>
                            <td>2024-06-05</td>
                            <td><button class="btn btn-primary">Iniciar</button>
                                <button class="btn btn-success">Completar</button>
                                <button class="btn btn-info">Detalles</button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">C04</th>
                            <td>V04</td>
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
        let id = usuario.id;
        let token = usuario.token;
        let solicitudId = null;

        document.addEventListener('DOMContentLoaded', () => {
            if (!usuario || !token) {
                console.error('Usuario no autenticado');
                alert('Usuario no autenticado. Por favor, inicie sesión nuevamente.');
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
                        <td>${solicitud.id}</td>
                        <td>${solicitud.descripcion}</td>
                        <td>${solicitud.estado}</td>
                        <td>${solicitud.tecnico.nombre} ${solicitud.tecnico.apellido}</td>
                        <td>${solicitud.tecnico.sucursal.nombre} ${solicitud.tecnico.sucursal.ciudad}</td>
                    `;
                    tablaSolicitudes.appendChild(tr);
                });
            })
            .catch(error => console.error('Error:', error));
        
            // Escuchar el envío del formulario para solicitar repuesto
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
                productosContainer.innerHTML = '<table class="table table-striped"><thead><tr><th>ID</th><th>Nombre</th><th>Descripción</th><th>Stock</th><th>Acciones</th></tr></thead><tbody id="productosBody"></tbody></table>';
                const productosBody = document.getElementById('productosBody');
                data.forEach(producto => {
                    const tr = document.createElement('tr');
                    tr.innerHTML = `
                        <td>${producto.id}</td>
                        <td>${producto.nombre}</td>
                        <td>${producto.descripcion}</td>
                        <td>${producto.cantidad_en_stock}</td>
                        <td><button class="btn btn-success" onclick="agregarProducto(${producto.id})">Agregar</button></td>
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
