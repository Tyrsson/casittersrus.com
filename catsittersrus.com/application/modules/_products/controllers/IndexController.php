<?php

/**
 * ProductsController
 *
 * @author
 * @version
 */
require_once 'System/Controller/Action.php';

class Products_IndexController extends System_Controller_Action
{
	/*public $prodTable;
	public $prod_id;
	public $categoryImgPath;
	public $productImgPath;
	public $imgPath;
	public $productImage;
	public $productPage;
	public $cart;
	public $user;
    public $indexPath;
    */
	public $catalog;

    public function preDispatch()
    {
//         $params = $this->_request->getParams();
//         if($params['action'] === 'search')
//         {
//             $this->term = $this->getRequest()->getParam('term');
//             $this->page = $this->getRequest()->getParam('page');
//         }
//         else {
//             $this->term = 'noterm';
//         }
    }

	public function init()
	{
		parent::init();

		$this->catalog = new Storefront_Model_Catalog();
		$this->products = new Products_Model_Products();
		// old code
// 		//$this->cart = new Cart_Model_Cart();
// 		//$this->cat = new Categories_Model_Categories ();
// 		$this->product = new Products_Model_Products ();
// 		$this->productImage = new Products_Model_ProductImage();
// 		$this->productPage  = new Products_Model_ProductPage();
// 		$this->cats = new Products_Model_Categories();
// 		//$this->catLookup = new Products_Model_CatLookup();

// 		if ($this->_request->isPost()) {
// 		    if (isset($this->_request->addtocart)) {
// 		        $qty = $this->_request->count;
// 		        $this->cart->addItem($this->_request->productId, $qty);
// 		    }
// 		}


// 		//$cartItems = $this->cart->getItems();
// 		//$this->view->showCart = true;
// 		//$this->view->itemCount = count($cartItems);

//         $this->indexPath = APPLICATION_PATH . DIRECTORY_SEPARATOR . 'data' . DIRECTORY_SEPARATOR . 'search';
//         //Zend_Debug::dump($this->appSettings);


	}

	/**
	 * The default action - show the home page
	 */
	public function indexAction()
	{
		$this->showCats = false;
		$this->showProducts = false;
		$categoryTable = new Products_Model_Categories();
		$categoryIdent = $this->_request->categoryIdent;
		$page = $this->_request->page;
		$catIds = array();
		switch($categoryIdent) {
			case 'all' :
				$this->categories = $categoryTable->getCategoriesByParentId(0, null, $page);
				if($this->categories instanceof Zend_Paginator && $this->categories->count() > 0) {
					$this->showCats = true;
				}
				break;
			default:
				$this->categories = $categoryTable->fetchChildrenByParentIdent($categoryIdent, $page);
				//Zend_Debug::dump($this->categories);
				if($this->categories instanceof Zend_Paginator && $this->categories->count() > 0) {
					$this->showCats = true;
				}
				$categoryId = $categoryTable->fetchIdByIdent($categoryIdent);



				Zend_Debug::dump($categoryId);

				break;
		}





		$this->view->categories = $this->categories;
		$this->view->showCats = $this->showCats;


	}

	public function categoryAction()
	{





		//$this->view->categories = $this->cat->fetchAll();
		//$this->view->cats = $this->cat->fetchDropDown();

// 		if (isset($this->_request->catId)) {
// 			$catId = $this->_request->catId;
// 			$this->view->cat = $this->cat->fetch($catId);
// 			// $products = $this->product->fetchAllByCat($catId);
// 			// Zend_Debug::dump($this->view->cat);
// 			// Zend_Debug::dump($this->view->cats);
// 			// $this->view->products = $products;
// 		}

// 		// Get the requested page from the request
// 		// If by chance its not set, set a default and start them at page = 1
// 		if (isset($this->_request->page)) {
// 			// $page = $this->_request->page;
// 			// Query the resource object for the reqested page
// 			$paginator = $this->product->getOnePageByCat($this->_request->page, $catId);
// 		}

// 		// The pagination control will need this.
// 		// $this->view->page = $page;
// 		// Assign the paginator to the view for use
// 		$this->view->cat = $this->cat->fetch($catId);
// 		$this->view->paginator = $paginator;

	}

	public function displayAction()
	{
		$id = $this->_request->getParam('id');
		$this->view->product = $this->product->fetch($id);
		$this->view->user = $this->user;
	}

	public function quoteAction()
	{
		$form = new Contact_Form_Contact();

		$items = $this->cart->getItems();
		$this->view->cartItems = $items;
		$body = '';

		if (isset($items) && is_object($items)) {
			foreach ($items as $item) {
				$body .= "\nItem Name: $item->name \n Product id: $item->ident \n Quantity: $item->qty";
			}
		}

		if ($this->getRequest()->isPost()) {
			if ($form->isValid($this->getRequest()->getPost())) {
				$values = $form->getValues();
/*
				// $id = $values['location'];
				// $toEmail = $this->locations->fetchEmail($id);
                $toEmail = $this->contactSettings->sendTo;

				$mail = new Zend_Mail();
				$mail->setBodyText($values['Editor']);

				// $mail->setFrom($values['email'], $values['name']);
                if (!$this->contactSettings->showLocations) {
                	$mail->setFrom($this->contactSettings->sendFrom, $_SERVER['HTTP_HOST']);
                } elseif ($this->contactSettings->showLocations) {
                	$mail->setFrom($values['email'], $values['name']);
                }

				$mail->addTo($toEmail);
				$mail->setSubject('Quote Request');
				$mail->send();
*/
				if ($items) {
					/**
					 * Target directory where PDF files are stored
					 */
					$targetDir = $_SERVER['DOCUMENT_ROOT'] . $this->productOrdersPath . DIRECTORY_SEPARATOR . $this->user->userId;
					if (!is_dir($targetDir)) {
						if (mkdir($targetDir)) {
							die('Error: could not create directory: ' . $targetDir); /* FIXME */
						} else {
							chmod($targetDir, 0777);
						}
					}

					$pdf = new Zend_Pdf();

					$page = $pdf->newPage(Zend_Pdf_Page::SIZE_A4);
					$pdf->pages[] = $page;

					/**
					 * Number of items per page. Note: first page will list 40 items only.
					 */
					$numItemsPerPage = 50;

					/**
					 * Coordinates to top left corner of PDF page (units)
					 */
					$left = 55;
					$top  = 787;

					if (count($items) <= 40) {	// number of items per first page
						$numPages = 1;
					} else {
						$numPages = 1 + ceil((count($items) - 40) / $numItemsPerPage);
					}

					$page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA), 8);
					$page->drawText('Page 1 of ' . $numPages, 277, 34);

					$x = $left;
					$y = $top;

					$page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA_BOLD), 10);
					$page->drawText('Order Date', $x, $y);
					$page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA), 10);
					$date = new Zend_Date();
					Zend_Date::setOptions(array('format_type' => 'php'));
					$page->drawText($date->get('F j, Y, g:i a'), $x + 144, $y);
					$y -= 21;

					$page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA_BOLD), 10);
					$page->drawText('User ID', $x, $y);
					$page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA), 10);
					$page->drawText($this->user->userId, $x + 144, $y);
					$y -= 21;

					$page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA_BOLD), 10);
					$page->drawText('User Name', $x, $y);
					$page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA), 10);
					$page->drawText(trim($this->user->firstName . ' ' . $this->user->lastName), $x + 144, $y);
					$y -= 21;

					$page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA_BOLD), 10);
					$page->drawText('User Email', $x, $y);
					$page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA), 10);
					$page->drawText($this->user->email, $x + 144, $y);
					$y = 643;

					$page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA_BOLD), 10);
					$page->drawText('Item Name', $x, $y);
					$page->drawText('Product ID', $x + 322, $y);
					$page->drawText('Quantity', $x + 411, $y);
					$y -= 21;

					$page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA), 10);

					/**
					 * Number of items printed per page during iteration
					 */
					$numItemsPrinted = 0;

					foreach ($items as $item) {
						$page->drawText($item->name, $x, $y);
						$page->drawText($item->ident, $x + 322, $y);
						$page->drawText($item->qty, $x + 411, $y);
						$y -= 13;

						$numItemsPrinted++;

						if ($numItemsPrinted >= 40) {	// number of items per first page
							if (count($pdf->pages) > 1) {
								if ($numItemsPrinted < $numItemsPerPage) {
									continue;
								}
							}

							$page = $pdf->newPage(Zend_Pdf_Page::SIZE_A4);
							$pdf->pages[] = $page;

							$page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA), 8);
							$page->drawText('Page ' . count($pdf->pages) . ' of ' . $numPages, 277, 34);

							$x = $left;
							$y = $top;

							$page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA_BOLD), 10);
							$page->drawText('Item Name', $x, $y);
							$page->drawText('Product ID', $x + 322, $y);
							$page->drawText('Quantity', $x + 411, $y);
							$y -= 21;

							$page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA), 10);

							$numItemsPrinted = 0;
						}
					}

					/**
					 * Target name of the PDF file
					 */
					$fileName = $targetDir . DIRECTORY_SEPARATOR . 'order-' . $date->get('Y-m-d-H-i') . '.pdf';

					$pdf->save($fileName);

					$mail = new Zend_Mail();

					$mail->setBodyText($values['Editor']);

					$mail->setFrom('noreply@amlight.dirextion.net', 'American Lighting');
					/*if (!$this->contactSettings->showLocations) {
						$mail->setFrom($this->contactSettings->sendFrom, $_SERVER['HTTP_HOST']);
					} elseif ($this->contactSettings->showLocations) {
						$mail->setFrom($values['email'], $values['name']);
					}*/

					$mail->addTo($this->contactSettings->sendTo);
					$mail->setSubject('Quote Request');

					$at = new Zend_Mime_Part($pdf->render());

					$at->type        = 'application/pdf';
					$at->disposition = Zend_Mime::DISPOSITION_INLINE;
					$at->encoding    = Zend_Mime::ENCODING_BASE64;
					$at->filename    = basename($fileName);

					$mail->addAttachment($at);

					$mail->send();
				}

				$this->_helper->getHelper('FlashMessenger')->addMessage('Thank you. Your message was successfully sent.');
				$this->_redirect('/contact/success');
			}
		} else {
			$form->populate(
				$values = array(
					'email'  => $this->isLogged ? $this->user->email : '',
					'Editor' => isset($body) ? $body : '',
					'name'   => $this->isLogged ? trim($this->user->firstName . ' ' . $this->user->lastName) : ''
				)
			);
		}

		$this->view->form = $form;
	}

	public function removeitemAction()
	{
		if (isset($this->_request->itemId)) {
			$this->cart->removeItem((int)$this->_request->itemId);
			$this->_redirect('/cart/details');
		}

		$this->_redirect('/');
	}

    public function dosearchAction () {
    	$this->_helper->layout->disableLayout();
    	$this->_helper->viewRenderer->setNoRender();
        $formValues = $this->getRequest()->getPost();

        if($formValues['term'] != ""){
            if(isset($formValues['title-asc'])){
                $this->_redirect('/products/search/' . $formValues['term'] . '/1/title/asc');
            }elseif(isset($formValues['title-desc'])){
                $this->_redirect('/products/search/' . $formValues['term'] . '/1/title/desc');
            }elseif(isset($formValues['date-asc'])){
                $this->_redirect('/products/search/' . $formValues['term'] . '/1/published/asc');
            }elseif(isset($formValues['date-desc'])){
                $this->_redirect('/products/search/' . $formValues['term'] . '/1/published/desc');
            }
            else{
                $this->_redirect('/products/search/' . $formValues['term'] . '/1');
            }
        }
    }

	public function searchAction()
    {
		$this->view->categories = $this->cat->fetchAll();
		$this->view->cats = $this->cat->fetchDropDown();

        if($this->term && $this->term !== '')
        {
            $index = Zend_Search_Lucene::open($this->indexPath);
            $type = 'title';//$this->getRequest()->getParam('type');
            $sort = 'asc';//$this->getRequest()->getParam('sort');
            //Zend_Debug::dump($type);
            //Zend_Debug::dump($sort);
            if($type == 'title') {
                //Zend_Debug::dump($type);
                if($sort == 'asc') {
                    $hits = $index->find( $this->term, $type, SORT_STRING, SORT_ASC);
                    $this->view->titleOrder = 'title-desc';
                }
                else {
                    $hits = $index->find( $this->term, $type, SORT_STRING, SORT_DESC);
                    $this->view->titleOrder = 'title-asc';
                }
            }
            elseif($type == 'published') {
                //Zend_Debug::dump($type);
                if($sort == 'asc') {
                    $hits = $index->find( $this->term, $type, SORT_STRING, SORT_ASC);
                    $this->view->dateOrder = 'published-desc';
                }
                else {
                    $hits = $index->find( $this->term, $type, SORT_STRING, SORT_DESC);
                    $this->view->dateOrder = 'published-asc';
                }
            }
            else{
                $hits = $index->find($this->term);
            }
            //$hits = $index->find( $this->term, 'title', SORT_STRING, SORT_DESC);
            //$hits = $index->find('title:'. $term . '+content:'. $term . '+published:' . $term);
            if(count($hits) > 0) {
                $this->view->numHits = count($hits);
                foreach ($hits as $i => $hit) {
                    $resultsArray[$i] = new stdClass();
                    $doc = $hit->getDocument();
                    foreach($doc->getFieldNames() as $field) {
                        $resultsArray[$i]->{$field} = $hit->{$field};
                    }
                }
                //Zend_Debug::dump($resultsArray);
                $paginator = Zend_Paginator::factory($resultsArray);
                $paginator->setItemCountPerPage(9);
                $paginator->setCurrentPageNumber($this->page);
                $this->view->paginator = $paginator;
            }
            else {
                $this->view->error = 'Your search did not match any content on file. Please make sure all words are spelled correctly,
                try different keywords, or enter a name from a prior story.';
            }
            $this->view->page = $this->page;
            $this->view->term = $this->term;
        }
    }

	public function downloadAction()
	{
    	if(!$this->isLogged) {
    		$this->messenger->addMessage('Please login to view your account summary!');
    		$this->_redirect('/user/login');
    	} else {
			$filename = $this->_request->getParam('filename');

			$targetFilename = $_SERVER['DOCUMENT_ROOT'] . $this->productOrdersPath . DIRECTORY_SEPARATOR . $this->user->userId . DIRECTORY_SEPARATOR . $filename;
			if (is_readable($targetFilename)) {
				$this->_sendFile($targetFilename, 'attachment');
				exit;
			}
		}
	}

	public function readAction()
	{
    	if(!$this->isLogged) {
    		$this->messenger->addMessage('Please login to view your account summary!');
    		$this->_redirect('/user/login');
    	} else {
			$filename = $this->_request->getParam('filename');

			$targetFilename = $_SERVER['DOCUMENT_ROOT'] . $this->productOrdersPath . DIRECTORY_SEPARATOR . $this->user->userId . DIRECTORY_SEPARATOR . $filename;
			if (is_readable($targetFilename)) {
				$this->_sendFile($targetFilename, 'inline');
				exit;
			}
		}
	}

	protected function _sendFile($filename, $contentDisposition)
	{
		$response = $this->getResponse();

		$response->setHttpResponseCode(200);
		$response->setHeader('Content-Type', 'application/pdf', true);
		$response->setHeader('Content-Disposition', $contentDisposition . '; filename="' . basename($filename) . '"', true);
		$response->setHeader('Last-Modified', gmdate('r', filemtime($filename)), true);
		$response->setHeader('Content-Length', filesize($filename), true);
		$response->sendHeaders();

		readfile($filename);
	}
}
