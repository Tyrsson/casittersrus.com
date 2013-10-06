<?php
require_once ('Zend/Application/Module/Bootstrap.php');
class Installer_Bootstrap extends System_Application_Module_Bootstrap
{
	protected $hasFrontEndNav = false;
	protected $hasAdminNav = true;
}