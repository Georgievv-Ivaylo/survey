<?php
$data = [];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $dataPost = json_decode(file_get_contents('php://input'), true);

  $questionnaireId = $dataPost['questionnaire_id'];
  $tableProps = 'questionnaire_id, questionnaire_json';
  $tablePropsLength = '?,?';
  array_walk_recursive($dataPost, [$db, 'escapeData']);
  $values = [ $dataPost['questionnaire_id'] ];
  unset($dataPost['questionnaire_id']);
  $questionnaireJson = json_encode($dataPost);
  $values[] = $questionnaireJson;

	$query = '
    INSERT INTO answered_questionnaires ( '. $tableProps .' ) VALUES ('. $tablePropsLength .')
	';
	$stmt = $db->prepare($query);
	$stmt->execute($values);
  // $data = $dataPost;
  $returnData = $dataPost;
  array_walk_recursive($returnData, [$db, 'printData']);
  $data = $returnData;
}

echo json_encode($data);
