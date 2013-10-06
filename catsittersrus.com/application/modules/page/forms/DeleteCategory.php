<?php
class Page_Form_DeleteCategory extends Page_Form_CreateAlbum
{
    public function init() {

        $pages = new Page_Model_Page();
        
        $album = new Zend_Form_Element_Select('categoryId');
        //self::getUserId();
        $album->setLabel('Select Category to Delete:')
        		->setMultiOptions($albums->fetchUserAlbums(self::getUserId())->toArray())
                ->setRequired(true);
        
        //Create submit button
        $submit = new Zend_Form_Element_Submit('submit');
        $submit->setLabel('Submit')
        ->setOptions(array('class' => 'submit'));
        
        $this->addElement($album )
        	 ->addElement($submit);
    }
    public function getUserId() {
        $auth = Zend_Auth::getInstance();
        if($auth->hasIdentity()) {
            return (int) $auth->getIdentity()->userId;
        } else {
            return null;
        }
    }
}