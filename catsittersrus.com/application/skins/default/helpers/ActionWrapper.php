<?php
/**
 *
 * @author Joey
 * @version
 */
require_once 'System/View/Helper/Abstract.php';

/**
 * ActionWrapper helper
 *
 * @uses viewHelper Default_View_Helper
 */
class Default_View_Helper_ActionWrapper extends Zend_View_Helper_HtmlElement
{
    /**
     */
    public $attribs;
    public $tag = 'div';
    public $openingBracket = '<';
    /**
     * The tag closing bracket
     *
     * @var string
     */
    protected $_closingBracket = '>';

    public function actionWrapper ($content = '', array $attribs = array())
    {
        if(array_key_exists('tag', $attribs)) {
            $this->setTag($attribs['tag']);
            unset($attribs['tag']);
        }
        return $this->getOpeningBracket() .
               $this->getTag() .
               $this->_htmlAttribs($attribs) .
               $this->getClosingBracket() .
               $content .
               $this->getOpeningBracket() .
               '/' .
               $this->getTag() .
               $this->getClosingBracket();
    }
    public function getClosingBracket()
    {
        if(!$this->_closingBracket) {
            $this->_closingBracket = '>';
        }
        return $this->_closingBracket;
    }
    /**
     * @return the $attribs
     */
    public function getAttribs ()
    {
        return $this->attribs;
    }

	/**
     * @param field_type $attribs
     */
    public function setAttribs ($attribs)
    {
        $this->attribs = $attribs;
    }

	/**
     * @return the $tag
     */
    public function getTag ()
    {
        return $this->tag;
    }

	/**
     * @param string $tag
     */
    public function setTag ($tag)
    {
        $this->tag = $tag;
    }

	/**
     * @return the $openingBracket
     */
    public function getOpeningBracket ()
    {
        return $this->openingBracket;
    }

	/**
     * @param string $openingBracket
     */
    public function setOpeningBracket ($openingBracket)
    {
        $this->openingBracket = $openingBracket;
    }

	public function isHtml5() {
        // if the doc type is either html5 or Rfda we will still want -> /> closing tags
    }

}
