<?php

/**
 * IndexController
 * 
 * @author
 * @version 
 */
require_once 'Zend/Controller/Action.php';
class Test_IndexController extends System_Controller_Action {

	public function init() {
		parent::init();
	}
	public function indexAction() {
		switch(true) {
			case ( $this->isAjax() && $this->_request->isPost() ) :
				Zend_Debug::dump($this->_request->getPost());
				break;
			case ( $this->isAjax() && $this->_request->isGet() ) :
				Zend_Debug::dump($this->_request->getUserParams());
				break;
		}
	}
}
