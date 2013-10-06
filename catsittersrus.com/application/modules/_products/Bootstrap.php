<?php
require_once ('System/Application/Module/Bootstrap.php');
class Products_Bootstrap extends System_Application_Module_Bootstrap
{
	/*
	 * @var boolean flag to include front end navigation to be overridden in class childern
	*/
	protected $hasFrontEndNav = true;
	/*
	 * @var boolean flag to include admin navigation to be overridden in class childern
	*/
	protected $hasAdminNav = true;
    protected function _initImagePaths()
    {
//     		$this->options = $this->getOptions();
//     		//Zend_Debug::dump($this->options, 'boostrap');
//     		Zend_Registry::set('categoryImgPath', $this->options['categoryImgPath']);
//     		Zend_Registry::set('productImgPath', $this->options['productImgPath']);
//     		Zend_Registry::set('productOrdersPath', $this->options['productOrdersPath']);
//     		Zend_Registry::set('maxImageWidth', $this->options['maxImageWidth']);
    }
}

