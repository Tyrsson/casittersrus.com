<?php
/**
 * Aurora CMS
 *
 * LICENSE
 *
 * @category   Zend
 * @package    Zend_Dojo
 * @subpackage View
 * @copyright  Copyright (c) 2011-2013 Webinertia
 * @license    http://webinertia.net/license.txt
 * @version    1.0
 */

/** Zend_Dojo_View_Helper_DijitContainer */
require_once 'Zend/Dojo/View/Helper/DijitContainer.php';

/**
 * Dojo AccordionContainer dijit
 *
 * @uses       Zend_Dojo_View_Helper_DijitContainer
 * @package    Zend_Dojo
 * @subpackage View
 * @copyright  Copyright (c) 2011-2013 Webinertia
 * @license    http://webinertia.net/license.txt
  */
class Zend_Dojo_View_Helper_AccordionContainer extends Zend_Dojo_View_Helper_DijitContainer
{
    /**
     * Dijit being used
     * @var string
     */
    protected $_dijit  = 'dijit/layout/AccordionContainer';

    /**
     * Dojo module to use
     * @var string
     */
    protected $_module = 'dijit/layout/AccordionContainer';

    /**
     * dijit.layout.AccordionContainer
     *
     * @param  string $id
     * @param  string $content
     * @param  array $params  Parameters to use for dijit creation
     * @param  array $attribs HTML attributes
     * @return string
     */
    public function accordionContainer($id = null, $content = '', array $params = array(), array $attribs = array())
    {
        if (0 === func_num_args()) {
            return $this;
        }

        return $this->_createLayoutContainer($id, $content, $params, $attribs);
    }
}
