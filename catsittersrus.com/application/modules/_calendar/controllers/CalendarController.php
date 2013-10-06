<?php

/**
 * Calendar_CalendarController
 * 
 * @author
 * @version 
 */

require_once 'System/Controller/Action.php';

class Calendar_CalendarController extends System_Controller_Action
{
    public function init()
    {
        parent::init();
    }
    /**
     * The default action - show the home page
     */
    public function indexAction ()
    {
        echo new Calendar_Form_CreateCalendar();
    }
    public function dayAction()
    {
        
    }
    public function eventAction()
    {
        
    }
}
