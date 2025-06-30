<?php
require_once 'db_connection.php';

$game_id = $_POST['game_id'] ?? 0;
$user_id = $_POST['user_id'] ?? 0;
$score = $_POST['score'] ?? 0;

$stmt = $conn->prepare("CALL sp_create_game_score(?, ?, ?)");
$stmt->bind_param("iii", $game_id, $user_id, $score);

if ($stmt->execute()) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['error' => $stmt->error]);
}

$stmt->close();
$conn->close();
?>
