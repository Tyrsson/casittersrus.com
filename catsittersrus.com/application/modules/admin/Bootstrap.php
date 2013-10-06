<?php
require_once ('Zend/Application/Module/Bootstrap.php');
class Admin_Bootstrap extends System_Application_Module_Bootstrap
{
	protected $hasFrontEndNav = true;
	protected $hasAdminNav = true;


	public function _initRoutes() {
	    $front = Zend_Controller_Front::getInstance();
	    $this->getRouter();
	    $route = new Zend_Controller_Router_Route(
	            'admin/',
	            array(
	                    'action'        => 'index',
	                    'controller'    => 'index',
	                    'module'        => 'admin',

	            )
// 	            array(
// 	                    'parentCat' => '[a-zA-Z-_0-9]+',
// 	                    'childCat' => '[a-zA-Z-_0-9]+',
// 	                    'format'   => '[a-z]+',
// 	                    'page'          => '\d+'
// 	            )
	    );
	    $this->router->addRoute('admin-index', $route);
        $route = new Zend_Controller_Router_Route('admin/cmditemstore/get/:format', 
                array(
                        'module' => 'admin',
                        'controller' => 'cmd-item-store',
                        'action' => 'get',
                        'format' => 'json',
                        //'identifier' => 'id'
                ), 
                array(
                        'format' => '[a-z]+',
                        //'page' => '\d+'
                ));
	    $this->router->addRoute('admin-index', $route);
	    
	    
	    $RestFul = new Zend_Rest_Route($front, array(), array('admin' => array('navapi')));
	    $this->router->addRoute('rest', $RestFul);
	    
// 	    $cmdStoreRoute = new Zend_Rest_Route($front, array(), array(
// 	            'product' => array('ratings')
// 	    ));
	}
// 	protected function _initDojoBuildLayer() {
// 	    //$this->_logger->info('Bootstrap ' . __METHOD__);
// 	    //TODO: Recode this plugin to allow for modules
// 	    $layer = new System_Controller_Plugin_DojoLayer();
// 	    $front = Zend_Controller_Front::getInstance();
// 	    $front->registerPlugin(new System_Controller_Plugin_DojoLayer($layer));
// 	    // echo __METHOD__;
// 	}
}