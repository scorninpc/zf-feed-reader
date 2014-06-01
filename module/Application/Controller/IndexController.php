<?php

namespace Application\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Zend\Mail;
use Zend\Mime\Message as MimeMessage;
use Zend\Mime\Part as MimePart;
use Zend\Mail\Transport\Smtp as SmtpTransport;
use Zend\Mail\Transport\SmtpOptions;
use Zend\Mail\Transport\Sendmail as SendmailTransport;
use Zend\Db\Sql\Expression;
use Zend\Json\Json;

/**
 * Controlador Index
 */
class IndexController extends AbstractActionController
{
	/**
	 * Ação da pagina inicial
	 */
	public function indexAction()
	{
		// Cria o view
		$view = new ViewModel();
		
		// Seta as metas
		$renderer = $this->getServiceLocator()->get("Zend\View\Renderer\PhpRenderer");
		$renderer->headTitle("Feed Reader");
		$renderer->headMeta()->appendName("keywords", "");
		$renderer->headMeta()->appendName("description", "");
		
		// Retorna o view
		return $view;
	}
}
