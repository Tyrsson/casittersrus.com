<?php

Class Products_Form_CreateProduct extends Zend_Form {

    //public $appSettings;
    public function init() {

    	$appSettings = Zend_Registry::get('appSettings');
    	$basePath = $_SERVER['DOCUMENT_ROOT'] . DIRECTORY_SEPARATOR . $appSettings->productImgPath . DIRECTORY_SEPARATOR;
    	$thumbPath = $basePath . DIRECTORY_SEPARATOR . 'thumbs';
    	$imagePath = $basePath . DIRECTORY_SEPARATOR . 'images';
    	$iconPath = $basePath . DIRECTORY_SEPARATOR . 'icons';
    	//$headerPath = $basePath . DIRECTORY_SEPARATOR . 'headers';

    	//1
    	$cats = new Products_Model_Categories();

        $prodName = new Zend_Form_Element_Text('name');
        // create text input for name
        $prodName->setLabel('Product Name:')
        		 ->setRequired(true)
        		 ->addFilter('StringTrim');

        $price = new Zend_Form_Element_Text('price');
        // create text input for name
        $price->setLabel('Price:')
              ->addFilter('StringTrim');
// Product category
    	$prodCat = new Zend_Form_Element_Select('categoryId');
        $prodCat->setLabel('Product Category:')->setMultiOptions($cats->fetchDropDown()->toArray());

// Featured Product?
        $featured = new Zend_Form_Element_Checkbox('featured');
        $featured->setLabel('Featured Product:');

// Product Slider?
        $slider = new Zend_Form_Element_Checkbox('slider');
        $slider->setLabel('Product Slider:');

// File upload
        $file = new System_Form_Element_Thumbnail('image');
        $file->setLabel('Upload a file (max width for images is 400px):')
                //The following must be set to a valid writable path
                ->setDestination( $imagePath );

// Ensure only 1 file
        $file->addValidator('Count', false, 1);
// Limit to 100K
        $file->addValidator('Size', false, 2097152);
// Allow only ext's in the list
        $file->addValidator('Extension', false, 'jpg,png,gif,bmp,tiff');
// End file upload

         // create text input for message body
        $description = new Zend_Form_Element_Text('shortDescription');
        $description->setLabel('Description:')
                  ->setOptions(array('size' => '50'))
                  ->addFilter('StringTrim');

        $body = new Zend_Form_Element_Textarea('description');
        $body->setLabel('Product Page Text:')
        ->addFilter('StringTrim');


        $this->addElement('hash', 'csrf', array('salt' => 'unique'));

        $this->addElement($prodName)
             ->addElement($price)
             ->addElement($prodCat)
             ->addElement($featured)
             ->addElement($slider)
        	 ->addElement($file)
        	 ->addElement($description)
        	 ->addElement($body);
    }
   public function loadDefaultDecorators()
   {
       $this->setDecorators(array(
           'FormElements',
           'Fieldset',
           'Form'
       ));
   }

}