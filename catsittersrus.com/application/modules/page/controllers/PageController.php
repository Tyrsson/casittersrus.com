<?php

/**
 * PageController
 *
 * @author
 * @version
 */
require_once 'Zend/Controller/Action.php';

class Page_PageController extends System_Controller_Action
{

    /**
     * The default action - show the home page
     */
    public function indexAction ()
    {
        // TODO Auto-generated PageController::indexAction() default action
        Zend_Debug::dump($this->_request->getParams());
    }
}
