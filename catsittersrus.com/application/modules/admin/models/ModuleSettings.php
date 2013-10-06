<?php
/**
 * AppSettings
 *
 * @author Joey Smith
 * @version 0.1
 */
require_once 'Zend/Db/Table/Abstract.php';
class Admin_Model_ModuleSettings extends Zend_Db_Table_Abstract {
	protected $_name = 'modulesettings';
	protected $_primary = 'variable';
	protected $_sequence = false;
	public $moduleName;
	public $form;
	public $labelFilter;
	public $subFormContainerId;

// 	public function init($moduleName = null, $subFormContainerId = null) {
// 		if (null !== $moduleName) {
// 			self::setModuleName ( $moduleName );
// 		}
// 		if($subFormContainerId !== null) {
// 		    $this->setSubFormContainerId($subFormContainerId);
// 		}
// 		self::setForm (null,  $moduleName );
// 		$this->labelFilter = new Zend_Filter_Word_CamelCaseToDash();
// 	}

	public function setModuleName($moduleName) {
		$this->moduleName = $moduleName;
	}
	public function fetch() {
		$query = $this->select ()->from ( $this->_name, array (
		        'moduleName',
				'variable',
				'value',
				'settingType'
		) )->where ( 'moduleName = ?', $this->getModuleName() );
		return $this->fetchAll ( $query );
	}
	public function fetchVar($module, $variable) {
		$query = $this->select ()->from ( $this->_name, array (
				'variable',
				'value'
		) )->where ( 'moduleName = ?', $module )->where ( 'variable = ?', $variable );
		$result = $this->fetchRow ( $query );
		return $result;
	}
	public function setForm($name = null, $id = null) {

		$this->form = new ZendX_JQuery_Form();

		$this->form->setDecorators(
		        array(
		                'FormElements',
		                array(
		                        'HtmlTag',
		                        array(
		                                'tag' => 'dl'
		                        )
		                ),
		                array(
		                        'TabPane',
		                        array(
		                                'jQueryParams' => array(
		                                        'containerId' => $this->getSubFormContainerId (),
		                                        'title' => ucfirst($this->getModuleName())
		                                )
		                        )
		                )
		        ));

	}
	public function getForm() {
		return $this->form;
	}
	public function getFormWithoutValues() {
		$baseElement = 'Zend_Form_Element_';
		foreach ( $this->fetch () as $settingArray ) {
			// construct the class name string
			$elementName = $baseElement . $settingArray->settingType;
			// call the form element class
			$element = new $elementName ( $settingArray->variable );
			$element->setLabel ( $settingArray->variable );
			$element->addFilter ( 'StringTrim' );
			// $element->setValue($settingArray->value);
			if ($settingArray->settingType === 'Textarea') {
				$element->setAttribs ( array (
						'cols' => '40',
						'rows' => '4'
				) );
			}
			$this->form->addElement ( $element );
		}
		$submit = new Zend_Form_Element_Submit ( 'submit' );
		$submit->setLabel ( 'Submit' );
		$this->form->addElement ( $submit );
		return $this->form;
	}
	public function getFormWithValues() {
		$baseElement = 'Zend_Form_Element_';
		foreach ( $this->fetch () as $settingArray ) {
		    //Zend_Debug::dump($settingArray->toArray());
			// construct the class name string
			$elementName = $baseElement . $settingArray->settingType;
			// call the form element class
			$element = new $elementName ( $settingArray->variable );
			$element->setLabel ( ucfirst(str_replace('-', " ", $this->labelFilter->filter($settingArray->variable) ) ) );
			$element->addFilter ( 'StringTrim' );
			$element->setValue ( $settingArray->value );
			if ($settingArray->settingType === 'Textarea') {
				$element->setAttribs ( array (
						'cols' => '40',
						'rows' => '4'
				) );
			}
			$this->form->addElement ( $element );
		}
		$submit = new Zend_Form_Element_Submit ( 'submit' );
		$submit->setLabel ( 'Submit' );
		$this->form->addElement ( $submit );
		return $this->form;
	}
	public function fetchContactInfo($fetchObject = true)
	{
	    $q = $this->select(true)
	       ->where('moduleName = ?', 'contact')
	       ->where('settingType = ?', 'Text');
	    $result = $this->fetchAll($q);
	    if(!$fetchObject) {
	        return $result->toArray();
	    }
	    return $result;
	}
	public function getModuleName() {
	    return $this->moduleName;
	}
}