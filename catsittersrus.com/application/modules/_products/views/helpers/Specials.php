<?php

/**
 * @author Joey
 * @version
 */
require_once 'Zend/View/Interface.php';

/**
 * StyleSheet helper
 * @uses viewHelper Zend_View_Helper
 */
class Products_View_Helper_Specials extends Zend_View_Helper_Abstract
{
	/**
	 * @var Zend_View_Interface
	 */
	public $view;

	public function specials()
	{
		$output = "<h3>Specials</h3>\n";

		$this->prodTable = new Products_Model_Products();
		$this->view->featured = $this->prodTable->featured();
		foreach ($this->view->featured as $product) {
			$output .= '<p class="hm-prod-title">' . $product->name . "</p>\n";
			$output .= '<p>' . $product->shortDescription . "</p>\n";
		}
		return $output;
    }

	/**
	 * Sets the view field
	 * @param $view Zend_View_Interface
	 */
	public function setView(Zend_View_Interface $view)
	{
		$this->view = $view;
	}
}
