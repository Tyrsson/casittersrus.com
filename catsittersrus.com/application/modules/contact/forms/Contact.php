<?php
class Contact_Form_Contact extends Zend_Dojo_Form {

	public function init() {
		
		$this->setAction('/contact');
		/* Form Elements & Other Definitions Here ... */
		switch(APPLICATION_ENV) {
			case 'production' :
				$dir = 'public_html';
				break;
			case 'development' :
				$dir = 'public';
				break;
		}

		// initialize form
	    $this->setElementsBelongTo('contact');
	    $this->setName('contact');
		//$this->setAction('/contact/index')
			//->setMethod('post');

		$name = new Zend_Dojo_Form_Element_TextBox('name');
		$name->setLabel('Name')
			 //->setOptions(array('size' => '30'))
		     ->setRequired(true)
		     //->addValidator ( 'NotEmpty', true )
		     ->addFilter('HtmlEntities')
		     ->addFilter('StringTrim');
		// create text input for email address
		$email = new Zend_Dojo_Form_Element_TextBox('email');
		$email->setLabel('Email Address')
			  //->setOptions(array('size' => '30'))
			  ->setRequired(true)
			  //->addValidator('NotEmpty', true)
			  ->addValidator('EmailAddress', true)
			  ->addFilter('StringToLower')
			  ->addFilter ( 'StringTrim' );
		// create text input for phone number

		$number = new Zend_Dojo_Form_Element_TextBox( 'number' );
		$number->setLabel('Phone Number (Optional)' )
		//->setOptions(array('size' => '30'))
		//->setRequired(true)
		//->addValidator('NotEmpty', true)
		->addFilter('HtmlEntities')
		->addFilter('StringToLower')
		->addFilter ( 'StringTrim' );

		// create text input for message body

		$editor = new  Zend_Dojo_Form_Element_Editor ( 'Editor' );
		$editor->setLabel('Message');
		$editor->setRequired(true)
		->setAttrib('COLS', '30')
		->setAttrib('ROWS', '4')
		->addFilter('HtmlEntities')
		->addFilter('StringTrim');
		// create captcha

		$appSettings = Zend_Registry::get('appSettings');
		// create captcha
// 		$captcha = new Zend_Form_Element_Captcha('captcha', array(
// 				'captcha' => array(
// 						'captcha' => 'Image',
// 						'wordLen' => 6,
// 						'timeout' => 300,
// 						'width' => 300,
// 						'height' => 100,
// 						'imgUrl' => '/modules/captcha/archive',
// 						'imgDir' => APPLICATION_PATH . '/../public/modules/captcha/archive',
// 						'font' => APPLICATION_PATH .
// 						'/../public/modules/captcha/fonts/LiberationSansRegular.ttf',
// 				)
// 		));
		$captcha = new Zend_Form_Element_Captcha('captcha', array(
				'captcha' => array(
						'captcha' => 'Image',
						'wordLen' => 6,
						'timeout' => 300,
						'width' => 300,
						'height' => 100,
						'imgUrl' => '/modules/captcha/archive',
						'imgDir' => APPLICATION_PATH . '/../'.$dir.'/modules/captcha/archive',
						'font' => APPLICATION_PATH .
						'/../'.$dir.'/modules/captcha/fonts/LiberationSansRegular.ttf',
				)
		));

		$captcha->setLabel('Verification code:');

		$submit = new Zend_Dojo_Form_Element_SubmitButton('send');
		//$submit->setLabel('Submit')->setOptions(array('class' => 'submit'));

		$this->addElement($name)
		->addElement($email)
		->addElement($number)
		->addElement($editor);

		switch($appSettings->enableCaptcha) {
		    case true :
		        $this->addElement($captcha);
		        break;
		    case false :

		        break;
		}

		$this->addElement($submit);
	}
	public function loadDefaultDecorators()
	{
		$this->setDecorators ( array (
				'FormElements',
				'Form'
			)
		 );
	}
}