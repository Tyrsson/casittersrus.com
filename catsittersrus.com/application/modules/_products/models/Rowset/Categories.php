<?php
class Products_Model_Rowset_Categories extends Zend_Db_Table_Rowset_Abstract
{
	/**
	 * Zend_Db_Table_Abstract object.
	 *
	 * @var Zend_Db_Table_Abstract
	 */
	protected $_table;

	/**
	 * Connected is true if we have a reference to a live
	 * Zend_Db_Table_Abstract object.
	 * This is false after the Rowset has been deserialized.
	 *
	 * @var boolean
	 */
	protected $_connected = true;

	/**
	 * Zend_Db_Table_Abstract class name.
	 *
	 * @var string
	 */
	protected $_tableClass = 'Products_Model_ProductCategories';

	/**
	 * Zend_Db_Table_Row_Abstract class name.
	 *
	 * @var string
	 */
	protected $_rowClass = 'Products_Model_Row_Category';

	/**
	 * Iterator pointer.
	 *
	 * @var integer
	 */
	protected $_pointer = 0;

	/**
	 * How many data rows there are.
	 *
	 * @var integer
	 */
	protected $_count;

	/**
	 * Collection of instantiated Zend_Db_Table_Row objects.
	 *
	 * @var array
	 */
	protected $_rows = array();

	/**
	 * @var boolean
	 */
	protected $_stored = false;

	/**
	 * @var boolean
	 */
	protected $_readOnly = false;

	public function getChildren()
	{
		$children = array();

		while ($this->valid()) {
			$child = $this->current();
			$children[] = $child->id;  // the actual tag name
			$this->next();
		}

		$this->rewind();

		return $children;
	}

}