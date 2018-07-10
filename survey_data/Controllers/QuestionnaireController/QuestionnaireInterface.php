<?php

namespace Controllers\QuestionnaireController;

interface QuestionnaireInterface
{

	public function getQuestionnaires():array;

	public function getFullQuestionnaire(string $id):array;

	public function setQuestionnaire(array $post):array;

}

?>