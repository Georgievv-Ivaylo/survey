<?php

namespace Controllers\UserControllers;

interface UserInterface
{
	public function getUser(string $name,string $password,string $confirmPassword): array;
}

?>