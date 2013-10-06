<?php

/**
 * SubCategories
 *
 * @author Joey
 * @version
 */

require_once 'Zend/Db/Table/Abstract.php';

class Products_Model_CatLookup extends Zend_Db_Table_Abstract {
	/**
	 * @author Joey Smith
	 * @version 0.9.1
	 *
	 */
	protected $_name = 'product_catlookup';
	/**
	 * The primary key column or columns.
	 * A compound key should be declared as an array.
	 * You may declare a single-column primary key
	 * as a string.
	 *
	 * @var mixed
	 */
	protected $_primary = 'id';
	/**
	 * Define the logic for new values in the primary key.
	 * May be a string, boolean true, or boolean false.
	 *
	 * @var mixed
	 */
	protected $_sequence = true;
	/**
	 * Classname for row
	 *
	 * @var string
	 */
	protected $_rowClass = 'Products_Model_Row_CatLookup';
	/**
	 * Classname for rowset
	 *
	 * @var string
	 */
	protected $_rowsetClass = 'Products_Model_Rowset_CatLookups';


	public function fetchDropDown() {
		$query = $this->select()
		->from($this->_name, array('key' => 'id', 'value' => 'catName'))
		->where('id > ?', 0);

		return  $this->fetchAll($query);
	}
	public function fetchChildrenByParentId($id)
	{
		$q = $this->select()->from($this->_name)->where('parentId = ?', $id);

		return $this->fetchAll($q);
	}
	public function fetchParents()
	{
		$q = $this->select()->from($this->_name)->where('parentId = ?', 0);
		return $this->fetchAll($q);
	}

}
