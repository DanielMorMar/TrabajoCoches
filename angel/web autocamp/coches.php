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
    $servername = "0.0.0.0";
    $username = "admin";
    $password = "123456789";
    $dbname = "camp";
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
                    <th>Modelo</th>
                    <th>Foto</th>
                    <th>Gama</th>
                    <th>Precio</th>
                    <th>Combustible</th>
                    <th>Motor</th>
                    <th>Plazas</th>
                    <th>Maletas</th>
                </tr>
            <tbody>
                <?php
                    // Consultar los datos
                    $sql = "SELECT modelo, foto, nomgama, precio, combustible, motor, plazas, maletas FROM coche, gama WHERE gama.codgama = coche.codgama AND stock > 0";;
                    $result = $conn->query($sql);
                    if ($result === false) {
                    die("Error en la consulta: " . $conn->error);
                    }
                    if ($result->num_rows > 0) {
                        while($row = $result->fetch_assoc()) {
                            $ruta_imagen = "imagenes/" . $row['foto'];
                        echo "<tr>
                    <td>{$row['modelo']}</td>
                    <td><img src='{$ruta_imagen}' alt='Foto del coche' style='width: 100px; height: 100px;'></td>
                    <td>{$row['nomgama']}</td>
                    <td>{$row['precio']} €</td>
                    <td>{$row['combustible']}</td>
                    <td>{$row['motor']}</td>
                    <td>{$row['plazas']}</td>
                    <td>{$row['maletas']}</td>
                  </tr>";
                        }
                    }
                ?>
            </tbody>
        </div>
    </table>
</body>
</html>
