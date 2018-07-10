<?php
namespace Controllers\QuestionnaireController;

use Adapter\Database;


class Questionnaire implements QuestionnaireInterface
{

	/**
	 *
	 * @var Database
	 */
	private $db;

	public function __construct($db)
	{
		$this->db = $db;
	}

	public function setQuestionnaire(array $post): array
	{
		$questionnaireId = $post['questionnaire_id'];
		$tableProps = 'questionnaire_id, questionnaire_json';
		$tablePropsLength = '?,?';
		array_walk_recursive($post, [$this->db, 'escapeData']);
		$values = [ $post['questionnaire_id'] ];
		unset($post['questionnaire_id']);
		$questionnaireJson = json_encode($post);
		$values[] = $questionnaireJson;

		$query = '
	    INSERT INTO answered_questionnaires ( '. $tableProps .' ) VALUES ('. $tablePropsLength .')
		';
		$stmt = $this->db->prepare($query);
		$stmt->execute($values);
		// $data = $dataPost;
		$returnData = $post;
		array_walk_recursive($returnData, [$this->db, 'printData']);

		return $returnData;
	}

	public function getFullQuestionnaire(string $id): array
	{
		$data = $this->getQuestionnaire($id);

		$getQuestions = [];
		$getQuestions = @json_decode($data['questions_json'], 1);
		$questions = [];
		$questions = $this->getQuestions($getQuestions['questions']);

		foreach ($questions as $questionK => $questionV) {
			$getAnswers = @json_decode($questionV['answers_json'], 1);
			$questions[$questionK]['answers'] = [];
			if (count($getAnswers) >= 1) $questions[$questionK]['answers'] = $this->getAnswers($getAnswers);
		}

		$data['questions'] = $questions;

		return $data;
	}

	public function getQuestionnaire(int $id): array
	{
		$query = '
		  SELECT questionnaires.id,
		         questionnaires.title,
		         questionnaires.questions_json
		    FROM questionnaires
		   WHERE questionnaires.id = ?
		';
		$stmt = $this->db->prepare($query);
		$stmt->execute([ $id ]);

		return $stmt->fetchRow();
	}

	public function getQuestions(array $questionsIds): array
	{
		$query = '
		  SELECT questions.id,
		         questions.name,
		         questions.title,
		         questions.answers_json,
		         questions.type
		    FROM questions
		   WHERE questions.id IN ('. implode(',', $questionsIds) .')
		         AND status != "unactive"
		';
		$stmt = $this->db->prepare($query);
		$stmt->execute([  ]);

		return $stmt->fetchAll();
	}

	public function getAnswers(array $answers): array
	{
		$getAnswers = [];
		foreach ($answers as $answersV) {
			$answer = $this->getAnswer( $answersV['id']+0 );
			$answer['connectedQuestions'] = $answersV['connected_questions'];
			$getAnswers[] = $answer;
		}

		return $getAnswers;
	}

	public function getAnswer(int $id): array
	{
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
		$stmt = $this->db->prepare($query);
		$stmt->execute([ $id ]);

		return $stmt->fetchRow();
	}

	public function getQuestionnaires(): array
	{
		$query = '
		  SELECT questionnaires.id,
		         questionnaires.title
		    FROM questionnaires
		   WHERE questionnaires.status != "unactive"
		';
		$stmt = $this->db->prepare($query);
		$stmt->execute([]);

		return $stmt->fetchAll();
	}

}

