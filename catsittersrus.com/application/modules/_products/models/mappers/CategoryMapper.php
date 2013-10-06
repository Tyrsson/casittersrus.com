<?php
class Products_Model_Mapper_CategoryMapper
{
	public $cats;
	public $catLookup;
	protected $_data;
	protected $log;

	public function __construct($data)
	{
		try {
			$this->getLog();
			$this->setData($data);
			$this->getCatLookup();
			$this->getCats();
		} catch (Exception $e) {
			$e->getMessage() . ' :: ' . $e->getTraceAsString();
		}

	}
	public function save()
	{
		try {
			$catId = null;
			if( $this->_data == null || !isset($this->_data))
			{
				throw new Zend_Exception('_data must be set and can not be null');
			}
			// Fetch a new category row
			$catRow = $this->cats->fetchNew();
			// set the data that belongs to a category row
			$catRow->setFromArray($this->_data);
			// save new category
			$result = $catRow->save();
			/* verify that we have a good save and assign the new catId
			 * so the children, if any, can be saved in the lookup table
			 */
			if(is_string($result) && !is_object($result)) {
				$catId = (int) $result;
			}
			elseif($result instanceof Products_Model_Row_Category || $result == null) {
				// here we did not have a good save
				throw new Zend_Exception('Category was not created');
			}
			// we will save a lookup record for all cats, and set the parentId to 0 if this is a top level cat
			if(isset($this->_data['parentId']) && $catId !== null) {
				// this should always be an array, even if we have a single value
				foreach($this->_data['parentId'] as $parent) {
					// fetch a new lookup row
					$lookupRecord = $this->catLookup->fetchNew();
					// assign the catId that was just created
					$lookupRecord->catId = $catId;
					// assign the parents of this category
					$lookupRecord->parentId = $parent;
					// save the lookup row
					$lookupRecord->save();
				}
			} else {
				// fetch a new lookup row
				$lookupRecord = $this->catLookup->fetchNew();
				// assign the catId that was just created
				$lookupRecord->catId = $catId;
				// assign the parents of this category
				$lookupRecord->parentId = 0;
				// save the lookup row
				$lookupRecord->save();
			}
			//FIXME:: Expand logging to include the Cat name and the parent names if any
			$this->log->addUserEvent(Zend_Auth::getInstance(), null, null);
			$this->log->info('Created Category');
		} catch (Zend_Exception $e) {
			$this->log->crit($e);
		}

	}
	/**
	 * @return the $cats
	 */
	public function getCats() {
		if ( ! $this->cats instanceof Products_Model_Categories) {
			$this->cats = new Products_Model_Categories();
		}
		return $this->cats;
	}

	/**
	 * @param field_type $cats
	 */
	public function setCats($cats) {
		$this->cats = $cats;
	}

	/**
	 * @return the $catLookup
	 */
	public function getCatLookup() {
		if( ! $this->catLookup instanceof Products_Model_CatLookup)
		{
			$this->setCatLookup(new Products_Model_CatLookup());
		}
		return $this->catLookup;
	}

	/**
	 * @param field_type $catLookup
	 */
	public function setCatLookup($catLookup) {
		$this->catLookup = $catLookup;
	}

	/**
	 * @return the $_data
	 */
	public function getData() {
		return $this->_data;
	}

	/**
	 * @param field_type $_data
	 */
	public function setData(array $_data) {
		$this->_data = $_data;
	}
	/**
	 * @return the $log
	 */
	public function getLog() {
		try {
			if( ! $this->log instanceof System_Log)
			{
				if(Zend_Registry::isRegistered('log')) {
					$this->log = Zend_Registry::get('log');
				}
				else {
					throw new Zend_Exception('Log instance not found in registry');
				}
			}
			return $this->log;
		} catch (Exception $e) {
			echo $e->getMessage() . ' :: ' . $e->getFile() . ' :: ' . $e->getLine();
		}
	}

	/**
	 * @param field_type $log
	 */
	public function setLog($log) {
		$this->log = $log;
	}



}