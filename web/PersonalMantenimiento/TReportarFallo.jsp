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
                            <input type="number" class="form-control" required>
                        </div>
                        <div>
                            <label >Nombre</label>
                            <input type="text" class="form-control" required>
                        </div>
                        <div >
                            <label for="descripcion">descripcion</label>
                            <textarea class="form-control"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Solicitar</button>
                    </form>
                </div>
            </div>
            <h1 >Fallos Reportados</h1>
            <div class="tablafallos">
                    <table class="table table-striped table-dark">
                        <thead>
                            <tr>
                                <th>ID  Vehiculo</th>
                                <th>Nombre</th>
                                <th>Descripción</th>
                                <th>Fecha</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Fallo en frenos</td>
                                <td>Los frenos hacen un ruido extraño al frenar</td>
                                <td>2024-05-20</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Luces no funcionan</td>
                                <td>Las luces delanteras no encienden al activarlas</td>
                                <td>2024-05-21</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Fallo en frenos</td>
                                <td>Los frenos hacen un ruido extraño al frenar</td>
                                <td>2024-05-20</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Luces no funcionan</td>
                                <td>Las luces delanteras no encienden al activarlas</td>
                                <td>2024-05-21</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Fallo en frenos</td>
                                <td>Los frenos hacen un ruido extraño al frenar</td>
                                <td>2024-05-20</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Luces no funcionan</td>
                                <td>Las luces delanteras no encienden al activarlas</td>
                                <td>2024-05-21</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Fallo en frenos</td>
                                <td>Los frenos hacen un ruido extraño al frenar</td>
                                <td>2024-05-20</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Luces no funcionan</td>
                                <td>Las luces delanteras no encienden al activarlas</td>
                                <td>2024-05-21</td>
                            </tr>
                        </tbody>
                
            </div>
        </div>
        
        
    </body>
</html>
