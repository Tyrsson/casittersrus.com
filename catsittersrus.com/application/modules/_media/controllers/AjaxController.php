<?php

/**
 * AjaxController
 *
 * @author
 * @version
 */

require_once 'Zend/Controller/Action.php';

class Media_AjaxController extends System_Controller_Action
{
    public $data;
    private $overRide = false;
    public function preDispatch()
    {
        switch($this->overRide)
        {
            case true :
                if(!$this->isAjax()) {
                    $helper = $this->getHelper('viewRenderer');
                    $helper->setViewSuffix('ajax.phtml');
                }

                break;
            case false :

                break;
        }
    }
    public function init()
    {
        parent::init();
        $ajaxHelper = $this->getHelper('AjaxContext');
        $ajaxHelper->addActionContext('getimage', 'html')
                   ->addActionContext('subalbums', 'html')
                   ->addActionContext('filepage', 'html')
                   ->addActionContext('recentimages','html')
                   ->initContext();

        $this->albums = new Media_Model_Albums();
        $this->files = new Media_Model_Files();
        if($this->_request->isXmlHttpRequest()) {
            // by default this is an array but we are going to cast it to an object
            $this->data = (object) $this->_request->getParams();
        }
    }



    /**
     * The default action - show the home page
     */
    public function indexAction ()
    {
        // TODO Auto-generated AjaxController::indexAction() default action
    }
    public function getimageAction() {
        if($this->_request->isXmlHttpRequest())
        {
            //$params = $this->_request->getParams();
            $this->view->data = (object) $this->_request->getParams();
            $this->view->appSettings = Zend_Registry::get('appSettings');
        }
    }
    public function subalbumsAction()
    {

    }
    public function filepageAction()
    {

    }
    public function recentimagesAction ()
    {
        $module = 'media';
        $this->view->imgBasePath = '/modules/'.$module.'/images';
        $this->view->thumbBasePath = '/modules/_thumbs/'.ucfirst($module);
    	$files = new Media_Model_Files();
    	$images = $files->fetchRecentImages();
    	$this->view->images = $images;
    	 //$this->view->test = Zend_Debug::dump($images, 'test', false);
    }
}
