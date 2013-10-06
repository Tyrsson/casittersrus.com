<?php
class Products_Model_Rowset_Products extends Zend_Db_Table_Rowset_Abstract
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
	protected $_tableClass = 'Products_Model_Products';
	
	/**
	 * Zend_Db_Table_Row_Abstract class name.
	 *
	 * @var string
	 */
	protected $_rowClass = 'Products_Model_Row_Product';
	
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
	
	public function getRandProducts(){
		if(count($this->_data) > 4){
			$this->result = array_rand($this->_data, 4);
			return $this->result;
		}
		else{
			return $this->_data;
		}
	}
}