<?php
require 'config.php';

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$data = json_decode(file_get_contents("php://input"), true);
$username = $data["username"];
$email = $data["email"];
$password = $data["password"];

$created_by = "system";

$stmt = $conn->prepare("CALL sp_create_user(?, ?, ?, ?)");
$stmt->bind_param("ssss", $username, $email, $password, $created_by);
$stmt->execute();

if ($stmt->affected_rows > 0) {
    echo json_encode(["status" => "success", "message" => "Usuario creado correctamente"]);
} else {
    echo json_encode(["status" => "error", "message" => "No se pudo crear el usuario"]);
}

$stmt->close();
$conn->close();
?>