<?php
require 'config.php';

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

try {
    if ($conn->connect_error) {
        http_response_code(500);
        echo json_encode(["status" => "error", "message" => "Error de conexión a la base de datos"]);
        exit();
    }

    $data = json_decode(file_get_contents("php://input"), true);
    $username = $data["username"] ?? '';
    $password = $data["password"] ?? '';

    if (empty($username) || empty($password)) {
        http_response_code(400);
        echo json_encode(["status" => "error", "message" => "Todos los campos son obligatorios"]);
        exit();
    }

    $stmt = $conn->prepare("CALL sp_login_user(?, ?)");
    if (!$stmt) {
        http_response_code(500);
        echo json_encode(["status" => "error", "message" => "Error en la preparación de la consulta"]);
        exit();
    }
    $stmt->bind_param("ss", $username, $password);
    $stmt->execute();

    $result = $stmt->get_result();
    $user = $result->fetch_assoc();

    if ($user) {
        echo json_encode(["status" => "success", "message" => "Inicio de sesión exitoso", "user" => $user]);
    } else {
        http_response_code(401);
        echo json_encode(["status" => "error", "message" => "Credenciales inválidas"]);
    }

    $stmt->close();
    $conn->close();
} catch (Throwable $e) {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => "Error interno: " . $e->getMessage()]);
    exit();
}
?>