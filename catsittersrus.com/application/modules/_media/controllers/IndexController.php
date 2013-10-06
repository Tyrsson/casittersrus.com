<?php
/**
 * MediaController
 *
 * @author
 * @version
 */
require_once 'System/Controller/Action.php';
class Media_IndexController extends System_Controller_Action
{
	public $params;
	public $node = 'media';
	public $childNode = 'images';
	public $albums;
	public $files;
	public $albumId;
	public $albumName;
	public $page;
	public $mainImgPath;
	public $thumbImgPath;
	/* (non-PHPdoc)
	 * @see Zend_Controller_Action::preDispatch()
	 */
	public function preDispatch() {
		/* We will only use this if we need to check and setup objects before the route is dispatched
		 * This will be called before the init method below, init is called once the route is dispatched
		 */
		$this->params = $this->_request->getParams();
		//Zend_Debug::dump($this->params);
		$this->albumId = $this->_request->getParam('albumId', '0');
		$this->albumName = $this->_request->getParam('albumName', 'Default');
		$this->page = $this->_request->page;
		//Zend_Debug::dump($this->albumName);

		$this->albums = new Media_Model_Albums();
		$this->files = new Media_Model_Files();
		$this->mainImgPath = '/modules/'.$this->module.'/images/'.$this->albumName;
		$this->thumbImgPath = '/modules/_thumbs/'.ucfirst($this->module).'/'.$this->albumName;

		// we will need these in the view scope for all actions so we assign them here
		$this->view->albumName = $this->albumName;
		$this->albumId = $this->albums->fetchIdByAlbumName($this->albumName);
		$this->view->albumId = $this->albumId;

		$this->view->thumbImgPath = $this->thumbImgPath;
		$this->view->mainImgPath = $this->mainImgPath;
		$this->view->page = $this->page;
		$this->view->mediaUrl = $this->_request->mediaUrl;
	}
	/* (non-PHPdoc)
	 * @see System_Controller_Action::init()
	 */
	public function init() {
		/* Call the System init to setup the correct context
		 * This is called after the predisatch above, but before the actions below
		 *
		 * This and the method above are run for ALL calls to this controller, regardless of the Action to be executed below
		 */
		parent::init();
	}

    /**
     * The default action - show the albums
     */
    public function indexAction ()
    {
    	$this->view->paginator = $this->albums->fetchPage($perPage = 6, $this->page);
    }
    public function filesAction ()
    {
    	try {

    		$this->view->paginator = $this->files->fetchPage(6, $this->page, null, $this->albumName);
    	} catch (Exception $e) {
    		switch(APPLICATION_ENV) {
    			case 'development' :
    				echo $e->getMessage() . ' :: ' . $e->getTraceAsString();
    				break;
    			case 'production' :
    				throw new Zend_Controller_Action_Exception('It appears the resource you are requesting has been been removed or does not exist.', 404);
    				break;
    		}
    	}

    }
    public function subalbumAction ()
    {

    }

    public function testAction() {
		 $data = $this->_request->getParams();
		 $data = (object) $data;
		 $data->basePath = '/modules/media/images/';

        $this->view->data = $data;

    }
}
