<?php
class Contact_Form_NewsLetterSignup extends Zend_Form {
	public function init() {
		$this->setMethod('post');
		$this->setAction('/contact/newsletter');
		$this->setName('newsletter');
		$this->addElement('Text', 'firstName', array('Label' => 'First Name'));
		$this->addElement('Text', 'lastName', array('Label' => 'Last Name'));
		$this->addElement('Text', 'email', array('Label' => 'Email', 'Required' => true));
		//$this->addElement('Text', 'company', array('Label' => 'Company'));
		$this->addElement('MultiCheckbox', 'type', array('Label' => 'Select the correspondence you would like to recieve below', 'Required' => true, 'multiOptions' => array('newsletter' => 'e-Newsletter', 'offers' => 'Offers and Promotions')) );
		$this->addElement('Submit', 'Submit');
	}
}