<?php

/**
 * IndexController
 *
 * @author
 * @version
 */

require_once 'System/Controller/Action.php';

class Contact_IndexController extends System_Controller_Action {


	public function init() {
		parent::init();
	}

	/**
	 * The default action - show the home page
	 */
	public function indexAction() {

		$form = new Contact_Form_Contact();
		//$form->setAction($this->_request->pageUrl)->setMethod('post');
		if($this->_request->isPost())
		{
			if($form->isValid($this->_request->getPost())) {
// 				$namespace = $form->getElementsBelongTo();
// 				if (!empty($namespace) && !is_array($this->_request->getPost($namespace))) {
// 					$this->renderContactForm($form);
// 					return;
// 				}
				// mail handling
				$mail = new Zend_Mail();
				$this->post = $form->getValues($this->_request->getPost());
				//$result = $this->settings->fetchVar('siteEmail');
				$toEmail = $this->settings->siteEmail;
				$mail->setFrom($this->post['email'], $this->post['name']);
				$message = $this->post['name'] . "\n" . $this->post['email'] . "\n" . $this->post['number'] . "\n" . $this->post['Editor'];

				$mail->setBodyText(strip_tags($message));

				$mail->addTo($toEmail);
				$mail->setSubject('Contact form submission');

				try {
					$send = $mail->send();
					if($send === true) {
						$this->view->messages = array('Your email was sent successfully!');
					} else {
						$this->view->messages = array('There was an unknown error while trying to process your request.');
					}
				} catch (Zend_Exception $e) {
					echo $e->getMessage();
				}


			}

		}

		$this->view->form = $form;

	}
	public function newsletterAction() {

		try {
			$form = new Contact_Form_NewsLetterSignup();
			switch($this->_request->isPost()) {
				case true :
					if($form->isValid($this->_request->getPost())) {
						$data = $form->getValues();
						Zend_Debug::dump($data);
						$db = new Zend_Db_Table('newsletter');
						// both was selected
						if(count($data['type']) == 2) {
							$data['type'] = 'all';
						}
						else {
							// only 1 option was selected
							$data['type'] = array_shift($data['type']);
						}
						$row = $db->fetchNew();
						$row->setFromArray($data);
						$result = $row->save();
						if($result > 0) {
							$this->log->info('Newsletter signup');
						}
					}
					break;
				case false :
					$form->populate( array( 'type' => array( 0 => 'newsletter', 1 => 'offers' ) ) );
					break;
			}
			$this->view->form = $form;
		}
		catch (Zend_Exception $e) {
			$this->log->warn($e);
		}

	}
	public function rentalAction() {
		try {
			$form = new Springer_Form_Rental();

			switch($this->_request->isPost()) {
				case true :
					if($form->isValid($this->_request->getPost())) {
						$mailService = new Contact_Service_FormMailer($form);
						$mailer = $mailService->getMailer();
						$mailer->setFrom('no-reply@springerequip.com', 'Rental Form');
						$mailer->addTo('waynec@springerequip.com', 'Wayne Cornelius');
						$mailer->setSubject($form->getName());
						$mailer->send();
					}

					break;
				case false :

					break;
			}
			$desc = $form->getElement('usage_desc');
			//$desc->setValue('Description of Application');
			$this->view->form = $form;
		} catch (Zend_Exception $e) {
			$this->log->crit($e);
		}

	}
	public function partsAction() {

		try {
			$form = new Springer_Form_OrderParts();
			switch($this->_request->isPost()) {
				case true :
					if($form->isValid($this->_request->getPost())) {
						$mailService = new Contact_Service_FormMailer($form);
						$mailer = $mailService->getMailer();
						$mailer->setFrom('no-reply@springerequip.com', 'Request to schedule service');
						$mailer->addTo('randyd@springerequip.com', 'Randy Duncan');
						$mailer->setSubject($form->getName());
						$mailer->send();
					}

					break;
				case false :

					break;
			}
			$this->view->form = $form;
		}
		catch (Zend_Exception $e) {
			$this->log->crit($e);
		}

	}
	public function serviceAction() {
		try {
			$form = new Springer_Form_Service();

			switch($this->_request->isPost()) {
				case true :
					if($form->isValid($this->_request->getPost())) {
						$mailService = new Contact_Service_FormMailer($form);
						$mailer = $mailService->getMailer();
						$mailer->setFrom('no-reply@springerequip.com', 'Request to schedule service');
						$mailer->addTo('joem@springerequip.com', 'Joe Moman');
						$mailer->setSubject($form->getName());
						$mailer->send();
					}

					break;
				case false :

					break;
			}
			$this->view->form = $form;
		} catch (Zend_Exception $e) {
			$this->log->crit($e);
		}
	}
	public function surveyAction() {
		try {
			$form = new Springer_Form_Survey();

			switch($this->_request->isPost()) {
				case true :
					if($form->isValid($this->_request->getPost())) {
						$mailService = new Contact_Service_FormMailer($form);
						$mailer = $mailService->getMailer();
						$mailer->setFrom('no-reply@springerequip.com', 'Service Survey');
						$mailer->addTo('joem@springerequip.com', 'Joe Moman');
						$mailer->setSubject($form->getName());
						$mailer->send();
					}

					break;
				case false :

					break;
			}
			$this->view->form = $form;
		} catch (Zend_Exception $e) {
			$this->log->crit($e);
		}
	}
	public function salvageAction() {
		try {
			$form = new Springer_Form_Salvage();

			switch($this->_request->isPost()) {
				case true :
					if($form->isValid($this->_request->getPost())) {
						$mailService = new Contact_Service_FormMailer($form);
						$mailer = $mailService->getMailer();
						$mailer->setFrom('no-reply@springerequip.com', 'Salvaged Parts Inquiry');
						$mailer->addTo('johnw@springerequip.com', 'John Woodall');
						$mailer->setSubject($form->getName());
						$mailer->send();
					}

					break;
				case false :

					break;
			}
			$this->view->form = $form;
		} catch (Zend_Exception $e) {
			$this->log->crit($e);
		}
	}
}
