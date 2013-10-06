<?php
/**
 *
 * @author Joey
 * @version 0.0.1
 */
require_once 'Zend/View/Interface.php';

/**
 * RecentMedia helper
 *
 * @uses viewHelper Media_View_Helper
 */
class Default_View_Helper_RecentMedia extends System_View_Helper_Abstract
{
    /**
     */
    public function recentMedia ()
    {
        if($this->appSettings->showRecentMedia = true)
        {
        $this->html .= '
                <div id="recent-media">
                    <ul>
                        <li><a href="' . $this->view->baseUrl() . '/media/recentimages">Recent Media</a></li>
                    </ul>
                </div>';
       // return 'running from the default skin';
        return $this->html;
        }
    }

    /**
     * Sets the view field
     *
     * @param $view Zend_View_Interface
     */
    public function setView (Zend_View_Interface $view)
    {
        $this->view = $view;
    }
}
