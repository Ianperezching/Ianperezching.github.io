<?php
require_once 'db_connection.php';

$user_id = $_POST['user_id'] ?? 0;
$token = $_POST['token'] ?? '';

$stmt = $conn->prepare("CALL sp_create_user_token(?, ?)");
$stmt->bind_param("is", $user_id, $token);

if ($stmt->execute()) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['error' => $stmt->error]);
}

$stmt->close();
$conn->close();
?>
