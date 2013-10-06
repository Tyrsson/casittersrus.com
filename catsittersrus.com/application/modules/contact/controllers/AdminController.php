<?php

/**
 * AdminController
 *
 * @author
 * @version
 */

require_once 'Zend/Controller/Action.php';

class Contact_AdminController extends System_Controller_AdminAction {

	public function init() {
		parent::init();
	}
	public function indexAction() {

	}
	public function exportAction()
	{
		$model = new Contact_Model_Newsletter();

		switch($this->_request->isPost())
		{
			case true :
				$this->_helper->viewRenderer->setNoRender();
				$this->_helper->layout()->disableLayout();
				$result = $model->export();
				if($result) {
					$path = $model->getCsvPath();

					$stream = @file_get_contents($path);
					if (strlen($stream) == 0) {
						$this->_response->setBody('Sorry, we could not find requested download file.');
					} else {
						//$this->_response->setHeader('Content-type', 'application/octet-stream', true);
						$this->_response->setHeader('Content-type', 'text/csv', true);
						$this->_response->setBody($stream);
					}
				}
				break;
			case false :

				break;
		}
		$this->view->form = new Contact_Form_Export();

	}
}
