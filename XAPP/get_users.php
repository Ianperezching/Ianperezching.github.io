<?php
require 'db.php';

$stmt = $pdo->query("CALL GetAllUsers()");
$users = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($users);
?>