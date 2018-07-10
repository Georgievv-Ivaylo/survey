<?php

namespace Exception;

class Controller extends \Exception
{

	public function errorMsg() {
		//error message
		$errorMsg = 'Error on line '.$this->getLine().' in '.$this->getFile()
		.': <strong>'.$this->getMessage().'</strong> is not a valid E-Mail address';
		return $errorMsg;
	}
}

?>