<?php
require_once 'db_connection.php';

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

$id = $_POST['id'] ?? 0;

$stmt = $conn->prepare("CALL sp_activate_user(?)");
$stmt->bind_param("i", $id);
$stmt->execute();

if ($stmt->affected_rows > 0) {
    echo json_encode(["status" => "success", "message" => "Usuario activado correctamente"]);
} else {
    echo json_encode(["status" => "error", "message" => "No se pudo activar el usuario"]);
}

$stmt->close();
$conn->close();
?>