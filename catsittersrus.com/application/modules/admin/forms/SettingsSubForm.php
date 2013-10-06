<?php
class Admin_Form_SettingsSubForm extends Zend_Dojo_Form
{
    public $containerId;
    public $title;

    public function __construct($options = null)
    {
        if (is_array($options)) {
            $this->setOptions($options);
        } elseif ($options instanceof Zend_Config) {
            $this->setConfig($options);
        }

        $this->setDisableLoadDefaultDecorators(true);

        self::init();

        $this->loadDefaultDecorators();
    }
	public function setOptions($options)
	{
	    if(isset($options['containerId'])) {
	        $this->setContainerId($options['containerId']);
	        unset($options['containerId']);
	    }
	    if(isset($options['title'])) {
	        $this->setTitle($options['title']);
	        unset($options['title']);
	    }
	    parent::setOptions($options);
	}
    public function init()
    {


    }
	/**
     * @return the $containerId
     */
    public function getContainerId ()
    {
        return $this->containerId;
    }

	/**
     * @param field_type $containerId
     */
    public function setContainerId ($containerId)
    {
        $this->containerId = $containerId;
    }

	/**
     * @return the $title
     */
    public function getTitle ()
    {
        return $this->title;
    }

	/**
     * @param field_type $title
     */
    public function setTitle ($title)
    {
        $this->title = $title;
    }


}