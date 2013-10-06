<?php
class Media_Model_Rowset_Files extends Zend_Db_Table_Rowset_Abstract
{
    protected $_tableClass = 'Media_Model_File';
    protected $_appSettings;

    public function getAppSettings()
    {
    	switch(Zend_Registry::isRegistered('appSettings')) {
    		case true :
    			return Zend_Registry::get('appSettings');
    			break;
    		case false :
    			return null;
    			break;
    	}
    }
    public function getData()
    {
        return $this->_data;
    }
}