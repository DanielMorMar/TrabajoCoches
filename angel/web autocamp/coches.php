<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Coches 2:ahora sabes cuales hay</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="menu.css">
</head>
<body>
<?php
    // Mostrar todos los errores (útil para debugging)
    ini_set('display_errors', 1);
    error_reporting(E_ALL);
    // Conectar a la base de datos
    // Cambiar el servername por el que proceda: localhost, IP, url, …
    $servername = "127.0.0.1";
    $username = "asirweb";
    $password = "qwe_123";
    $dbname = "webasir";
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Verificar la conexión
    if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
    }
?>
    <div id="mySidebar" class="sidebar">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
        <a href="index.html">Página principal</a>
        <a href="#">Iniciar sesión</a>
        <a href="#">Contacta</a>
      </div>  
      <div id="main">
        <button class="openbtn" onclick="openNav()">☰ Menú</button>
          
       </div>
      <script>
      function openNav() {
        document.getElementById("mySidebar").style.width = "250px";
        document.getElementById("main").style.marginLeft = "250px";
      }
      
      function closeNav() {
        document.getElementById("mySidebar").style.width = "0";
        document.getElementById("main").style.marginLeft= "0";
      }
      </script>
    <table>
        <div class="flex-container">
            <h1> COCHES DISPONIBLES</h1>
            <table>
                <tr>
                    <th>COCHES</th>
                    <th></th>
                    <th></th>
                </tr>
                <tr>
                    <td>matrícula</td>
                    <td>Marca</td>
                    <td>Modelo</td>
                    <td></td>
                </tr>
                <tr>
                    <td>AAA1234</td>
                    <td>Renault</td>
                    <td>Megane</td>
                    <td><a href="datos.html">ver</a></td>
                </tr>
                <tr>
                    <td>AAA1234</td>
                    <td>Renault</td>
                    <td>Megane</td>
                    <td><a href="datos.html">ver</a></td>
                </tr>
            </table>
            <tbody>
                <?php
                    // Consultar los datos
                    $sql = "SELECT * FROM clientes";
                    $result = $conn->query($sql);
                    if ($result === false) {
                    die("Error en la consulta: " . $conn->error);
                    }
                    if ($result->num_rows > 0) {
                        while($row = $result->fetch_assoc()) {
                        echo " <tr>
                            <td>{$row['razon_social']}</td>
                            <td>{$row['descripcion']}</td>
                            <td>{$row['email']}</td>
                            <td>{$row['telefono']}</td>
                            </tr>";
                        }
                    }
                ?>
            </tbody>
        </div>
    </table>
</body>
</html>