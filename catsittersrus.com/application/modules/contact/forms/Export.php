<?php
class Contact_Form_Export extends Zend_Form
{
	public function init()
	{
		$this->addElement('Submit', 'Export');
	}
}
