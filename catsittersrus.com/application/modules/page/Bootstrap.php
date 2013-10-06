<?php
require_once ('System/Application/Module/Bootstrap.php');
class Page_Bootstrap extends System_Application_Module_Bootstrap
{
    /*
     * @var boolean flag to include front end navigation to be overridden in class childern
    */
    protected $hasFrontEndNav = false;
    /*
     * @var boolean flag to include admin navigation to be overridden in class childern
    */
    protected $hasAdminNav = false;

    /* (non-PHPdoc)
	 * @see System_Application_Module_Bootstrap::_initModuleAutoloader()
	 */
	protected function _initModuleAutoloader() {
		$this->_resourceLoader = new Zend_Application_Module_Autoloader(array(
				'basePath'  => APPLICATION_PATH . '/modules/page',
				'namespace' => 'Page_',
		)
		);
		//return $this->_resourceLoader;
		//die(__METHOD__);
		//echo __CLASS__ . "<br />";
	}
	protected function _initRoutes()
	{
	    /*
	     *
	        resources.router.routes.admin-page-success.route = /admin/page/success
            resources.router.routes.admin-page-success.defaults.module = page
            resources.router.routes.admin-page-success.defaults.controller = admin
            resources.router.routes.admin-page-success.defaults.action = success

            resources.router.routes.admin-page-create.route = /admin/page/create
            resources.router.routes.admin-page-create.defaults.module = page
            resources.router.routes.admin-page-create.defaults.controller = admin
            resources.router.routes.admin-page-create.defaults.action = create

            resources.router.routes.admin-page-edit.route = /admin/page/edit/:pageUrl
            resources.router.routes.admin-page-edit.defaults.module = page
            resources.router.routes.admin-page-edit.defaults.controller = admin
            resources.router.routes.admin-page-edit.defaults.action = edit

            resources.router.routes.admin-page-delete.route = /admin/page/delete/:pageUrl
            resources.router.routes.admin-page-delete.defaults.module = page
            resources.router.routes.admin-page-delete.defaults.controller = admin
            resources.router.routes.admin-page-delete.defaults.action = delete
	     */
	    $this->getRouter();
	    $route = new Zend_Controller_Router_Route_Regex(
	            'page(?:/(\w+))?',
	            array(
	                    'module'        => 'page',
	                    'controller'    => 'index',
	                    'action'        => 'page',
	                    //'url'           => 'home'
	            ),
	            array(
	    	            1 => 'url'
	            ),
	            'page/%s'
	    );
	    $this->router->addRoute('page', $route);

	    $route = new Zend_Controller_Router_Route(
	            'admin/page/create',
                array(
                        'module'     => 'page',
                        'controller' => 'admin',
                        'action'     => 'create',
                        'format'     => 'html'
                )
	    );
	    $this->router->addRoute('create_page', $route);

	    $route = new Zend_Controller_Router_Route(
	            'admin/page/edit/:pageUrl',
	            array(
	                    'module'     => 'page',
	                    'controller' => 'admin',
	                    'action'     => 'edit',
	                    'pageUrl'    => '',
	                    'format'     => 'html'
	            ),
	            array(
	    	          'pageUrl' => '[a-zA-Z0-9_-]+',
	                  'format'  => '[a-z]+'
	            )
	    );
	    $this->router->addRoute('edit_page', $route);
	}
}