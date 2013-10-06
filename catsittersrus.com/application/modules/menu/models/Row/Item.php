<?php
class Menu_Model_Row_Item extends Zend_Db_Table_Row_Abstract
{
	protected $_tableClass = 'Menu_Model_MenuItems';
	protected $_rowsetClass = 'Menu_Model_Rowset_Items';
}
