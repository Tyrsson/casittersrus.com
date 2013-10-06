<?php
/**
 * Menus
 *  
 * @author Joey
 * @version 
 */
require_once 'Zend/Db/Table/Abstract.php';
class Page_Model_MenuLinks extends Zend_Db_Table_Abstract
{
    /**
     * The default table name
     */
    protected $_name = 'pageMenuLinks';
    protected $_primary = 'menuId';
    protected $_sequence = false;
    protected $_rowClass = 'Page_Model_Row_MenuLink';
    protected $_rowsetClass = 'Page_Model_Rowset_MenuLinks';
}
