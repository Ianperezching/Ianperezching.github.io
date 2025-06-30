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
    $created_by = 'web';

    if (empty($username) || empty($password)) {
        http_response_code(400);
        echo json_encode(["status" => "error", "message" => "Todos los campos son obligatorios"]);
        exit();
    }

    $password_hash = password_hash($password, PASSWORD_BCRYPT);

    $stmt = $conn->prepare("CALL sp_create_user(?, ?, ?)");
    if (!$stmt) {
        http_response_code(500);
        echo json_encode(["status" => "error", "message" => "Error en la preparación de la consulta"]);
        exit();
    }
    $stmt->bind_param("sss", $username, $password_hash, $created_by);

    if ($stmt->execute()) {
        echo json_encode(["status" => "success", "message" => "Usuario registrado correctamente"]);
    } else {
        http_response_code(500);
        echo json_encode(["status" => "error", "message" => "No se pudo registrar el usuario"]);
    }

    $stmt->close();
    $conn->close();
} catch (Throwable $e) {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => "Error interno: " . $e->getMessage()]);
    exit();
}
?>
