<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="../css/tecnicocss/global.css"/>
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
                        <th>Estado</th>
                        <th>Nombre solicitante</th>
                        <th>Sucursal</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody id="tablabody">
                </tbody>
            </table>
        </div>

        <div class="tablaDisposicion">
            <h1 class="titulo">Productos de la Solicitud</h1>
            <table class="table table-striped table-dark">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Descripcion</th>
                        <th>Cantidad en Stock</th>
                        <th>Stock Minimo</th>
                    </tr>
                </thead>
                <tbody id="productosbody">
                </tbody>
            </table>
        </div>
    </div>
    <script>
        const urlBase = "http://localhost:9090/api/v1";
        let usuario = JSON.parse(sessionStorage.getItem('usuario'));
        let id = usuario.id;
        let token = usuario.token;

        document.addEventListener('DOMContentLoaded', function() {
            const tablaSolicitudes = document.getElementById('tablabody');
            const productosBody = document.getElementById('productosbody');

            function cargarSolicitudesPorTecnico() {
                fetch(urlBase + '/mantenimiento/solicitudes-repuestos/tecnico/' + id, {
                    method: 'GET',
                    headers: {
                        'Authorization': 'Bearer ' + token
                    }
                })
                .then(response => response.json())
                .then(data => {
                    tablaSolicitudes.innerHTML = '';
                    data.forEach(solicitud => {
                        const tr = document.createElement('tr');
                        const acciones = solicitud.estado === 'Pendiente' 
                            ? '<button type="button" class="btn btn-danger btn-sm" onclick="eliminarSolicitud(this)">Eliminar</button>' 
                            : '';

                        tr.innerHTML = 
                            '<td>' + solicitud.id + '</td>' +
                            '<td>' + solicitud.descripcion + '</td>' +
                            '<td>' + solicitud.estado + '</td>' +
                            '<td>' + solicitud.tecnico.nombre + ' ' + solicitud.tecnico.apellido + '</td>' +
                            '<td>' + solicitud.tecnico.sucursal.nombre + ' ' + solicitud.tecnico.sucursal.ciudad + '</td>' +
                            '<td>' + acciones + '</td>';
                        tr.addEventListener('click', () => cargarProductosPorSolicitud(solicitud.id));
                        tablaSolicitudes.appendChild(tr);
                    });
                })
                .catch(error => console.error('Error:', error));
            }

            function cargarProductosPorSolicitud(solicitudId) {
                fetch(urlBase + '/mantenimiento/listarProductosBySolicitud/' + solicitudId, {
                    method: 'GET',
                    headers: {
                        'Authorization': 'Bearer ' + token
                    }
                })
                .then(response => response.json())
                .then(data => {
                    productosBody.innerHTML = '';
                    data.forEach(producto => {
                        const tr = document.createElement('tr');
                        tr.innerHTML = 
                            '<td>' + producto.id + '</td>' +
                            '<td>' + producto.nombre + '</td>' +
                            '<td>' + producto.descripcion + '</td>' +
                            '<td>' + producto.cantidad_en_stock + '</td>' +
                            '<td>' + producto.stock_minimo + '</td>';
                        productosBody.appendChild(tr);
                    });
                })
                .catch(error => console.error('Error:', error));
            }

            cargarSolicitudesPorTecnico();
        });

        function eliminarSolicitud(button) {
            var row = button.parentNode.parentNode;
            var solicitudId = row.cells[0].textContent;

            fetch(urlBase + '/mantenimiento/solicitudes-repuestos/' + solicitudId, {
                method: 'DELETE',
                headers: {
                    'Authorization': 'Bearer ' + token
                }
            })
            .then(response => {
                if (response.ok) {
                    console.log('Solicitud eliminada correctamente');
                    row.remove();
                } else {
                    console.error('Error al eliminar la solicitud');
                }
            })
            .catch(error => console.error('Error:', error));
        }
    </script>
</body>
</html>
<style>
        .contenedor {
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 20px;
    }

    .contenedor .titulo {
        font-size: 36px;
        text-align: center;
        margin-bottom: 20px;
    }

    .contenedor .tablaDisposicion {
        width: 100%;
        margin-bottom: 40px;
    }

    .contenedor .tablaDisposicion table {
        width: 100%;
        border-collapse: collapse;
    }

    .contenedor .tablaDisposicion th,
    .contenedor .tablaDisposicion td {
        padding: 12px;
        text-align: left;
    }

    .contenedor .tablaDisposicion thead {
        background-color: #343a40;
        color: white;
    }

    .contenedor .tablaDisposicion tbody tr:nth-child(even) {
        background-color: #495057;
    }

    .contenedor .tablaDisposicion tbody tr:hover {
        background-color: #6c757d;
    }

    .contenedor .tablaDisposicion .titulo {
        font-size: 24px;
        text-align: center;
        margin-bottom: 10px;
    }

    .contenedor .tablaDisposicion .table {
        margin-bottom: 0;
    }

</style>