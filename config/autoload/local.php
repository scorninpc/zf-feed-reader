<?php
return array(
	'db' => array(
		'driver' => "Pdo",
		'dsn' => "pgsql:dbname=;host=",
		'username' => "",
		'password' => "",
		'driver_options' => array(
			PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'UTF8'"
		),
	),
);
