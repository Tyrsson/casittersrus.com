<?php
class Contact_Service_FormMailer
{
	public $appSettings;
	public $form;
	/*
	 * @var object Zend_Mail
	 */
	public $mailer;
	public $que;
	public $db;
	public $toAddresses = array();
	public $Bcc;
	public $attachments = array();
	public $module;
	public $fields = array();
	public $message;
	public $subject;
	public $from;
	public $toName;
	public $log;

	public function __construct(Zend_Form $form = null) {

		$this->setLog(Zend_Registry::get('log'));

		if($form !== null) {
			$this->setForm($form);
		}
		try {
			$this->getMessage();
			$fieldCount = $form->count();

			foreach($form as $field) {
				if(!$field instanceof Zend_Form_Element_Submit && (!is_array($field->getValue())))
				{
					//Zend_Debug::dump($field->getLabel() . ' ' .$field->getValue());
					$this->message .= $field->getLabel() . ' ' . $field->getValue() . "\n";
				}
				elseif(is_array($field->getValue())) {
					$this->message .= $field->getLabel() . "\n";
					foreach($field->getValue() as $option) {
						//Zend_Debug::dump($option, '$option');
						$this->message .= $option.',' . "\n";
					}
				}
				elseif($field instanceof Zend_Form_Element_Textarea) {
					$this->message .= $field->getLabel() . "\n" . $field->getValue() . "\n";
				}

			}
			$this->getMailer();
			$this->mailer->setBodyText($this->getMessage());

		} catch (Exception $e) {
			$this->log->crit($e);
		}
	}

	public function addMessageSegment($segment)
	{
		try {

		} catch (Exception $e) {

		}
	}

	/**
	 * @return the $subject
	 */
	public function getSubject() {
		return $this->subject;
	}

	/**
	 * @param field_type $subject
	 */
	public function setSubject($subject) {
		$this->subject = $subject;
	}

	/**
	 * @return the $from
	 */
	public function getFrom() {
		return $this->from;
	}

	/**
	 * @param field_type $from
	 */
	public function setFrom($from) {
		$this->from = $from;
	}

	/**
	 * @return the $fields
	 */
	public function getFields() {
		return $this->fields;
	}

	/**
	 * @param multitype: $fields
	 */
	public function setFields($fields) {
		$this->fields = $fields;
	}

	/**
	 * @return the $message
	 */
	public function getMessage() {
		if(!isset($this->message) || !is_string($this->message))
		{
			$this->message = '';
		}
		return $this->message;
	}

	/**
	 * @param field_type $message
	 */
	public function setMessage($message) {
		$this->message = $message;
	}

	public function getAppSettings() {
		return $this->appSettings;
	}

	/**
	 * @param field_type $appSettings
	 */
	public function setAppSettings($appSettings) {
		$this->appSettings = $appSettings;
	}

	/**
	 * @return the $form
	 */
	public function getForm() {
		return $this->form;
	}

	/**
	 * @param field_type $form
	 */
	public function setForm($form) {
		$this->form = $form;
	}

	/**
	 * @return the $mailer
	 */
	public function getMailer() {
		if(!$this->mailer instanceof Zend_Mail) {
			$this->setMailer(new Zend_Mail());
		}
		return $this->mailer;
	}

	/**
	 * @param field_type $mailer
	 */
	public function setMailer($mailer) {
		$this->mailer = $mailer;
	}

	/**
	 * @return the $que
	 */
	public function getQue() {
		return $this->que;
	}

	/**
	 * @param field_type $que
	 */
	public function setQue($que) {
		$this->que = $que;
	}

	/**
	 * @return the $db
	 */
	public function getDb() {
		return $this->db;
	}

	/**
	 * @param field_type $db
	 */
	public function setDb($db) {
		$this->db = $db;
	}

	/**
	 * @return the $toAddresses
	 */
	public function getToAddresses() {
		return $this->toAddresses;
	}

	/**
	 * @param multitype: $toAddresses
	 */
	public function setToAddresses($toAddresses) {
		$this->toAddresses = $toAddresses;
	}

	/**
	 * @return the $Bcc
	 */
	public function getBcc() {
		return $this->Bcc;
	}

	/**
	 * @param field_type $Bcc
	 */
	public function setBcc($Bcc) {
		$this->Bcc = $Bcc;
	}

	/**
	 * @return the $attachments
	 */
	public function getAttachments() {
		return $this->attachments;
	}

	/**
	 * @param multitype: $attachments
	 */
	public function setAttachments($attachments) {
		$this->attachments = $attachments;
	}

	/**
	 * @return the $module
	 */
	public function getModule() {
		return $this->module;
	}

	/**
	 * @param field_type $module
	 */
	public function setModule($module) {
		$this->module = $module;
	}
	/**
	 * @return the $log
	 */
	public function getLog() {
		return $this->log;
	}

	/**
	 * @param field_type $log
	 */
	public function setLog($log) {
		$this->log = $log;
	}



}