<?php
/**
 *
 * @author Joey
 * @version 
 */
require_once 'Zend/View/Interface.php';
/**
 * StyleSheet helper
 *
 * @uses viewHelper Zend_View_Helper
 */
class Products_View_Helper_FormHash extends Zend_View_Helper_Abstract
{
    /**
     * @var Zend_View_Interface 
     */
    public $view;
    /**
     * 
     */
    public function formHash($spec, $options = null)
    {
    	return new Zend_Form_Element_Hash($spec, $options = null);
    }
    /**
     * Sets the view field 
     * @param $view Zend_View_Interface
     */
    public function setView (Zend_View_Interface $view)
    {
        $this->view = $view;
    }
}
