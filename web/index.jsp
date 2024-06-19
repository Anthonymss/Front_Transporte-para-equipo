<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Form | Dan Aleko</title>
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
  <div class="wrapper">
    <form action="">
      <h1>Login</h1>
      <div class="input-box">
        <input id="username" type="text" placeholder="Mail" required autocomplete="username">

        <i class='bx bxs-user'></i>
      </div>
      <div class="input-box">
        <input id="pass" type="password" placeholder="Password" required autocomplete="current-password">
        <i class='bx bxs-lock-alt' ></i>
      </div>
      <div class="remember-forgot">
        <label><input type="checkbox">Remember Me</label>
        <a href="prueva.html">Forgot Password</a>
      </div>
      <button id="login" type="button" class="btn">Login</button>
      <div class="register-link"></div>
       <div id="error-message" style="color: red ;text-align: center;padding-top: 20px"></div>
    </form>
     
  </div>

    <script ">
    const urlBase = "http://localhost:9090/api/v1";
    document.getElementById('login').addEventListener('click', () => {
    const username = document.getElementById('username').value;
    const pass = document.getElementById('pass').value;
    console.log(urlBase+"::::::");
    const credenciales = {
      username: username,
      password: pass
    };
    // fetch para logear
    fetch(urlBase.concat("/authenticate"), {
      method: "POST",
      body: JSON.stringify(credenciales),
      headers: {
        "Content-Type": "application/json; charset=UTF-8"
      }
    })
    .then(response => {
      if (!response.ok) {
        throw new Error('Credenciales Incorrectas 😶');
      }
      return response.json();
    })
    .then(json => {
      const usuario = {
        token: json.token,
        id: json.id,
        nombre: json.nombre,
        apellido: json.apellido,
        correoElectronico: json.correoElectronico,
        imagen: json.imagen,
        role: json.roles[0].nombre
      };
      sessionStorage.setItem('usuario', JSON.stringify(usuario));
      switch (usuario.role) {
        case "ADMINISTRADOR":
          window.location.href = "Admin/ARegistro.jsp";
          break;
        case "MANTENIMIENTO":
          window.location.href = "PersonalMantenimiento/TDisposicionTareas.jsp";
          break;
          case "ALMACEN":
          window.location.href = "PersonalMantenimiento/TDisposicionTareas.jsp";
          break;
        default:
          break;
      }
    })
    .catch(error => {
      console.error('Error:', error);
      document.getElementById('error-message').innerText = error.message;
    });
  });
</script>

</body>
</html>

<style>
    *{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Poppins", sans-serif;
}
body{
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background-image: url("fondo.jpg");
  background-size: cover;
  background-position: center;
}
.wrapper{
  width: 420px;
  background-color:#00000046;
  border: 2px solid rgba(255, 255, 255, .2);
  border-radius: 12px;
  color: #fff;
  border-radius: 12px;
  padding: 30px 40px;
}
.wrapper h1{
  font-size: 36px;
  text-align: center;
}
.wrapper .input-box{
  position: relative;
  width: 100%;
  height: 50px;
  
  margin: 30px 0;
}
.input-box input{
  width: 100%;
  height: 100%;
  background: transparent;
  border: none;
  outline: none;
  border: 2px solid rgba(255, 255, 255, .2);
  border-radius: 40px;
  font-size: 16px;
  color: #fff;
  padding: 20px 45px 20px 20px;
}
.input-box input::placeholder{
  color: #fff;
}
.input-box i{
  position: absolute;
  right: 20px;
  top: 30%;
  transform: translate(-50%);
  font-size: 20px;

}
.wrapper .remember-forgot{
  display: flex;
  justify-content: space-between;
  font-size: 14.5px;
  margin: -15px 0 15px;
}
.remember-forgot label input{
  color: white;
  margin-right: 3px;

}
.remember-forgot a{
  color: #fff;
  text-decoration: none;

}
.remember-forgot a:hover{
  text-decoration: underline;
}
.wrapper .btn{
  margin-top:30px ;
  width: 100%;
  height: 45px;
  background: #fff;
  border: none;
  outline: none;
  border-radius: 40px;
  box-shadow: 0 0 10px rgba(0, 0, 0, .1);
  cursor: pointer;
  font-size: 16px;
  color: #333;
  font-weight: 600;
}
.wrapper .btn:hover{
    background: #000000;
    color: #fff;
    transition: 0.5s;
    box-shadow: 0 0 20px rgba(190, 190, 190, 0.2);
    transform: scale(1.05);
    transition: 0.5s;
    border: 0.1px,rgb(70, 69, 70),solid;
    font-size: 20px;

}
</style>