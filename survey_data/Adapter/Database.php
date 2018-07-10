<?php

namespace Adapter;

class Database
{

	public function __construct()
	{}

	public function db() {
		return new \Adapter\PDODatabase(
			\Config\DbConfig::DB_HOST,
			\Config\DbConfig::DB_NAME,
			\Config\DbConfig::DB_USER,
			\Config\DbConfig::DB_PASS
		);
	}
}

