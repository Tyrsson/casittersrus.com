<?php
class Calendar_Form_CreateCalendar extends System_Form_Default
{
    public function init($jscript = null)
    {
        parent::init($jscript);
        
        parent::addSubmit();
    }
}