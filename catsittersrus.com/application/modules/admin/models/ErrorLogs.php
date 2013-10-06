<?php

/**
 * ErrorLogs
 *
 * @author Joey
 * @version
 */

require_once 'Zend/Db/Table/Abstract.php';

class Admin_Model_ErrorLogs extends Zend_Db_Table_Abstract {
	/**
	 * The default table name
	 */
	protected $_name = 'log';


	public function init()
	{

	}
	public function fetchDebug($countPerPage = 20, $page)
	{
		$q = $this->select()->from($this->_name);

		$paginator = new Zend_Paginator(new Zend_Paginator_Adapter_DbTableSelect($q));
		$paginator->setItemCountPerPage($countPerPage);
		$paginator->setCurrentPageNumber($page);


		return $this->fetchAll($q);
	}
	public function fetch($priority = 5, $countPerPage = 10, $page = 1)
	{

	}
}
