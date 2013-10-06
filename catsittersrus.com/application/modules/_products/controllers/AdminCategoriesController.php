<?php
/**
 * Products_AdminCategoriesController
 *
 * @author
 * @version
 */
require_once 'System/Controller/AdminAction.php';

class Products_AdminCategoriesController extends System_Controller_AdminAction
{
    public $categories;

    public function init() {
    	parent::init();
        $this->categories = new Products_Model_Categories();
        //$this->catLookup = new Products_Model_CatLookup();
    }
    /**
     * The default action - show the home page
     */
    public function indexAction ()
    {
        // TODO Auto-generated CategoriesController::indexAction() default
    // action
    }
    public function editAction() {
        $form = new Products_Form_EditCategory();
        $id = $this->_request->id;
        $cat = $this->categories->fetch($id);

        if($this->_request->isPost())
        {
            if($form->isValid($this->_request->getPost()))
            {
            	$filter = new System_Filter_ItemNameToUri();
                $data = $form->getValues($this->_request->getPost());
                $cat->setFromArray($data);
                $cat->ident = $filter->filter($data['name']);
                $cat->save();
            }
        } else {
            $form->populate($this->categories->fetch($id)->toArray());
        }
        $this->view->form = $form;
    }
    public function createAction() {
    	$result = null;
        $form = new Products_Form_CreateCategory();

		if($this->_request->isPost())
		{
			if($form->isValid($this->_request->getPost()))
			{
				$filter = new System_Filter_ItemNameToUri();
				$data = $form->getValues($this->_request->getPost());
				$data['ident'] = $filter->filter($data['name']);
				// returns boolean
				$save = $this->categories->saveCategory($data);
				if($save) {
					$this->log->addUserEvent($this->auth);
					$this->log->info('Created category '.$data['name']);
					$this->redirect('/admin/success');
				}
			}
		}
		$this->view->form = $form;
    }
    public function deleteAction()
    {
        $id = $this->_request->getParam('id');
        $page = $this->_request->getParam('page');
        if(isset($id))
        {
            $row = $this->categories->fetch($id);
            $row->delete();
            $this->_redirect('/admin/categories/list/'. $page);
        }
    }
    public function listAction() {
        $page = $this->_request->page;
        $this->view->pageNumber = $page;
        //$this->view->user = $this->user;
        //$this->view->acl = new Guestbook_Acl_Guestbook();
        $this->view->paginator = $this->categories->getOnePage($page);
    }
}
