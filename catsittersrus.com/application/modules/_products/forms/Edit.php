<?php

Class Products_Form_Edit extends Products_Form_Create {

    public function init() {
        parent::init();
        $id = new Zend_Form_Element_Hidden('id');
        $this->addElement($id); 
    }
   public function loadDefaultDecorators() 
   {
       $this->setDecorators(array(
           'FormElements',
           'Fieldset',
           'Form'
       ));
   }

}
