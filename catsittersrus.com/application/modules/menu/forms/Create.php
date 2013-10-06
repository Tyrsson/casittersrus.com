<?php
class Menu_Form_Create extends Zend_Dojo_Form
{
	public function init() {
	    
	    $date = new Zend_Date();
	    $today = $date->toString('MM/dd/yyyy');
	    
	    //$this->setAction('/admin/menu/create');
	    
	    $this->setAttribs(array(
	            
	            'legend' => 'Menu Fields'
	    ));
	    
	    // This sets the decorator so that we can show this form in a tab and allows it to be closable
        $this->setDecorators(
                array(
                        'FormElements',
                        array(
                                'HtmlTag',
                                array(
                                        'tag' => 'dl'
                                )
                        ),
                        array( 
                              'decorator' => 'ContentPane',
                              'options' => array(
                                            'closable' => true
                              )
                        )
                )
        );
	     
        $id = new Zend_Form_Element_Hidden('id');
	    
		$name = new Zend_Dojo_Form_Element_TextBox('name');
		$name->setLabel('Menu Name');

		$isCurrent = new Zend_Dojo_Form_Element_CheckBox('isCurrent');
		$isCurrent->setLabel('Is this the current menu ?');
	
		
		$this->addElements(array($id, $name, $isCurrent));
		
	}
}

