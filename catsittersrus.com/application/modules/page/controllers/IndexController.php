<?php
/**
 * PageController
 *
 * @author Joey Smith
 * @version 0.9
 */
require_once 'Zend/Controller/Action.php';
class Page_IndexController extends System_Controller_Action
{
    public $categories;
    public $files;
    public $page;
    public $isHome = false;
    public $model = 'Page_Model_Page';
    public $pages;
    public $found = false;

    //public $context = array('index' => array('ajax'));

   // private $overRideUrl = false;

    public function preDispatch()
    {
        if($this->isAjax()) {
 		   exit();
		}
    }
    public function init() {
        parent::init();
        $this->pages = new Page_Model_Page();
    }
    /**
     * The default action - show the page if the user has access to it, if its not found then of course we get a 404
     */
    public function indexAction ()
    {
        $pageData = array();
        $params = $this->_request->getParams();
        //Zend_Debug::dump($params);
        if(!isset($params->pageUrl)) {
            $params['pageUrl'] = 'home';
        }

        $this->page = $this->pages->fetchByUrl(  $params['pageUrl'] );

        switch($this->page instanceof Page_Model_Row_Page) {
        	case true :

        	    if($this->page === null) {
        	        throw new Zend_Controller_Action_Exception('Page not found', 404);
        	    }
        	    elseif($this->page instanceof Page_Model_Row_Page) {
        	        $this->view->widgets = $this->page->findDependentRowset('Page_Model_Widgets', 'widgets');
        	        switch($this->page->pageUrl) {
        	        	case 'home' :
        	        	    $this->isHome = true;
        	        	    $this->view->isHome = $this->isHome;

        	        	    break;

        	        	default :

        	        	    break;
        	        }// end switch

        	        $this->view->headTitle(ucwords($this->page->pageName));
        	        $role = (string) $this->user->role;
        	        $pageRole = (string) $this->page->role;
        	        switch($this->acl->isAllowed($role, $this->module, 'page.manage')) {
        	        	case true :
        	        	    $this->view->allowEdit = true;
        	        	    break;
        	        	default:
        	        	    $this->view->allowEdit = false;
        	        	    break;
        	        }

        	        switch($this->acl->isAllowed($role, $this->module, "page.$pageRole.view")) {
        	        	case true :
        	        	    break;
        	        	default :
        	        	    throw new Zend_Controller_Action_Exception('Access Denied', 550);
        	        	    break;
        	        }

        	        $this->pages->registerPageNavigation($this->page->pageId, true);

        	        $children = $this->pages->fetchChildren($this->page->pageId);
        	        $childCount = count($children);
        	        $hasChildren = false;
        	        if($childCount > 0) {
        	            $hasChildren = true;
        	        }
        	        $this->view->hasChildren = $hasChildren;
        	        $this->view->childCount = $childCount;
        	        $this->view->subPages = $children;

//         	        $this->view->allowDelete = $allowDelete;

        	        //     				if(count($subPages) > 0) {
        	        //     					$this->view->subPageNav = $this->_helper->subPageNav($subPages);
        	        //     					$pageData['hasSubPages'] = true;
        	        //     					//$pageData['subPages'] = $subPages;
        	        //     				} else {
        	        //     					$pageData['hasSubPages'] = false;
        	        //     				}
        	            // array_merge this
        	        $this->view->page = array_merge($pageData, $this->page->toArray());
        }// end elseif
        break;

        case false :
            throw new Zend_Controller_Action_Exception('Unknown page', 404);
            break;
        }
    }
    public function pageAction()
    {
    	$pageData = array();
    	$this->page = $this->pages->fetchByUrl($this->_request->url);

    	switch($this->page instanceof Page_Model_Row_Page) {
    		case true :

    			if($this->page === null) {
    				throw new Zend_Controller_Action_Exception('Page not found', 404);
    			}
    			elseif($this->page instanceof Page_Model_Row_Page) {
    				$this->view->widgets = $this->page->findDependentRowset('Page_Model_Widgets', 'widgets');
    				switch($this->page->pageUrl) {
    					case 'home' :
    						$this->isHome = true;
    						$this->view->isHome = $this->isHome;

    						break;

    					default :

    						break;
    				}// end switch

    				$this->view->headTitle(ucwords($this->page->pageName));
    				$role = (string) $this->user->role;
    				$pageRole = (string) $this->page->role;
    				switch($this->acl->isAllowed($role, $this->module, "$this->module.manage")) {
    					case true :
    						$this->view->allowEdit = true;
    						break;
    					default:
    						$this->view->allowEdit = false;
    						break;
    				}

    				switch($this->acl->isAllowed($role, $this->module, "$this->module.$pageRole.view")) {
    					case true :
    						break;
    					default :
    						throw new Zend_Controller_Action_Exception('Access Denied', 550);
    						break;
    				}

    				$this->pages->registerPageNavigation($this->page->pageId, true);

    				$children = $this->pages->fetchChildren($this->page->pageId);
    				$childCount = count($children);
    				$hasChildren = false;
    				if($childCount > 0) {
    					$hasChildren = true;
    				}
    				$this->view->hasChildren = $hasChildren;
    				$this->view->childCount = $childCount;
    				$this->view->subPages = $children;


//     				if(count($subPages) > 0) {
//     					$this->view->subPageNav = $this->_helper->subPageNav($subPages);
//     					$pageData['hasSubPages'] = true;
//     					//$pageData['subPages'] = $subPages;
//     				} else {
//     					$pageData['hasSubPages'] = false;
//     				}
    				// array_merge this
    				$this->view->page = array_merge($pageData, $this->page->toArray());
    			}// end elseif
    			break;

    		case false :
    			throw new Zend_Controller_Action_Exception('Unknown page', 404);
    			break;
    	}
    }

}