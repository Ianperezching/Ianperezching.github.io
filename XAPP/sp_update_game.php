<?php
require_once 'db_connection.php';

$id = $_POST['id'] ?? 0;
$gamename = $_POST['gamename'] ?? '';
$modified_by = $_POST['modified_by'] ?? '';

$stmt = $conn->prepare("CALL sp_update_game(?, ?, ?)");
$stmt->bind_param("iss", $id, $gamename, $modified_by);

if ($stmt->execute()) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['error' => $stmt->error]);
}

$stmt->close();
$conn->close();
?>
