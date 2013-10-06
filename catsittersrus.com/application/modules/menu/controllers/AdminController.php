<?php

/**
 * AdminController
 *
 * @author
 * @version
 */

require_once 'System/Controller/AdminAction.php';

class Menu_AdminController extends System_Controller_AdminAction {

  public $menuTable;
  public $menuCategoryTable;
  public $menuItemTable;
  public $menu;
  public $workSpaceForm;
  public $formStack;
  
  public function preDispatch()
  {
      switch(true) {
      	case ($this->isAjax()) :
      	    //Zend_Dojo_View_Helper_Dojo::setUseDeclarative(true);
      	    break;
      }
  }
  public function init() {

    parent::init();
    Zend_Dojo_View_Helper_Dojo::setUseDeclarative(true);
    
    $this->workSpaceForm = new System_Dojo_Form();
    $this->workSpaceForm->addSubmit('Save');
    //$this->formStack = $this->workSpaceForm->getSubForm('tabs');
    
    $this->menuTable = new Menu_Model_Menu();
    $this->menuCategoryTable = new Menu_Model_Category();
    $this->menuItemTable = new Menu_Model_MenuItems();
    if(isset($this->_request->menuId)) {
      $this->menuTable->init()->setId($this->_request->menuId);
      $this->menu = $this->menuTable->fetch($this->_request->menuId);
      $this->view->menuId = $this->menu->id;
    }

    $ajax = $this->_helper->getHelper('AjaxContext');
    $ajax->setAutoJsonSerialization(false);
    $ajax->addActionContext('index', 'html')
         ->addActionContext('edit-item', 'html')
         ->addActionContext('edit-category', 'html')
         ->addActionContext('manage-items', 'html')
         ->addActionContext('create', 'html')
         ->addActionContext('edit', 'html')
         ->addActionContext('manage-category', 'html')
         ->addActionContext('create-category', 'html')
         ->addActionContext('item-store', 'json')
         ->addActionContext('menu-store', 'json')
    ->initContext();
    
  }

  /**
   * The default action - show the home page
   */
  public function indexAction() {
      
    try {
            Zend_Dojo_View_Helper_Dojo::setUseDeclarative(true);
            $menuRowset = $this->menuTable->fetchAllMenus(true, $this->_request->page);
            foreach ($menuRowset as $menuRow) {
                $menuCats = $menuRow->findDependentRowset($this->menuCategoryTable, 'MenuCats');
            }
            $this->view->paginator = $this->menuTable->fetchAllMenus(true, $this->_request->page);

    } catch (Exception $e) {
      $this->log->addUserEvent(Zend_Auth::getInstance(), null, null);
      $this->log->crit($e);
    }

  }
  public function createAction() {

      
    try {
        //Zend_Dojo_View_Helper_Dojo::setUseDeclarative();
        $form = new Menu_Form_Create();
        if($this->isAjax()) {
            switch(true) {
                
            	case ($this->_request->isPost()) :
            	    if($form->isValid($this->_request->getPost())) {
            	        $data = $form->getValues();
            	        $row = $this->menuTable->fetchNew();
            
            	        $row->setFromArray($data);
            	        $result = $row->save();
            	        if($result > 0) {
            	            $this->log->addUserEvent(Zend_Auth::getInstance(), null, null);
            	            $this->log->info('New Menu Created');
            	            $this->messenger->addMessage('Your menu was created.');
            	        }
            	    }
            	    break;
            	case ($this->_request->isGet()) :
            	    $this->view->form = $form;
            	    break;
            	    
            }
        }
        else {
            
        }
        
    } catch (Zend_Exception $e) {
      $this->log->addUserEvent(Zend_Auth::getInstance(), null, null);
      $this->log->crit($e);
    }
  }
  public function editAction() {

    try {
        Zend_Dojo_View_Helper_Dojo::setUseDeclarative(true);
      //$form = new Menu_Form_Edit();
        $tabs = $this->workSpaceForm->getSubForm('tabs');
        $tabs->addSubForm(new Menu_Form_Edit(), 'menuTab');
        
        //$tabs->addSubForm(new Menu_Form_EditCategory(array('menuObject' => $this->menu)), 'categoryTab');

      switch($this->_request->isPost()) {
        case true :
          if($this->workSpaceForm->isValid($this->_request->getPost())) {
            $data = $this->workSpaceForm->getValues();
            $row = $this->menuTable->fetch($this->_request->id);

            $row->setFromArray($data);
            $result = $row->save();
            if($result > 0) {
              $this->log->addUserEvent(Zend_Auth::getInstance(), null, null);
              $this->log->info('Edited menu');
              $this->messenger->addMessage('Your menu was edited.');
              //$this->redirect('/admin/menu/success');
            }
          }
          break;
        case false :
          $this->workSpaceForm->populate($this->menuTable->fetch($this->_request->id)->toArray());
          $now = Zend_Date::now();
          //$updatedDate = $this->workSpaceForm->getElement('updatedDate');
          //$updatedDate->setValue($now->getTimestamp());
          break;
      }
      $this->view->form = $this->workSpaceForm;
    } catch (Zend_Exception $e) {
      $this->log->addUserEvent(Zend_Auth::getInstance(), null, null);
      $this->log->crit($e);
    }


  }
  public function successAction() {
    switch($this->messenger->hasCurrentMessages()) {
      case true :
        $this->view->messages = $this->messenger->getMessages();
        break;
    }

  }
  public function deleteAction() {
    try {
      $this->_helper->viewRenderer->setNoRender(true);
      switch(true) {
        case (isset($this->_request->id)) :
          $row = $this->menuTable->fetch($this->_request->id);
          // result will contain the number of rows deleted
          $result = $row->delete();
          if($result > 0) {
            $this->log->addUserEvent(Zend_Auth::getInstance(), null, null);
            $this->log->info('Deleted menu');
            $this->messenger->addMessage('Menu was deleted.');
            //$this->redirect('/admin/menu/success');
          }
          break;
        case (!isset($this->_request->id)) :
          throw new Zend_Controller_Action_Exception('Menu id was not found in the request object, see error for more details', 500);
          break;
      }
    } catch (Zend_Exception $e) {
      $this->log->addUserEvent(Zend_Auth::getInstance(), null, null);
      $this->log->crit($e);
    }

  }
  /************************************** Admin Menu Categories ********************************/

  public function manageCategoryAction() {
    try {

        $cats = $this->menu->findDependentRowset('Menu_Model_Category', 'MenuCats');
        $paginator = new Zend_Paginator(new Zend_Paginator_Adapter_Iterator($cats));
        $paginator->setCurrentPageNumber($this->_request->page);
      $this->view->paginator = $paginator;
    } catch (Exception $e) {
      $this->log->addUserEvent(Zend_Auth::getInstance(), null, null);
      $this->log->crit($e);
    }
  }

  public function createCategoryAction() {
      $form = new Menu_Form_CreateCategory(array('menuObject' => $this->menu));

    ///$this->view->menuId = $this->_request->menuId;
    // was not found in the haystack
    //  = new Zend_Validate_InArray()
    try {

      //$form->populate(array('menuId' => $this->_request->menuId));
      switch($this->_request->isPost()) {
        case true :
          if($form->isValid($this->_request->getPost())) {
            $data = $form->getValues();
// 						Zend_Debug::dump($data);
// 						die('post data');
            $row = $this->menuCategoryTable->fetchNew();
            $row->setFromArray($data);
            $result = $row->save();
            if($result > 0) {
              $this->log->addUserEvent(Zend_Auth::getInstance(), null, null);
              $this->log->info('New Category Created');
              $this->messenger->addMessage('Your category was created.');
              $this->redirect('/admin/menu/category');
            }
          }
        break;
        case false :

            break;
      }

      $form->populate(array('menuId' => $this->_request->menuId));
      $this->view->form = $form;
    } catch (Zend_Exception $e) {
      $this->log->addUserEvent(Zend_Auth::getInstance(), null, null);
      $this->log->crit($e);
      echo $e->getMessage() . ' :: ' . $e->getTraceAsString();
    }
  } //end createCategoryAction

  public function editCategoryAction() {

    try {
      
      //Zend_Debug::dump();
      $tabs = $this->workSpaceForm->getSubForm('tabs');
      $tabs->addSubForm(new Menu_Form_EditCategory(array('menuObject' => $this->menu)), 'categoryTab');
      //Zend_Debug::dump($this->workSpaceForm);
      
      //$form = new Menu_Form_EditCategory(array('menuObject' => $this->menu));

      switch($this->_request->isPost()) {
        case true :
          if($this->workSpaceForm->isValid($this->_request->getPost())) {
            $data = $this->workSpaceForm->getValues();
            $row = $this->menuCategoryTable->fetch($this->_request->id);

            $row->setFromArray($data);
            $result = $row->save();
            if($result > 0) {
              $this->log->addUserEvent(Zend_Auth::getInstance(), null, null);
              $this->log->info('Edited Category');
              $this->messenger->addMessage('Your category was edited.');
              $this->_helper->redirector->gotoRoute(array('menuId' => $this->menu->id), 'menu_manage_category');
            }
          }
          break;
        case false :
          $this->workSpaceForm->populate($this->menuCategoryTable->fetch($this->_request->id)->toArray());
          $now = Zend_Date::now();
          //$updatedDate = $this->workSpaceForm->getElement('updatedDate');
          //$updatedDate->setValue($now->getTimestamp());
          break;
      }
      //$this->view->form = $form;
      $this->view->form = $this->workSpaceForm;
    } catch (Zend_Exception $e) {
      $this->log->addUserEvent(Zend_Auth::getInstance(), null, null);
      $this->log->crit($e);
    }
  } //end editCategoryAction

  public function deleteCategoryAction() {
    try {
      $this->_helper->viewRenderer->setNoRender(true);
      switch(true) {
        case (isset($this->_request->id)) :

          $row = $this->menuCategoryTable->fetch($this->_request->id);
          $menuId = $row->menuId;
          if($row instanceof Menu_Model_Row_Category) {
              $children = $row->findDependentRowset('Menu_Model_Category', 'ChildCats');
              if(count($children)) {
                  foreach($children as $child) {
                      if( ( $id = $child->delete() ) > 0) {
                          continue;
                      }
                  }
              }
             $result = $row->delete();
          }
          if($result > 0) {
            $this->log->addUserEvent(Zend_Auth::getInstance(), null, null);
            $this->log->info('Deleted category');
            $this->messenger->addMessage('Category was deleted.');
            $this->_helper->redirector->gotoRoute(array('menuId' => $menuId), 'menu_manage_category');
          }
          break;
        case (!isset($this->_request->id)) :
          throw new Zend_Controller_Action_Exception('Category id was not found in the request object, see error for more details', 500);
          break;
      }
    } catch (Zend_Exception $e) {
      $this->log->addUserEvent(Zend_Auth::getInstance(), null, null);
      $this->log->crit($e);
    }

  } //end deleteCategoryAction


  /************************************** Admin Menu Items ********************************/

  public function manageItemsAction() {
    try {
        $items = $this->menu->findDependentRowset('Menu_Model_MenuItems', 'MenuItems');
        $paginator = new Zend_Paginator(new Zend_Paginator_Adapter_Iterator($items));
        $paginator->setCurrentPageNumber($this->_request->page);
        $this->view->paginator = $paginator;
    } catch (Exception $e) {
      $this->log->addUserEvent(Zend_Auth::getInstance(), null, null);
      $this->log->crit($e);
    }
  }

  public function createItemAction() {
    //Zend_Debug::dump($this->menuItemTable->fetchAll()->toArray());
    try {
      $form = new Menu_Form_CreateItem();

      switch($this->_request->isPost()) {
        case true :
          if($form->isValid($this->_request->getPost())) {
            $data = $form->getValues();
            $row = $this->menuItemTable->fetchNew();

            $row->setFromArray($data);
            $result = $row->save();
            if($result > 0) {
              $this->log->addUserEvent(Zend_Auth::getInstance(), null, null);
              $this->log->info('New Item Created');
              $this->messenger->addMessage('Your item was created.');
              $this->redirect('/admin/menu/item');
            }
          }
          break;
        case false :

          break;
      }
      $form->populate(array('menuId' => $this->menu->id));
      $this->menuCategoryTable->setMenu($this->menu);
      $cats = $form->getElement('categoryId');
      $cats->setMultiOptions($this->menuCategoryTable->fetchItemCatDropDown());

      $this->view->form = $form;
    } catch (Zend_Exception $e) {
      echo $e->getMessage();
      $this->log->addUserEvent(Zend_Auth::getInstance(), null, null);
      $this->log->crit($e);
    }
  } //end createItemAction

  public function editItemAction() {

    try {
      $form = new Menu_Form_EditItem();

      switch($this->_request->isPost()) {
        case true :
          if($form->isValid($this->_request->getPost())) {
            $data = $form->getValues();
            $row = $this->menuItemTable->fetch($this->_request->id);

            $row->setFromArray($data);
            $result = $row->save();
            if($result > 0) {
              $this->log->addUserEvent(Zend_Auth::getInstance(), null, null);
              $this->log->info('Edited Item');
              $this->messenger->addMessage('Your item was edited.');
              $this->redirect('/admin/menu/item');
            }
          }
          break;
        case false :
          $form->populate($this->menuItemTable->fetch($this->_request->id)->toArray());
          $now = Zend_Date::now();
          $updatedDate = $form->getElement('updatedDate');
          $updatedDate->setValue($now->getTimestamp());
          break;
      }
      $this->view->form = $form;
    } catch (Zend_Exception $e) {
      $this->log->addUserEvent(Zend_Auth::getInstance(), null, null);
      $this->log->crit($e);
    }


  } //end editItemAction

  public function deleteItemAction() {
    try {
      $this->_helper->viewRenderer->setNoRender(true);
      switch(true) {
        case (isset($this->_request->id)) :
          $row = $this->menuItemTable->fetch($this->_request->id);

          //$file_name = $this->menuItemTable->getParam($file_path);
          //$file_path = $_SERVER['DOCUMENT_ROOT'] . '/modules/menu/items';


          // result will contain the number of rows deleted
          $result = $row->delete();

          if($result > 0) {
            $this->log->addUserEvent(Zend_Auth::getInstance(), null, null);
            $this->log->info('Deleted item');
            $this->messenger->addMessage('Item was deleted.');
            $this->redirect('/admin/menu/item');
          }
          break;
        case (!isset($this->_request->id)) :
          throw new Zend_Controller_Action_Exception('Item id was not found in the request object, see error for more details', 500);
          break;
      }
    } catch (Zend_Exception $e) {
      $this->log->addUserEvent(Zend_Auth::getInstance(), null, null);
      $this->log->crit($e);
    }

  } //end deleteItemAction

  public function itemStoreAction()
  {
      if($this->isAjax()) {
          $model = new  Menu_Model_Menu();
          $menu = $model->fetchCurrent();
          
          $itemTable = new Menu_Model_MenuItems();
          //$items = $itemTable->fetchAllItems($paginated = true, $page = 1, $countPerPage = 4, $asArray = false);
          //$items->setItemCountPerPage($items->count());
          
          $djData = new Zend_Dojo_Data();
          $djData->setIdentifier('id');
          $djData->setItems($itemTable->fetchAll()->toArray());
          
          
          switch(true) {
          	case  ($this->_request->isPost()) :
          	    
          	    break;
          	case ($this->_request->isGet()) :
          	    $this->_helper->layout()->disableLayout();
          	    $this->_helper->viewRenderer->setNoRender();
          	   // $items = $model->fetchItemsByMenuId($this->_request->menuId);

          	   // echo $djData->toJson();
          	   $this->_response->setBody($djData->toJson());
          	    break;
          }
      }
  }
  public function menuStoreAction()
  {
      
      if($this->isAjax()) {
          $model = new  Menu_Model_Menu();
      
          $djData = new Zend_Dojo_Data();
          $djData->setIdentifier('id');
          $djData->setItems($model->fetchTree());
          
      
          switch(true) {
          	case  ($this->_request->isPost()) :
          	     
          	    break;
          	case ($this->_request->isGet()) :
          	    $this->_helper->layout()->disableLayout();
          	    $this->_helper->viewRenderer->setNoRender();

          	    $this->_response->setBody($djData->toJson());
          	    break;
          }
      }
  }
}