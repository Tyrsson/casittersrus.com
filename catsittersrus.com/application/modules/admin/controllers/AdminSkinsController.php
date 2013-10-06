<?php

/**
 * Admin_AdminSkinsController
 *
 * @author Joey Smith
 * @version 0.9.1
 */

require_once 'Zend/Controller/Action.php';
class Admin_AdminSkinsController extends System_Controller_AdminAction {

    public $ajaxable = array(
            'index' => array('html'),
            'install-skin' => array('html')
    );

	public $installer;

	public function init() {
		parent::init();
		//$this->installer = new System_SkinInstaller();
	}
	/**
	 * The default action - show the home page
	 */
	public function indexAction() {

	    echo '<a href="/admin/skins/manage/theridge">The Ridge</a>';

	}
	public function installAction() {
	    $step = 0;
	    $continue = false;
	    $skins = new Admin_Model_Skins();
	    $skinsettings = new Admin_Model_SkinSettings();
	    $front = Zend_Controller_Front::getInstance();
	    $archiveName = '';
	    $tempSkinName = '';

	    $templateTarget = APPLICATION_PATH . DIRECTORY_SEPARATOR . 'skins';
	    $styleTarget = $_SERVER['DOCUMENT_ROOT'] . $front->getBaseUrl() . DIRECTORY_SEPARATOR . 'skins';
		$form = new Admin_Form_UploadSkin();

		if($this->_request->isPost()) {

			if($form->isValid($this->_request->getPost())) {

				$data = $form->getValues();
				$tmpPath = APPLICATION_PATH . DIRECTORY_SEPARATOR . 'data' . DIRECTORY_SEPARATOR . 'tmp' . DIRECTORY_SEPARATOR . 'skins';
			    $filter     = new Zend_Filter_Decompress(array(
                                                            'adapter' => 'Zip',
                                                            'options' =>
			                                                    array(
                                                                    'target' => $tmpPath,
                                                                )
                                                         ));

				    $open = $filter->filter(APPLICATION_PATH . DIRECTORY_SEPARATOR . 'data' . DIRECTORY_SEPARATOR . 'tmp/' . $data['files']);
				    if($open) {
				        unset($filter);
				        $step++; // 1
				       // main archive opened
				       try {
				           // until we get the install config, we have to depend on the archive being named correctly so we can locate the install file... needs improved
				           $parts = explode('.', $data['files']);
				          // Zend_Debug::dump($parts);
				          // exit();
				           if(isset($parts[0]) && $parts[0] !== '')
				           {
				                $tempSkinName = $parts[0];
				           }

				           $config = new Zend_Config_Xml($tmpPath . DIRECTORY_SEPARATOR . $tempSkinName . DIRECTORY_SEPARATOR . 'install.xml');
				           // this should hold everthing we need for install ...... well hopefully...
				           $install = $config->install->toArray();

				           if(isset($install['settings'])) {
				               $step++; // 2
				               // these are what we are looking for at this step
				               $settings = $install['settings'];
				               // we will need to compare this to make sure we got all the settings in the db ;)
				               $settingCount = count($settings);

				               $continue = true;
				               $validator = new Zend_Validate_Db_NoRecordExists(array('table' => 'skins', 'field' => 'skinName'));
				               if($validator->isValid($install['skinName'])) {

				                   // here we need to hit step[3]


				                   $skinService = new System_SkinInstaller(array('skinName' => $install['skinName']));
				                   $movedStyles = $skinService->moveTree($tmpPath . DIRECTORY_SEPARATOR . $install['skinName'] . DIRECTORY_SEPARATOR . 'styles', 'styles');
				                   if($movedStyles > 0 && $continue) {
				                       $step++;
				                       $continue = true;
				                   }
				                   else {
				                       $continue = false;
				                   }

				                   $movedTemplates = $skinService->moveTree($tmpPath . DIRECTORY_SEPARATOR . $install['skinName'] . DIRECTORY_SEPARATOR . 'templates', 'templates');
				                   if($movedTemplates > 0 && $continue) {
				                       $step++;
				                       $continue = true;
				                   }
				                   else {
				                       $continue = false;
				                   }

				                   // create the skin db records now that we have the files in place
				                   if($continue) {

				                       // we only need a new row if we have got to this point
				                       $newSkin = $skins->fetchNew();

				                       $newSkin->skinName = $install['skinName'];
				                       $skinId = $newSkin->save();
				                       $i = 0;
				                       foreach($settings as $spec => $value) {
				                           //Zend_Debug::dump(array($spec => $value));
				                           $settingsRow = $skinsettings->fetchNew();
				                           $settingsRow->skinId = $skinId;
				                           $settingsRow->spec = $spec;
				                           $settingsRow->value = $value;
				                           $settingsRow->save();
				                           $i++;
				                           continue;
				                       }
				                       if($i === $settingCount) {
				                           $step++;
				                       }
				                       else {
				                           $continue = false;
				                           throw new Zend_Application_Exception('An exception was encountered while trying to write the settings for ' . $install['skinName']);
				                       }
				                   }

				                   if($continue) {
				                       // here we need to chmod and cleanup
				                       die('Install complete, ready for cleanup'); //
				                   }

				               }
				               else {
				                   throw new Zend_Db_Exception('Another skin by that name exist, please repackage your skin with a new name.');
				               }
				           }


				       } catch (Zend_Exception $e) {
				           echo 'Install halted on step: ' . $step;
				           echo $e->getMessage() . ' :: ' . $e->getTraceAsString();
				       }


				    }

			}
		}
		//echo 'skin install';
		$this->view->form = $form;
	}
	public function settingsAction()
	{
	    $form = new Admin_Form_SkinSettings();
	    $skins = new Admin_Model_Skins();



	    if($this->_request->isPost()) {
	        if($form->isValid($this->_request->getPost())) {

	            $current = $skins->fetchCurrent();

	            $data = $form->getValues(true);
	            if($current->skinId == $data['skin']) {
	                // do nothing
	            } else {
	                $current->isCurrentSkin = 0;
	                $current->save();

	                $new = $skins->fetchById((int)$data['skin']);
	                $new->isCurrentSkin = 1;
	                $new->save();

	            }

	            //Zend_Debug::dump($data);
	        }
	    }
	    $this->view->form = $form;
	}
	public function manageSkinSettingsAction()
	{
	    $skins = new Admin_Model_Skins();
	    $skin = $skins->fetchByName($this->_request->skinName);

	    $settings = $skin->findDependentRowset('Admin_Model_SkinSettings');
	    //Zend_Debug::dump($settings);

	    $iniPath = APPLICATION_PATH . '/skins/'.$this->_request->skinName.'/data/settings.ini';
	    if(file_exists($iniPath)) {
	        $config = new Zend_Config_Ini($iniPath, 'development');
	       // Zend_Debug::dump($config);
	        $form = new Zend_Form($config->skin->settings);
	        //echo $form;
	    }

	    if($this->_request->isPost()) {

	    }
	    else {
	        $index = count($settings);
	        for ($i = 0; $i < $index; $i++) {
	        	$preData[$settings[$i]->spec] = $settings[$i]->value;
	        }
	        $form->populate($preData);
	    }
	    $this->view->form = $form;
	}
}
