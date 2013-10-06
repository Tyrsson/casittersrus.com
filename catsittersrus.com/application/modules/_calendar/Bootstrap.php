<?php
/**
 * @author Joey Smith
 * @version 0.9.1
 * @package System
 */
require_once ('System/Application/Module/Bootstrap.php');
class Calendar_Bootstrap extends System_Application_Module_Bootstrap
{
	/*
	 * @var boolean flag to include front end navigation to be overridden in class childern
	*/
	protected $hasFrontEndNav = false;
	/*
	 * @var boolean flag to include admin navigation to be overridden in class childern
	*/
	protected $hasAdminNav = false;
	protected function _initTest()
	{
	    echo __CLASS__ . "<br />";
	}

}