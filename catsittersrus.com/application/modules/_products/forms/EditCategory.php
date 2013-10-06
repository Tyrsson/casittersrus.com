<?php

class Products_Form_EditCategory Extends Products_Form_CreateCategory
{
	public function init() {
	    parent::init();
	    $id = new Zend_Form_Element_Hidden('id');
	    $this->addElement($id);
    }
    public function loadDefaultDecorators()
    {
        $this->setDecorators(array(
        'FormElements',
        'Form'
        ));
    }
}
