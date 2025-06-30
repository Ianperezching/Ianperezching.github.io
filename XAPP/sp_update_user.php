<?php
require_once 'db_connection.php';

$id = $_POST['id'] ?? 0;
$username = $_POST['username'] ?? '';
$password = $_POST['password'] ?? '';
$state = $_POST['state'] ?? 1;

$stmt = $conn->prepare("CALL sp_update_user(?, ?, ?, ?)");
$stmt->bind_param("issi", $id, $username, $password, $state);

if ($stmt->execute()) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['error' => $stmt->error]);
}

$stmt->close();
$conn->close();
?>
