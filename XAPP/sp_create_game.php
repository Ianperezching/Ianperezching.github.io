<?php
require_once 'db_connection.php';

$gamename = $_POST['gamename'] ?? '';
$created_by = $_POST['created_by'] ?? '';

$stmt = $conn->prepare("CALL sp_create_game(?, ?)");
$stmt->bind_param("ss", $gamename, $created_by);

if ($stmt->execute()) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['error' => $stmt->error]);
}

$stmt->close();
$conn->close();
?>
