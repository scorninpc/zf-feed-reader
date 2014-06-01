<?php
/**
 * This makes our life easier when dealing with paths. Everything is relative
 * to the application root now.
 */
chdir(dirname(__DIR__));

ini_set("display_errors", "On");
error_reporting(E_ALL ^E_NOTICE ^E_WARNING);

if($_GET['param'] == "minify") {
	defined("APPLICATION_PATH") || define("APPLICATION_PATH", dirname(__FILE__) . "");
	
	include("vendor/smartoptimizer/index.php");
	die();
}

// Setup autoloading
require 'init_autoloader.php';

// Run the application!
Zend\Mvc\Application::init(require 'config/application.config.php')->run();
