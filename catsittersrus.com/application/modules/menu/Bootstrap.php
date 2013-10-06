<?php
/**
 * @author Joey Smith
 * @version 0.9.1
 * @package System
 */
require_once ('Zend/Application/Module/Bootstrap.php');
class Menu_Bootstrap extends System_Application_Module_Bootstrap
{
    /*
     * @var boolean flag to include front end navigation to be overridden in class childern
    */
    protected $hasFrontEndNav = false;
    /*
     * @var boolean flag to include admin navigation to be overridden in class childern
    */
    protected $hasAdminNav = true;

    protected function _initModuleAutoloader() {
        $this->_resourceLoader = new Zend_Application_Module_Autoloader(array(
                'basePath'  => APPLICATION_PATH . '/modules/menu',
                'namespace' => 'Menu_',
        )
        );


        $this->_resourceLoader->addResourceTypes(array(
                // DO NOT REMOVE
                'helpers' => array(
                        'path' => 'controllers/action/helpers',
                        'namespace' => 'Controller_Action_Helper')
        )
        );


        return $this->_resourceLoader;
        //die(__METHOD__);
    }
    protected function _initActionHelpers()
    {
        //$this->_logger->info('Bootstrap ' . __METHOD__);
        Zend_Controller_Action_HelperBroker::addHelper(new Menu_Controller_Action_Helper_MenuHelper());
        // echo __METHOD__;
    }

    public function _initRoutes() {
    	$this->getRouter();
    	//Zend_Debug::dump($this->router);
    	// /menu/:parentCat/:childCat/:format
    	$route = new Zend_Controller_Router_Route(
    			'menu/:parentCat/:childCat/:format/:page',
    			array(
    					'action'        => 'index',
    					'controller'    => 'index',
    					'module'        => 'menu',
    					'parentCat' => 'none',
    					'childCat' => 'none',
    					'format'   => 'html',
    					'page'          => 1
    			),
    			array(
    					'parentCat' => '[a-zA-Z-_0-9]+',
    					'childCat' => '[a-zA-Z-_0-9]+',
    					'format'   => '[a-z]+',
    					'page'          => '\d+'
    			)
    	);
    	$this->router->addRoute('menu_index', $route);

    	$createRoute = new Zend_Controller_Router_Route(
    	        'admin/menu/category/create/:menuId/:format',
    	        array(
    	                'action'        => 'create-category',
    	                'controller'    => 'admin',
    	                'module'        => 'menu',
    	                'menuId' => '0',
    	                'format'   => 'html'
    	        ),
    	        array(
    	                'menuId'          => '\d+',
    	                'format'   => '[a-z]+'
    	        )
    	);
    	$this->router->addRoute('menu_create_category', $createRoute);
    	
//     	$editMenu = new Zend_Controller_Router_Route(
//     	        'admin/menu/edit/:id/:format',
//     	        array(
//     	                'action'        => 'edit',
//     	                'controller'    => 'admin',
//     	                'module'        => 'menu',
//     	                'id' => '0',
//     	                'format'   => 'html'
//     	        ),
//     	        array(
//     	                'id'          => '\d+',
//     	                'format'   => '[a-z]+'
//     	        )
//     	);
//     	$this->router->addRoute('menu_edit', $editMenu);

    	// /admin/menu/category/:menuId/:page
    	$manageRoute = new Zend_Controller_Router_Route(
    	        'admin/menu/manage/category/:menuId/:page/:format',
    	        array(
    	                'action'        => 'manage-category',
    	                'controller'    => 'admin',
    	                'module'        => 'menu',
    	                'menuId' => '0',
    	                'page' => '1',
    	                'format'   => 'html'
    	        ),
    	        array(
    	                'menuId'          => '\d+',
    	                'page'     => '\d+',
    	                'format'   => '[a-z]+'
    	        )
    	);
    	$this->router->addRoute('menu_manage_category', $manageRoute);

    	$editCat = new Zend_Controller_Router_Route(
    	        'admin/menu/edit/category/:menuId/:id/:format',
    	        array(
    	                'action'        => 'edit-category',
    	                'controller'    => 'admin',
    	                'module'        => 'menu',
    	                'menuId' => '0',
    	                'id' => '0',
    	                'format'   => 'html'
    	        ),
    	        array(
    	                'menuId'          => '\d+',
    	                'id'     => '\d+',
    	                'format'   => '[a-z]+'
    	        )
    	);
    	$this->router->addRoute('menu_edit_category', $editCat);

    	$editItem = new Zend_Controller_Router_Route(
    	        'admin/menu/item/edit/:menuId/:id/:format',
    	        array(
    	                'action'        => 'edit-items',
    	                'controller'    => 'admin',
    	                'module'        => 'menu',
    	                'menuId' => '0',
    	                'id' => '0',
    	                'format'   => 'html'
    	        ),
    	        array(
    	                'menuId'          => '\d+',
    	                'id'     => '\d+',
    	                'format'   => '[a-z]+'
    	        )
    	);
    	$this->router->addRoute('menu_edit_item', $editItem);
    	
    	$manageItem = new Zend_Controller_Router_Route(
    	        'admin/menu/manage/items/:menuId/:format/:page',
    	        array(
    	                'action'        => 'manage-items',
    	                'controller'    => 'admin',
    	                'module'        => 'menu',
    	                'menuId' => '0',
    	                'format'   => 'html',
    	                'page' => '0',
    	        ),
    	        array(
    	                'menuId'          => '\d+',
    	                'format'   => '[a-z]+',
    	                'page'     => '\d+',
    	        )
    	);
    	$this->router->addRoute('menu_manage_items', $manageItem);
    	
    	$itemStore = new Zend_Controller_Router_Route(
    	        'admin/menu/item/store/:menuId/:format',
    	        array(
    	                'action'        => 'item-store',
    	                'controller'    => 'admin',
    	                'module'        => 'menu',
    	                'menuId' => '0',
    	                'format'   => 'json',
    	        ),
    	        array(
    	                'menuId'          => '\d+',
    	                'format'   => '[a-z]+'
    	        )
    	);
    	$this->router->addRoute('menu_item_store', $itemStore);
    	
    	$menuStore = new Zend_Controller_Router_Route(
    	        'admin/menu/store/:menuId/:format',
    	        array(
    	                'action'        => 'menu-store',
    	                'controller'    => 'admin',
    	                'module'        => 'menu',
    	                'menuId' => '0',
    	                'format'   => 'json',
    	        ),
    	        array(
    	                'menuId'          => '\d+',
    	                'format'   => '[a-z]+'
    	        )
    	);
    	$this->router->addRoute('menu_store', $menuStore);
    	
    	
    	$rest = new Zend_Rest_Route(Zend_Controller_Front::getInstance(), array(), array('menu' => array('json')));
    	$this->router->addRoute('menu_rest_store', $rest);
    	
    	//echo __CLASS__ . "<br />";
    }
}