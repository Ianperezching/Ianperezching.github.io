<?php
require_once 'db_connection.php';

$id = $_POST['id'] ?? 0;

$stmt = $conn->prepare("CALL sp_delete_user_token(?)");
$stmt->bind_param("i", $id);

if ($stmt->execute()) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['error' => $stmt->error]);
}

$stmt->close();
$conn->close();
?>
