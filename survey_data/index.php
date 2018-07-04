<?php
session_start();

require_once './db.php';

$locationRaw = explode('?', $_SERVER['REQUEST_URI']);
$location = explode('/', $locationRaw[0]);
$documentMainDir = array_shift($location);
$documentMainDir = array_shift($location);
$documentDir = array_shift($location);
$document = array_shift($location);

if ($documentMainDir === 'get') {
	include './apis/'. $documentDir .'/'. $document .'.php';
} elseif ($documentMainDir === 'post' && $_SERVER['REQUEST_METHOD'] === 'POST') {
	include './handlers/'. $documentDir .'/'. $document .'.php';
}
