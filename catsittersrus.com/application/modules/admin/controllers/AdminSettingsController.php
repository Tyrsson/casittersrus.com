<?php
/**
 * AdminAdminController
 *
 * @author Joey Smith
 * @version 0.1
 */
require_once 'System/Controller/AdminAction.php';
class Admin_AdminSettingsController extends System_Controller_AdminAction {
	public $appSettings;
	public $moduleSettings;
	public $ajaxable = array(
		'settings' => array('html')
	);
	public function init() {
		parent::init ();
		//$this->appSettings = new Admin_Model_SettingsGateway ();
		
		if($this->isAjax()) {
		    $this->_helper->layout()->disableLayout();
		}
		$ajax = $this->_helper->ajaxContext();
		$ajax->addActionContexts($this->ajaxable);
	}
	/**
	 * The default action - show the home page
	 */
	public function indexAction() {
		// TODO Auto-generated AdminAdminController::indexAction() default
	}
	public function buildForm()
	{
	    /**
	     * You must set the form id so that you can add your tabPanes to the tabContainer
	     * Set the decorator to use the TabContainer View Helper
	     */
	    $form = new ZendX_JQuery_Form;
	    $form->setAttrib('id', 'mainForm');
	    $form->setDecorators(array(
                        'FormElements',
                        array(
                                'TabContainer',
                                array(
                                        'id' => 'tabContainer',
                                        'class' => 'tabContainer',
                                        'style' => 'width: 800px;'
                                )
                        ),
                        'Form'
                ));

	    /**
	     * Create the subforms and add some elements
	    */
	    $subforms = array();
	    $subforms[0] = new ZendX_JQuery_Form;
	    $username = $form->createElement('text', 'username')
	    ->setLabel('username');
	    $subforms[0]->addElement($username);

	    $subforms[1] = new ZendX_JQuery_Form;
	    $guestname = $form->createElement('text', 'guestname')
	    ->setLabel('guestname');
	    $subforms[1]->addElement($guestname);

	    /**
	     * Set the decorators on the subforms to use TabPane View Helper
	     * Note that containerId is the same as the form id set earlier
	    */
	    foreach ($subforms as $pageno=>$subform) {
	        $subform->setAttrib('id', 'subForm');
	        $subform->setDecorators(array(
                        'FormElements',
                        array(
                                'HtmlTag',
                                array(
                                        'tag' => 'div'
                                )
                        ),
                        array(
                                'TabPane',
                                array(
                                        'jQueryParams' => array(
                                                'containerId' => 'managePages',
                                                'title' => 'Content Options',
                                        )
                                )
                        )
                ));
	        /**
	         * Add a submit button to each subform
	        */
	        $subform->addElement('submit', 'Submit');
	        $form->addSubform($subform, 'subform_'.$pageno);
	    }

	    return $form;
	}
	public function settingsAction() {
	    Zend_Dojo_View_Helper_Dojo::setUseDeclarative(true);
	    //$appSettingsModel = new Admin_Model_AppSettings ();
	    $moduleSettingsModel = new Zend_Db_Table('modulesettings');
	    $moduleListSelect = $moduleSettingsModel->select()->distinct()->from('modulesettings', array('moduleName'));
	    $modules = $moduleSettingsModel->fetchAll($moduleListSelect);
	    $form = new Admin_Form_Settings(array('moduleList' => $modules->toArray()));
	    $form->setAction('/admin/settings');
	    //Zend_Debug::dump($form->getModuleList());

	    switch($this->_request->isPost ()) {
	    	case true :

	    	    break;
	    	case false :

	    	    break;
	    }

	    $this->view->form = $form;

// 		$settings = new Admin_Model_AppSettings ();
// 		if ($this->_request->isPost ()) {
// 			$form = $settings->getFormWithoutValues ();
// 			if ($form->isValid ( $this->_request->getPost () )) {
// 				$data = $form->getValues ();
// 				foreach ( $data as $key => $value ) {
// 					$row = $settings->fetchVar ( $key );
// 					$row->value = $value;
// 					$row->save ();
// 				}
// 			}
// 			$this->view->form = $form;
// 		} else {
// 			$this->view->form = $settings->getFormWithValues ();
// 		}
	}
	public function modulesettingsAction() {
		$settings = new Admin_Model_ModuleSettings ();
		$settings->init ( isset ( $this->_request->modName ) ? $this->_request->modName : '' );
		if (isset ( $this->_request->modName )) {
			if ($this->_request->isPost ()) {
				$form = $settings->getFormWithoutValues ();
				if ($form->isValid ( $this->_request->getPost () )) {
					$data = $form->getValues ();
					foreach ( $data as $key => $value ) {
						$row = $settings->fetchVar ( $this->_request->modName, $key );
						$row->value = $value;
						$row->save ();
					}
				}
				$this->view->form = $form;
			} else {
				$this->view->form = $settings->getFormWithValues ();
			}
		}
	}
	public function addmodsettingsAction() {
	    $settings = new Admin_Model_ModuleSettings();
	    $form = new Admin_Form_CreateModuleSettings();

	    if($this->_request->isPost())
	    {
	        if($form->isValid($this->_request->getPost()))
	        {
	            $data = $form->getValues();
	            $row = $settings->fetchNew();
	            $row->setFromArray($data);
	            $conf = (bool) $row->save();
	            if($conf) {
	                $this->messenger->addMessage('Your setting was created');
	            } else {
	                throw new System_Application_Exception('Setting not created, please check your syntax!!');
	            }
	        }
	    }
	    $this->view->form = $form;
	}
}