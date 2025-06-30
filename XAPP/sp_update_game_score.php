<?php
require_once 'db_connection.php';

$id = $_POST['id'] ?? 0;
$score = $_POST['score'] ?? 0;

$stmt = $conn->prepare("CALL sp_update_game_score(?, ?)");
$stmt->bind_param("ii", $id, $score);

if ($stmt->execute()) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['error' => $stmt->error]);
}

$stmt->close();
$conn->close();
?>
