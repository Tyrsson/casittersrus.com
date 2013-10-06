<?php
/**
 *
 * @author Joey
 * @version
 */
require_once 'Zend/View/Interface.php';

/**
 * Ckfinder helper
 *
 * @uses viewHelper Media_View_Helper
 */
class Default_View_Helper_Ckfinder extends System_View_Helper_Abstract {

	/**
	 *
	 */
	public function ckfinder($readOnly = true) {
		require_once($_SERVER['DOCUMENT_ROOT'] . DIRECTORY_SEPARATOR . 'js-src' . DIRECTORY_SEPARATOR . 'ckfinder' . DIRECTORY_SEPARATOR . 'ckfinder.php');
		$finder = new CKFinder() ;
		$finder->ReadOnly = $readOnly;
		//$finder->BasePath = $_SERVER['DOCUMENT_ROOT'] . DIRECTORY_SEPARATOR . 'js-src' . DIRECTORY_SEPARATOR . 'ckfinder' ;	// The path for the installation of CKFinder (default = "/ckfinder/").
		$finder->BasePath = '/js-src/ckfinder/';
		//$finder->SelectFunction = 'ShowFileInfo' ;
		// The default height is 400.
		$finder->Height = 600;
		$finder->Create() ;
	}

}
