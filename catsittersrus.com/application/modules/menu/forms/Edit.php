<?php
class Menu_Form_Edit extends Menu_Form_Create
{
	public function init() {
		parent::init();
		$this->removeElement('createdDate');

		$updatedDate = new Zend_Form_Element_Hidden('updatedDate');

		$this->addElement($updatedDate);
	}
}