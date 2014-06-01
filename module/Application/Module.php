<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link	  http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2012 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Application;

use Zend\Mvc\ModuleRouteListener;
use Zend\ModuleManager\ModuleManager;
use Zend\Mvc\MvcEvent;
use Zend\EventManager\Event;
use Zend\View\Helper\Doctype;
use Zend\Db\ResultSet\ResultSet;
use Zend\Db\TableGateway\TableGateway;

use Application\Model\FotosTable;
use Application\Model\Fotos;

class Module
{
	public function onBootstrap(MvcEvent $e)
	{
		$eventManager = $e->getApplication()->getEventManager();
		$moduleRouteListener = new ModuleRouteListener();
		$moduleRouteListener->attach($eventManager);
		
		$doctypeHelper = new Doctype();
		$doctypeHelper->setDoctype('XHTML5');
		
		$eventManager->attach(MvcEvent::EVENT_DISPATCH_ERROR, function($e) {
			$result = $e->getResult();
			$result->setTerminal(TRUE);
		});
		
		$eventManager->attach("finish", array($this, "compressOutput"), 100);
	}
	
	public function compressOutput($e) {
		$response = $e->getResponse();
		$content = $response->getBody();
		$content = str_replace("  ", " ", str_replace("\n", " ", str_replace("\r", " ", str_replace("\t", " ", $content))));
		
		if (@strpos($_SERVER['HTTP_ACCEPT_ENCODING'], 'gzip') !== false) {
			header('Content-Encoding: gzip');
			$content = gzencode($content, 9);
		}
		
		$response->setContent($content);
	}

	public function init(ModuleManager $moduleManager)
	{
		$events = $moduleManager->getEventManager();
		
		$sharedEvents = $events->getSharedManager();
		$sharedEvents->attach(__NAMESPACE__, 'dispatch', array($this, 'assignToLayout'), 201);
	}
	
	public function assignToLayout(Event $e) {
		$route = $e->getRouteMatch();
		$viewModel = $e->getViewModel();
		
		$controller = $route->getParam("controller");
		$action = $route->getParam("action");
		
		$viewModel->_currentController = $controller;
		$viewModel->_currentAction = $action;
	}

	public function getConfig()
	{
		return include __DIR__ . '/Config/module.config.php';
	}

	public function getAutoloaderConfig()
	{
		return array(
			'Zend\Loader\StandardAutoloader' => array(
				'namespaces' => array(
					__NAMESPACE__ => __DIR__,
				),
			),
		);
	}
	
	/**
	 * Recupera a configuração dos serviços
	 * 
	 * @return multitype:multitype:NULL  |\Application\AlbumTable|\Application\TableGateway
	 */
	public function getServiceConfig()
	{
		return array(
			'factories' => array(
				// Configura o model das fotos
				'Application\Model\FotosTable' =>  function($sm) {
					$tableGateway = $sm->get("FotosTableGateway");
					$table = new FotosTable($tableGateway);
					return $table;
				},
				'FotosTableGateway' => function ($sm) {
					$dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
					$resultSetPrototype = new ResultSet();
					$resultSetPrototype->setArrayObjectPrototype(new Fotos());
					return new TableGateway("fotos", $dbAdapter, null, $resultSetPrototype);
				},
			),
		);
	}
}
