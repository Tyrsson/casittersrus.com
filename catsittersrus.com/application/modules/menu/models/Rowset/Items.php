<?php
class Menu_Model_Rowset_Items extends Zend_Db_Table_Rowset_Abstract
{
	protected $_tableClass = 'Menu_Model_MenuItems';
	protected $_rowClass = 'Menu_Model_Row_Item';
}

