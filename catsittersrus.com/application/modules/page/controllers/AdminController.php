<?php
/**
 * Page_AdminPageController
 *
 * @author
 * @version
 */
require_once 'Zend/Controller/Action.php';
class Page_AdminController extends System_Controller_AdminAction {
	public $page;
	protected $_pService;
	public $pageName;
	protected $pageUrlFilter;
	protected $pageNameFilter;
	protected $matches = array('/ /', '/_/', '/--/', '/&/', '/\'/', '/\"/');
	protected $replacement = array('-', '-', '-', 'and', '', '');
	protected $nameMatches = array('/&/');
	protected $nameReplacement = array('and');

	public $ajaxable = array(
//             'index' => array(
//                     'html'
//             ),
            'create' => array(
                    'html'
            ),
            'edit' => array(
                    'html'
            )
    );
	public function preDispatch() {
	    
	    $ajax = $this->_helper->getHelper('AjaxContext');
	    $ajax->addActionContext('create', 'html')
	    ->addActionContext('edit', 'html')
	    ->initContext();
	    
	    switch($this->isAjax()) {
	    	case true :
	    	    
	    	    break;
	    	case false :
	    	    
	    	    break;
	    }
	}
	//public    $searchIndexPath;
	public function init() {
		parent::init();
		
        //$this->pages = new Page_Model_Page();

		$this->pageUrl = $this->_request->getParam('pageUrl', null);

		//$this->page = $this->pages->fetchByUrl($this->pageUrl);

		// create the filter chains
		$this->pageUrlFilter = new Zend_Filter();
		$this->pageNameFilter = new Zend_Filter();

		$this->entities = new Zend_Filter_HtmlEntities(array('quotestyle' => ENT_QUOTES));
		$this->trimFilter = new Zend_Filter_StringTrim();
		$this->alnumFilter = new Zend_Filter_Alnum(array('allowwhitespace' => true));
		$this->toLowerFilter = new Zend_Filter_StringToLower();

		$this->replaceUrlFilter = new Zend_Filter_PregReplace();
		$this->replaceUrlFilter->setMatchPattern($this->matches);
		$this->replaceUrlFilter->setReplacement($this->replacement);

		// build the chain
		$this->pageUrlFilter->addFilter($this->trimFilter);
		$this->pageUrlFilter->addFilter($this->toLowerFilter);
		$this->pageUrlFilter->addFilter($this->replaceUrlFilter);

		$this->pageNameFilter->addFilter($this->trimFilter);
		$this->replaceNameFilter = new Zend_Filter_PregReplace();
		$this->replaceNameFilter->setMatchPattern($this->nameMatches);
		$this->replaceNameFilter->setReplacement($this->nameReplacement);
		$this->pageNameFilter->addFilter($this->replaceNameFilter);
		$this->pageNameFilter->addFilter($this->alnumFilter);

		$this->roleTable = new User_Model_Roles();

		$this->validatePageName = new Zend_Validate_Db_NoRecordExists(array('table' => 'pages', 'field' => 'pageName'));

	}
	/**
	 * The default action - show the home page
	 */
	public function indexAction() {
// 		$model = new Page_Model_Page();
// 		$pages = $model->fetchAll()->toArray();
// 		//Zend_Debug::dump($pages);
// 		$parents = array();
// 		$children = array();

// 		foreach ($pages as $page) {
// 			if ($page['parentId'] == 0) {
// 				$parents[$page['pageId']] = $page;
// 			}
// 			if ($page['parentId'] != 0) {
// 				$children[$page['pageId']] = $page;
// 			}
// 		}

// 		$this->view->pages = $pages;

	}
	public function createAction() {
	    // This allows the markup to be parsed in the view file when the form is requsted via ajax
	    Zend_Dojo_View_Helper_Dojo::setUseDeclarative(true);
		$form = new Page_Form_CreatePage();
		//$form = new Page_Form_ManagePage();
		$form->setAction('/admin/pages/create');
		$page = new Page_Model_Page();
		$row = $page->fetchNew();
		$pageCount = $page->fetchTotalPageCount();
		if($this->isAjax()) {
		    $this->view->message = 'This is a test message';
		}
		//Zend_Debug::dump($row);
		try {
			switch ($this->_request->isPost()) {
			case true:
			//Zend_Debug::dump($this->_request->getPost());
				if ($form->isValid($this->_request->getPost())) {

					$this->post = $form->getValues($this->_request->getPost());
					//Zend_Debug::dump($this->post);
					//die();
					$this->post['pageType'] = 'page';
					switch ($page->allowCreateType($this->post['pageType'])) {

					case true:
						if($this->post['headerImage'] == null) {
							$this->post['headerImage'] = 'default_header.png';
						}
						$row->setFromArray($this->post);
						//$row->role = $this->roleTable->fetchRoleById($this->post['role']);
						$pageName = $this->pageNameFilter->filter($this->post['pageName']);

						if($this->validatePageName->isValid($pageName))
						{
							$row->pageName = $pageName;
						} else {
							throw new Zend_Application_Exception(sprintf('A page with that name already exist, please choose another page name.', $this->post['pageName']));
						}

						//$row->pageUrl = $this->pageUrlFilter->filter($this->post['pageName']);
						$filter = new System_Filter_ItemNameToUri();
						$row->pageUrl = $filter->filter($this->post['pageName']);
						$date = Zend_Date::now();
						$row->createdDate = $date->getTimestamp();
						$row->pageOrder = ++$pageCount;
						$row->userId = $this->user->userId;
						$row->parentId = $this->post['parentId'];

						//$row->showInHomeWidget = $this->post['showInHomeWidget'];

//                         if(isset($this->post['parent']) && $this->post['parent'] !== '') {
//                         	$result = $page->fetchIdByName((int)$this->post['parent']);
//                             $page->init($result->pageId);
//                             $row->parentId = $result->pageId;
//                         }
//                         else {
//                         	$row->parentId = 0;
//                         }
						$id = $row->save();

						if ($id > 0) {


							$count = count($this->post['widgets']);
							if ($count >= 1) {
								// widget table class
								$widgets = new Page_Model_Widgets();
								for ($i = 0; $i < $count; $i++) {
									$widget = $widgets->fetchNew();
									$widget->module = $this->post['widgets'][$i];
									$widget->pageId = $id;
									$widget->pageUrl = $row->pageUrl;
									$widget->controller = 'index';
									$widget->action = 'index';
									$widget->save();
									$attached = $i;
								}
							}
// 							elseif($count === 0) {
// 								$attachedWidgets = $page->findDependentRowset('Page_Model_Widgets', 'widgets');
// 								$index = count($attachedWidgets);
// 								for ($i = 0; $i < $index; $i++) {
// 									$attachedWidgets[$i]->delete();
// 								}
// 							}

// 							$this->messenger->addMessage('Page successfully edited.');
// 							$this->redirect('/');

// 							$this->messenger->addMessage('The page was successfully created and you will be redirected in 3 seconds.');
// 							$this->view->pageName = $row->pageUrl;
							//$this->redirect('/admin/success');
						} else {
							throw new Zend_Application_Exception('There was an unexpected exception while trying to complete your request!');
						}

						break;
					case false:
						throw new Zend_Application_Exception(sprintf('Maximum supported %s pages is 1, please choose another Page Type.', $this->post['pageType']));
						break;
					} // end switch

				}
				break;
			case false:
				$this->view->form = $form;
				break;
			}
		} catch (Exception $e) {
			$this->log->alert($e->getMessage() . ' ::Error Location:: File:: ' . $e->getFile() . ' :: Line:: ' . $e->getLine());
			echo $e->getMessage();
		}

	}

	public function orderPagesAction()
	{
	    //This code block handles the ordering of pages in the main menu
// 	    		switch ($this->isAjax()) {
// 	    		case true:
// 	    		    $model = new Page_Model_Page();
// 	    			if (isset($_POST['order'])) {
// 	    				$i = 1;
// 	    				foreach ($_POST['order'] as $order) {
// 	    					$orderParts = explode('_', $order);
// 	    					$pageToOrderId = $orderParts[1];
// 	    					$row = $model->fetchById($pageToOrderId);
// 	    					$row->pageOrder = $i;
// 	    					$row->save();
// 	    					$i++;
// 	    					continue;
// 	    				}
// 	    			}
// 	    			$pageList = $model->getPagesForOrder();
// 	    			$this->view->orderList = $pageList->toArray();
// 	    			$this->getHelper('viewRenderer')->setNoRender(true);
// 	    			$this->_helper->layout->disableLayout();
// 	    			if (isset($this->_request->pageUrl)) {
// 	    				$page = new Page_Model_Page();
// 	    				$child = $page->fetchByUrl($this->_request->pageUrl);
// 	    				//$this->_response->setBody(var_dump($_POST));
// 	    			}
// 	    			break;
// 	    		}
	}
	public function editAction() {
	    // this must be called or your dojo dijit will not parse when ajaxed in
	    Zend_Dojo_View_Helper_Dojo::setUseDeclarative(true);
		$form = new Page_Form_EditPage();
		$form->setAction('/admin/page/edit/'.$this->_request->pageUrl);
		$model = new Page_Model_Page();
		$page = $model->fetchForEditByUrl($this->pageUrl);
		$pageList = $model->getPagesForOrder();
		$this->view->orderList = $pageList->toArray();
		$this->view->pageName = $page->pageName;

		if($this->isAjax()) {
		    // processAjax(array $data)
		    	if ($this->_request->isPost()) {
		    	    // the pre-validation data, never ever use this raw
		    	    $post = $this->_request->getPost();
		    	    // the subForm container 
		    	    $wSoObj = $form->getSubForm('wSoObj');
		    	    $data = array();
		    	    
		    	    
		    	    foreach($wSoObj as $subForm) {
		    	        //Zend_Debug::dump($subForm->getName());
		    	        if( array_key_exists( $subForm->getName(), $post[$wSoObj->getName()] ) ) {
		    	            if( $subForm->isValid( $post[$wSoObj->getName()][$subForm->getName()] ) ) {
		    	                Zend_Debug::dump($post[$wSoObj->getName()][$subForm->getName()]);
		    	                $page->setFromArray($post[$wSoObj->getName()][$subForm->getName()]);
		    	            }
		    	            else {
		    	                //TODO:: Add validation handling
		    	            }
		    	        }
		    	        continue;
		    	    }
		    	    $result = $page->save();
		    	    // provide notification that the update was successfull

		    	}
		    	else { // pre populate the form with the requested page data
		    	    //echo 'blah';
		    	    $data = array();
		    	    $widgets = $page->findDependentRowset('Page_Model_Widgets', 'widgets')->toArray();
		    	    $index = count($widgets);
		    	    if ($index >= 1) {
		    	        for ($i = 0; $i < $index; $i++) {
		    	            $data['widgets'][] = $widgets[$i]['module'];
		    	        }
		    	    }
		    	    $data['role'] = $page->role;
		    	    $popdata = array_merge($data, $page->toArray());
		    	    
		    	    $form->populate($popdata);
		    	}
		}
		else {// This is deprecated code, but should be left for the moment
		    
// 		    switch ($this->_request->isPost()) {
// 		    	case true:
// 		    	    if ($form->isValid($this->_request->getPost())) {
// 		    	        try {
// 		    	            $attached = 0;
// 		    	            $this->post = $form->getValues($this->post);
// 		    	            $page->setFromArray($this->post);
// 		    	            //Zend_Debug::dump($page->toArray());
// 		    	            //die();
// 		    	            //$page->role = $this->roleTable->fetchRoleById($this->post['role']);
// 		    	            $pageName = $this->post['pageName'];
		    
// 		    	            $filter = new System_Filter_ItemNameToUri();
// 		    	            $page->pageUrl = $filter->filter($this->post['pageName']);
// 		    	            $date = Zend_Date::now();
// 		    	            $page->modifiedDate = $date->getTimestamp();
// 		    	            $result = $page->save();
		    
// 		    	            // This handles adding widgets based on module, controller, action of a given module
// 		    	            if ($result > 0) {
// 		    	                $count = count($this->post['widgets']);
// 		    	                if ($count >= 1) {
// 		    	                    // widget table class
// 		    	                    $widgets = new Page_Model_Widgets();
// 		    	                    for ($i = 0; $i < $count; $i++) {
// 		    	                        $row = $widgets->fetchNew();
// 		    	                        $row->module = $this->post['widgets'][$i];
// 		    	                        $row->pageId = $page->pageId;
// 		    	                        $row->pageUrl = $page->pageUrl;
// 		    	                        $row->controller = 'index';
// 		    	                        $row->action = 'index';
// 		    	                        $row->save();
// 		    	                        $attached = $i;
// 		    	                    }
// 		    	                }
// 		    	                elseif($count === 0) {
// 		    	                    $attachedWidgets = $page->findDependentRowset('Page_Model_Widgets', 'widgets');
// 		    	                    $index = count($attachedWidgets);
// 		    	                    for ($i = 0; $i < $index; $i++) {
// 		    	                        $attachedWidgets[$i]->delete();
// 		    	                    }
// 		    	                }
		    
// 		    	                $this->messenger->addMessage('Page successfully edited.');
// 		    	                $this->redirect('/');
		    
// 		    	            }
// 		    	            else {
// 		    	                throw new Zend_Application_Exception('An unexpected error occured while trying to complete your request!');
// 		    	            }
		    
// 		    	        } catch (Zend_Exception $e) {
// 		    	            $this->log->alert($e);
// 		    	        }
// 		    	    }
		    
// 		    	    break;
// 		    	case false:
// 		    	    // prepare data for any widgets attached to this page
// 		    	    //$popdata = array();
// 		    	    $data = array();
// 		    	    $widgets = $page->findDependentRowset('Page_Model_Widgets', 'widgets')->toArray();
// 		    	    $index = count($widgets);
// 		    	    if ($index >= 1) {
// 		    	        for ($i = 0; $i < $index; $i++) {
// 		    	            $data['widgets'][] = $widgets[$i]['module'];
// 		    	        }
// 		    	    }
// 		    	    //$data['role'] = $page->role;
// 		    	    $popdata = array_merge($data, $page->toArray());
		    
// 		    	    $form->populate($popdata);
		    
// 		    	    break;
// 		    }
		    
		    
		}
		
// 		$data = array();
// 		$widgets = $page->findDependentRowset('Page_Model_Widgets', 'widgets')->toArray();
// 		$index = count($widgets);
// 		if ($index >= 1) {
// 		    for ($i = 0; $i < $index; $i++) {
// 		        $data['widgets'][] = $widgets[$i]['module'];
// 		    }
// 		}
// 		//$data['role'] = $page->role;
// 		$popdata = array_merge($data, $page->toArray());
		 
// 		$form->populate($popdata);
		$this->view->form = $form;

	}
	public function deleteAction() {
		try {
			$this->_helper->viewRenderer->setNoRender(true);
			switch (isset($this->pageUrl)) {
			case true:
				if ($this->pageUrl !== 'home') {
					$model = new Page_Model_Page();
					$page = $model->fetchForEditByUrl($this->pageUrl);

					$delete = (int) $page->delete();
					if ($delete > 0) {
						$this->messenger->addMessage("$page->pageName was deleted successfully!");
						//$this->view->pageName = '';
						$this->redirect('/admin/success');
					} else {
						throw new Zend_Db_Exception(' unknown error trying to process request!');
					}
				}
				break;

			case false:
				break;

			}
		} catch (Exception $e) {
			$this->log->warn($e->getMessage() . ' ::Error Location:: File:: ' . $e->getFile() . ' :: Line:: ' . $e->getLine());
		}

	}
	public function successAction() {

		if (isset($this->_request->pageUrl)) {
			$this->view->pageName = $this->_request->pageUrl;
		}

	} // <- void method, here only for loading the view
}
