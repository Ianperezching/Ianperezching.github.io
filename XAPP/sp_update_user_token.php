<?php
require_once 'db_connection.php';

$id = $_POST['id'] ?? 0;
$token = $_POST['token'] ?? '';

$stmt = $conn->prepare("CALL sp_update_user_token(?, ?)");
$stmt->bind_param("is", $id, $token);

if ($stmt->execute()) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['error' => $stmt->error]);
}

$stmt->close();
$conn->close();
?>
