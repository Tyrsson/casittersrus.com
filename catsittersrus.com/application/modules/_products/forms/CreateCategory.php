<?php

class Products_Form_CreateCategory Extends Zend_Form
{
	public function init() {

		$appSettings = Zend_Registry::get('appSettings');
    	$basePath = $_SERVER['DOCUMENT_ROOT'] . DIRECTORY_SEPARATOR . $appSettings->categoryImgPath . DIRECTORY_SEPARATOR;
    	$thumbPath = $basePath . DIRECTORY_SEPARATOR . 'thumbs';
    	$imagePath = $basePath . DIRECTORY_SEPARATOR . 'images';
    	$iconPath = $basePath . DIRECTORY_SEPARATOR . 'icons';
    	$headerPath = $basePath . DIRECTORY_SEPARATOR . 'headers';

    	//1
    	$cats = new Products_Model_Categories();

//     	$catIdent = new Zend_Form_Element_Text('ident');
//         // create text input for name
//         $catIdent->setLabel('Category Identifer:')
//                 //->setOptions(array('size' => '30'))
//                   //->setRequired(true)
//                   //->addValidator('NotEmpty', true)
//                   //->setOptions(array('class' => 'input'))
//                   //->addValidator('Alnum', 'allowWhiteSpace', true)
//                   //->addFilter('HtmlEntities')
//                   ->addFilter('StringTrim');

        $menuText = new Zend_Form_Element_Text('menuText');
        // create text input for name
        $menuText->setLabel('Menu Text (Text to show in navigation)')
        //->setOptions(array('size' => '30'))
        //->setRequired(true)
        //->addValidator('NotEmpty', true)
        //->setOptions(array('class' => 'input'))
        //->addValidator('Alnum', 'allowWhiteSpace', true)
        //->addFilter('HtmlEntities')
        ->addFilter('StringTrim');

        $icon = new Zend_Form_Element_File('categoryIcon');
        $icon->setLabel('Category Icon (will not be resized)')
        //The following must be set to a valid writable path
        ->setDestination($iconPath);
        // Ensure only 1 file
        $icon->addValidator('Count', false, 1);
        // Limit to 100K
        $icon->addValidator('Size', false, 2097152);
        // Allow only ext's in the list
        $icon->addValidator('Extension', false, 'jpg,png,gif');

    	$imageWithThumb = new System_Form_Element_Thumbnail('categoryThumbnail');
    	$imageWithThumb->setLabel('Upload a Image (thumbnail will be auto created)')
    	//The following must be set to a valid writable path
    	->setDestination($imagePath);
    	$imageWithThumb->addValidator('Count', false, 1);
    	// Limit to 100K
    	$imageWithThumb->addValidator('Size', false, 2097152);
    	// Allow only ext's in the list
    	$imageWithThumb->addValidator('Extension', false, 'jpg,png,gif');

    	$headerImage = new Zend_Form_Element_File('headerImage');
    	$headerImage->setLabel('Header Image to use for Category page')
    	//The following must be set to a valid writable path
    	->setDestination($headerPath);
    	$headerImage->addValidator('Count', false, 1);
    	// Limit to 100K
    	$headerImage->addValidator('Size', false, 2097152);
    	// Allow only ext's in the list
    	$headerImage->addValidator('Extension', false, 'jpg,png,gif');

        $catName = new Zend_Form_Element_Text('name');
        // create text input for name
        $catName->setLabel('Category Name')
        //->setOptions(array('size' => '30'))
        ->setRequired(true)
        ->addValidator('NotEmpty', true)
        ->setOptions(array('class' => 'input'))
        //->addValidator('Alpha', 'allowWhiteSpace', true)
        //->addFilter('HtmlEntities')
        ->addFilter('StringTrim');

        $shortDesc = new Zend_Form_Element_Textarea('shortDesc');
        $shortDesc->setLabel('Short Description');
        $shortDesc->setOptions(array('cols' => 90, 'rows' => 2));

        $content = new Zend_Form_Element_Textarea('content');
        $content->setLabel('Category Text content');

        $parentCat = new Zend_Form_Element_Select('parentId');
        $options = array(0 => '--');
        $parentCat->setLabel('Parent Category')->setMultiOptions(array_merge($options, $cats->fetchDropDown()->toArray() ));

//         $submit = new Zend_Form_Element_Submit('submit');
//         $submit->setLabel('Submit');

        $this->addElements(array($catName,  $menuText, $parentCat, $icon, $imageWithThumb, $headerImage, $shortDesc, $content));

    }
    public function loadDefaultDecorators()
    {
        $this->setDecorators(array(
        'FormElements',

        'Form'
        ));
    }
}
