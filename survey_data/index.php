<?php

use App\App;

session_start();

spl_autoload_register(function($class) {
	$getFile = str_replace("\\", DIRECTORY_SEPARATOR, trim($class, "\\")) .'.php';
	if (file_exists($getFile)) require_once $getFile;
});

$app = new App();

$app->start();
?>