<?php

namespace Controllers\UserControllers;

class User implements UserInterface
{
	private $user = [];

	public function __construct()
	{}

	public function getUser(string $name, string $password, string $confirmPassword): array
	{
		return $this->user = $name;
	}

}

?>