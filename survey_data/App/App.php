<?php

namespace App;

use \Adapter\Database;
use \Exception\Controller;

class App implements AppInterface
{

	public function start()
	{

		$locationRaw = explode('?', $_SERVER['REQUEST_URI']);
		$location = explode('/', $locationRaw[0]);
		$documentMainDir = array_shift($location);
		$documentMainDir = array_shift($location);

		$classNameFile = $this->transformToFileName(array_shift($location));
		$className = '\\Controllers\\'. $classNameFile .'Controller\\'. $classNameFile;

			$data = [];
			if (class_exists($className)) {
				$db = new Database();
				$myClass = new $className($db->db());

				$handleRegFor = $this->transformToFileName(array_shift($location));

				if ($documentMainDir === 'get') {
					$handleReg = 'get'. $handleRegFor;
					$id = '';
					if (!empty($_GET['id'])) $id = $_GET['id'];

					try {
						$data = $myClass->$handleReg($id);
					} catch (Controller $e) {
						$data['error_msg'][] = $e;
					}
				} elseif ($documentMainDir === 'post' && $_SERVER['REQUEST_METHOD'] === 'POST') {
					$handleReg = 'set'. $handleRegFor;
					$jsonPost = ($stream = fopen('php://input', 'r')) !== false ? stream_get_contents($stream) : "{}";
					$dataPost = @json_decode($jsonPost, true);
					try {
						$data = $myClass->$handleReg($dataPost);
					} catch (Controller $e) {
						$data['error_msg'][] = $e;
					}
				}
			} else {
				$data['error_msg'][] = 'Unvalid data request!';
			}

			echo json_encode($data);
	}

	private function transformToFileName(string $rawName): string
	{
		return implode('', array_map('ucfirst', explode('-', $rawName)));
	}
}

?>