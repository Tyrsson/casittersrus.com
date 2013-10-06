<?php
/**
 * Skins
 *
 * @author Joey
 * @version
 */
require_once 'Zend/Db/Table/Abstract.php';
class Admin_Model_Skins extends System_Db_Table_Core
{
	protected $_name = 'skins';
    protected $_primary = 'skinId';
    protected $_sequence = true;
    protected $_rowsetClass = 'Admin_Model_Rowset_Skins';
    protected $_rowClass = 'Admin_Model_Row_Skin';

    protected $_dependentTables = array('Admin_Model_SkinSettings');

    public function fetchById($skinId) {
        $query = $this->select()->from($this->_name, array("*"))->where('skinId = ?', $skinId);
        return $this->fetchRow($query);
    }
    public function fetchByName($skinName) {
        $query = $this->select()->from($this->_name, array("*"))->where('skinName = ?', $skinName);
        return $this->fetchRow($query);
    }
    public function fetchSelect()
    {
        $query = $this->select()
        ->from($this->_name, array('key' => 'skinId', 'value' => 'skinName'));

        return  $this->fetchAll($query);
    }
//     public function fetchCurrent() {
//         $query = $this->select()->from($this->_name, array("*"))->where('isCurrentSkin = ?', 1);
//         return $this->fetchRow($query);
//     }
    public function fetchDropDown() {
        $query = $this->select()
        			  ->from($this->_name, array('key' => $this->_primary, 'value' => $valueColumn))
        			  ->where($condition);

        return  $this->fetchAll($query);
    }
}
