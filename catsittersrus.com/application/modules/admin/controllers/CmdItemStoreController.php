<?php

/**
 * CmdItemStoreController
 * 
 * @author
 * @version 
 */
require_once 'Zend/Controller/Action.php';

class Admin_CmdItemStoreController extends System_Controller_AdminAction
{
    public $context = array(
    	'get' => array('json')
    );
    public $ajaxable = array();
    
    public $djData;

    public function preDispatch()
    {
        switch($this->isAjax()) {
        	case true :
        	    $this->_helper->layout()->disableLayout();
        	    break;
        	case false :
        	    
        	    break;
        }
    }
	public function init() {
	    parent::init();
	    $this->_helper->contextSwitch()->initContext($this->context);
	    $this->_helper->ajaxContext()->initContext();
	    $this->djData = new Zend_Dojo_Data();
	    $this->djData->setIdentifier('cmd');
	    $this->djData->setLabel('label');
	}
    /**
     * The default action - show the home page
     */
    public function indexAction ()
    {
        // TODO Auto-generated CmdItemStoreController::indexAction() default
    // action
    }
	/* (non-PHPdoc)
     * @see System_Rest_AdminController::deleteAction()
     */
    public function deleteAction ()
    {
        // TODO Auto-generated method stub
        
    }

	/* (non-PHPdoc)
     * @see System_Rest_AdminController::getAction()
     */
    public function getAction ()
    {
        
        // TODO Auto-generated method stub
        $container = Zend_Registry::get('Admin_Navigation');
        $store = new RecursiveIteratorIterator($container, RecursiveIteratorIterator::SELF_FIRST);
        $cmds = array();
        $index = count($store);
        $i = 0;
        foreach($store as $cmd) {
        	$cmds[$i]['cmd'] = $cmd->uri;
        	$cmds[$i]['label'] = $cmd->label;
        	$i++;
        	continue;
        }
        
        $this->djData->setItems($cmds);
        $this->_helper->json($this->djData->toJson(), true, false, false);
    }

	/* (non-PHPdoc)
     * @see System_Rest_AdminController::headAction()
     */
    public function headAction ()
    {
        // TODO Auto-generated method stub
        
    }

	/* (non-PHPdoc)
     * @see System_Rest_AdminController::postAction()
     */
    public function postAction ()
    {
        // TODO Auto-generated method stub
        
    }

	/* (non-PHPdoc)
     * @see System_Rest_AdminController::putAction()
     */
    public function putAction ()
    {
        // TODO Auto-generated method stub
        
    }

    
}
