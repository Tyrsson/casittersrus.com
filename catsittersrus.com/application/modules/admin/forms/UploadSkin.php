<?php
class Admin_Form_UploadSkin extends Zend_Form
{
	public function init(){
		$files = new Zend_Form_Element_File('files');
		$files->setLabel('Upload Zip:');
		//The following must be set to a valid writable path
		$files->setDestination(APPLICATION_PATH . DIRECTORY_SEPARATOR . 'data/tmp');

		// Ensure only 1 file
		$files->addValidator('Count', array('min' => 1, 'max' => 5));
		// Limit to 100K
		$files->addValidator('Size', false, 9992097152);
		// Allow only ext's in the list
		$files->addValidator('Extension', false, 'zip');
		$files->setMultiFile(1);

		$submit = new Zend_Form_Element_Submit('submit');
		$submit->setLabel('Upload');

		$this->addElements(array($files, $submit));

	}
}