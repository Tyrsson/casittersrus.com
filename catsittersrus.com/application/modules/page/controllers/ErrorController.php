<?php

class Page_ErrorController extends System_Controller_Action
{
    const SERVICE_UNAVAILABLE = 'Service Temporarily Unavailable';
    public $logError = '';
    public $codeClass = 'ui-error-page error-';
    public function init() {
        parent::init();
        //$this->_helper->viewRenderer->setNoRender(true);
    }
    public function errorAction()
    {
        $errors = $this->_getParam('error_handler');

        if (!$errors || !$errors instanceof ArrayObject) {
            $this->view->message = 'You have reached the error page';
            return;
        }

        switch ($errors->type) {
            case Zend_Controller_Plugin_ErrorHandler::EXCEPTION_NO_ROUTE:
            case Zend_Controller_Plugin_ErrorHandler::EXCEPTION_NO_CONTROLLER:
            case Zend_Controller_Plugin_ErrorHandler::EXCEPTION_NO_ACTION:
                // 404 error -- controller or action not found
                $this->_response->setHttpResponseCode(404);
                $priority = Zend_Log::ERR;
                $message = 'Sorry, the page you requested cannot be found.';

                break;
            default:
                if($errors->exception->getCode() ==  550) {
                    $this->getResponse()->setHttpResponseCode(550);
                    $priority = Zend_Log::CRIT;
                    $message = 'Sorry, it appears you do not have the suffeceint privileges to view this page.';
                }
                elseif($errors->exception->getCode() ==  503) {
                    $date= Zend_Date::now();
                    $retry = $date->add('1', Zend_Date::WEEK);
                    $this->_response->setHttpResponseCode(503);
                    $this->_response->setHeader('Retry-After', $retry->toString());
                    $priority = Zend_Log::INFO;
                    $message = 'This area is currently under construction please check back soon!';
                }
                else { // default
                $this->_response->setHttpResponseCode(500);
                $priority = Zend_Log::CRIT;
                $this->view->message = '<img class="five-hundred" src="/skins/'.$this->skinName.'/images/500-error.png" alt="error" />Sorry, the server encountered an unexpected error.';
                }
                break;
        }
        // Log exception, if logger available
        if($log = $this->getLog())
        {
            switch(true) {
            	case ($this->isLogged) :
            	    $log->addUserEvent(Zend_Auth::getInstance());
            	    break;
            	case (!$this->isLogged) :
            	    $log->addUserEvent(null, 'guest', null);
            	    break;
            }
            $log->log('File Path to error:: ' . $errors->exception->getFile() . ', Line Number:: ' . $errors->exception->getLine() . ', Exception Message:: ' . $errors->exception->getMessage(), $priority);
        }
        // conditionally display exceptions
        if ($this->getInvokeArg('displayExceptions') == true) {
            $this->view->exception = $errors->exception;
        }

        $this->codeClass .= $this->_response->getHttpResponseCode();
        $this->view->codeClass = $this->codeClass;
        $this->view->request   = $errors->request;
    }

    public function getLog()
    {
        $bootstrap = $this->getInvokeArg('bootstrap');
        switch(true) {
        	case ($bootstrap->hasResource('Log')) :
        	    $log = $bootstrap->getResource('Log');
        	    return $log;
        	    break;
        	case (Zend_Registry::isRegistered('log')) :
        	    $log = Zend_Registry::get('log');
        	    return $log;
        	    break;
        	default :
        	    return false;
        	    break;

        }
    }
}

