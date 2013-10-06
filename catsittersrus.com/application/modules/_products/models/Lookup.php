<?php
require_once 'Zend/Db/Table/Abstract.php';
class Products_Model_Lookup extends Zend_Db_Table_Abstract
{
	protected $_name = 'product_lookup';
	//protected $_primary = 'recordId';
	protected $sequence = false;
	/**
	 * Associative array map of declarative referential integrity rules.
	 * This array has one entry per foreign key in the current table.
	 * Each key is a mnemonic name for one reference rule.
	 *
	 * Each value is also an associative array, with the following keys:
	 * - columns = array of names of column(s) in the child table.
	 * - refTableClass = class name of the parent table.
	 * - refColumns = array of names of column(s) in the parent table,
	 * in the same order as those in the 'columns' entry.
	 * - onDelete = "cascade" means that a delete in the parent table also
	 * causes a delete of referencing rows in the child table.
	 * - onUpdate = "cascade" means that an update of primary key values in
	 * the parent table also causes an update of referencing
	 * rows in the child table.
	 *
	 * @var array
	 */
	protected $_referenceMap = array (
			'Category' => array (
					'columns' => 'categoryId',
					'refTableClass' => 'Products_Model_ProductCategories',
					'refColumns' => 'categoryId',
					'onDelete' => 'cascade',
					'onUpdate' => 'cascade'
			),
			'Product' => array (
					'columns' => 'productId',
					'refTableClass' => 'Products_Model_Products',
					'refColumns' => 'productId',
					'onDelete' => 'cascade',
					'onUpdate' => 'cascade'
			),
			'Image' => array (
					'columns' => 'imageId',
					'refTableClass' => 'Products_Model_ProductImage',
					'refColumns' => 'imageId',
					'onDelete' => 'cascade',
					'onUpdate' => 'cascade'
			),
			'Page' => array (
					'columns' => 'pageId',
					'refTableClass' => 'Products_Model_ProductPage',
					'refColumns' => 'pageId',
					'onDelete' => 'cascade',
					'onUpdate' => 'cascade'
			)
	);

}