<?php
require_once 'Zend/Db/Table/Abstract.php';
class Products_Model_Categories extends Zend_Db_Table_Abstract
{
	/**
	 * @author Joey Smith
	 * @version 0.9.1
	 *
	 */
	protected $_name = 'category';
	/**
	 * The primary key column or columns.
	 * A compound key should be declared as an array.
	 * You may declare a single-column primary key
	 * as a string.
	 *
	 * @var mixed
	 */
	protected $_primary = 'categoryId';
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
	protected $_rowClass = 'Products_Model_Row_Category';
	/**
	 * Classname for rowset
	 *
	 * @var string
	 */
	protected $_rowsetClass = 'Products_Model_Rowset_Categories';

	public $page;
	public $log;

	public function init()
	{
		$this->log = Zend_Registry::get('log');
		$this->page = new Products_Model_Page();

	}
	public function fetchIdByIdent($categoryIdent)
	{
		$q = $this->select()->from($this->_name, array('categoryId'))->where('ident = ?', $categoryIdent);
		$result = $this->fetchRow($q);
		if(isset($result->categoryId) && $result->categoryId > 0) {
			return $result->categoryId;
		}
		else {
			return null;
		}
	}
	public function getCategoriesByParentId($parentId, $countPerPage = 10, $page)
	{
		$select = $this->select()
		->where('parentId = ?', $parentId)
		->order('name');

		$paginator = new Zend_Paginator(new Zend_Paginator_Adapter_DbTableSelect($select));
		return $paginator;
	}
	public function saveCategory(array $data)
	{
		// save a category record and related page if there is content
		try {
			$savePage = false;
			$row = $this->fetchNew();
			$row->setFromArray($data);
			$categoryId = $row->save();
			// we need to create a category page for this one
			if(isset($data['content']) && !empty($data['content']) && $data['content'] !== null)
			{
				if(isset($categoryId))
				{
					$categoryId = (int) $categoryId;
					if(!$categoryId > 0) {
						throw new Zend_Db_Table_Exception('Invalid categoryId');
					}

				}
				$savePage = true;
				// get a new products page row
				$page = $this->page->fetchNew();
				$page->categoryId = $categoryId;
				$page->body = $data['content'];
				$pageId = $page->save();
			}
			if(!$categoryId > 0 || ( true === $savePage && ( !$pageId > 0 ) ) ) {
				throw new Zend_Db_Exception('Category data could not be saved');
			}
			else {
				return true;
			}
		} catch (Zend_Exception $e) {
			$this->log->addUserEvent(Zend_Auth::getInstance(), null, null);
			$this->log->crit($e);
			return false;
		}

	}
	public function fetchChildrenByParentIdent($ident, $pageNumber) {
		$q = $this->select()->from($this->_name, array('categoryId'))->where('ident = ?', $ident);
		$parent = $this->fetchRow($q);

		if(isset($parent->categoryId)) {
			$q = $this->select()->from($this->_name)->where('parentId = ?', $parent->categoryId);
			$paginator = new Zend_Paginator(new Zend_Paginator_Adapter_DbTableSelect($q));

			$paginator->setCurrentPageNumber($pageNumber);
			return $paginator;
		}

	}
	public function fetchChildrenByParentId($parentId, $fetchObject = false)
	{
		$q = $this->select()->from($this->_name);
		$q->setIntegrityCheck(false)
		->where('product_categories.id > ?', 0)
		->join('product_catlookup', 'product_categories.id = product_catlookup.catId')
		->where('product_catlookup.parentId = ?', $parentId);

		if($fetchObject) {
			return $this->fetchAll($q);
		}
		return $this->fetchAll($q)->toArray();
	}
	public function fetchDropDown() {
		$query = $this->select()
		->from($this->_name, array('key' => 'categoryId', 'value' => 'name'))
		->where('categoryId > ?', 0);

		return  $this->fetchAll($query);
	}
}