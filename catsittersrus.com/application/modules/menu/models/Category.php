<?php

/**
 * Category
 *
 * @author Randall
 * @version
 */

require_once 'System/Model/Core.php';

class Menu_Model_Category extends System_Model_Core {
	/**
	 * The default table name
	 */
	protected $_name = 'menuCategories';
	protected $_primary = 'id';
	protected $_sequence = true;
	protected $_rowClass = 'Menu_Model_Row_Category';
	protected $_rowsetClass = 'Menu_Model_Rowset_Categories';

	protected $_dependentTables = array('Menu_Model_MenuItems');

	protected $_referenceMap = array(
								'MenuCats' => array(
									'columns' 			=> array('menuId'),
									'refTableClass'		=> 'Menu_Model_Menu',
									'refColumns' 		=> array('id'),
									'onDelete'          => self::CASCADE
								),
                    	        'ChildCats' => array(
                    	                'columns' 			=> array('parentId'),
                    	                'refTableClass'		=> 'Menu_Model_Category',
                    	                'refColumns' 		=> array('id'),
                    	                'onDelete'          => self::CASCADE
                    	        ),
// 	                            'ParentCats' => array(
//                                     'columns' 			=> array('parentId'),
//                                     'refTableClass'		=> 'Menu_Model_Category',
//                                     'refColumns' 		=> array('id'),
//                                     'onDelete'          => self::CASCADE
// 								),
	                           'MenuItems' => array(
                                    'columns' 			=> array('menuId'),
                                    'refTableClass'		=> 'Menu_Model_Category',
                                    'refColumns' 		=> array('id'),
                                    'onDelete'          => self::CASCADE
								)
			 );

	public $menuId;
	public $menu;


	public function init()
	{
	    return $this;
	}

	/**
     * @return the $menu
     */
    public function getMenu ()
    {
        return $this->menu;
    }

	/**
     * @param field_type $menu
     */
    public function setMenu ($menu)
    {
        $this->menu = $menu;
    }

	public function setMenuId($menuId)
	{
	    $this->menuId = $menuId;
	    return $this;
	}
	public function getMenuId()
	{
	    return $this->menuId;
	}
	public function fetchParents($orderColumn = 'id', $orderBy = 'ASC') {
		$q = $this->select()
		->from($this->_name)
		->where('parentId = ?', 0)
		->order("$orderColumn $orderBy");
		return $this->fetchAll($q);
	}
	public function fetchParentNameByChildName($childName) {
		$q = $this->select()->from($this->_name)->where('name = ?', $childName);
		$child = $this->fetchRow($q);

		if( ($child instanceof Menu_Model_Row_Category) && $child->parentId) {
			$q = $this->select()->from($this->_name, array('id', 'name'))->where('id = ?', $child->parentId);
		}

		$result = $this->fetchRow($q);
		if(isset($result->name)) {
			return $result->name;
		}
	}
	public function fetchChildrenByParentName($parentName, $orderColumn = 'id', $orderBy = 'ASC') {
		$q = $this->select()
		->from($this->_name)
		->where('name = ?', $parentName);

		$parent = $this->fetchRow($q);

		if( ($parent instanceof Menu_Model_Row_Category) && $parent->id !== null) {
		$sql = $this->select()
		->from($this->_name)
		->where('parentId = ?', $parent->id)
		->order("$orderColumn $orderBy");

		return $this->fetchAll($sql);
		}
		else {
			return null;
		}
	}
	public function fetchCatByName($name, $withItems = false, $paginated = false, $itemsPerPage = 6, $page = 1) {
		$data = null;
		$q = $this->select()->from($this->_name)->where('name = ?', $name);
		$result = $this->fetchRow($q);
		switch ($withItems) {
			case true :
				$items = new Menu_Model_MenuItems();
				$data = $result->findDependentRowset($items, 'CategoryItems');
				if($paginated) {
					$paginator = new Zend_Paginator(new Zend_Paginator_Adapter_Iterator($data));
					$paginator->setItemCountPerPage($itemsPerPage);
					$paginator->setCurrentPageNumber($page);
					return $paginator;
				}
				else {
					return $data;
				}
				break;
			case false :
				return $this->fetchRow($q);
				break;
		}
	}
	public function fetchParentDropDown($menuId = null) {

	   // Zend_Debug::dump()
		$noParent = array();
		$query = $this->select()->from($this->_name, array('key' => 'id', 'value' => 'name'));
		if($this->menu instanceof Menu_Model_Row_Menu) {
		    $query->where('menuId = ?', $this->menu->id);
		}
		$result = $this->fetchAll($query)->toArray();
		//Zend_Debug::dump($result);
		array_unshift($result, array('key' => 0, 'value' => 'No Parent'));

		return $result;
	}
	public function fetchItemCatDropDown() {

	    // Zend_Debug::dump()
	    $noParent = array();
	    $query = $this->select()->from($this->_name, array('key' => 'id', 'value' => 'name'));
	    //if($this->menu instanceof Menu_Model_Row_Menu) {
	    $query->where('menuId = ?', $this->menu->id);
	    //}
	    $result = $this->fetchAll($query)->toArray();
	    //Zend_Debug::dump($result);
	    //array_unshift($result, array('key' => 0, 'value' => 'No Parent'));

	    return $result;
	}
	/***** Drop down code ends here *****/

	public function fetch($id) {
		$q = $this->select()->from($this->_name)->where('id = ?', $id);
		return $this->fetchRow($q);
	}

	public function fetchAllCategories($paginated = true, $page = 1, $countPerPage = 4, $asArray = false) {

		$q = $this->select()->from($this->_name);

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
