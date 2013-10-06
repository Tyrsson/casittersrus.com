<?php
/**
 * Products
 *
 * @author Joey
 * @version
 */
require_once 'Zend/Db/Table/Abstract.php';
class Products_Model_Products extends System_Db_Table_Abstract
{
    /**
     * The default table name
     */
    protected $_name = 'product';
    protected $_primary = 'productId';
    protected $_sequence = true;
    protected $_rowsetClass = 'Products_Model_Rowset_Products';
    protected $_rowClass    = 'Products_Model_Row_Product';

    protected $_dependentTables = array('Products_Model_ProductImage', 'Products_Model_Page');

//     protected $_referenceMap = array(
//     		'Categories' => array(
//     				'columns' => array('categoryId'),
//     				'refTableClass' => 'Products_Model_Categories',
//     				'refColumns' => array('id')
//     		)
//     );

    public $urlFilter;
    public function init(){
        $this->appSettings = Zend_Registry::get('appSettings');
        $this->urlFilter = new System_Filter_ItemNameToUri();
    }
    // Proxy to RowClass save();
    public function save(array $data)
    {
    	$this->getLog();
    	try {
    		$pRow = $this->fetchNew();
    		$pRow->setFromArray($data);
    		$pRow->ident = $this->urlFilter->filter($data['name']);
    		$data['productId'] = $pRow->save();

    		if( ! $data['productId'] > 0) {
    			throw new Zend_Db_Exception('Product could not be created.');
    		}

    		if(isset($data['image']) && $data['image'] !== null && !empty($data['image'])) {
    			$filter = new System_Filter_ThumbFileNamePrefix();
    			$images = new Products_Model_ProductImage();
    			$productImage = $images->fetchNew();
    			$productImage->setFromArray($data);
    			$productImage->full = $data['image'];
    			$productImage->thumbnail = $filter->filter($data['image']);
    			$imageId = $productImage->save();

    			if( ! $imageId > 0) {
    				throw new Zend_Db_Table_Exception('Product Image record could not be created.');
    			}

    		}

    		return $data['productId'];

    	} catch (Zend_Exception $e) {
    		$this->log->addUserEvent(Zend_Auth::getInstance());
    		$this->log->crit($e);
    		return false;
    	}
    }
    public function fetchAllByCat($catId) {

        $query = $this->select()->where('categoryId = ?', $catId);

        return $this->fetchAll($query);
    }

    public function getAllProducts()
    {
        $query = $this->select()
			->from($this->_name);

        return $this->fetchAll($query);
    }
    public function getOnePageByCatIdent($catIdent, $page = 1)
    {
    	$query = $this->select()
    	->setIntegrityCheck(false)
    	->from($this->_name)
    	->join('productImage', 'productImage.productId = product.productId')
    	->where('product.productId > ?', 0)
    	->where('product.categoryId = ?', $catIdent);
    	$paginator = new Zend_Paginator(new Zend_Paginator_Adapter_DbTableSelect($query));
    	$paginator->setItemCountPerPage(6);
    	$paginator->setCurrentPageNumber($page);
    	return $paginator;
    }
    public function getOnePage($page = 1)
    {
        $query = $this->select()
        			->setIntegrityCheck(false)
                      ->from($this->_name)
                      ->join('productImage', 'productImage.productId = product.productId')
                      ->where('product.productId > ?', 0);
        $paginator = new Zend_Paginator(new Zend_Paginator_Adapter_DbTableSelect($query));
        $paginator->setItemCountPerPage(6);
        $paginator->setCurrentPageNumber($page);
        return $paginator;
    }
    public function getOnePageRand()
    {
        $query = $this->select()
                      ->from($this->_name)
                      ->where('productId > ?', 0)
                      ->where('slider = ?', 1)
					  ->order('RAND()');
        $paginator = new Zend_Paginator(new Zend_Paginator_Adapter_DbTableSelect($query));
        $paginator->setItemCountPerPage(6);
        $paginator->setCurrentPageNumber(1);
        return $paginator;
    }
    public function getOnePageByCat($page = 1, $catId, $perPage = null)
    {
        $query = $this->select()
        ->from($this->_name)
        ->where('categoryId = ?', $catId);
        $paginator = new Zend_Paginator(new Zend_Paginator_Adapter_DbTableSelect($query));

        if(isset($this->appSettings->productsPerPage) && !empty($this->appSettings->productsPerPage))
        {
            $paginator->setItemCountPerPage($this->appSettings->productsPerPage);
        }
        elseif($perPage !== null)
        {
            $paginator->setItemCountPerPage($perPage);
        }
        else {
            $paginator->setItemCountPerPage(6);
        }

        $paginator->setCurrentPageNumber($page);
        return $paginator;
    }
    public function getOneById ($id)
    {
        $this->_id = $id;
        $query = $this->select()
                      ->from($this->_name)
                      ->where($this->_primary .' = ?', $this->_id);

        $result = $this->fetchAll($query);
        return $result;
    }
    public function fetch($id)
    {
        $query = $this->select()->from($this->_name)->where('productId = ?', $id);
        return $this->fetchRow($query);
    }
    public function featured() {
    	$query = $this->select()->from($this->_name)->where('featured = ?', 1);
    	return $this->fetchAll($query);
    }
    public function fetchEdit($id)
    {
    	$prod = self::fetch($id);
    	$prodArray = $prod->toArray();

    	$imageTable = new Products_Model_ProductImage();
    	$image = $imageTable->fetch($id);
    	$imageArray = $image->toArray();
    	$pageTable = new Products_Model_Page();
    	$page = $pageTable->fetch($id);
    	$pageArray = $page->toArray();

    	return array_merge($prodArray, $imageArray, $pageArray);
    }
    public function getProductsByCat($categoryId, $limit = NULL, $perPage = null)
    {
    	$query = $this->select()
    	->from($this->_name)
    	->where('categoryId = ?', $categoryId)
    	->limit($limit);

    	$result = $this->fetchAll($query);
    	$randProducts = $result->getRandProducts();
    	return $randProducts;
    }
    public function setCompany(array $data, $id)
    {
    	if(isset($id))
    	{
    		$where = $this->getAdapter()->quoteInto('productId = ?', $id);
            $this->update($data, $where);
            return true;
    	}
    	else {
    		return false;
    	}
    }
    public function getTableName() {
    	return $this->_name;
    }
//    public function edit(array $data, $id)
//    {
//        if (!$this->checkAcl('editown') || !$this->checkAcl('admin:edit'))
//        {
//            throw new System_Acl_Exception('Insufficient Privileges');
//        }
//        else {
//
//                $where = $this->getAdapter()->quoteInto('news_id = ?', $id);
//                $this->update($data, $where);
//        }
//    }
}
