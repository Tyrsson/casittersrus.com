<?php

Class Products_Form_DoSearch extends Zend_Form {
	
	public function init() {
		
		$this->setMethod('post');
		$searchField = new Zend_Form_Element_Text('term');
		$searchField->setOptions(array('value' => 'Search'));
		$searchField->setAttrib('size' , '30');
		
		$submit = new Zend_Form_Element_Submit('search');
		$submit->setLabel('Go');
		$submit->setAttrib('class', 'submit');
		
		$this->addElement($searchField)->addElement($submit);
	}
}

?>