<?php
class Menu_Form_CreateItem extends Zend_Form
{
	public function init() {

		$menu = new Menu_Model_Menu();
		$cats = new Menu_Model_Category();
		$menuItems = new Menu_Model_MenuItems();
		//Zend_Debug::dump($menuItems->getMetaData());

		$menuId = new Zend_Form_Element_Hidden('menuId');
		$name = new Zend_Form_Element_Text('name');
		$name->setLabel('Item Name');

		$shortDescription = new Zend_Form_Element_Text('shortDescription');
		$shortDescription->setLabel('Short Description');

		$content = new Zend_Form_Element_Textarea('content');
		$content->setLabel('Full Description');

		$price = new Zend_Form_Element_Text('price');
		$price->setLabel('Price (must be XXX.XX format)');

		$category = new Zend_Form_Element_Select('categoryId');
		$category->setMultiOptions($cats->fetchDropDown('name'));
		$category->setLabel('Category');

		$availability = new Zend_Form_Element_Select('availability');
		$availability->setLabel('Availability');
		$availability->setMultiOptions($menuItems->getMetaData('availability'));

		$isActive = new Zend_Form_Element_Checkbox('isActive');
		$isActive->setLabel('Is this an active item?');

		$isSpecial = new Zend_Form_Element_Checkbox('isSpecial');
		$isSpecial->setLabel('Is this a daily special?');

		$image = new Zend_Form_Element_File('image');
		$image->setOptions(array('thumbNamePrefix' => 'thumb_'));
		$image->setLabel('Upload an image:');
		$image->setDestination($_SERVER['DOCUMENT_ROOT'] . '/modules/menu/items');

		$image->addValidator('Count', false, 1);
		$image->addValidator('Size', false, 2097152);
		$image->addValidator('Extension', false, 'jpg,png,gif');

		$createdDate = new Zend_Form_Element_Hidden('createdDate');
		$now = Zend_Date::now();
		$createdDate->setValue($now->getTimestamp());


		$this->addElements(array($name, $shortDescription, $content, $price, $category, $menuId, $availability, $isActive, $isSpecial, $image, $createdDate));
	}
}
