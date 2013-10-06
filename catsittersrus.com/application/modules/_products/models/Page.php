<?php
/**
 * ProductPage
 *
 * @author Joey
 * @version
 */
require_once 'Zend/Db/Table/Abstract.php';
class Products_Model_Page extends Zend_Db_Table_Abstract
{
    /**
     * The default table name
     */
    protected $_name = 'page';
    protected $_primary = 'pageId';
    protected $_sequence = true;

    protected $_rowClass    = 'Products_Model_Row_Page';

    public function fetchProductPage($productId)
    {
    	$query = $this->select()->from($this->_name)->where('productId = ?', $productId);
    	return $this->fetchRow($query);
    }
    public function fetchCategoryPage($categoryId)
    {
    	$query = $this->select()->from($this->_name)->where('categoryId = ?', $categoryId);
    	return $this->fetchRow($query);
    }
}
