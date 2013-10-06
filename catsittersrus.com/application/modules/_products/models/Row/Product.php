<?php
class Products_Model_Row_Product extends System_Model_Row_Searchable
{
/**
     * The data for each column in the row (column_name => value).
     * The keys must match the physical names of columns in the
     * table for which this row is defined.
     *
     * @var array
     */
    protected $_data = array();

    /**
     * This is set to a copy of $_data when the data is fetched from
     * a database, specified as a new tuple in the constructor, or
     * when dirty data is posted to the database with save().
     *
     * @var array
     */
    protected $_cleanData = array();

    /**
     * Tracks columns where data has been updated. Allows more specific insert and
     * update operations.
     *
     * @var array
     */
    protected $_modifiedFields = array();

    /**
     * Zend_Db_Table_Abstract parent class or instance.
     *
     * @var Zend_Db_Table_Abstract
     */
    //protected $_table;

    /**
     * Connected is true if we have a reference to a live
     * Zend_Db_Table_Abstract object.
     * This is false after the Rowset has been deserialized.
     *
     * @var boolean
     */
    protected $_connected = true;

    /**
     * A row is marked read only if it contains columns that are not physically represented within
     * the database schema (e.g. evaluated columns/Zend_Db_Expr columns). This can also be passed
     * as a run-time config options as a means of protecting row data.
     *
     * @var boolean
     */
    protected $_readOnly = false;

    /**
     * Name of the class of the Zend_Db_Table_Abstract object.
     *
     * @var string
     */
    protected $_tableClass = 'Products_Model_Products';

    /**
     * Primary row key(s).
     *
     * @var array
     */
    protected $_primary = 'productId';
    private $page = null;
	private $category = null;

	public function getSearchIndexFields()
	{
	    $filter = new Zend_Filter_StripTags();
	    $fields['class'] = __CLASS__; // try changing this to get_called_class() to ident each rows class instead of the parent
	    $fields['key'] = $this->_data['productId'];
	    $fields['docRef'] = $fields['class'].':'.$fields['key'];
	    $fields['url'] = '/products/display/'.$this->_data['productId'];
	    $fields['title'] = $this->_data['name'];
	    $fields['contents'] = $this->_data['description'];
	    $fields['summary'] = substr($filter->filter($this->_data['shortDescription']), 0, 300);
	    $fields['createdBy'] = Zend_Auth::getInstance()->hasIdentity() ? Zend_Auth::getInstance()->getIdentity()->userId : 0;
	    $fields['dateCreated'] = 0;

	    return $fields;
	}
	/**
	 * @return Model_Row_User
	 */
	public function getCategory()
	{
		if (!$this->category) {
			$this->category = $this->findParentRow('Products_Model_ProductCategories');
		}

		return $this->category;
	}
	/**
	 * @return Products_Model_Row_Page
	 */
	public function getPage()
	{
		if (!$this->page) {
			$this->page = $this->findManyToManyRowset(
														'Products_Model_ProductPage',	// match table
														'Products_Model_Lookup');	// join table
		}

		return $this->page;
	}


	/**
	 * Allows post-insert logic to be applied to row.
	 * Subclasses may override this method.
	 *
	 * @return void
	 */
// 	protected function _postInsert()
// 	{
// 		$lookup = new Products_Model_Lookup();
// 		$row = $lookup->fetchNew();
// 		$row->setFromArray($this->_data);
// 		$row->save();
// 		parent::_postInsert();
// 	}

}