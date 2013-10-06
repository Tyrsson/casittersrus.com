<?php
class Page_Form_CreatePage extends Zend_Dojo_Form
{
    public $pageUrl;
    public $pageName;

// 	public function __construct($options = null) {
// 	    if($options !== null) {
// 	        $this->setOptions($options);
// 	    }
// 	}

    //TODO: Populate the parent page name for editing page
    // May have to remove the dojo element and replace it in the child edit form
    // so that we can populate the page name, but that will remove the datastore
    public function init() {

    	$ext = 'jpg,jpeg,png,gif,bmp,tiff';
        $types = new Page_Model_PageTypes();
        $pages = new Page_Model_Page();
        $widgets = new Page_Model_Widgets();
        $date = new Zend_Date();
        $today = $date->toString('MM/dd/yyyy');

        //$this->setAction('/admin/pages/edit'.$this->getPageUrl());
        $this->setAction('/admin/pages/create');
        $this->setMethod('post');
        
        $formContainer = new Zend_Dojo_Form_SubForm('mainForm');

        //Start Main Form
        $this->setAttribs(array(
            'name'  => 'wSFO',
            'jsId'  => 'wSFO'
        ));
        $formContainer->setDecorators(array(
            'FormElements',
            array('TabContainer', array(
                'id' => 'tabContainer',
                'style' => 'width: 800px; height: 600px;',
                'dijitParams' => array(
                    'tabPosition' => 'top'
                ),
            )),
            'DijitForm',
        ));

        // start content options elements
        $name = new Zend_Form_Element_Text('pageName');
        $name->setLabel('Page Name');

        $editor = new Zend_Dojo_Form_Element_Editor(
                                                    'pageText', 
                                                    array(
                                                       'id' => 'editor',
                                                       'label' => 'Content Editor'
                                                    )
                                                );
        $extraPlugins = array('fontName', 'fontSize', 'foreColor', 'hiliteColor', 'createLink', 'unlink', 'insertImage');
        // 'fontName', 'fontSize', 'formatBlock', 'foreColor', 'hiliteColor', 'pastefromword', 'insertanchor', 'createLink', 'insertImage', 'newpage', 'print', 'preview', 'collapsibletoolbar'
        $editor->addExtraPlugins($extraPlugins);
        //$pluginStyleSheets = array()
        ///$editor->addStyleSheets($styleSheets);
        //$editor->setLabel('Page Content')
        //->setRequired(true);

        $parent = new Zend_Dojo_Form_Element_FilteringSelect('parentId');
        $parent->setLabel('Parent Page');
        $parent->setMultiOptions($pages->fetchParentDropDown());

        // end content options elements

        // content options sub form
        $content = new Zend_Dojo_Form_SubForm();
        //$content->setAttrib('id', 'contentOptions');
        $content->setAttribs(array(
                'name'   => 'textboxtab',
                'legend' => 'Content',
        ));
        $content->setDecorators(array(
                'FormElements',
                array('HtmlTag', array('tag' => 'dl')),
                'ContentPane',
        ));

        $content->addElements(array($parent, $editor));
        // end content options sub form
        $roles = new User_Model_Roles();
        $role = new Zend_Dojo_Form_Element_FilteringSelect('role');
        $role->setRequired(true);
        $role->setLabel('Min Access Role');
        $role->setMultiOptions($roles->fetchAllRoles());

        $access = new Zend_Dojo_Form_SubForm();
        $access->setAttribs(array(
            'name'   => 'accesstab',
            'legend' => 'Access Elements',
        ));
        $access->setDecorators(array(
                'FormElements',
                array('HtmlTag', array('tag' => 'dl')),
                'ContentPane',
        ));
        $visible = new Zend_Dojo_Form_Element_FilteringSelect('visible');
        $visible->setLabel('Page Visibility');
        $visible->setMultiOptions(array('public' => 'public', 'private' => 'private'));

        $seo = new Zend_Dojo_Form_SubForm();
        $seo->setAttribs(array(
                'name'   => 'seotab',
                'legend' => 'SEO',
        ));
        $seo->setDecorators(array(
                'FormElements',
                array('HtmlTag', array('tag' => 'dl')),
                'ContentPane',
        ));

        $keywords = new Zend_Dojo_Form_Element_TextBox('keywords');
        $keywords->setLabel('Keywords');

        $description = new Zend_Dojo_Form_Element_Textarea('description');
        $description->setLabel('Description');

        $reindex = new Zend_Dojo_Form_Element_TextBox('reindex');
        $reindex->setLabel('Reindex');

        $linkText = new Zend_Dojo_Form_Element_TextBox('link text');
        $linkText->setLabel('Link Text');

        $submit = new Zend_Dojo_Form_Element_SubmitButton('submit_wSO', array('ignore' => true, 'label' => 'Save'));

        $seo->addElements(array($keywords, $description, $reindex, $linkText));

        $access->addElement($visible);
        $access->addElement($role);

        $formContainer->addSubForm($content, 'contentTab');
        $formContainer->addSubForm($seo, 'seoTab');
        $formContainer->addSubForm($access, 'accessTab');
        $this->populate(array('createdDate' => $today));
        
        $this->addSubForm($formContainer, 'wSoObj');
        $this->addElement($submit);

    }
    public function setOptions($options)
    {
        if(isset($options['pageUrl'])) {
            call_user_func(array($this, 'set'.ucfirst($options['pageUrl'])), $options['pageUrl']);
            unset($options['pageUrl']);
        }
        if(isset($options['pageName'])) {
            call_user_func(array($this, 'set'.ucfirst($options['pageName'])), $options['pageName']);
            unset($options['pageName']);
        }
        parent::setOptions($options);
    }
	/**
     * @return the $pageUrl
     */
    public function getPageUrl ()
    {
        return $this->pageUrl;
    }

	/**
     * @param field_type $pageUrl
     */
    public function setPageUrl ($pageUrl)
    {
        $this->pageUrl = $pageUrl;
    }

	/**
     * @return the $pageName
     */
    public function getPageName ()
    {
        return $this->pageName;
    }

	/**
     * @param field_type $pageName
     */
    public function setPageName ($pageName)
    {
        $this->pageName = $pageName;
    }
}