<?php

/**
 * AjaxController
 *
 * @author
 * @version
 */
require_once 'Zend/Controller/Action.php';

class Admin_AjaxController extends System_Controller_AdminAction
{
    public $data;
    public function init(){
        parent::init();

        $ajax = $this->_helper->getHelper('AjaxContext');
        $ajax->addActionContext('welcome', array('html'))
        	 ->addActionContext('tools', array('html'))
        	 ->addActionContext('content', array('html'))
        	 //->addActionContext('nav', array('json'))
        	 ->initContext();
//         if(!$this->isAjax()) {
//             throw new Zend_Controller_Action_Exception('Not Found', 404);
//         }
        $this->view->user = $this->user;
    }
    public function navAction()
    {
        $this->_helper->layout()->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        
        // create a dojo data container
        $dojoData = new Zend_Dojo_Data();
        $dojoData->setIdentifier('id');
        //$dojoData->setLabel('label');
                
        $navContainer = Zend_Registry::get('Admin_Navigation');
        
        foreach($navContainer as $page) {
            $page->name = $page->label;
        }
        $nav = $navContainer->toArray();
        $index = count($nav);
        $children = array();
        for ($i = 0; $i < $index; $i++) {
            if($i === 0) {
                $pages[$i]['id'] = 'root';
                $nav[$i]['id'] = 'root';
                $nav[$i]['page'] = true;
            }
            else {
                $pages[$i]['id'] = $i;
                $nav[$i]['id'] = "$i";
                
            }
        	$nav[$i]['name'] = $nav[$i]['label'];
        	
        	if(count($nav[$i]['pages'])) {
        	    $childCount = count($nav[$i]['pages']);
        	    for ($n = 0; $n < $childCount; $n++) {
        	        $nav[$i]['pages'][$n]['id'] = "$i-$n";
        	        $nav[$i]['pages'][$n]['childpage'] = true;
        	    }
        	} 
        	else {
        	    unset($nav[$i]['pages']);
        	}
        	
        }

        $dojoData->setItems($nav);
        //$dojoData->addItems($children);
       // $this->log->debug($dojoData->toJson());
        $this->_response->setBody($dojoData->toJson());
        //$this->_helper->autoCompleteDojo->sendAutoCompletion($dojoData->toArray());

    }
    public function welcomeAction()
    {

    }
    public function toolsAction()
    {

    }
    public function contentAction()
    {

    }
    /**
     * The default action - show the home page
     */
    public function indexAction ()
    {
        // TODO Auto-generated AjaxController::indexAction() default action
    }
}
