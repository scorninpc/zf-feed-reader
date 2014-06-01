<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link	  http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2012 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

return array(
	'router' => array(
		'routes' => array(
			'home' => array(
				'type' => 'Zend\Mvc\Router\Http\Literal',
				'options' => array(
					'route' => '/',
					'defaults' => array(
						'controller' => 'Application\Controller\Index',
						'action'	 => 'index',
					),
				),
				'may_terminate' => true,
				'child_routes' => array(
					'default' => array(
						'type' => 'Segment',
						'options' => array(
							'route' => '[:controller[/:action]]',
							'constraints' => array(
								'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
								'action' => '[a-zA-Z][a-zA-Z0-9_-]*'
							),
							'defaults' => array(
								'action' => 'index',
								'__NAMESPACE__' => 'Application\Controller'
							)
						)
					)
				)
			),
			'inicial' => array (
				'type' => 'Segment',
				'options' => array (
					'route' => '/inicial',
					'defaults' => array (
						'controller' => 'Application\Controller\Index',
						'action' => 'index' 
					) 
				) 
			),
		)
	),
	
	'translator' => array(
		'locale' => 'pt_BR',
		'translation_file_patterns' => array(
			array(
				'type' => 'gettext',
				'base_dir' => __DIR__ . '/../../../data/language',
				'pattern' => '%s.mo',
			),
		),
	),
	
	'controllers' => array(
		'invokables' => array(
			'Application\Controller\Index' => 'Application\Controller\IndexController',
		),
	),
	
	'view_manager' => array(
		'defaultSuffix' => '.tpl',
		'display_not_found_reason' => TRUE,
		'display_exceptions' => TRUE,
		'doctype' => 'HTML5',
		'not_found_template' => 'error/404',
		'exception_template' => 'error/index',
		'template_map' => array(
			'application/index/index' => __DIR__ . "/../View/index/index.tpl",
			
			'layout/layout' => __DIR__ . '/../View/layout/default.tpl',
			'error/404' => __DIR__ . '/../View/error/404.tpl',
			'error/index' => __DIR__ . '/../View/error/index.tpl',
		),
		'template_path_stack' => array(
			'application' => __DIR__ . '/../View',
		),
	),
);
