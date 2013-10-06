<?php
class Page_Form_MobileNavigation extends Zend_Form
{
	public function init() {
		$this->setMethod('post');
		$model = new Page_Model_Page();
		//$pages = $model->fetchMobileNavigation();

		$this->setName('navigation');

		$select = new Zend_Form_Element_Select('pageUrl');
		//$select->setLabel('Navigation');
		$select->setAttrib('onchange', 'submit()');
		$select->setMultiOptions($model->fetchMobileNavigation());

		$this->addElements(array($select));
	}
}