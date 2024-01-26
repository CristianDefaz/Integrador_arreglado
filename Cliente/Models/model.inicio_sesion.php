<?php
session_start(); // Iniciar la sesión

require_once "model.conexion.php";

$correo = $_POST['correo'];
$contrasenia = $_POST['contrasenia'];

if($correo == "" || $contrasenia == ""){
    echo '<div class="notification is-danger is-light">
            <strong>¡No has llenado todos los datos!</strong><br>
          </div>';
    exit();
}

// Consulta SQL para verificar las credenciales
$query = "SELECT * FROM clientes WHERE Correo = '$correo' AND Contrasena = '$contrasenia'";
$resultado = mysqli_query($conexion, $query);

// Verificar si la consulta devuelve al menos una fila
if ($resultado && mysqli_num_rows($resultado) > 0) {
    // Obtener el ClienteID
    $fila = mysqli_fetch_assoc($resultado);
    $clienteID = $fila['ClienteID'];
    $nombre = $fila['Nombre'];

    // Almacenar el ClienteID en la sesión
    $_SESSION['ClienteID'] = $clienteID;
    $_SESSION['Nombre'] = $nombre;

    // Redireccionar a la página de inicio
    header("Location: http://localhost/integrador_sexto/Cliente/views/index.php?page=home/home");
    exit();
} else {
    echo '<div class="notification is-danger is-light">
            <strong>¡Ocurrió un error inesperado!</strong><br>
            Usuario o clave incorrectos
          </div>';
          exit();

}

// Cerrar la conexión a la base de datos
mysqli_close($conexion);
?>
