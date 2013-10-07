<?php

/**
 * AdminAdminController
 *
 * @author
 * @version
 */

require_once 'System/Controller/AdminAction.php';

class Admin_IndexController extends System_Controller_AdminAction {

    public $ajaxable = array(
            //'edit' => array('html'),
            //'index' => array('html')
    );

    public function preDispatch()
    {
        Zend_Dojo_View_Helper_Dojo::useDeclarative();
    }
	public function init()
	{
		parent::init();
		//$this->_helper->viewRenderer->setV
		$this->_helper->viewRenderer->setViewBasePathSpec(APPLICATION_PATH . '/skins/default')
		->setViewScriptPathSpec(':module/:controller/:action.:suffix')
		->setViewScriptPathNoControllerSpec(':action.:suffix');

		if($this->isAjax()) {
		    $this->_helper->layout()->disableLayout();
		   // $this->_helper->viewRenderer->setNoRender(true);
		}

	}

	/**
	 * The default action - show the home page
	 */
	public function indexAction()
	{
	    $this->view->form = new Page_Form_CreatePage();
	    $this->view->message = 'Loading test';
	}
	public function successAction() {
		$params = $this->_request->getParams();
		if(isset($params['deleted'])) {
		    echo $params['deleted'] . ' records deleted!';
		}
	}
}
