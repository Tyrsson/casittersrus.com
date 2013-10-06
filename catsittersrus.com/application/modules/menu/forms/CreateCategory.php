<?php
class Menu_Form_CreateCategory extends Zend_Dojo_Form
{
    public $currentMenuId;
    public $menu;

    public function __construct($options = null)
    {
        parent::__construct($options);
    }
    public function setOptions(array $options)
    {
        if(array_key_exists('menuObject', $options)) {
            $this->setMenu($options['menuObject']);
            unset($options['menuObject']);
        }
        parent::setOptions($options);
    }
	public function init() {
        // This sets the Tab text
        $this->setAttribs(array(
                'name'   => 'catTab',
                'legend' => 'Category Fields',
        ));
        // This sets the decorator so that we can show this form in a tab and allows it to be closable
        $this->setDecorators(
                array(
                        'FormElements',
                        array(
                                'HtmlTag',
                                array(
                                        'tag' => 'dl'
                                )
                        ),
                        array( 
                              'decorator' => 'ContentPane',
                              'options' => array(
                                            'closable' => true
                              )
                        )
                )
        );
        // of course this gets menu information
        $category = new Menu_Model_Category();
        $category->setMenu($this->getMenu());
        
        // we need this so it can be used to update this row for an edit
        $menuId = new Zend_Form_Element_Hidden('menuId');
        
        // Does it have a name? of course it does
		$name = new Zend_Dojo_Form_Element_Textbox('name');
		$name->setLabel('Category Name');
		// Date, pretty simple
		$createdDate = new Zend_Form_Element_Hidden('createdDate');
		$now = Zend_Date::now();
		$createdDate->setValue($now->getTimestamp());
		
		// This is a pre populated filtering select ;)
		$parent = new Zend_Dojo_Form_Element_FilteringSelect('parentId');
		$parent->setLabel('Parent Category?');
		$parent->setMultiOptions($category->fetchParentDropDown());
		
		// This adds them all to this form, which actually becomes a subform of the main wSOF
		$this->addElements(array($menuId, $category, $name, $parent));
	}

	/**
     * @return the $menu
     */
    public function getMenu ()
    {
        return $this->menu;
    }

	/**
     * @param field_type $menu
     */
    public function setMenu ($menu)
    {
        $this->menu = $menu;
    }

	/**
     * @return the $currentMenuId
     */
    public function getCurrentMenuId ()
    {
        return $this->currentMenuId;
    }

	/**
     * @param field_type $currentMenuId
     */
    public function setCurrentMenuId ($currentMenuId)
    {
        $this->currentMenuId = $currentMenuId;
    }


}
