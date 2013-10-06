<?php
class Media_Model_Row_File extends System_Model_Row_Searchable
{
    protected $_name = 'mediafiles';
    protected $_primary = 'fileId';
    protected $_tableClass = 'Media_Model_Files';
    protected $albums;
    public    $thumbPath;
	public    $imgPath;
	
    public function init()
    {
        parent::init();
        $this->albums = new Media_Model_Albums();
    }
    public function getSearchIndexFields()
    {
        $albums = new Media_Model_Albums();
        $pages = new Page_Model_Page();
        $mediaPageName = $pages->fetchPageNameByType();
        //$date = new Zend_Date($this->_data['timestamp'], Zend_Date::TIMESTAMP);
        $filter = new Zend_Filter_StripTags();
        $album = $albums->fetchById($this->_data['albumId']);
        $fields['class'] = __CLASS__; // try changing this to get_called_class() to ident each rows class instead of the parent
        $fields['key'] = $this->_data['fileId'];
        $fields['docRef'] = $fields['class'].':'.$fields['key'];
        $fields['url'] = '/'.$mediaPageName.'/' . $album->serverPath; //TODO: this needs to be mapped to a route........
        $fields['title'] = !empty($this->_data['title']) ? $this->_data['title'] : $this->_data['fileName'];
        $fields['contents'] = !empty($this->_data['description']) ? $this->_data['description'] : $this->_data['fileName'] ;
        $fields['summary'] =  !empty($this->_data['description']) ? substr($filter->filter($this->_data['description']), 0, 300) : $this->_data['fileName'];
        $fields['createdBy'] = '0';
        $fields['dateCreated'] = '0';

        //Zend_Debug::dump($fields);
        //die();
        
        return $fields;
    }
    public function setAlbumName($albumName)
    {
    	$this->albumName = $albumName;
    }
    public function getAlbumName()
    {

    		if(isset($this->_data['albumId'])) {
    			$album = $this->albums->fetchById($this->_data['albumId']);
    			$this->_data['albumName'] = $album->albumName;
    		}
    	
    	
    }
    public function getData()
    {
        return $this->_data;
    }
}