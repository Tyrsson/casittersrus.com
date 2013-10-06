\<?php
/**
 * @author Joey Smith
 * @version 0.1
 */
class BootstrapAdminRpc extends Zend_Application_Bootstrap_Bootstrap
{
	const DEFAULT_SKIN_NAME = 'default';
    /**
     * Init a global MySQL connection for all calls to the DB
     */
    protected $db;
    protected $sessionConfig;
    protected $appSettings;
    protected $_logger;
    protected $_config;
    protected $_cache;

    protected function _initConfig() {
        $this->_config = new Zend_Config_Ini(APPLICATION_PATH . '/configs/application.ini', APPLICATION_ENV);
        defined('DEV') || define('DEV', 'development');
        defined('PROD') || define('PROD', 'production');
        // echo __METHOD__;
    }
    protected function _initFront() {
    	$front = Zend_Controller_Front::getInstance();
    	$this->front = $front;
    	$dispatcher = $front->getDispatcher();
    	$dispatcher->setParam('disableOutputBuffering', true);
    	ini_set("zlib.output_compression", "On");
    	$front->setParam('prefixDefaultModule', true);
    	$front->setDefaultModule('page');
    	$front->setDefaultControllerName('index');
    	$front->setDefaultAction('index');
    	//$front->setParam('useDefaultControllerAlways', true);
    	$this->router = $front->getRouter();
    	//$this->router->setGlobalParam('format', 'html');
    	//$router->removeDefaultRoutes();
    	// echo __METHOD__;
    }
    /**
     * Setup locale
     */
    protected function _initLocale() {
        //$this->_logger->info('Bootstrap ' . __METHOD__);
        $this->locale = new Zend_Locale('en');
        Zend_Locale::setDefault('en');
        Zend_Registry::set('Zend_Locale', $this->locale);
        // echo __METHOD__;
    }
    protected function _initCaching () {

        $this->bootstrap('cachemanager');
        $resource = $this->getPluginResource('cachemanager');
        $cacheManager = $resource->getCacheManager();
        $this->_cache = $cacheManager->getCache('cache');
        Zend_Registry::set('cache', $this->_cache);

        $classFileIncCache = APPLICATION_PATH . '/data/pluginLoaderCache.php';
        if (file_exists($classFileIncCache)) {
            include_once $classFileIncCache;
        }
        if ($this->_config->params->enablePluginLoaderCache) {
            Zend_Loader_PluginLoader::setIncludeFileCache($classFileIncCache);
        }

       // echo __METHOD__;
    }
    protected function _initMysql() {
        $this->bootstrap('db');
        switch (APPLICATION_ENV) {

            case 'development' :
                $profiler = new Zend_Db_Profiler_Firebug('System Queries');
                $profiler->setEnabled(true);
                $this->getPluginResource('db')->getDbAdapter()->setProfiler($profiler);
                break;

            case 'production' :
                Zend_Db_Table_Abstract::setDefaultMetadataCache($this->_cache);
                break;
        }
        // echo __METHOD__;
    }

    /**
     * Configure the default modules autoloading, here we first create
     * a new module autoloader specifiying the base path and namespace
     * for our default module. This will automatically add the default
     * resource types for us. We also add two custom resources for Services
     * and Model Resources.
     */
	protected function _initAdminModuleAutoloader() {
            //$this->_logger->info('Bootstrap ' . __METHOD__);
        	$this->_resourceLoader = new Zend_Application_Module_Autoloader(array(
        			'basePath'  => APPLICATION_PATH . '/modules/admin',
        			'namespace' => 'Admin_',
        	)
        	);

//         	$this->_resourceLoader->addResourceTypes(array(
//         	        // DO NOT REMOVE
//         	        'api' => array(
//         	                'path' => 'models/api',
//         	                'namespace' => 'Model_Api')
//         	)
//         	);
        	return $this->_resourceLoader;
    }
//     protected function _initSearchModuleAutoloader() {
//         //$this->_logger->info('Bootstrap ' . __METHOD__);
//         $this->_resourceLoader = new Zend_Application_Module_Autoloader(array(
//                 'basePath'  => APPLICATION_PATH . '/modules/search',
//                 'namespace' => 'Search_',
//         )
//         );
//         //die(__METHOD__);
//         return $this->_resourceLoader;
//         // echo __METHOD__;

//     }
//     protected function _initApplicationSettings()
//     {
//     	/* Usage **
//     	 $test = array('blah' => 'blah');
//     	$settings = new Admin_Settings_Settings($test);
//     	$blah = 'blah';
//     	$settings->__set('test', $blah);
//     	*/
//     	$appSettings = Admin_Model_SettingsGateway::getInstance();
//     	$this->appSettings = $appSettings;
//     	Zend_Registry::set('appSettings', $appSettings);
//     	return $appSettings;
//     	 echo __METHOD__;
//     }

    /**
     * Setup the logging
     */
    protected function _initLogging() {
        // table column mapping array
        $columnMapping = array(
        //'userId' => 'userId',
        //'userName' => 'userName',
        'timeStamp' => 'timeStamp',
        'priorityName' =>'priorityName',
        'priority' => 'priority',
        'message' => 'message');

        $this->bootstrap('frontController');
        $this->_logger = new Zend_Log();
        switch(APPLICATION_ENV) {
            case 'development' :
                $productionFilter = new Zend_Log_Filter_Priority(Zend_Log::DEBUG);
                break;
            case 'production' :
                $productionFilter = new Zend_Log_Filter_Priority(Zend_Log::INFO);
                break;
        }
        switch(APPLICATION_ENV) {
            case 'production' :
                    $writer = new Zend_Log_Writer_Db(Zend_Db_Table_Abstract::getDefaultAdapter(), 'log', $columnMapping);
                    $writer->addFilter($productionFilter);
                break;
            case 'development' :
                    $writer = new Zend_Log_Writer_Firebug();
                break;
        }
        $this->_logger->addWriter($writer);
        Zend_Registry::set('log', $this->_logger);
        // echo __METHOD__;
    }
    protected function _initSession() {
        //if('production' == $this->getEnvironment()) {
	        //$this->_logger->info('Bootstrap ' . __METHOD__);
	        $this->sessionConfig = array(
	        'name'           => 'session',
	        'primary'        => 'id',
	        'modifiedColumn' => 'modified',
	        'dataColumn'     => 'data',
	        'lifetimeColumn' => 'lifetime'
	        );
	        Zend_Session::setOptions(array(
	        							//'cookie_secure' => true, //only if using SSL
	        							//'use_only_cookies' => true,
	        							'gc_maxlifetime' => 15 * 60, // use setting or fall back to 15 minutes
	        							'cookie_httponly' => true
	        							)
	        						);

	        Zend_Session::setSaveHandler(new Zend_Session_SaveHandler_DbTable($this->sessionConfig));
	        Zend_Session::start();
       // }
        //Zend_Session::regenerateId();
	      // echo __METHOD__;
    }

    // Init the Navigation helper - Requires System library
//     protected function _initNavigation() {
//     	/**
//     	 * This will be changing soon to use a module based navigation
//     	 */
// 		// Read navigation XML and initialize container
//         $navconfig = new Zend_Config_Xml(APPLICATION_PATH . '/configs/navigation.xml', 'nav');
//         $container = new Zend_Navigation($navconfig);
//         // Register navigation container
//         $registry = Zend_Registry::getInstance();
//         $registry->set('Zend_Navigation', $container);
//         // Add action helper
//         Zend_Controller_Action_HelperBroker::addHelper(new System_Controller_Action_Helper_Navigation());
//         // echo __METHOD__;
//     }
//     protected function _initAdminNavigation() {
//     	//$this->_logger->info('Bootstrap ' . __METHOD__);
//     	/**
//     	* This will be changing soon to use a module based navigation
//     	*/
//     	// Read navigation XML and initialize container
//     	$adminnavconfig = new Zend_Config_Xml(APPLICATION_PATH . '/configs/navigation.xml', 'adminnav');
//     	$admincontainer = new Zend_Navigation($adminnavconfig);
//     	// Register navigation container
//     	$registry = Zend_Registry::getInstance();
//     	$registry->set('Admin_Navigation', $admincontainer);
//     	// Add action helper
//     	Zend_Controller_Action_HelperBroker::addHelper(new System_Controller_Action_Helper_AdminNavigation());
//     	// echo __METHOD__;
//     }
    protected function _initSubPageNavigation() {
        Zend_Controller_Action_HelperBroker::addHelper(new System_Controller_Action_Helper_SubPageNav());
        // echo __METHOD__;
    }
    protected function _initSearchWidget()
    {
        //Zend_Controller_Action_HelperBroker::addHelper(new Search_Controller_Action_Helper_SearchWidget());
    }
    protected function _initActionHelpers()
    {
    	//$this->_logger->info('Bootstrap ' . __METHOD__);
    	Zend_Controller_Action_HelperBroker::addHelper(new System_Controller_Action_Helper_Context());
    	// echo __METHOD__;
    }
//     protected function _initSkinPaths() {
//     	$paths = new System_Controller_Plugin_SkinPaths();
//     	$front = Zend_Controller_Front::getInstance();
//     	$front->registerPlugin(new System_Controller_Plugin_SkinPaths($paths));
//     	// echo __METHOD__;
//     }
    // Init the pageTitle plugin - Requires the System library and ini namespace
    protected function _initPagetitle() {
        //$this->_logger->info('Bootstrap ' . __METHOD__);
		//TODO: Recode this plugin to allow for modules
        $pageTitle = new System_Controller_Plugin_Pagetitle();
        $front = Zend_Controller_Front::getInstance();
        $front->registerPlugin(new System_Controller_Plugin_Pagetitle($pageTitle));
        // echo __METHOD__;
    }


    protected function _initCurrency() {
		$currency = new Zend_Currency('en_US');
		Zend_Registry::set('Zend_Currency', $currency);
		// echo __METHOD__;
    }
    // Set today's date for an instance of Zend_Date
    protected function _initDebugTime() {
        //$this->_logger->info('Bootstrap ' . __METHOD__);
        // Date may be retrieved from the registry using the today_date key
        //$now = Zend_Date::now();
        //$date = $today->toString('yyyy-MM-dd');
        $date = new Zend_Date();
        $registry = Zend_Registry::getInstance();
        $registry->set('debug_start_time', $date->getTimestamp());

    }
//     protected function _initLicense() {
//         	//$this->_logger->info('Bootstrap ' . __METHOD__);
//         	//TODO: Recode this plugin to allow for modules
//         	$License = new System_Controller_Plugin_License();
//         	$front = Zend_Controller_Front::getInstance();
//         	$front->registerPlugin(new System_Controller_Plugin_License($License));
//     }

}