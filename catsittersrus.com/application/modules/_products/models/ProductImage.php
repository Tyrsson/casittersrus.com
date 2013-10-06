<?php
/**
 * ProductImage
 *
 * @author Joey
 * @version
 */
require_once 'Zend/Db/Table/Abstract.php';
class Products_Model_ProductImage extends Zend_Db_Table_Abstract
{
    /**
     * The default table name
     */
    protected $_name = 'productImage';
    protected $_primary = 'imageId';
    protected $_sequence = true;
    protected $_rowClass = 'Products_Model_Row_Image';

    public function fetch($productId)
    {
    	$query = $this->select()->from($this->_name)->where('productId = ?', $productId);
    	return $this->fetchRow($query);
    }
}
