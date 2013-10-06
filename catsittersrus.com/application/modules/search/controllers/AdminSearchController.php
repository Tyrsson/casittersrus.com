<?php

/**
 * Admin_AdminSearchController
 * 
 * @author Joey Smith
 * @version 0.9
 */

require_once 'System/Controller/AdminAction.php';

class Search_AdminSearchController extends System_Controller_AdminAction
{
    private static $token;
    private $clientParams = array();
    public function init()
    {
        parent::init();
        
    }
    /**
     * The default action - show the home page
     */
    public function indexAction ()
    {
        //$this->_forward($action = 'manage');
    }

    public function manageAction()
    {
        $get = $this->_request->getQuery();
        
        switch($get['cmd']) {
            case 'buildNew' :
                $pages = new Page_Model_Page();
                $index = Search_Service_Lucene::create(APPLICATION_PATH . DIRECTORY_SEPARATOR . 'data' . DIRECTORY_SEPARATOR . 'search');
//                 foreach($pages->fetchAll() as $page) {
//                     $index->addDocument(new Search_Lucene_Document($page->getSearchIndexFields()));
//                 }
                break;
        }
        
    }
}
