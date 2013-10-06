<?php

/**
 * AdminJsonController
 * 
 * @author
 * @version 
 */
require_once 'Zend/Controller/Action.php';

class Menu_JsonController extends System_Rest_AdminController
{
    protected $menuModel; 
    protected $catModel; 
    protected $itemModel; 
    protected $data; 
    protected $rParams;
    protected $djData; 
    protected $id;
    
    /**
     * (non-PHPdoc)
     * @see System_Rest_AdminController::init()
     * 
     * HTTP POST request set header 201 indicates "created" upon success
     * HTTP 
     */
	public function init() 
	{
	    parent::init();
	    $this->menuModel = new Menu_Model_Menu();
	    $this->catModel = new Menu_Model_Category();
	    $this->itemModel = new Menu_Model_MenuItems();
	    $this->rParams = $this->_helper->jsonParams();
	    $this->djData = new Zend_Dojo_Data();
	    $this->djData->setIdentifier('id');
	    
	    if(isset($this->rParams->id)) {
	        $this->id = $this->rParams->id;
	    }
	}

    /**
     * The index action handles index/list requests; it should respond with a
     * list of the requested resources.
     */
    public function indexAction()
    { 
        if(!$this->_rParams->id) {
            // we want all items
        }
    }
    /**
     * The get action handles GET requests and receives an 'id' parameter; it
     * should respond with the server resource state of the resource identified
     * by the 'id' value.
    */
    public function getAction()
    { 
//         Zend_Debug::dump($this->rParams);

        $this->djData->setItems($this->itemModel->fetchAll()->toArray());
        $this->_response->setBody($this->djData->toJson());
        
    }
    /**
     * The head action handles HEAD requests and receives an 'id' parameter; it
     * should respond with the server resource state of the resource identified
     * by the 'id' value.
    */
    public function headAction()
    {
        
    }    
    /**
     * The post action handles POST requests; it should accept and digest a
     * POSTed resource representation and persist the resource state.
    */
    public function postAction()
    {
        
    }
    /**
     * The put action handles PUT requests and receives an 'id' parameter; it
     * should update the server resource state of the resource identified by
     * the 'id' value.
    */
    public function putAction()
    {
        
    }
    /**
     * The delete action handles DELETE requests and receives an 'id'
     * parameter; it should update the server resource state of the resource
     * identified by the 'id' value.
    */
    public function deleteAction()
    {
        
    }
}
