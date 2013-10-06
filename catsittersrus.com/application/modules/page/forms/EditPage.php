<?php
class Page_Form_EditPage extends Page_Form_CreatePage
{
    public function init() {
        parent::init();
        $userId = new Zend_Form_Element_Hidden('userId');
        $pageId = new Zend_Form_Element_Hidden('pageId');
        //$this->addElements(array($pageId, $userId));
    }
}