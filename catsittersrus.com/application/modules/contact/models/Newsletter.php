<?php

/**
 * Newsletter
 *
 * @author Joey
 * @version
 */

require_once 'Zend/Db/Table/Abstract.php';

class Contact_Model_Newsletter extends Zend_Db_Table_Abstract {
	/**
	 * The default table name
	 */
	protected $_name = 'newsletter';
	protected $_primary = 'id';
	protected $_sequence = true;
	protected $header = array('email address', 'first name', 'last name');
	public $csvPath;



	public function init(){
		$this->log = Zend_Registry::get('log');

	}
	public function fetchForExport($mode = 'new') {

	}
	public function export() {

		try {
			$this->getCsvPath();
			$q = $this->select()->from($this->_name, array('email', 'firstName', 'lastName', 'exported'))->where('id > ?', 0)->where('exported = ?', 0);
			$rows = $this->fetchAll($q);

			foreach($rows as $row) {
				$data[] = array(
						'email' => $row->email,
						'first name' => $row->firstName,
						'last name' => $row->lastName
				);
				$row->exported = 1;
				$row->save();
			}

			//$data = $this->fetchAll($q)->toArray();

			$write = $this->mssafe_csv($this->getCsvPath(), $data, $this->header);
			if(!$write) {
				throw new Zend_Exception('Write failed');
			} else {

				return true;
			}
		} catch (Zend_Exception $e) {
			$this->log->warn($e);
			return false;
		}

	}
	private function setExported($id) {
		//$q = $this->select()->from($this->_name, array('id', 'exported'))->where
	}
	public function mssafe_csv($filepath, $data, $header = array())
	{
		if ( $fp = fopen($filepath, 'w') ) {
			$show_header = true;
			if ( empty($header) ) {
				$show_header = false;
				reset($data);
				$line = current($data);
				if ( !empty($line) ) {
					reset($line);
					$first = current($line);
					if ( substr($first, 0, 2) == 'ID' && !preg_match('/["\\s,]/', $first) ) {
						array_shift($data);
						array_shift($line);
						if ( empty($line) ) {
							fwrite($fp, "\"{$first}\"\r\n");
						} else {
							fwrite($fp, "\"{$first}\",");
							fputcsv($fp, $line);
							fseek($fp, -1, SEEK_CUR);
							fwrite($fp, "\r\n");
						}
					}
				}
			} else {
				reset($header);
				$first = current($header);
				if ( substr($first, 0, 2) == 'ID' && !preg_match('/["\\s,]/', $first) ) {
					array_shift($header);
					if ( empty($header) ) {
						$show_header = false;
						fwrite($fp, "\"{$first}\"\r\n");
					} else {
						fwrite($fp, "\"{$first}\",");
					}
				}
			}
			if ( $show_header ) {
				fputcsv($fp, $header);
				fseek($fp, -1, SEEK_CUR);
				fwrite($fp, "\r\n");
			}
			foreach ( $data as $line ) {
				fputcsv($fp, $line);
				fseek($fp, -1, SEEK_CUR);
				fwrite($fp, "\r\n");
			}
			fclose($fp);
		} else {
			return false;
		}
		return true;
	}
	/**
	 * @return the $csvPath
	 */
	public function getCsvPath() {
		if(!isset($this->csvPath)) {
			$path = APPLICATION_PATH .  DIRECTORY_SEPARATOR . 'data' .DIRECTORY_SEPARATOR . 'newsletter-emails.csv';
			$this->setCsvPath($path);
		}
		return $this->csvPath;
	}

	/**
	 * @param field_type $csvPath
	 */
	public function setCsvPath($csvPath) {
		$this->csvPath = $csvPath;
	}



}
