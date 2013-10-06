<?php
/**
 * ProductsController
 *
 * @author
 * @version
 */
require_once 'System/Controller/AdminAction.php';
class Products_AdminController extends System_Controller_AdminAction
{
	public $prodTable;
	public $prod_id;
	public $prodImgPath;
	public $imgPath;
	public $prodImage;
	public $prodPage;
    public $indexPath;
    public $searchIndexData;

	public function init()
	{
		parent::init();
		//$this->prodImgPath = Zend_Registry::get('productImgPath');
		//$this->imgPath = $_SERVER['DOCUMENT_ROOT'] . $this->prodImgPath;
        $this->indexPath = APPLICATION_PATH . DIRECTORY_SEPARATOR . 'data' . DIRECTORY_SEPARATOR . 'search';

		$this->params = $this->_request->getParams();
		$this->prodTable = new Products_Model_Products();
		$this->prodImage = new Products_Model_ProductImage();
		$this->prodPage  = new Products_Model_Page();

	}
    /**
     * The default action - show the home page
     */
    public function indexAction ()
    {
        $this->view->pageNumber = $this->_request->page;
        $this->view->paginator = $this->prodTable->getOnePage($this->_request->page);
    }
    public function productlistAction()
    {

    }
    public function createAction()
    {
    	$uploadedCount = 0;
    	// create product form
    	$form = new Products_Form_CreateProduct();

    	if($this->_request->isPost()) {
    		if($form->isValid($this->_request->getPost())) {
    			$data = $form->getValues($this->_request->getPost());
    			$result = $this->prodTable->save($data);
    		}
    		if($result > 0) {
    			$this->redirect('/admin/success');
    		}
    	}
    	else {

    	}
    	// assign the form to the view for use
    	$this->view->form = $form;
    }
    public function editAction()
    {
    	// get the id for the product to be edited
        $id = $this->_request->getParam('id');
        // get the form for edit, this form extends the creation form
        $form = new Products_Form_Edit();
        // fetch the product row from the db
        $prod = $this->prodTable->fetch($id);
        // is this post?
        if($this->_request->isPost())
        {
        	// is the form values valid?
            if($form->isValid($this->getRequest()->getPost()))
            {
            	// if valid get the values
                $formData = $form->getValues();
                $validator = new Zend_Validate_Db_NoRecordExists($options = array(
                		'adapter' => Zend_Db_Table::getDefaultAdapter(),
                		'table' => $this->prodTable->getTableName(),
                		'field' => 'ident'
                ));
                // overload the properties
                $prod->ident    	    = $formData['ident'];
                $prod->categoryId       = $formData['categoryId'];
                $prod->description      = $formData['description'];
                $prod->shortDescription = $formData['shortDescription'];
                $prod->name             = $formData['name'];
                $prod->price			= $formData['price'];

//                 if($validator->isValid($formData['ident']))
//                 {

                if(isset($formData['image']))
                {
                	$prod->image = $this->prodImgPath . '/' . $formData['image'];
                }
                if(isset($formData['featured'])) {
                    $prod->featured = $formData['featured'];
                }

                if(isset($formData['slider'])) {
                    $prod->slider = $formData['slider'];
                }

                // save the new data to the db row
                $prodId = $prod->save();
            	if($prodId !== 0)
    	        {
    	        	$this->_helper->getHelper('FlashMessenger')->addMessage('Product edited successfully');
    	            //$this->_redirect('/products/display/' . $prodId);
					$this->_redirect('/admin/products/');
    	        }

                //}
            }
        } else {
        	// if this is not a post populate the form with the requested row data
        	$row = $this->prodTable->fetch($id);
        	if ($row) {
        		$row = $row->toArray();
        	} else {
        		$row = array();
        	}
            $form->populate($row);
        }
        // assign the form to the view for use
        $this->view->form = $form;
    }
    public function deleteAction()
    {
    	$id = $this->_request->getParam('id');
    	$page = $this->_request->getParam('page');
    	if(isset($id))
    	{
    		$row = $this->prodTable->fetch($id);
    		$row->delete();
    		$this->_redirect('/admin/products/'. $page);
    	}
    }

    public function buildsearchAction($return = '/admin')
    {
        $products = $this->prodTable->getAllProducts();
        //echo 'we have our test area';

        //$indexPath = APPLICATION_PATH . DIRECTORY_SEPARATOR . 'data' . DIRECTORY_SEPARATOR . 'search';
        $index = Zend_Search_Lucene::create($this->indexPath);
        foreach($products as $product)
        {
            $index->addDocument(new System_Search($product));
            //echo 'index built';
        }

    }
}
