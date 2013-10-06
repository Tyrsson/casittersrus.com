<?php

/**
 * Item
 *
 * @author Randall
 * @version
 */

require_once 'System/Model/Core.php';

class Menu_Model_MenuItems extends System_Model_Core {
	/**
	 * The default table name
	 */
	protected $_name = 'menuItems';
	protected $_primary = 'id';
	protected $_sequence = true;
	protected $_rowClass = 'Menu_Model_Row_Item';
	protected $_rowsetClass = 'Menu_Model_Rowset_Items';

	protected $_referenceMap = array(
			'CategoryItems' => array(
					'columns' 			=> array('categoryId'),
					'refTableClass'		=> 'Menu_Model_Category',
					'refColumns' 		=> array('id'),
					'onDelete'          => self::CASCADE
			),
			'MenuItems' => array(
					'columns' 			=> array('menuId'),
					'refTableClass' 	=> 'Menu_Model_Menu',
					'refColumns' 		=> array('id'),
					'onDelete'          => self::CASCADE
			),
	        'Specials' => array(
	                'columns' 			=> array('menuId'),
	                'refTableClass' 	=> 'Menu_Model_MenuItems',
	                'refColumns' 		=> array('isSpecial')
			)
	);
	
	public function fetchSpecials($fetchObject = true)
	{
	    $table = new Menu_Model_Menu();
	    $menu = $table->fetchCurrent();
	    //$currentId = $menu->id;
	    $q = $this->select(true)->where('isSpecial = ?', 1)->where('menuId = ?', $menu->id);
	    $result = $this->fetchAll($q);
	    if(!$fetchObject) {
	        return $result->toArray();
	    }
	    return $result;
	}
	public function getMetaData($columnName){
		$data = array();
		$sql = 'SHOW COLUMNS FROM ' . $this->_db->quoteIdentifier($this->_name) . ' WHERE field= '.$this->_db->quote($columnName, 'string');
		$columnData = $this->_db->fetchAll($sql);
		if(isset($columnData[0]) && is_array($columnData[0])) {
			if(isset($columnData[0]['Type'])) {
				$subString = $this->get_string_between(str_replace("'", "", $columnData[0]['Type']), '(', ')');
				$valueArray = explode(',', $subString);
				if(is_array($valueArray)) {
					foreach ($valueArray as $key => $value) {
						$data[$value] = $value;
						continue;
					}
				}
			}
		}
		if(count($data) >= 1) {
			return $data;
		}
		else {
			return null;
		}
	}
	public function get_string_between($string, $start, $end){
		$string = " ".$string;
		$ini = strpos($string,$start);
		if ($ini == 0) return "";
		$ini += strlen($start);
		$len = strpos($string,$end,$ini) - $ini;
		return substr($string,$ini,$len);
	}

	public function fetch($id) {
		$q = $this->select()->from($this->_name)->where('id = ?', $id);
		return $this->fetchRow($q);
	}

	public function fetchAllItems($paginated = true, $page = 1, $countPerPage = 4, $asArray = false) {

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
