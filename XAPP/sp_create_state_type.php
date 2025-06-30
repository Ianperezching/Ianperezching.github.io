<?php
require_once 'db_connection.php';

$name = $_POST['name'] ?? '';

$stmt = $conn->prepare("CALL sp_create_state_type(?)");
$stmt->bind_param("s", $name);

if ($stmt->execute()) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['error' => $stmt->error]);
}

$stmt->close();
$conn->close();
?>
