<?php
require 'config.php';

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

$result = $conn->query("CALL sp_get_users()");

if ($result) {
    $data = $result->fetch_all(MYSQLI_ASSOC);
    echo json_encode($data);
} else {
    echo json_encode(['error' => $conn->error]);
}

$conn->close();
?>