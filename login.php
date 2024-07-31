<?php
session_start();
include 'db.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];

    $sql = "SELECT * FROM users WHERE email='$email' AND password='$password'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // Usuario encontrado
        $_SESSION['user'] = $email;
        header("Location: inventario.html"); // Redirigir a la página del inventario
    } else {
        // Usuario no encontrado
        echo "Correo o contraseña incorrectos";
    }
}

?>