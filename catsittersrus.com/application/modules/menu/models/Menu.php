<?php

/**
 * Menu
 *
 * @author Joey
 * @version
 */

require_once 'System/Model/Core.php';

class Menu_Model_Menu extends System_Model_Core {
	/**
	 * The default table name
	 */
	protected $_name = 'menus';
	protected $_primary = 'id';
	protected $_sequence = true;

	protected $_rowsetClass = 'Menu_Model_Rowset_Menus';

	protected $_rowClass = 'Menu_Model_Row_Menu';

	protected $_dependentTables = array('Menu_Model_Category', 'Menu_Model_MenuItems');

	public $id;

	public function init() {
	    return $this;
	}
	public function setId($id) {
	    $this->id = $id;
	}
	public function getId() {
	    return $this->id;
	}
	public function fetch($id) {
		$q = $this->select()->from($this->_name)->where('id = ?', $id);
		return $this->fetchRow($q);
	}
	public function fetchCurrent() {
		$q = $this->select()->from($this->_name)->where('isCurrent = ?', 1);
		return $this->fetchRow($q);
	}
	public function fetchCategories() {

	}
	public function fetchDropDown($valueColumn, $withDefault = false, $defaultId = 0, $defaultLabel = 'None', $asArray = true) {
	    $noParent = array();
	    $query = $this->select()->from($this->_name, array('key' => 'id', 'value' => 'name'))->order('isCurrent DESC');
	    $result = $this->fetchAll($query)->toArray();
	    return $result;
	}
	public function fetchItemsByMenuId($menuId) {
	    $menu = $this->fetch($menuId);
	    return $menu->findDependentRowset('Menu_Model_MenuItems', 'MenuItems');
	}
	public function fetchTree($menuId = null) {
	    // $menuId === null, we want all menus, cats and their items
	    // we need an array to hold the results
	   // $result = array();
	    
	    // now everything needs to be an assoc array
	    $menus = $this->fetchAll();
	    $index = count($menus);
	    for ($i = 0; $i < $index; $i++) {
	        $data[$i]['menu']['id'] = $menus[$i]->id;
	        $data[$i]['menu']['name'] = $menus[$i]->name;
	    	$data[$i]['menu']['children'] = $menu[$i]->findDependRowset('Menu_Model_Category', 'MenuCats');
	    	if(count($data[$i]['menu']['children'])) {
	    	    
	    	}
	    }
	    return (array) $data;
	}
	public function fetchAllMenus($paginated = true, $page = 1, $countPerPage = 4, $asArray = false) {

		$q = $this->select()->from($this->_name)->order('isCurrent DESC');

		switch($paginated) {
			case true :
				$paginator = new Zend_Paginator(new Zend_Paginator_Adapter_DbTableSelect($q));
				$paginator->setItemCountPerPage($countPerPage);
				$paginator->setCurrentPageNumber($page);
				return $paginator;
				break;
			case false :
				if(!$asArray) {
					return $this->fetchAll($q);
				}
				else {
					return $this->fetchAll($q)->toArray();
				}
				break;
		}

	}
}
