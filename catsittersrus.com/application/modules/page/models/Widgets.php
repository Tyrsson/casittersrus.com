<?php

/**
 * Widgets
 *
 * @author jsmith
 * @version
 */

require_once 'Zend/Db/Table/Abstract.php';

class Page_Model_Widgets extends Zend_Db_Table_Abstract {
	/**
	 * The default table name
	 */
	protected $_name = 'pagewidgets';
	protected $_primary = 'id';
	protected $_sequence = true;
	//protected $_rowClass = 'Page_Model_Row_Widget';
	protected $_referenceMap = array(
			'widgets' => array(
					'columns' => array('pageId'),
					'refTableClass' => 'Page_Model_Page',
					'refColumns' => array('pageId'),
					'onDelete' => 'cascade',
					'onUpdate' => 'cascade'
			)
	);

	public function scan()
	{
		$notAllowed = array('admin', 'installer', 'pages', 'storefront');
		$allowed = array();
		$modulePath = APPLICATION_PATH . DIRECTORY_SEPARATOR . 'modules';
		$dir = new DirectoryIterator($modulePath);
		foreach ($dir as $fileinfo) {
    		if (!$fileinfo->isDot() && $fileinfo->isDir()) {
    			$pos = strpos($fileinfo->getFilename(), '_');
    			if($pos === false && !in_array($fileinfo->getFilename(), $notAllowed)) {
    				//Zend_Debug::dump($fileinfo->getFilename());
    				$controllers = new DirectoryIterator($modulePath . DIRECTORY_SEPARATOR . $fileinfo->getFilename() . DIRECTORY_SEPARATOR . 'controllers');
    				foreach($controllers as $controllerInfo) {

    					if(!$controllerInfo->isDot() && !$controllerInfo->isDir()) {
    						//Zend_Debug::dump($controllerInfo->getFilename());
    						if($controllerInfo->getFilename() === 'IndexController.php') {

    							//Zend_Debug::dump($methods);
    							$allowed[$fileinfo->getFilename()] = ucfirst($fileinfo->getFilename());

    						}
    					}

    				}
    			}

    		}
		}
		if(count($allowed) >= 1) {
			return $allowed;
		}
		else {
			return null;
		}
	}


}
