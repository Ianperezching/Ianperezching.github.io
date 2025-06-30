<?php
require_once 'db_connection.php';

$username = $_POST['username'] ?? '';
$password = $_POST['password'] ?? '';
$state = $_POST['state'] ?? 1;

$stmt = $conn->prepare("CALL sp_create_user(?, ?, ?)");
$stmt->bind_param("ssi", $username, $password, $state);

if ($stmt->execute()) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['error' => $stmt->error]);
}

$stmt->close();
$conn->close();
?>
