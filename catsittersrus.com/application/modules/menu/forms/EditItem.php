<?php
class Menu_Form_EditItem extends Menu_Form_CreateItem
{
	public function init() {
		parent::init();
		$this->removeElement('createdDate');

		$id = new Zend_Form_Element_Hidden('id');

		$updatedDate = new Zend_Form_Element_Hidden('updatedDate');


		$this->addElements(array($id, $updatedDate));
	}
}