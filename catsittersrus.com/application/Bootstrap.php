<?php
/**
 * @author Joey Smith
 * @version 0.1
 */
class Bootstrap extends Zend_Application_Bootstrap_Bootstrap
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
        	//die(__METHOD__);
        	return $this->_resourceLoader;
        	// echo __METHOD__;
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
    protected function _initApplicationSettings()
    {
    	/* Usage **
    	 $test = array('blah' => 'blah');
    	$settings = new Admin_Settings_Settings($test);
    	$blah = 'blah';
    	$settings->__set('test', $blah);
    	*/
    	$appSettings = Admin_Model_SettingsGateway::getInstance();
    	$this->appSettings = $appSettings;
    	Zend_Registry::set('appSettings', $appSettings);
    	return $appSettings;
    	 echo __METHOD__;
    }

    /**
     * Setup the logging
     */
    protected function _initLogging() {
        // table column mapping array
        $columnMapping = array(
        'userId' => 'userId',
        'userName' => 'userName',
        'timeStamp' => 'timeStamp',
        'priorityName' =>'priorityName',
        'priority' => 'priority',
        'message' => 'message');

        $this->bootstrap('frontController');
        $this->_logger = new System_Log();
        switch($this->appSettings->debugMode) {
            case true :
                $productionFilter = new Zend_Log_Filter_Priority(Zend_Log::DEBUG);
                break;
            case false :
                $productionFilter = new Zend_Log_Filter_Priority(Zend_Log::INFO);
                break;
            default:
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
	        							'gc_maxlifetime' => ( isset($this->appSettings->sessionLength) ) ? (int) $this->appSettings->sessionLength : 15 * 60, // use setting or fall back to 15 minutes
	        							'cookie_httponly' => true
	        							)
	        						);

	        Zend_Session::setSaveHandler(new Zend_Session_SaveHandler_DbTable($this->sessionConfig));
	        Zend_Session::start();
       // }
        //Zend_Session::regenerateId();
	      // echo __METHOD__;
    }
    protected function _initSkin() {
        //Zend_Debug::dump($this->getAppNamespace());
        //$this->_logger->info('Bootstrap ' . __METHOD__);

        // make sure these are initialized for use
        $this->bootstrap('layout');
        $this->bootstrap('view');
        //$this->bootstrap('useragent');

        $layout = $this->getResource('layout'); // get the layout object
        $view = $this->getResource('view'); //get the view object
       // $ua = $this->getResource('useragent'); // get the user agent object


        $viewRenderer = new Zend_Controller_Action_Helper_ViewRenderer($view);

        $skin = new Admin_Model_SkinSettings();
        $row = $skin->fetchCurrent();
        
        //Zend_Debug::dump($row->skinName);
        define('SKIN_NAME', $row->skinName);
        $view->skinName = $this->skinName = $row->skinName;
        Zend_Registry::set('skinName', $this->skinName);
        $isDefault = false;

        /*
         * DO NOT MODIFY, WILL BREAK SKIN LOADING !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         */
        $viewRenderer->setViewBasePathSpec(APPLICATION_PATH . '/skins/' . $row->skinName)
        			->setViewScriptPathSpec(':module/:controller/:action.:suffix')
        			->setViewScriptPathNoControllerSpec(':action.:suffix');
        Zend_Controller_Action_HelperBroker::addHelper($viewRenderer);
        $layout->setLayoutPath($viewRenderer->getViewBasePathSpec() . '/layouts');

        //Zend_View::setHelperPath(null);
        $view->addHelperPath('Zend/View/Helper', 'Zend_View_Helper');

        $view->addHelperPath("System/View/Helper/", "System_View_Helper");


        // add the default skins helper path
        $view->addHelperPath(APPLICATION_PATH . '/skins/' . self::DEFAULT_SKIN_NAME . '/helpers', ucfirst(self::DEFAULT_SKIN_NAME).'_View_Helper');

        if(is_dir($viewRenderer->getViewBasePathSpec() . '/' . $this->helpers)) {
        	$this->view->addHelperPath(APPLICATION_PATH . $viewRenderer->getViewBasePathSpec() . '/' . $this->helpers, ucfirst( $row->skinName).'_View_Helper');
        }

        $view->addHelperPath('ZendX/JQuery/View/Helper/', 'ZendX_JQuery_View_Helper');

        defined('SKIN_NAME') || define('SKIN_NAME', $this->skinName);
        // get the requesting device - mobile, desktop
        //$device = $ua->getDevice();

//         if($device instanceof Zend_Http_UserAgent_Mobile) {
//             defined('IS_MOBILE') || define('IS_MOBILE', true);
//             $view->device = $device;
//         } else {
//             defined('IS_MOBILE') || define('IS_MOBILE', false);
//             $view->device = null;
//         }

        if($this->appSettings->enableFbOpenGraph) {
        	$view->doctype('XHTML1_RDFA');
        }
        
        /*
         * Dojo setup Start
         */
        Zend_Dojo::enableView($view);
           
        $view->dojo()
        ->setDjConfigOption('parseOnLoad', true)
        ->setDjConfigOption('ioPublish', true)
        ;
        
        $this->appSettings->useDojoCdn = false;
        
        if(!isset($skinObj->dojoTheme) || empty($skinObj->dojoTheme)) {
            $dojoTheme = 'claro';
            $view->dojo()->addStyleSheetModule('dijit.themes.'.$dojoTheme);
        }
        else {
            $view->dojo()->addStyleSheetModule('dijit.themes.'.$skinObj->dojoTheme);
        }
        
        if(!$this->appSettings->useDojoCdn || !isset($this->appSettings->useDojoCdn) || empty($this->appSettings->useDojoCdn)) {
           // $localLayer = new System_Controller_Plugin_DojoLayer();
            //$front = Zend_Controller_Front::getInstance();
            //$front->registerPlugin(new System_Controller_Plugin_DojoLayer($localLayer));
            
            $view->dojo()->setLocalPath('/lib/dojo/dojo.js');
        }
        elseif(isset($this->appSettings->useDojoCdn) && $this->appSettings->useDojoCdn === true) {
            //
            $view->dojo()->useCdn();
            $view->dojo()->setCdnBase('//ajax.googleapis.com/ajax/libs/dojo/');
            // what about version ?
            if(isset($skinObj->dojoVersion) && !is_bool($skinObj->dojoVersion))
            {
                $view->dojo()->setCdnVersion($skinObj->dojoVersion);
                $view->dojo()->setCdnDojoPath('/lib/dojo/dojo.js');
            }
            else {
                $view->dojo()->setCdnDojoPath(Zend_Dojo::CDN_DOJO_PATH_GOOGLE);
            }
            
        }
        
        if(isset($this->appSettings->debugDojo) && $this->appSettings->debugDojo === true) {
            $view->dojo()
            ->setDjConfigOption('isDebug', true);
        }
//         $view->dojo()
//              ->addLayer('/lib/admin/zendLayer.js')
//              ->addLayer('/lib/admin/app.js')
//              ->addLayer('/lib/aurora/util.js');
        // Do we want to explicitly enable dojo or implicitly 
        // $dojoLoadGlobal - temp var until settings are addded in dev branch and master
        $dojoLoadGlobal = true;
        if(isset($skinObj->loadDojoGlobal) && $skinObj->loadDojoGlobal === true) {
            $view->dojo()->Enable();
        }
        elseif(isset($dojoLoadGlobal)) {
            if($dojoLoadGlobal) {
                $view->dojo()->Enable();
            }
            else {
                $view->dojo()->disable();
            }
        }
        elseif(isset($skinObj->loadDojoGlobal) && $skinObj->loadDojoGlobal === false)
        {
            $view->dojo()->disable();
        }
        
        /*
         * Dojo setup end
         */

        $jquery = $view->jQuery();
        $jquery->useCdn();
        $jquery->setVersion('1.9.1');
        $jquery->useUiCdn();
        $jquery->setUiVersion('1.10.3');
        $jquery->enable();
        $jquery->uiEnable()
        ;



        $viewRenderer->setView($view);
        Zend_Controller_Action_HelperBroker::addHelper($viewRenderer);
        // echo __METHOD__;
    }
    // Init the Navigation helper - Requires System library
    protected function _initNavigation() {
    	/**
    	 * This will be changing soon to use a module based navigation
    	 */
		// Read navigation XML and initialize container
        $navconfig = new Zend_Config_Xml(APPLICATION_PATH . '/configs/navigation.xml', 'nav');
        $container = new Zend_Navigation($navconfig);
        // Register navigation container
        $registry = Zend_Registry::getInstance();
        $registry->set('Zend_Navigation', $container);
        // Add action helper
        Zend_Controller_Action_HelperBroker::addHelper(new System_Controller_Action_Helper_Navigation());
        // echo __METHOD__;
    }
    protected function _initAdminNavigation() {
    	//$this->_logger->info('Bootstrap ' . __METHOD__);
    	/**
    	* This will be changing soon to use a module based navigation
    	*/
    	// Read navigation XML and initialize container
    	$adminnavconfig = new Zend_Config_Xml(APPLICATION_PATH . '/configs/navigation.xml', 'adminnav');
    	$admincontainer = new Zend_Navigation($adminnavconfig);
    	// Register navigation container
    	$registry = Zend_Registry::getInstance();
    	$registry->set('Admin_Navigation', $admincontainer);
    	// Add action helper
    	Zend_Controller_Action_HelperBroker::addHelper(new System_Controller_Action_Helper_AdminNavigation());
    	// echo __METHOD__;
    }
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
    	Zend_Controller_Action_HelperBroker::addHelper(new System_Controller_Action_Helper_JsonParams());
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

    /**
     * Setup locale
     */
    protected function _initLocale() {
        //$this->_logger->info('Bootstrap ' . __METHOD__);
    	$this->locale = new Zend_Locale('en_US');
        Zend_Registry::set('Zend_Locale', $this->locale);
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