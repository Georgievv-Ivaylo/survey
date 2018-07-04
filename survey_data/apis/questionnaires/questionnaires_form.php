<?php
$data = [];

$query = '
  SELECT questionnaires.id,
         questionnaires.title
    FROM questionnaires
   WHERE questionnaires.status != "unactive"
';
$stmt = $db->prepare($query);
$stmt->execute([]);
$data = $stmt->fetchAll();

echo json_encode($data);
