<?php
class Admin_Form_Settings extends Zend_Dojo_Form
{
    public $settings;
    public $moduleList;

    public function __construct($options = null)
    {
        if (is_array($options)) {
            self::setOptions($options);
        } elseif ($options instanceof Zend_Config) {
            parent::setConfig($options);
        }
        self::init();
        parent::__construct($options);
    }
    public function setOptions($options)
    {
        if(isset($options['settings'])) {
            self::setSettings($options['settings']);
            unset($options['settings']);
        }
        if(isset($options['moduleList'])) {
            self::setModuleList($options['moduleList']);
            unset($options['moduleList']);
        }
        parent::setOptions($options);
    }
    public function init()
    {
        $baseElement = 'Zend_Dojo_Form_Element_';

        $this->setMethod('post');
        $this->setAttribs(array(
                'name'  => 'wSFO',
                'jsId'  => 'wSFO'
        ));
        $this->setDecorators(array(
                'FormElements',
                array('TabContainer', array(
                        'id' => 'tabContainer',
                        'style' => 'width: 600px; height: 500px;',
                        'dijitParams' => array(
                                'tabPosition' => 'top',
                                //'parseOnLoad' => true

                        ),
                )),
                'DijitForm',
        ));
        // we need a TabPane for each of these
        $list = $this->getModuleList();
        if(count($list)) {
            $index = count($list);
            // ok here we go
            $model = new Zend_Db_Table('modulesettings');
            for ($i = 0; $i < $index; $i++) {
                $subForm = new Zend_Dojo_Form_SubForm();
                $subForm->setAttribs(array(
                        'name'   => $list[$i]['moduleName'],
                        'legend' => ucfirst($list[$i]['moduleName']) . ' Options',
                        'dijitParams' => array(
                                'title' => ucfirst($list[$i]['moduleName']) . ' Options',
                                //'parseOnLoad' => true
                        ),
                ));
                $this->addSubForm($subForm, $list[$i]['moduleName']);
            }
            $subforms = $this->getSubForms();
            $settingsSelect = $model->select()->from('modulesettings', array('moduleName', 'variable', 'value', 'settingType'))->order('moduleName ASC');
            $formSettings = $model->fetchAll($settingsSelect);
            $index = count($formSettings);
            
            $labelFilter = new Zend_Filter_Word_CamelCaseToSeparator();
            
            for ($i = 0; $i < $index; $i++) {

                $subforms[$formSettings[$i]->moduleName]->addElement(
                        $formSettings[$i]->settingType,
                        $formSettings[$i]->variable,
                        array(
                                'value'      => $formSettings[$i]->value,
                                'label'      => ucwords($labelFilter->filter($formSettings[$i]->variable)),
                                //'class'      => 'editor',
                                'trim'       => true,
                                'propercase' => true,
                        )
                );
                continue;
            }
        }
        $this->addElement(
                'Button',
                'dijitButton',
                array(
                        'label' => 'Button',
                )
        );
    }
	/**
     * @return the $moduleList
     */
    public function getModuleList ()
    {
        return $this->moduleList;
    }
	/**
     * @param field_type $moduleList
     */
    public function setModuleList (array $moduleList)
    {
        $this->moduleList = $moduleList;
    }
	/**
     * @return the $settings
     */
    public function getSettings ()
    {
        return $this->settings;
    }
	/**
     * @param field_type $settings
     */
    public function setSettings (Zend_Db_Table_Rowset_Abstract $settings)
    {
        $this->settings = $settings;
    }
}