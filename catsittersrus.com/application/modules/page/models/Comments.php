<?php
require_once ('Zend/Db/Table/Abstract.php');
    /** 
     * @author Joey Smith
     * @version 0.9.1
     * @package Page
     */
class Page_Model_Comments extends Zend_Db_Table_Abstract
{
    protected $_name = 'pageComments'; //<- Db Table Name
    protected $_primary = 'commentId';  //<- Primary Table Index
    protected $_rowClass = 'Page_Model_Row_Comment'; //<- Return object type for this Model
    protected $_rowsetClass = 'Page_Model_Rowset_Comments'; //<- 
    protected $_dependentTables = array('Page_Model_Lookup');
    
    public function fetch($pageId) {
    	$query = $this->select()
    	              ->from($this->_name, array('content'))
    	              ->where('fileId = ?', $pageId);
    	$row = $this->fetchRow($query);

    }
}
?>