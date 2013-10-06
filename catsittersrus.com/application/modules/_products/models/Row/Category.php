<?php
class Products_Model_Row_Category extends Zend_Db_Table_Row_Abstract
{
	/**
	 * Name of the class of the Zend_Db_Table_Abstract object.
	 *
	 * @var string
	 */
	protected $_tableClass = 'Products_Model_Categories';

	public function getId()
	{
		return $this->_data['id'];
	}
}