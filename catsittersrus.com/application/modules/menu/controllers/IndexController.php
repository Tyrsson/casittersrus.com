<?php

/**
 * IndexController
 *
 * @author
 * @version
 */

require_once 'System/Controller/Action.php';

class Menu_IndexController extends System_Controller_Action {

	public $urlOptions = array();
	public $cats;
	public $menu;
	public $ajaxable = array(
			// New entry per action
			'index' => array('html')
	);


	public function init() {
		parent::init();
		$this->_helper->ajaxContext->initContext();
		$menu = new Menu_Model_Menu();
		$this->menu = $menu->fetchCurrent();
		$this->cats = new Menu_Model_Category();
		$this->view->cats = $this->cats;

	}
	/**
	 * The default action - show the home page
	 */
	public function indexAction() {
		// TODO Auto-generated IndexController::indexAction() default action
		//Zend_Debug::dump($this->_request->getParams(), 'request params');
		$ajaxParams = array('parentCat' => 'ajaxedDefault', 'childCat' => 'ajaxedDefault', 'page' => 0);
		$defaults = array('parentCat' => 'default', 'childCat' => 'default', 'page' => 0);
		if($this->menu == null) {
		    throw new Zend_Controller_Action_Exception('Under Construction', 503);
		}

		switch($this->isAjax()) {
			case true :

				$parentSelect = $this->menu->select()->where('parentId = ?', 0);
				$parents = $this->menu->findDependentRowset('Menu_Model_Category', 'MenuCats', $parentSelect);
				if(count($parents)) {
				    $defaults['parentCat'] = $parents[0]->name;
				}
                $selectedParent = $this->cats->fetchCatByName($this->_request->parentCat, false, false);
				$childSelect = $this->menu->select()->where('parentId = ?', $selectedParent->id);
				$children = $this->menu->findDependentRowset('Menu_Model_Category', 'MenuCats', $childSelect);
				if(count($children)) {
				    $defaults['childCat'] = $children[0]->name;
				}
				$this->view->urlOptions = $this->_request->getParams();
				$data = $this->cats->fetchCatByName($this->_request->childCat, true, true, 2, $this->_request->page);
				$ajaxParams = $this->_request->getParams();
				break;

			case false :

				$parentSelect = $this->menu->select()->where('parentId = ?', 0);
				$parents = $this->menu->findDependentRowset('Menu_Model_Category', 'MenuCats', $parentSelect);
				$selectedParent = $this->cats->fetchCatByName(($this->_request->parentCat === 'none') ? $parents[0]->name : $this->_request->parentCat, false, false);

				$childSelect = $this->menu->select()->where('parentId = ?', $selectedParent->id);
				$children = $this->menu->findDependentRowset('Menu_Model_Category', 'MenuCats', $childSelect);

				$this->view->urlOptions = array_intersect_key(
				                                                $this->_request->getParams(),
				                                                array(
				                                                        'parentCat' => ($this->_request->parentCat === 'none') ? $parents[0]->name : $this->_request->parentCat,
				                                                        'childCat' => ($this->_request->childCat === 'none') ? $children[0]->name : $this->_request->childCat
				                                                )
				                          );
				$data = $this->cats->fetchCatByName( ($this->_request->childCat === 'none') ? $children[0]->name : $this->_request->childCat, true, true, 2, $this->_request->page);

				break;
		}



		//$this->view->urlOptions = array_merge($this->_request->getParams(), $defaults, $ajaxParams);
		$mContainer = new Zend_Navigation();


		$index = count($parents);
		for ($i = 0; $i < $index; $i++) {
			$pages[] = array(
					     'label' => strtoupper($parents[$i]->name),
					     'route'  => 'menu_index',
		    	         'action' => 'index',
					     'controller' => 'index',
					     'module' => 'menu',
					     //'active' => $i === 0 ? true : false,
					     'params' => array(
					                       'parentCat' => $parents[$i]->name,
					                       'childCat'  => 'none',
					                       'format'    => 'html',
					                       'page'      => 1
					                 )
		            );
		}

		$mContainer->addPages($pages);
		$this->view->parentNavContainer = $mContainer;

		$this->view->parents = $parents;
		$this->view->children = $children;
		$this->view->data = $data;
	}

	public function singleItemAction() {

    }

}
