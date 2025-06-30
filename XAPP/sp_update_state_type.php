<?php
require_once 'db_connection.php';

$id = $_POST['id'] ?? 0;
$name = $_POST['name'] ?? '';

$stmt = $conn->prepare("CALL sp_update_state_type(?, ?)");
$stmt->bind_param("is", $id, $name);

if ($stmt->execute()) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['error' => $stmt->error]);
}

$stmt->close();
$conn->close();
?>
