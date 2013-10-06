<?php
class Menu_Form_EditCategory extends Menu_Form_CreateCategory
{
	public function init() {
		parent::init();
		$this->removeElement('createdDate');

		$id = new Zend_Form_Element_Hidden('id');

		$updatedDate = new Zend_Form_Element_Hidden('updatedDate');


		$this->addElements(array($id, $updatedDate));
	}
}