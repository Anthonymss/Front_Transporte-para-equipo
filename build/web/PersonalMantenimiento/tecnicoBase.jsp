<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="menu">
  <br><br>
    <h3 class="TipoOperador">Técnico</h3>
    <div class="logo">
        <img src="../resources/avatar-modified.png" alt="tecnico">
        <p id="NombreUsuario">Nombre</p>
    </div>
    <br><br><br>
    <nav>
        <div  class="dash"><i class="bi bi-columns-gap"></i>&nbsp;&nbsp; Dashboard</div>
        <a href="../PersonalMantenimiento/TDisposicionTareas.jsp">Disposición de Tareas</a>
        <a href="../PersonalMantenimiento/TTareasPendientes.jsp">Tareas Pendientes</a>
        <a href="../PersonalMantenimiento/TOrdenarRepuestos.jsp">Ordenar Repuestos</a>
        <a href="../PersonalMantenimiento/TGestionarRepuestos.jsp">Gestionar Respuestos Pendientes</a>
        <a href="../PersonalMantenimiento/TReportarFallo.jsp">Reportar Fallo</a>
    </nav>
</div>
<script>
    let nombreusuario=document.getElementById("NombreUsuario");
    let user=JSON.parse(sessionStorage.getItem('usuario'));
    nombreusuario.innerText=user.nombre.split(" ")[0] +"\t"+user.apellido.split(" ")[0];
    nombreusuario.style.width="180px";
    nombreusuario.style.textAlign="center";
    nombreusuario.style.position="relative";
    nombreusuario.style.left="-40px";
</script>
