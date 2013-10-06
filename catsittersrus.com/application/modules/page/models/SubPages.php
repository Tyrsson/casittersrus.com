<?php
/**
 * SubPage
 *  
 * @author Joey
 * @version 
 */
require_once 'Zend/Db/Table/Abstract.php';
class Page_Model_SubPage 
{
    public $parentId;
    
    public $page;
    
    public $subPages;
    
    public function __construct(object $page) {
        if (!($page instanceof Page_Model_Row_Page)) {
        	throw new System_Db_Exception('$page must be an instance of Page_Model_Page');
        }
        $this->setPage($page);
        
    }
	/**
     * @return the $parentId
     */
    public function getParentId ()
    {
        return $this->parentId;
    }

	/**
     * @param field_type $parentId
     */
    public function setParentId ($parentId)
    {
        $this->parentId = $parentId;
    }

	/**
     * @return the $page
     */
    public function getPage ()
    {
        return $this->page;
    }

	/**
     * @param Page_Model_Page $page
     */
    public function setPage ($page)
    {
        $this->page = $page;
    }

	/**
     * @return the $subPages
     */
    public function getSubPages ()
    {
        return $this->subPages;
    }

	/**
     * @param field_type $subPages
     */
    public function setSubPages ($subPages)
    {
        $this->subPages = $subPages;
    }

    
}
