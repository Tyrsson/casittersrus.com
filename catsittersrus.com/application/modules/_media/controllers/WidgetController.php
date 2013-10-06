<?php

/**
 * WidgetController
 *
 * @author
 * @version
 */

require_once 'Zend/Controller/Action.php';

class Media_WidgetController extends System_Controller_Action {

	public $table;
	public function init()
	{
		parent::init();
	}
	public function indexAction() {
		// TODO Auto-generated WidgetController::indexAction() default action
	}
	public function recentAction()
	{
		$params = $this->_request->getParams();
		/*
		 * This param must be set in the request if this widget is to return data
		 */
		if(isset($params['mediaType'])) {
			switch($params['mediaType']) {
				case 'images' :
					$module = 'media';
					$this->view->imgBasePath = '/modules/'.$module.'/images';
					$this->view->thumbBasePath = '/modules/_thumbs/'.ucfirst($module);
					$files = new Media_Model_Files();
					$this->paginator = new Zend_Paginator( new Zend_Paginator_Adapter_Iterator( $files->fetchRecentImages() ));
					//Zend_Debug::dump($this->paginator);
					//This should make sure we always show all of the results in a single page
					$total = $this->paginator->count();
					$this->paginator->setItemCountPerPage(isset($this->appSettings->showRecentCount) ? $this->appSettings->showRecentCount : 4);
					$this->view->paginator = $this->paginator;
					//$this->view->images = $images;
					break;
				case 'albums' :

					break;
			}
		}
		else {
			return;
		}

	}
	public function sliderAction()
	{
		$settings = new Media_Model_SliderSettings();
		$this->view->sliderSettings = $settings->fetchSettings();
		$images = new Media_Model_Files();
		$this->view->images = $images->fetchAllByAlbumName($albumName = 'Slider');

	}

}
