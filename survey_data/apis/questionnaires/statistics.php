<?php
$data = [];

$query = '
  SELECT answered_questionnaires.id,
         answered_questionnaires.questionnaire_id,
         answered_questionnaires.questionnaire_json
    FROM answered_questionnaires
   WHERE answered_questionnaires.status != "deleted"
';
$stmt = $db->prepare($query);
$stmt->execute();
$answeredQuestionnaires = $stmt->fetchAll();

$statisctics = [];
foreach ($answeredQuestionnaires as $answeredQuestionnaire) {
  $questions = @json_decode($answeredQuestionnaire['questionnaire_json'], 1);
  foreach ($questions as $question => $answers) {
    if (empty($statisctics[$answeredQuestionnaire['questionnaire_id']]['questions'][$question]['total'])) $statisctics[$answeredQuestionnaire['questionnaire_id']]['questions'][$question]['total'] = 0;

    if (is_array($answers)) {
      foreach ($answers as $answer) {
        ++$statisctics[$answeredQuestionnaire['questionnaire_id']]['questions'][$question]['total'];

        if (empty($statisctics[$answeredQuestionnaire['questionnaire_id']]['questions'][$question][$answer])) $statisctics[$answeredQuestionnaire['questionnaire_id']]['questions'][$question][$answer] = 0;
        ++$statisctics[$answeredQuestionnaire['questionnaire_id']]['questions'][$question][$answer];
      }
    } else {
      ++$statisctics[$answeredQuestionnaire['questionnaire_id']]['questions'][$question]['total'];

      if (empty($statisctics[$answeredQuestionnaire['questionnaire_id']]['questions'][$question][$answers])) $statisctics[$answeredQuestionnaire['questionnaire_id']]['questions'][$question][$answers] = 0;
      ++$statisctics[$answeredQuestionnaire['questionnaire_id']]['questions'][$question][$answers];
    }
  }
}

$data['statistics'] = $statisctics;

$query = '
  SELECT questionnaires.id,
         questionnaires.title
    FROM questionnaires
   WHERE status != "unactive"
';
$stmt = $db->prepare($query);
$stmt->execute([  ]);
$data['questionnaires'] = $stmt->fetchAll();

$query = '
  SELECT questions.id,
         questions.name,
         questions.title,
         questions.type
    FROM questions
   WHERE status != "unactive"
';
$stmt = $db->prepare($query);
$stmt->execute([  ]);
$data['questions'] = $stmt->fetchAll();

$query = '
  SELECT answers.id,
         answers.name,
         answers.title,
         answers.type
    FROM answers
   WHERE status != "unactive"
';
$stmt = $db->prepare($query);
$stmt->execute([  ]);
$data['answers'] = $stmt->fetchAll();

echo json_encode($data);
