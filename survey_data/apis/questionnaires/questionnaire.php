<?php
$data = [];

if (empty($_GET['qid']) || !is_numeric($_GET['qid'])) {
  $data['errorMsg'] = 'Unvalid Questionnaire!';
  echo json_encode($data);
  exit;
}

$questionnaireId = $_GET['qid']+0;
$query = '
  SELECT questionnaires.id,
         questionnaires.title,
         questionnaires.questions_json
    FROM questionnaires
   WHERE questionnaires.id = ?
';
$stmt = $db->prepare($query);
$stmt->execute([ $questionnaireId ]);
$data = $stmt->fetchRow();

$questionsData = [];
$questions = [];
$questionsData = @json_decode($data['questions_json'], 1);
$query = '
  SELECT questions.id,
         questions.name,
         questions.title,
         questions.answers_json,
         questions.type
    FROM questions
   WHERE questions.id IN ('. implode(',', $questionsData['questions']) .')
         AND status != "unactive"
';
$stmt = $db->prepare($query);
$stmt->execute([  ]);
$questions = $stmt->fetchAll();

foreach ($questions as $questionK => $questionV) {
  $answersData = @json_decode($questionV['answers_json'], 1);
  $questions[$questionK]['answers'] = [];
  if (count($answersData) >= 1) foreach ($answersData as $answersV) {
    $answer = [];
    $query = '
      SELECT answers.id,
             answers.id as value,
             answers.name,
             answers.title,
             answers.type
        FROM answers
       WHERE answers.id = ?
             AND status != "unactive"
    ';
    $stmt = $db->prepare($query);
    $stmt->execute([ $answersV['id'] ]);
    $answer = $stmt->fetchRow();
    $answer['connectedQuestions'] = $answersV['connected_questions'];
    $questions[$questionK]['answers'][] = $answer;
  }
}

$data['questions'] = $questions;

echo json_encode($data);
