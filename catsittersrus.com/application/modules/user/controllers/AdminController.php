<?php
/**
 * UserAdminController
 *
 * @author
 * @version
 */
require_once 'Zend/Controller/Action.php';
class User_AdminController extends System_Controller_AdminAction
{
    public $context = array('rolestore' => array('json'));
    /**
     * The default action - show the home page
     */
	public function init()
	{
		// Call the parent init to make sure we have the parents properties.
		parent::init();
// 		if($this->_request->isXmlHttpRequest())
// 		{
// 		    if(isset($this->context[$this->_request->action]))
// 		    {
// 		        $this->_helper->contextSwitch()->initContext();
// 		        $this->_helper->layout->disableLayout();
// 		        $this->getHelper('viewRenderer')->setNoRender(true);
// 		    }
// 		}
	}
    public function indexAction ()
    {
        Zend_Debug::dump($this->isAjax());
        $page = $this->_request->getParam('page', 1);
        $this->view->page = $page;
        $table = new User_Model_User();

        $paginator = $table->getOnePage($page);
        $this->view->paginator = $paginator;
    }
    public function editAction ()
    {
        if (Zend_Auth::getInstance()->hasIdentity())
        {
            $ident = Zend_Auth::getInstance()->getIdentity();

            $form = new User_Form_EditUser();
            $table = new User_Model_User();
            $row = $table->fetch($this->_request->id);
            $this->view->form = $form;

            if ($this->getRequest()->isPost())
            {
                $postData = $this->getRequest()->getPost();
                if ($form->isValid($postData))
                {
                    $values = $form->getValues();
                    $row->setFromArray($values);

                    $id = (int) $row->save();
                    if($id > 0) {
                    	$this->_redirect('/admin/user/userlist');
                    }
                }
             }
             else
             {
                    // pre-populate form
                    $this->view->form->populate($row->toArray());
             }
        }
    }
    public function createAction()
    {
        $form = new User_Form_EditUser();
        $model = new User_Model_DbTable_User();

    }
    public function deleteAction()
    {
    	try {

    		$this->_helper->viewRenderer->setNoRender(true);
    		//Zend_Debug::dump(Zend_Auth::getInstance());
    		//die();
    		$model = new User_Model_User();
    		switch(isset($this->_request->id)) {
    			case true :
    				$row = $model->fetch($this->_request->id);
    				$result = $row->delete();
    				if($result > 0) {
    					$this->log->addUserEvent(Zend_Auth::getInstance(), null, null);
    					$this->log->info('Deleted User');
    					$this->redirect('/admin/user/userlist');
    				}
    				break;
    			case false :

    				break;
    		}
    	} catch (Zend_Exception $e) {
    		$this->log->crit($e);
    	}

    }
    public function userlistAction ()
    {
         //$page = $this->getRequest()->getParam('page');
         $page = $this->_request->getParam('page', 1);
         $this->view->page = $page;
         $table = new User_Model_User();

         $paginator = $table->getOnePage($page);
         $this->view->paginator = $paginator;
    }
    public function rolestoreAction()
    {
        if($this->_request->isXmlHttpRequest())
        {
	        $roles = new Zend_Db_Table('roles');
	        foreach( $roles->fetchAll( $roles->select( array('role')))->toArray() as $role)
	        {
	        	foreach($role as $r)
	        	{
	        	    $name[] = array('rName' => $r);
	        	}
	        }
	        $data = new Zend_Dojo_Data('rName', $name);
	        echo $data->toJson();
        } else {
            exit;
        }
    }
}
