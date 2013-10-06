<?php
/**
 *
 * @author Joey
 * @version
 */
require_once 'Zend/Loader/PluginLoader.php';
require_once 'Zend/Controller/Action/Helper/Abstract.php';

/**
 * MenuHelper Action Helper
 *
 * @uses actionHelper Menu_Controller_Action_Helper
 */
class Menu_Controller_Action_Helper_MenuHelper extends Zend_Controller_Action_Helper_Abstract
{

    public $container = null;
    public $parents = null;
    public $menu = null;
    /**
     * Constructor: initialize plugin loader
     *
     * @return void
     */
    public function __construct ()
    {
//         if($this->container == null) {
//             $this->getContainer();
//         }
        if($this->menu == null) {
            $this->getMenu();
        }
        //Zend_Debug::dump($this->container);

        //$this->cats = new Menu_Model_Category();

    }
    public function preDispatch()
    {
        // temp fix to add php 5.4 support
        @$this->getContainer ()->findBy ( 'uri', $this->getRequest ()->getRequestUri () )->active = true;
        //$this->getContainer();
    }

    /**
     * @return the $container
     */
    public function getContainer ()
    {
        if(!isset($this->container) || $this->container == null) {
            if(Zend_Registry::isRegistered('Zend_Navigation')) {
                $this->setContainer(Zend_Registry::get('Zend_Navigation'));
            }
        }

        $this->container->addPages(self::getMenuPages());


        return $this->container;
    }

	/**
     * @param field_type $container
     */
    public function setContainer ($container)
    {
        $this->container = $container;
    }


	/**
     * @return the $menu
     */
    public function getMenu ()
    {
        if($this->menu == null) {
            $menu = new Menu_Model_Menu();
            $this->setMenu($menu->fetchCurrent());
        }
        return $this->menu;
    }

	/**
     * @param Menu_Model_Row_Menu $menu
     */
    public function setMenu ($menu)
    {
        $this->menu = $menu;
    }

	/**
     * @return the $parents
     */
    public function getParents ()
    {
        if($this->menu == null) {
            $this->getMenu();
        }
        $parentSelect = $this->menu->select()->where('parentId = ?', 0);
        $parents = $this->menu->findDependentRowset('Menu_Model_Category', 'MenuCats', $parentSelect);
        $this->setParents($parents);
        return $this->parents;
    }

	/**
     * @param Menu_Model_Rowset_Categories $parents
     */
    public function setParents ($parents)
    {
        $this->parents = $parents;
    }

	public function getMenuPages() {

	    $parents = $this->getParents();

    	    if(count($parents)) {

                $menuTab[] = array(
                        'label' => 'Menu',
                        'action' => 'index',
                        'controller' => 'index',
                        'module' => 'menu',
                        'order'  => 2,
                        'route' => 'menu_index',
                        'params' => array(
                	                   'parentCat' => $parents[0]->name,
                                       'childCat'  => 'none',
                                       'page'      => 1,
                )
                );
            return $menuTab;
	    }
    }
    /**
     * Strategy pattern: call helper as broker method
     */
    public function direct ()
    {
        // TODO Auto-generated 'direct' method
    }
}
