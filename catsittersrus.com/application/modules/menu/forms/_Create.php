<?php
class Menu_Form_Create extends Zend_Form
{
	public function init() {
		$name = new Zend_Form_Element_Text('name');
		$name->setLabel('Menu Name');

		$createdDate = new Zend_Form_Element_Hidden('createdDate');
		$now = Zend_Date::now();
		$createdDate->setValue($now->getTimestamp());


		$isCurrent = new Zend_Form_Element_Checkbox('isCurrent');
		$isCurrent->setLabel('Is this the current menu ?');

		$submit = new Zend_Form_Element_Submit('submit');
		$submit->setLabel('Submit');

		$this->addElements(array($name, $createdDate, $isCurrent, $submit));
	}
}

