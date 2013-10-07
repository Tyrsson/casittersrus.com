-- phpMyAdmin SQL Dump
-- version 3.5.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 07, 2013 at 07:43 AM
-- Server version: 5.5.29
-- PHP Version: 5.4.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cats`
--

-- --------------------------------------------------------

--
-- Table structure for table `appsettings`
--

DROP TABLE IF EXISTS `appsettings`;
CREATE TABLE `appsettings` (
  `variable` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `settingType` tinytext NOT NULL,
  KEY `variable` (`variable`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `appsettings`
--

INSERT INTO `appsettings` (`variable`, `value`, `settingType`) VALUES
('allowTags', '<h1>,<h2>,<h3>,<h4>,<h5>,<h6>,<hr>', 'Textarea'),
('enableCaptcha', '1', 'Checkbox'),
('seoKeyWords', 'Dirextion Inc, Dxcore, Php, Development, MySQL', 'Textarea'),
('siteName', 'The Ridge', 'Text'),
('webMasterEmail', 'noreply@dirextion.com', 'Text'),
('remoteLicenseKey', 'SingleDomain18446aad51de8a3a596b594c3fcca5d137cf8c34', 'Textarea'),
('siteEmail', 'jsmith@dirextion.com', 'Text'),
('enableMobileSupport', '1', 'CheckBox'),
('seoDescription', 'Custom CMS', 'Textarea'),
('facebookAppId', '431812843521907', 'Text'),
('facebookAppSecret', 'd86702c59bd48f3a76bc57d923cd237e', 'Text'),
('enableFbPageLink', '1', 'CheckBox'),
('enableFbOpenGraph', '0', 'Checkbox'),
('sessionLength', '86400', 'Text'),
('showOnlineList', '1', 'Checkbox'),
('enableLogging', '1', 'Checkbox'),
('enableHomeTab', '1', 'Checkbox'),
('enableLinkLogo', '1', 'Checkbox'),
('enableDebugMode', '1', 'Checkbox'),
('enableSearch', '1', 'Checkbox'),
('isInstalled', '0', 'Checkbox');

-- --------------------------------------------------------

--
-- Table structure for table `calendar`
--

DROP TABLE IF EXISTS `calendar`;
CREATE TABLE `calendar` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `monthRangeMin` int(11) NOT NULL,
  `monthRangeMax` int(11) NOT NULL,
  `type` enum('local','google') NOT NULL DEFAULT 'local',
  `googleUserName` varchar(255) DEFAULT NULL,
  `googlePassWord` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `calendar`
--

INSERT INTO `calendar` (`id`, `name`, `monthRangeMin`, `monthRangeMax`, `type`, `googleUserName`, `googlePassWord`) VALUES
(1, 'default', -1, 12, 'local', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `calendarevents`
--

DROP TABLE IF EXISTS `calendarevents`;
CREATE TABLE `calendarevents` (
  `eventId` int(11) NOT NULL AUTO_INCREMENT,
  `calendarId` int(11) NOT NULL,
  `year` int(4) NOT NULL,
  `month` int(2) NOT NULL,
  `day` int(2) NOT NULL,
  `eventName` varchar(255) NOT NULL,
  `linkOne` varchar(255) NOT NULL,
  `linkTwo` varchar(255) NOT NULL,
  `eventContent` longtext NOT NULL,
  PRIMARY KEY (`eventId`),
  KEY `eventName` (`eventName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `calendarevents`
--

INSERT INTO `calendarevents` (`eventId`, `calendarId`, `year`, `month`, `day`, `eventName`, `linkOne`, `linkTwo`, `eventContent`) VALUES
(1, 1, 2012, 10, 15, 'Test Event', 'http://linkone.com', 'http://linktwo', 'This is some test content for an event on Oct 15th 2012.'),
(2, 1, 2012, 10, 14, 'Test Event Two', '', '', 'event two content'),
(8, 0, 2012, 10, 17, 'The seventeenth', 'sdvwge', 'rbgwretg', 'event on the 17th'),
(9, 1, 2012, 10, 3, 'asfqerf', 'dfverv', 'adfvwerv', 'dafvwefrvw'),
(10, 1, 2012, 10, 18, 'Bday', 'sdvq', 'avqr', 'cal id = 1, eventId = 10, day = 18th, month = 10, year = 2012'),
(11, 1, 2012, 10, 29, 'New Event', 'link One', 'Link Two', 'This is some content etc');

-- --------------------------------------------------------

--
-- Table structure for table `calendarweeks`
--

DROP TABLE IF EXISTS `calendarweeks`;
CREATE TABLE `calendarweeks` (
  `weekId` int(11) NOT NULL AUTO_INCREMENT,
  `calendarId` int(11) DEFAULT NULL,
  `headingColor` varchar(7) DEFAULT NULL,
  `weekHeading` mediumtext,
  `headingLink` varchar(255) DEFAULT NULL,
  `monthId` int(11) DEFAULT NULL,
  `monthName` varchar(45) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  PRIMARY KEY (`weekId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `content_nodes`
--

DROP TABLE IF EXISTS `content_nodes`;
CREATE TABLE `content_nodes` (
  `nodeId` int(11) NOT NULL AUTO_INCREMENT,
  `nameSpace` varchar(255) NOT NULL,
  `contentItemId` int(11) NOT NULL,
  `spec` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`nodeId`),
  UNIQUE KEY `spec` (`spec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Content Nodes Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `eventId` int(11) NOT NULL AUTO_INCREMENT,
  `startDate` int(11) NOT NULL,
  `endDate` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `categories` mediumtext NOT NULL,
  `eventContent` longtext NOT NULL,
  PRIMARY KEY (`eventId`),
  KEY `startDate` (`startDate`,`endDate`,`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`eventId`, `startDate`, `endDate`, `title`, `categories`, `eventContent`) VALUES
(4, 1380603600, 1383282000, 'Testing', '', '<p>\r\n	This is test content for the first event. It should be wrapped in a p tag.</p>'),
(5, 1380603600, 1383282000, 'Another Event', '', '<p>\r\n	Another event to test assigning cats to event</p>'),
(6, 1383282000, 1393653600, 'Blah', '', '<p>\r\n	testing result</p>'),
(7, 1383282000, 1393653600, 'BlahBlah', '', '<p>\r\n	testing result</p>'),
(8, 1380603600, 1383282000, 'yada', '', '<p>\r\n	testing forward</p>'),
(9, 1383282000, 1383282000, 'yikes', '3,2,1,2,3,3,2,1,2', '<p>\r\n	This is content</p>');

-- --------------------------------------------------------

--
-- Table structure for table `installedmodules`
--

DROP TABLE IF EXISTS `installedmodules`;
CREATE TABLE `installedmodules` (
  `moduleId` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `nameSpace` varchar(255) NOT NULL,
  `publicName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`moduleId`),
  UNIQUE KEY `name` (`name`,`nameSpace`),
  KEY `publicName` (`publicName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `installedmodules`
--

INSERT INTO `installedmodules` (`moduleId`, `name`, `nameSpace`, `publicName`) VALUES
(1, 'admin', 'Admin_', 'Admin Area'),
(2, 'user', 'User_', NULL),
(3, 'pages', 'Pages_', NULL),
(4, 'media', 'Media_', 'Gallery'),
(5, 'contact', 'Contact_', 'Contact'),
(6, 'Calendar', 'Calendar_', 'Calendar'),
(7, 'search', 'Search_', 'Search'),
(8, 'testimonials', 'Testimonials_', 'Testimonials');

-- --------------------------------------------------------

--
-- Table structure for table `lang`
--

DROP TABLE IF EXISTS `lang`;
CREATE TABLE `lang` (
  `langKey` varchar(255) NOT NULL,
  `langText` mediumtext NOT NULL,
  `locale` varchar(5) NOT NULL,
  PRIMARY KEY (`langKey`),
  KEY `locale` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lang`
--

INSERT INTO `lang` (`langKey`, `langText`, `locale`) VALUES
('headerImageUserNotice', 'Page Header images must be width = X and Height = N', 'en_US'),
('welcomeGuest', 'Welcome back guest.', 'en_US');

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `logId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `fileId` int(11) NOT NULL DEFAULT '0',
  `userName` varchar(255) DEFAULT NULL,
  `timeStamp` varchar(255) NOT NULL,
  `priorityName` varchar(20) NOT NULL,
  `priority` int(1) NOT NULL,
  `message` mediumtext NOT NULL,
  PRIMARY KEY (`logId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1282 ;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`logId`, `userId`, `fileId`, `userName`, `timeStamp`, `priorityName`, `priority`, `message`) VALUES
(1, 1, 0, 'dxadmin', '08-02-2013 03:08:16', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Service Temporarily Unavailable'),
(2, 1, 0, 'dxadmin', '08-02-2013 03:08:19', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(3, 0, 0, 'guest', '08-02-2013 03:09:44', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(4, 0, 0, 'guest', '08-02-2013 03:21:32', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(5, 0, 0, 'guest', '08-02-2013 03:21:43', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(6, 0, 0, 'guest', '08-02-2013 03:22:11', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(7, 0, 0, 'guest', '08-02-2013 03:22:56', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(8, 0, 0, 'guest', '08-02-2013 03:26:48', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(9, 1, 0, 'dxadmin', '08-02-2013 03:29:14', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (%3C)'),
(10, 1, 0, 'dxadmin', '08-02-2013 03:29:21', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (%3C)'),
(11, 1, 0, 'dxadmin', '08-02-2013 03:29:24', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(12, 1, 0, 'dxadmin', '08-02-2013 03:29:51', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(13, 1, 0, 'dxadmin', '08-02-2013 03:30:03', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(14, 1, 0, 'dxadmin', '08-02-2013 03:30:06', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(15, 1, 0, 'dxadmin', '08-02-2013 03:30:07', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(16, 1, 0, 'dxadmin', '08-02-2013 03:30:08', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(17, 1, 0, 'dxadmin', '08-02-2013 03:30:10', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(18, 1, 0, 'dxadmin', '08-02-2013 03:30:15', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(19, 0, 0, 'guest', '08-02-2013 03:36:57', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(20, 1, 0, 'dxadmin', '08-02-2013 03:42:30', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Service Temporarily Unavailable'),
(21, 1, 0, 'dxadmin', '08-02-2013 03:42:33', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(22, 1, 0, 'dxadmin', '08-02-2013 03:43:19', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Service Temporarily Unavailable'),
(23, 1, 0, 'dxadmin', '08-02-2013 03:43:35', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Service Temporarily Unavailable'),
(24, 1, 0, 'dxadmin', '08-02-2013 03:43:39', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(25, 1, 0, 'dxadmin', '08-02-2013 03:43:42', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Service Temporarily Unavailable'),
(26, 1, 0, 'dxadmin', '08-02-2013 03:45:32', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Service Temporarily Unavailable'),
(27, 1, 0, 'dxadmin', '08-02-2013 03:49:12', 'CRIT', 2, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/View/Abstract.php, Line Number:: 988, Exception Message:: script ''/partials/ui-albums.phtml'' not found in path (/Volumes/Web/Library/WebServer/www/theridge/application/skins/default/scripts/)'),
(28, 1, 0, 'dxadmin', '08-02-2013 03:49:12', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(29, 1, 0, 'dxadmin', '08-02-2013 04:02:03', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Service Temporarily Unavailable'),
(30, 1, 0, 'dxadmin', '08-02-2013 04:02:03', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(31, 1, 0, 'dxadmin', '08-02-2013 04:02:56', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Service Temporarily Unavailable'),
(32, 1, 0, 'dxadmin', '08-02-2013 04:02:57', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(33, 1, 0, 'dxadmin', '08-02-2013 04:03:17', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Service Temporarily Unavailable'),
(34, 1, 0, 'dxadmin', '08-02-2013 04:03:19', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(35, 0, 0, 'guest', '08-02-2013 04:03:27', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(36, 1, 0, 'dxadmin', '08-02-2013 04:04:10', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Service Temporarily Unavailable'),
(37, 1, 0, 'dxadmin', '08-02-2013 04:04:14', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(38, 0, 0, 'guest', '08-02-2013 04:07:08', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(39, 0, 0, 'guest', '08-02-2013 04:13:27', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(40, 1, 0, 'dxadmin', '08-02-2013 04:14:48', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Service Temporarily Unavailable'),
(41, 1, 0, 'dxadmin', '08-02-2013 04:14:50', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Service Temporarily Unavailable'),
(42, 1, 0, 'dxadmin', '08-02-2013 04:14:53', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(43, 1, 0, 'dxadmin', '08-02-2013 04:15:03', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(44, 1, 0, 'dxadmin', '08-02-2013 04:15:08', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(45, 0, 0, 'guest', '08-02-2013 04:18:49', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(46, 0, 0, 'guest', '08-02-2013 04:18:49', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(47, 1, 0, 'dxadmin', '08-02-2013 04:19:10', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(48, 1, 0, 'dxadmin', '08-02-2013 04:21:42', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(49, 1, 0, 'dxadmin', '08-02-2013 04:21:47', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (modules)'),
(50, 1, 0, 'dxadmin', '08-02-2013 04:22:29', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (43t980g)'),
(51, 1, 0, 'dxadmin', '08-02-2013 04:23:24', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/pages/controllers/IndexController.php, Line Number:: 166, Exception Message:: Unknown page'),
(52, 1, 0, 'dxadmin', '08-02-2013 04:23:36', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (24908)'),
(53, 1, 0, 'dxadmin', '08-02-2013 04:25:14', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (24908)'),
(54, 1, 0, 'dxadmin', '08-02-2013 04:25:47', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(55, 1, 0, 'dxadmin', '08-02-2013 04:26:44', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(56, 1, 0, 'dxadmin', '08-02-2013 04:26:46', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(57, 1, 0, 'dxadmin', '08-02-2013 04:27:30', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(58, 1, 0, 'dxadmin', '08-02-2013 04:27:33', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(59, 1, 0, 'dxadmin', '08-02-2013 04:27:51', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(60, 1, 0, 'dxadmin', '08-02-2013 04:28:02', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (234)'),
(61, 1, 0, 'dxadmin', '08-02-2013 04:30:07', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(62, 1, 0, 'dxadmin', '08-02-2013 04:30:11', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(63, 1, 0, 'dxadmin', '08-02-2013 04:31:39', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(64, 1, 0, 'dxadmin', '08-02-2013 04:31:43', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(65, 1, 0, 'dxadmin', '08-02-2013 04:32:33', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(66, 1, 0, 'dxadmin', '08-02-2013 04:32:36', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(67, 1, 0, 'dxadmin', '08-02-2013 04:32:55', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (some)'),
(68, 1, 0, 'dxadmin', '08-02-2013 04:32:57', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(69, 1, 0, 'dxadmin', '08-02-2013 04:33:32', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (some)'),
(70, 1, 0, 'dxadmin', '08-02-2013 04:33:34', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(71, 0, 0, 'guest', '08-02-2013 04:47:10', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(72, 0, 0, 'guest', '08-02-2013 04:47:11', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(73, 0, 0, 'guest', '08-02-2013 04:47:13', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(74, 0, 0, 'guest', '08-02-2013 04:47:15', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(75, 0, 0, 'guest', '08-02-2013 05:10:07', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(76, 0, 0, 'guest', '08-02-2013 05:10:08', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(77, 0, 0, 'guest', '08-02-2013 05:20:42', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(78, 0, 0, 'guest', '08-02-2013 05:30:59', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(79, 0, 0, 'guest', '08-02-2013 05:31:01', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(80, 0, 0, 'guest', '08-02-2013 05:32:03', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(81, 0, 0, 'guest', '08-02-2013 05:32:04', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(82, 0, 0, 'guest', '08-05-2013 08:39:28', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(83, 0, 0, 'guest', '08-05-2013 08:40:00', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(84, 0, 0, 'guest', '08-05-2013 08:40:00', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(85, 0, 0, 'guest', '08-05-2013 08:42:55', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(86, 0, 0, 'guest', '08-05-2013 08:42:59', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (modules)'),
(87, 1, 0, 'dxadmin', '08-05-2013 08:43:17', 'INFO', 6, 'Successful Login'),
(88, 1, 0, 'dxadmin', '08-05-2013 08:43:18', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(89, 1, 0, 'dxadmin', '08-05-2013 08:43:30', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(90, 1, 0, 'dxadmin', '08-05-2013 08:43:47', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(91, 0, 0, 'guest', '08-05-2013 08:43:55', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(92, 1, 0, 'dxadmin', '08-05-2013 08:53:31', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(93, 0, 0, 'guest', '08-05-2013 08:55:07', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(94, 0, 0, 'guest', '08-05-2013 08:55:22', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(95, 0, 0, 'guest', '08-05-2013 08:55:28', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(96, 0, 0, 'guest', '08-05-2013 08:55:34', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(97, 0, 0, 'guest', '08-05-2013 08:55:39', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(98, 0, 0, 'guest', '08-05-2013 08:55:39', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(99, 0, 0, 'guest', '08-05-2013 08:55:43', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(100, 0, 0, 'guest', '08-05-2013 08:56:45', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(101, 0, 0, 'guest', '08-05-2013 08:56:46', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(102, 0, 0, 'guest', '08-05-2013 08:56:52', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(103, 0, 0, 'guest', '08-05-2013 09:04:59', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (24908)'),
(104, 0, 0, 'guest', '08-05-2013 09:05:03', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(105, 0, 0, 'guest', '08-05-2013 09:06:19', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (24908)'),
(106, 0, 0, 'guest', '08-05-2013 09:06:22', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(107, 0, 0, 'guest', '08-05-2013 09:07:49', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(108, 0, 0, 'guest', '08-05-2013 09:07:54', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (modules)'),
(109, 0, 0, 'guest', '08-05-2013 09:10:38', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(110, 0, 0, 'guest', '08-05-2013 09:11:04', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(111, 1, 0, 'dxadmin', '08-05-2013 09:14:13', 'INFO', 6, 'Successful Login'),
(112, 1, 0, 'dxadmin', '08-05-2013 09:14:14', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(113, 1, 0, 'dxadmin', '08-05-2013 09:19:27', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(114, 1, 0, 'dxadmin', '08-05-2013 09:25:27', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(115, 0, 0, 'guest', '08-05-2013 09:37:52', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(116, 0, 0, 'guest', '08-05-2013 09:38:33', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(117, 0, 0, 'guest', '08-05-2013 09:39:02', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(118, 0, 0, 'guest', '08-05-2013 10:02:41', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(119, 0, 0, 'guest', '08-05-2013 10:02:55', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (modules)'),
(120, 1, 0, 'dxadmin', '08-05-2013 10:17:11', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(121, 1, 0, 'dxadmin', '08-05-2013 10:17:44', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(122, 1, 0, 'dxadmin', '08-05-2013 10:18:30', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(123, 1, 0, 'dxadmin', '08-05-2013 10:18:31', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(124, 1, 0, 'dxadmin', '08-05-2013 10:18:31', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(125, 1, 0, 'dxadmin', '08-05-2013 10:18:31', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(126, 1, 0, 'dxadmin', '08-05-2013 10:18:32', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(127, 1, 0, 'dxadmin', '08-05-2013 10:18:33', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(128, 1, 0, 'dxadmin', '08-05-2013 10:18:33', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (js-src)'),
(129, 1, 0, 'dxadmin', '08-05-2013 10:18:33', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (js-src)'),
(130, 1, 0, 'dxadmin', '08-05-2013 10:18:33', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(131, 1, 0, 'dxadmin', '08-05-2013 10:18:33', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (js-src)'),
(132, 1, 0, 'dxadmin', '08-05-2013 10:18:34', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (js-src)'),
(133, 1, 0, 'dxadmin', '08-05-2013 10:18:34', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (js-src)'),
(134, 1, 0, 'dxadmin', '08-05-2013 10:18:35', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(135, 1, 0, 'dxadmin', '08-05-2013 10:18:35', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(136, 1, 0, 'dxadmin', '08-05-2013 10:21:53', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(137, 1, 0, 'dxadmin', '08-05-2013 10:22:03', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(138, 1, 0, 'dxadmin', '08-05-2013 10:41:13', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(139, 0, 0, 'guest', '08-05-2013 10:41:32', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (some)'),
(140, 0, 0, 'guest', '08-05-2013 10:41:40', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(141, 1, 0, 'dxadmin', '08-05-2013 10:42:23', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(142, 1, 0, 'dxadmin', '08-05-2013 10:42:27', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(143, 1, 0, 'dxadmin', '08-05-2013 10:43:25', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(144, 1, 0, 'dxadmin', '08-05-2013 10:43:25', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(145, 1, 0, 'dxadmin', '08-05-2013 11:14:52', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(146, 0, 0, 'guest', '08-05-2013 11:20:20', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(147, 1, 0, 'dxadmin', '08-05-2013 11:25:34', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(148, 1, 0, 'dxadmin', '08-05-2013 11:25:53', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(149, 1, 0, 'dxadmin', '08-05-2013 11:26:00', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(150, 1, 0, 'dxadmin', '08-05-2013 11:30:23', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(151, 1, 0, 'dxadmin', '08-05-2013 11:30:28', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(152, 1, 0, 'dxadmin', '08-05-2013 11:31:25', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(153, 1, 0, 'dxadmin', '08-05-2013 11:31:31', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(154, 1, 0, 'dxadmin', '08-05-2013 11:32:11', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(155, 1, 0, 'dxadmin', '08-05-2013 11:32:14', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(156, 1, 0, 'dxadmin', '08-05-2013 11:33:01', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(157, 1, 0, 'dxadmin', '08-05-2013 11:33:05', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(158, 1, 0, 'dxadmin', '08-05-2013 11:37:17', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(159, 1, 0, 'dxadmin', '08-05-2013 11:37:20', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(160, 0, 0, 'guest', '08-05-2013 11:38:54', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(161, 0, 0, 'guest', '08-05-2013 11:38:58', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(162, 0, 0, 'guest', '08-05-2013 11:38:58', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(163, 0, 0, 'guest', '08-05-2013 11:39:01', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(164, 1, 0, 'dxadmin', '08-05-2013 11:41:48', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(165, 1, 0, 'dxadmin', '08-05-2013 11:41:50', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(166, 1, 0, 'dxadmin', '08-05-2013 11:42:19', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(167, 0, 0, 'guest', '08-05-2013 11:50:20', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (some)'),
(168, 0, 0, 'guest', '08-05-2013 11:50:21', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(169, 0, 0, 'guest', '08-05-2013 11:50:46', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(170, 0, 0, 'guest', '08-05-2013 11:51:18', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(171, 0, 0, 'guest', '08-05-2013 11:51:22', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(172, 0, 0, 'guest', '08-05-2013 11:51:47', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(173, 0, 0, 'guest', '08-05-2013 11:51:50', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(174, 0, 0, 'guest', '08-05-2013 11:58:40', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(175, 0, 0, 'guest', '08-05-2013 11:58:42', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(176, 0, 0, 'guest', '08-05-2013 11:59:16', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(177, 0, 0, 'guest', '08-05-2013 11:59:18', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(178, 0, 0, 'guest', '08-05-2013 12:00:05', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(179, 0, 0, 'guest', '08-05-2013 12:02:19', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(180, 0, 0, 'guest', '08-05-2013 12:05:30', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(181, 0, 0, 'guest', '08-05-2013 12:06:07', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(182, 0, 0, 'guest', '08-05-2013 12:06:29', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(183, 0, 0, 'guest', '08-05-2013 12:12:15', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(184, 0, 0, 'guest', '08-05-2013 12:14:15', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(185, 0, 0, 'guest', '08-05-2013 12:14:37', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(186, 0, 0, 'guest', '08-05-2013 12:15:59', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(187, 0, 0, 'guest', '08-05-2013 12:16:12', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(188, 0, 0, 'guest', '08-05-2013 12:16:14', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(189, 0, 0, 'guest', '08-05-2013 12:23:28', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(190, 0, 0, 'guest', '08-05-2013 12:23:32', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(191, 0, 0, 'guest', '08-05-2013 12:24:13', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(192, 0, 0, 'guest', '08-05-2013 12:24:15', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(193, 0, 0, 'guest', '08-05-2013 12:28:56', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(194, 0, 0, 'guest', '08-05-2013 12:29:00', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(195, 0, 0, 'guest', '08-05-2013 12:31:06', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction');
INSERT INTO `log` (`logId`, `userId`, `fileId`, `userName`, `timeStamp`, `priorityName`, `priority`, `message`) VALUES
(196, 0, 0, 'guest', '08-05-2013 12:31:09', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(197, 0, 0, 'guest', '08-05-2013 12:31:50', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(198, 0, 0, 'guest', '08-05-2013 12:31:54', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(199, 0, 0, 'guest', '08-05-2013 12:33:51', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(200, 0, 0, 'guest', '08-05-2013 12:33:54', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(201, 0, 0, 'guest', '08-05-2013 12:37:36', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(202, 0, 0, 'guest', '08-05-2013 12:37:39', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(203, 0, 0, 'guest', '08-05-2013 12:38:12', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(204, 0, 0, 'guest', '08-05-2013 12:38:15', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(205, 0, 0, 'guest', '08-05-2013 12:44:10', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(206, 0, 0, 'guest', '08-05-2013 12:44:11', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(207, 0, 0, 'guest', '08-05-2013 12:44:25', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(208, 0, 0, 'guest', '08-05-2013 12:44:28', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(209, 0, 0, 'guest', '08-05-2013 12:44:43', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(210, 0, 0, 'guest', '08-05-2013 12:44:43', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(211, 0, 0, 'guest', '08-05-2013 12:44:54', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(212, 0, 0, 'guest', '08-05-2013 12:44:54', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(213, 1, 0, 'dxadmin', '08-05-2013 12:46:44', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(214, 1, 0, 'dxadmin', '08-05-2013 12:46:48', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(215, 1, 0, 'dxadmin', '08-05-2013 12:47:22', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(216, 1, 0, 'dxadmin', '08-05-2013 12:47:26', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(217, 1, 0, 'dxadmin', '08-05-2013 12:48:04', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(218, 1, 0, 'dxadmin', '08-05-2013 12:48:08', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(219, 1, 0, 'dxadmin', '08-05-2013 01:48:34', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(220, 1, 0, 'dxadmin', '08-05-2013 01:59:54', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(221, 1, 0, 'dxadmin', '08-05-2013 01:59:55', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(222, 1, 0, 'dxadmin', '08-05-2013 02:05:29', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(223, 1, 0, 'dxadmin', '08-05-2013 02:05:30', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(224, 1, 0, 'dxadmin', '08-05-2013 02:06:37', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(225, 1, 0, 'dxadmin', '08-05-2013 02:06:38', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(226, 1, 0, 'dxadmin', '08-05-2013 02:07:32', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(227, 1, 0, 'dxadmin', '08-05-2013 02:07:33', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(228, 1, 0, 'dxadmin', '08-05-2013 02:10:24', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(229, 1, 0, 'dxadmin', '08-05-2013 02:10:25', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(230, 1, 0, 'dxadmin', '08-05-2013 02:13:07', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(231, 1, 0, 'dxadmin', '08-05-2013 02:13:08', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(232, 1, 0, 'dxadmin', '08-05-2013 02:13:17', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(233, 1, 0, 'dxadmin', '08-05-2013 02:13:18', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(234, 1, 0, 'dxadmin', '08-05-2013 02:16:35', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(235, 1, 0, 'dxadmin', '08-05-2013 02:16:36', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(236, 1, 0, 'dxadmin', '08-05-2013 02:17:55', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(237, 1, 0, 'dxadmin', '08-05-2013 02:17:57', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(238, 1, 0, 'dxadmin', '08-05-2013 02:19:00', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(239, 1, 0, 'dxadmin', '08-05-2013 02:19:03', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(240, 1, 0, 'dxadmin', '08-05-2013 02:19:46', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(241, 1, 0, 'dxadmin', '08-05-2013 02:19:46', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(242, 1, 0, 'dxadmin', '08-05-2013 02:20:08', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(243, 1, 0, 'dxadmin', '08-05-2013 02:20:10', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(244, 1, 0, 'dxadmin', '08-05-2013 02:20:45', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(245, 1, 0, 'dxadmin', '08-05-2013 02:20:47', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(246, 1, 0, 'dxadmin', '08-05-2013 02:21:28', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(247, 1, 0, 'dxadmin', '08-05-2013 02:25:36', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(248, 1, 0, 'dxadmin', '08-05-2013 02:26:20', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(249, 1, 0, 'dxadmin', '08-05-2013 02:28:18', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(250, 1, 0, 'dxadmin', '08-05-2013 02:29:05', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(251, 1, 0, 'dxadmin', '08-05-2013 02:29:11', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(252, 1, 0, 'dxadmin', '08-05-2013 02:29:22', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(253, 1, 0, 'dxadmin', '08-05-2013 02:30:06', 'INFO', 6, 'New Menu Created'),
(254, 1, 0, 'dxadmin', '08-05-2013 02:30:07', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(255, 1, 0, 'dxadmin', '08-05-2013 02:30:14', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(256, 1, 0, 'dxadmin', '08-05-2013 02:30:20', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(257, 1, 0, 'dxadmin', '08-05-2013 02:31:04', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(258, 1, 0, 'dxadmin', '08-05-2013 02:31:09', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(259, 1, 0, 'dxadmin', '08-05-2013 02:31:12', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(260, 1, 0, 'dxadmin', '08-05-2013 02:31:34', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(261, 1, 0, 'dxadmin', '08-05-2013 02:31:38', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(262, 1, 0, 'dxadmin', '08-05-2013 02:31:47', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(263, 1, 0, 'dxadmin', '08-05-2013 02:32:00', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(264, 1, 0, 'dxadmin', '08-05-2013 02:32:13', 'CRIT', 2, 'exception ''PDOException'' with message ''SQLSTATE[HY093]: Invalid parameter number: no parameters were bound'' in /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Db/Statement/Pdo.php:228\nStack trace:\n#0 /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Db/Statement/Pdo.php(228): PDOStatement->execute(Array)\n#1 /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Db/Statement.php(303): Zend_Db_Statement_Pdo->_execute(Array)\n#2 /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Db/Adapter/Abstract.php(479): Zend_Db_Statement->execute(Array)\n#3 /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Db/Adapter/Pdo/Abstract.php(238): Zend_Db_Adapter_Abstract->query(Object(Zend_Db_Table_Select), Array)\n#4 /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Db/Table/Abstract.php(1575): Zend_Db_Adapter_Pdo_Abstract->query(Object(Zend_Db_Table_Select))\n#5 /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Db/Table/Abstract.php(1390): Zend_Db_Table_Abstract->_fetch(Object(Zend_Db_Table_Select))\n#6 /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/models/Category.php(150): Zend_Db_Table_Abstract->fetchAll(Object(Zend_Db_Table_Select))\n#7 /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/AdminController.php(199): Menu_Model_Category->fetchParentDropDown()\n#8 /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Action.php(516): Menu_AdminController->createCategoryAction()\n#9 /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php(308): Zend_Controller_Action->dispatch(''createCategoryA...'')\n#10 /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Front.php(954): Zend_Controller_Dispatcher_Standard->dispatch(Object(Zend_Controller_Request_Http), Object(Zend_Controller_Response_Http))\n#11 /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Application/Bootstrap/Bootstrap.php(97): Zend_Controller_Front->dispatch()\n#12 /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Application.php(366): Zend_Application_Bootstrap_Bootstrap->run()\n#13 /Volumes/Web/Library/WebServer/www/theridge/public/index.php(28): Zend_Application->run()\n#14 {main}\n\nNext exception ''Zend_Db_Statement_Exception'' with message ''SQLSTATE[HY093]: Invalid parameter number: no parameters were bound'' in /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Db/Statement/Pdo.php:234\nStack trace:\n#0 /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Db/Statement.php(303): Zend_Db_Statement_Pdo->_execute(Array)\n#1 /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Db/Adapter/Abstract.php(479): Zend_Db_Statement->execute(Array)\n#2 /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Db/Adapter/Pdo/Abstract.php(238): Zend_Db_Adapter_Abstract->query(Object(Zend_Db_Table_Select), Array)\n#3 /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Db/Table/Abstract.php(1575): Zend_Db_Adapter_Pdo_Abstract->query(Object(Zend_Db_Table_Select))\n#4 /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Db/Table/Abstract.php(1390): Zend_Db_Table_Abstract->_fetch(Object(Zend_Db_Table_Select))\n#5 /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/models/Category.php(150): Zend_Db_Table_Abstract->fetchAll(Object(Zend_Db_Table_Select))\n#6 /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/AdminController.php(199): Menu_Model_Category->fetchParentDropDown()\n#7 /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Action.php(516): Menu_AdminController->createCategoryAction()\n#8 /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php(308): Zend_Controller_Action->dispatch(''createCategoryA...'')\n#9 /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Front.php(954): Zend_Controller_Dispatcher_Standard->dispatch(Object(Zend_Controller_Request_Http), Object(Zend_Controller_Response_Http))\n#10 /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Application/Bootstrap/Bootstrap.php(97): Zend_Controller_Front->dispatch()\n#11 /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Application.php(366): Zend_Application_Bootstrap_Bootstrap->run()\n#12 /Volumes/Web/Library/WebServer/www/theridge/public/index.php(28): Zend_Application->run()\n#13 {main}'),
(265, 1, 0, 'dxadmin', '08-05-2013 02:32:13', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(266, 1, 0, 'dxadmin', '08-05-2013 02:32:19', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(267, 1, 0, 'dxadmin', '08-05-2013 02:32:43', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(268, 1, 0, 'dxadmin', '08-05-2013 02:33:23', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(269, 1, 0, 'dxadmin', '08-05-2013 02:33:26', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(270, 1, 0, 'dxadmin', '08-05-2013 02:37:38', 'CRIT', 2, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Db/Statement/Pdo.php, Line Number:: 234, Exception Message:: SQLSTATE[HY093]: Invalid parameter number: no parameters were bound'),
(271, 1, 0, 'dxadmin', '08-05-2013 02:37:39', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(272, 1, 0, 'dxadmin', '08-05-2013 02:37:39', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(273, 1, 0, 'dxadmin', '08-05-2013 02:38:43', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(274, 1, 0, 'dxadmin', '08-05-2013 02:38:52', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(275, 1, 0, 'dxadmin', '08-05-2013 02:39:02', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(276, 1, 0, 'dxadmin', '08-05-2013 02:39:07', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(277, 1, 0, 'dxadmin', '08-05-2013 02:39:10', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(278, 1, 0, 'dxadmin', '08-05-2013 02:39:18', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(279, 1, 0, 'dxadmin', '08-05-2013 02:53:31', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(280, 1, 0, 'dxadmin', '08-05-2013 02:53:44', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(281, 1, 0, 'dxadmin', '08-05-2013 02:53:46', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(282, 1, 0, 'dxadmin', '08-05-2013 02:54:41', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(283, 1, 0, 'dxadmin', '08-05-2013 02:54:47', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(284, 1, 0, 'dxadmin', '08-05-2013 02:54:58', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(285, 1, 0, 'dxadmin', '08-05-2013 02:55:18', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(286, 1, 0, 'dxadmin', '08-05-2013 03:00:07', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(287, 1, 0, 'dxadmin', '08-05-2013 03:00:11', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(288, 1, 0, 'dxadmin', '08-05-2013 03:00:52', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(289, 1, 0, 'dxadmin', '08-05-2013 03:01:01', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(290, 1, 0, 'dxadmin', '08-05-2013 03:02:29', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(291, 1, 0, 'dxadmin', '08-05-2013 03:04:01', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(292, 1, 0, 'dxadmin', '08-05-2013 03:06:41', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(293, 1, 0, 'dxadmin', '08-05-2013 03:06:57', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(294, 1, 0, 'dxadmin', '08-05-2013 03:09:05', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(295, 1, 0, 'dxadmin', '08-05-2013 03:09:23', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(296, 1, 0, 'dxadmin', '08-05-2013 03:15:57', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(297, 1, 0, 'dxadmin', '08-05-2013 03:16:15', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(298, 1, 0, 'dxadmin', '08-05-2013 03:16:33', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(299, 1, 0, 'dxadmin', '08-05-2013 03:16:51', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(300, 1, 0, 'dxadmin', '08-05-2013 03:17:57', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(301, 1, 0, 'dxadmin', '08-05-2013 03:19:13', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(302, 1, 0, 'dxadmin', '08-05-2013 03:21:03', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(303, 0, 0, 'guest', '08-05-2013 03:21:29', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(304, 0, 0, 'guest', '08-05-2013 03:21:31', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(305, 0, 0, 'guest', '08-05-2013 03:21:34', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(306, 1, 0, 'dxadmin', '08-05-2013 03:30:50', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (menu)'),
(307, 1, 0, 'dxadmin', '08-05-2013 03:35:18', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Action.php, Line Number:: 485, Exception Message:: Action "managecategory" does not exist and was not trapped in __call()'),
(308, 1, 0, 'dxadmin', '08-05-2013 03:35:27', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(309, 1, 0, 'dxadmin', '08-05-2013 03:35:33', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Action.php, Line Number:: 485, Exception Message:: Action "managecategory" does not exist and was not trapped in __call()'),
(310, 1, 0, 'dxadmin', '08-05-2013 03:36:51', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Action.php, Line Number:: 485, Exception Message:: Action "managecategory" does not exist and was not trapped in __call()'),
(311, 1, 0, 'dxadmin', '08-05-2013 03:37:11', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Action.php, Line Number:: 485, Exception Message:: Action "managecategory" does not exist and was not trapped in __call()'),
(312, 1, 0, 'dxadmin', '08-05-2013 03:37:41', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(313, 1, 0, 'dxadmin', '08-05-2013 03:39:56', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(314, 1, 0, 'dxadmin', '08-05-2013 03:40:02', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(315, 1, 0, 'dxadmin', '08-05-2013 03:41:36', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(316, 1, 0, 'dxadmin', '08-05-2013 03:41:47', 'CRIT', 2, 'exception ''PDOException'' with message ''SQLSTATE[HY093]: Invalid parameter number: no parameters were bound'' in /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Statement/Pdo.php:228\nStack trace:\n#0 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Statement/Pdo.php(228): PDOStatement->execute(Array)\n#1 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Statement.php(303): Zend_Db_Statement_Pdo->_execute(Array)\n#2 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Adapter/Abstract.php(479): Zend_Db_Statement->execute(Array)\n#3 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Adapter/Pdo/Abstract.php(238): Zend_Db_Adapter_Abstract->query(Object(Zend_Db_Table_Select), Array)\n#4 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Table/Abstract.php(1575): Zend_Db_Adapter_Pdo_Abstract->query(Object(Zend_Db_Table_Select))\n#5 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Table/Abstract.php(1390): Zend_Db_Table_Abstract->_fetch(Object(Zend_Db_Table_Select))\n#6 /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/models/Category.php(150): Zend_Db_Table_Abstract->fetchAll(Object(Zend_Db_Table_Select))\n#7 /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/AdminController.php(203): Menu_Model_Category->fetchParentDropDown()\n#8 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Action.php(516): Menu_AdminController->createCategoryAction()\n#9 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php(308): Zend_Controller_Action->dispatch(''createCategoryA...'')\n#10 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Front.php(954): Zend_Controller_Dispatcher_Standard->dispatch(Object(Zend_Controller_Request_Http), Object(Zend_Controller_Response_Http))\n#11 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Application/Bootstrap/Bootstrap.php(97): Zend_Controller_Front->dispatch()\n#12 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Application.php(366): Zend_Application_Bootstrap_Bootstrap->run()\n#13 /Volumes/Web/Library/WebServer/www/theridge/public/index.php(28): Zend_Application->run()\n#14 {main}\n\nNext exception ''Zend_Db_Statement_Exception'' with message ''SQLSTATE[HY093]: Invalid parameter number: no parameters were bound'' in /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Statement/Pdo.php:234\nStack trace:\n#0 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Statement.php(303): Zend_Db_Statement_Pdo->_execute(Array)\n#1 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Adapter/Abstract.php(479): Zend_Db_Statement->execute(Array)\n#2 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Adapter/Pdo/Abstract.php(238): Zend_Db_Adapter_Abstract->query(Object(Zend_Db_Table_Select), Array)\n#3 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Table/Abstract.php(1575): Zend_Db_Adapter_Pdo_Abstract->query(Object(Zend_Db_Table_Select))\n#4 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Table/Abstract.php(1390): Zend_Db_Table_Abstract->_fetch(Object(Zend_Db_Table_Select))\n#5 /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/models/Category.php(150): Zend_Db_Table_Abstract->fetchAll(Object(Zend_Db_Table_Select))\n#6 /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/AdminController.php(203): Menu_Model_Category->fetchParentDropDown()\n#7 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Action.php(516): Menu_AdminController->createCategoryAction()\n#8 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php(308): Zend_Controller_Action->dispatch(''createCategoryA...'')\n#9 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Front.php(954): Zend_Controller_Dispatcher_Standard->dispatch(Object(Zend_Controller_Request_Http), Object(Zend_Controller_Response_Http))\n#10 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Application/Bootstrap/Bootstrap.php(97): Zend_Controller_Front->dispatch()\n#11 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Application.php(366): Zend_Application_Bootstrap_Bootstrap->run()\n#12 /Volumes/Web/Library/WebServer/www/theridge/public/index.php(28): Zend_Application->run()\n#13 {main}'),
(317, 1, 0, 'dxadmin', '08-05-2013 03:41:47', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(318, 1, 0, 'dxadmin', '08-05-2013 03:42:31', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(319, 1, 0, 'dxadmin', '08-05-2013 03:42:35', 'CRIT', 2, 'exception ''PDOException'' with message ''SQLSTATE[HY093]: Invalid parameter number: no parameters were bound'' in /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Statement/Pdo.php:228\nStack trace:\n#0 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Statement/Pdo.php(228): PDOStatement->execute(Array)\n#1 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Statement.php(303): Zend_Db_Statement_Pdo->_execute(Array)\n#2 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Adapter/Abstract.php(479): Zend_Db_Statement->execute(Array)\n#3 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Adapter/Pdo/Abstract.php(238): Zend_Db_Adapter_Abstract->query(Object(Zend_Db_Table_Select), Array)\n#4 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Table/Abstract.php(1575): Zend_Db_Adapter_Pdo_Abstract->query(Object(Zend_Db_Table_Select))\n#5 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Table/Abstract.php(1390): Zend_Db_Table_Abstract->_fetch(Object(Zend_Db_Table_Select))\n#6 /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/models/Category.php(150): Zend_Db_Table_Abstract->fetchAll(Object(Zend_Db_Table_Select))\n#7 /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/AdminController.php(203): Menu_Model_Category->fetchParentDropDown()\n#8 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Action.php(516): Menu_AdminController->createCategoryAction()\n#9 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php(308): Zend_Controller_Action->dispatch(''createCategoryA...'')\n#10 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Front.php(954): Zend_Controller_Dispatcher_Standard->dispatch(Object(Zend_Controller_Request_Http), Object(Zend_Controller_Response_Http))\n#11 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Application/Bootstrap/Bootstrap.php(97): Zend_Controller_Front->dispatch()\n#12 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Application.php(366): Zend_Application_Bootstrap_Bootstrap->run()\n#13 /Volumes/Web/Library/WebServer/www/theridge/public/index.php(28): Zend_Application->run()\n#14 {main}\n\nNext exception ''Zend_Db_Statement_Exception'' with message ''SQLSTATE[HY093]: Invalid parameter number: no parameters were bound'' in /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Statement/Pdo.php:234\nStack trace:\n#0 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Statement.php(303): Zend_Db_Statement_Pdo->_execute(Array)\n#1 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Adapter/Abstract.php(479): Zend_Db_Statement->execute(Array)\n#2 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Adapter/Pdo/Abstract.php(238): Zend_Db_Adapter_Abstract->query(Object(Zend_Db_Table_Select), Array)\n#3 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Table/Abstract.php(1575): Zend_Db_Adapter_Pdo_Abstract->query(Object(Zend_Db_Table_Select))\n#4 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Table/Abstract.php(1390): Zend_Db_Table_Abstract->_fetch(Object(Zend_Db_Table_Select))\n#5 /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/models/Category.php(150): Zend_Db_Table_Abstract->fetchAll(Object(Zend_Db_Table_Select))\n#6 /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/AdminController.php(203): Menu_Model_Category->fetchParentDropDown()\n#7 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Action.php(516): Menu_AdminController->createCategoryAction()\n#8 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php(308): Zend_Controller_Action->dispatch(''createCategoryA...'')\n#9 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Front.php(954): Zend_Controller_Dispatcher_Standard->dispatch(Object(Zend_Controller_Request_Http), Object(Zend_Controller_Response_Http))\n#10 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Application/Bootstrap/Bootstrap.php(97): Zend_Controller_Front->dispatch()\n#11 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Application.php(366): Zend_Application_Bootstrap_Bootstrap->run()\n#12 /Volumes/Web/Library/WebServer/www/theridge/public/index.php(28): Zend_Application->run()\n#13 {main}'),
(320, 1, 0, 'dxadmin', '08-05-2013 03:42:35', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(321, 1, 0, 'dxadmin', '08-05-2013 03:44:49', 'CRIT', 2, 'exception ''PDOException'' with message ''SQLSTATE[HY093]: Invalid parameter number: no parameters were bound'' in /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Statement/Pdo.php:228\nStack trace:\n#0 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Statement/Pdo.php(228): PDOStatement->execute(Array)\n#1 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Statement.php(303): Zend_Db_Statement_Pdo->_execute(Array)\n#2 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Adapter/Abstract.php(479): Zend_Db_Statement->execute(Array)\n#3 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Adapter/Pdo/Abstract.php(238): Zend_Db_Adapter_Abstract->query(Object(Zend_Db_Table_Select), Array)\n#4 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Table/Abstract.php(1575): Zend_Db_Adapter_Pdo_Abstract->query(Object(Zend_Db_Table_Select))\n#5 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Table/Abstract.php(1390): Zend_Db_Table_Abstract->_fetch(Object(Zend_Db_Table_Select))\n#6 /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/models/Category.php(150): Zend_Db_Table_Abstract->fetchAll(Object(Zend_Db_Table_Select))\n#7 /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/AdminController.php(203): Menu_Model_Category->fetchParentDropDown()\n#8 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Action.php(516): Menu_AdminController->createCategoryAction()\n#9 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php(308): Zend_Controller_Action->dispatch(''createCategoryA...'')\n#10 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Front.php(954): Zend_Controller_Dispatcher_Standard->dispatch(Object(Zend_Controller_Request_Http), Object(Zend_Controller_Response_Http))\n#11 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Application/Bootstrap/Bootstrap.php(97): Zend_Controller_Front->dispatch()\n#12 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Application.php(366): Zend_Application_Bootstrap_Bootstrap->run()\n#13 /Volumes/Web/Library/WebServer/www/theridge/public/index.php(28): Zend_Application->run()\n#14 {main}\n\nNext exception ''Zend_Db_Statement_Exception'' with message ''SQLSTATE[HY093]: Invalid parameter number: no parameters were bound'' in /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Statement/Pdo.php:234\nStack trace:\n#0 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Statement.php(303): Zend_Db_Statement_Pdo->_execute(Array)\n#1 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Adapter/Abstract.php(479): Zend_Db_Statement->execute(Array)\n#2 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Adapter/Pdo/Abstract.php(238): Zend_Db_Adapter_Abstract->query(Object(Zend_Db_Table_Select), Array)\n#3 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Table/Abstract.php(1575): Zend_Db_Adapter_Pdo_Abstract->query(Object(Zend_Db_Table_Select))\n#4 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Table/Abstract.php(1390): Zend_Db_Table_Abstract->_fetch(Object(Zend_Db_Table_Select))\n#5 /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/models/Category.php(150): Zend_Db_Table_Abstract->fetchAll(Object(Zend_Db_Table_Select))\n#6 /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/AdminController.php(203): Menu_Model_Category->fetchParentDropDown()\n#7 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Action.php(516): Menu_AdminController->createCategoryAction()\n#8 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php(308): Zend_Controller_Action->dispatch(''createCategoryA...'')\n#9 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Front.php(954): Zend_Controller_Dispatcher_Standard->dispatch(Object(Zend_Controller_Request_Http), Object(Zend_Controller_Response_Http))\n#10 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Application/Bootstrap/Bootstrap.php(97): Zend_Controller_Front->dispatch()\n#11 /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Application.php(366): Zend_Application_Bootstrap_Bootstrap->run()\n#12 /Volumes/Web/Library/WebServer/www/theridge/public/index.php(28): Zend_Application->run()\n#13 {main}'),
(322, 1, 0, 'dxadmin', '08-05-2013 03:44:50', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(323, 1, 0, 'dxadmin', '08-05-2013 03:44:55', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(324, 1, 0, 'dxadmin', '08-05-2013 03:46:35', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)');
INSERT INTO `log` (`logId`, `userId`, `fileId`, `userName`, `timeStamp`, `priorityName`, `priority`, `message`) VALUES
(325, 1, 0, 'dxadmin', '08-05-2013 03:46:52', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(326, 1, 0, 'dxadmin', '08-05-2013 03:47:45', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(327, 1, 0, 'dxadmin', '08-05-2013 03:48:47', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(328, 1, 0, 'dxadmin', '08-05-2013 03:57:46', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(329, 1, 0, 'dxadmin', '08-05-2013 03:58:00', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(330, 1, 0, 'dxadmin', '08-05-2013 03:58:48', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(331, 1, 0, 'dxadmin', '08-05-2013 03:59:09', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(332, 1, 0, 'dxadmin', '08-05-2013 03:59:22', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(333, 1, 0, 'dxadmin', '08-05-2013 04:02:43', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(334, 1, 0, 'dxadmin', '08-05-2013 04:02:43', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(335, 1, 0, 'dxadmin', '08-05-2013 04:05:27', 'CRIT', 2, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Db/Statement/Pdo.php, Line Number:: 234, Exception Message:: SQLSTATE[HY093]: Invalid parameter number: no parameters were bound'),
(336, 1, 0, 'dxadmin', '08-05-2013 04:05:27', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(337, 1, 0, 'dxadmin', '08-05-2013 04:05:29', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(338, 1, 0, 'dxadmin', '08-05-2013 04:05:29', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(339, 1, 0, 'dxadmin', '08-05-2013 04:05:29', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/admin/controllers/AjaxController.php, Line Number:: 23, Exception Message:: Not Found'),
(340, 1, 0, 'dxadmin', '08-05-2013 04:05:30', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(341, 1, 0, 'dxadmin', '08-05-2013 04:07:19', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(342, 1, 0, 'dxadmin', '08-05-2013 04:07:20', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(343, 1, 0, 'dxadmin', '08-05-2013 04:07:20', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/admin/controllers/AjaxController.php, Line Number:: 23, Exception Message:: Not Found'),
(344, 1, 0, 'dxadmin', '08-05-2013 04:08:36', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(345, 0, 0, 'guest', '08-05-2013 04:08:45', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(346, 0, 0, 'guest', '08-05-2013 04:08:49', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(347, 0, 0, 'guest', '08-05-2013 04:08:51', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(348, 0, 0, 'guest', '08-05-2013 04:08:52', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(349, 0, 0, 'guest', '08-05-2013 04:08:56', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (modules)'),
(350, 0, 0, 'guest', '08-05-2013 04:08:57', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(351, 1, 0, 'dxadmin', '08-05-2013 04:09:16', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(352, 1, 0, 'dxadmin', '08-05-2013 04:09:18', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(353, 1, 0, 'dxadmin', '08-05-2013 04:09:18', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/admin/controllers/AjaxController.php, Line Number:: 23, Exception Message:: Not Found'),
(354, 1, 0, 'dxadmin', '08-05-2013 04:09:21', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(355, 1, 0, 'dxadmin', '08-05-2013 04:09:23', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(356, 1, 0, 'dxadmin', '08-05-2013 04:09:34', 'INFO', 6, 'New Menu Created'),
(357, 1, 0, 'dxadmin', '08-05-2013 04:09:35', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(358, 1, 0, 'dxadmin', '08-05-2013 04:09:36', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(359, 1, 0, 'dxadmin', '08-05-2013 04:09:36', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/admin/controllers/AjaxController.php, Line Number:: 23, Exception Message:: Not Found'),
(360, 1, 0, 'dxadmin', '08-05-2013 04:09:47', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(361, 1, 0, 'dxadmin', '08-05-2013 04:09:48', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(362, 1, 0, 'dxadmin', '08-05-2013 04:13:23', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(363, 1, 0, 'dxadmin', '08-05-2013 04:13:25', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(364, 1, 0, 'dxadmin', '08-05-2013 04:13:25', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/admin/controllers/AjaxController.php, Line Number:: 23, Exception Message:: Not Found'),
(365, 1, 0, 'dxadmin', '08-05-2013 04:24:02', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(366, 1, 0, 'dxadmin', '08-05-2013 04:24:28', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(367, 1, 0, 'dxadmin', '08-05-2013 04:24:31', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(368, 1, 0, 'dxadmin', '08-05-2013 04:24:31', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/admin/controllers/AjaxController.php, Line Number:: 23, Exception Message:: Not Found'),
(369, 1, 0, 'dxadmin', '08-05-2013 04:25:27', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(370, 1, 0, 'dxadmin', '08-05-2013 04:25:28', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(371, 0, 0, 'guest', '08-05-2013 04:26:03', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(372, 0, 0, 'guest', '08-05-2013 04:26:06', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(373, 0, 0, 'guest', '08-05-2013 04:26:08', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(374, 1, 0, 'dxadmin', '08-05-2013 04:27:14', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(375, 1, 0, 'dxadmin', '08-05-2013 04:27:17', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(376, 1, 0, 'dxadmin', '08-05-2013 04:27:18', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/admin/controllers/AjaxController.php, Line Number:: 23, Exception Message:: Not Found'),
(377, 1, 0, 'dxadmin', '08-05-2013 04:27:33', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(378, 1, 0, 'dxadmin', '08-05-2013 04:27:48', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(379, 1, 0, 'dxadmin', '08-05-2013 04:27:50', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(380, 1, 0, 'dxadmin', '08-05-2013 04:28:02', 'INFO', 6, 'New Category Created'),
(381, 1, 0, 'dxadmin', '08-05-2013 04:28:03', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(382, 1, 0, 'dxadmin', '08-05-2013 04:28:05', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(383, 1, 0, 'dxadmin', '08-05-2013 04:28:05', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/admin/controllers/AjaxController.php, Line Number:: 23, Exception Message:: Not Found'),
(384, 1, 0, 'dxadmin', '08-05-2013 04:28:16', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(385, 1, 0, 'dxadmin', '08-05-2013 04:28:18', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(386, 1, 0, 'dxadmin', '08-05-2013 04:28:18', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/admin/controllers/AjaxController.php, Line Number:: 23, Exception Message:: Not Found'),
(387, 1, 0, 'dxadmin', '08-05-2013 04:28:25', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(388, 1, 0, 'dxadmin', '08-05-2013 04:28:26', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(389, 1, 0, 'dxadmin', '08-05-2013 04:28:26', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/admin/controllers/AjaxController.php, Line Number:: 23, Exception Message:: Not Found'),
(390, 1, 0, 'dxadmin', '08-05-2013 04:28:30', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(391, 1, 0, 'dxadmin', '08-05-2013 04:28:31', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(392, 1, 0, 'dxadmin', '08-05-2013 04:28:44', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(393, 1, 0, 'dxadmin', '08-05-2013 04:28:45', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(394, 1, 0, 'dxadmin', '08-05-2013 04:28:45', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/admin/controllers/AjaxController.php, Line Number:: 23, Exception Message:: Not Found'),
(395, 1, 0, 'dxadmin', '08-05-2013 04:28:50', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(396, 1, 0, 'dxadmin', '08-05-2013 04:28:51', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(397, 1, 0, 'dxadmin', '08-05-2013 04:29:08', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(398, 1, 0, 'dxadmin', '08-05-2013 04:29:10', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(399, 1, 0, 'dxadmin', '08-05-2013 04:29:10', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/admin/controllers/AjaxController.php, Line Number:: 23, Exception Message:: Not Found'),
(400, 1, 0, 'dxadmin', '08-05-2013 04:29:13', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(401, 1, 0, 'dxadmin', '08-05-2013 04:29:15', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(402, 1, 0, 'dxadmin', '08-05-2013 04:29:26', 'INFO', 6, 'New Category Created'),
(403, 1, 0, 'dxadmin', '08-05-2013 04:29:27', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(404, 1, 0, 'dxadmin', '08-05-2013 04:29:29', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(405, 1, 0, 'dxadmin', '08-05-2013 04:29:29', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/admin/controllers/AjaxController.php, Line Number:: 23, Exception Message:: Not Found'),
(406, 1, 0, 'dxadmin', '08-05-2013 04:29:33', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(407, 1, 0, 'dxadmin', '08-05-2013 04:29:35', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(408, 1, 0, 'dxadmin', '08-05-2013 04:29:35', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/admin/controllers/AjaxController.php, Line Number:: 23, Exception Message:: Not Found'),
(409, 1, 0, 'dxadmin', '08-05-2013 04:29:40', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(410, 1, 0, 'dxadmin', '08-05-2013 04:29:41', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(411, 1, 0, 'dxadmin', '08-05-2013 04:29:41', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/admin/controllers/AjaxController.php, Line Number:: 23, Exception Message:: Not Found'),
(412, 1, 0, 'dxadmin', '08-05-2013 04:29:51', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(413, 1, 0, 'dxadmin', '08-05-2013 04:29:52', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(414, 1, 0, 'dxadmin', '08-05-2013 04:30:12', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(415, 1, 0, 'dxadmin', '08-05-2013 04:30:13', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(416, 1, 0, 'dxadmin', '08-05-2013 04:30:13', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/admin/controllers/AjaxController.php, Line Number:: 23, Exception Message:: Not Found'),
(417, 1, 0, 'dxadmin', '08-05-2013 04:30:23', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(418, 1, 0, 'dxadmin', '08-05-2013 04:30:25', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(419, 1, 0, 'dxadmin', '08-05-2013 04:34:14', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(420, 1, 0, 'dxadmin', '08-05-2013 04:34:19', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(421, 1, 0, 'dxadmin', '08-05-2013 04:34:27', 'INFO', 6, 'New Category Created'),
(422, 1, 0, 'dxadmin', '08-05-2013 04:34:28', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(423, 1, 0, 'dxadmin', '08-05-2013 04:34:33', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(424, 1, 0, 'dxadmin', '08-05-2013 04:34:42', 'INFO', 6, 'New Category Created'),
(425, 1, 0, 'dxadmin', '08-05-2013 04:34:43', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(426, 1, 0, 'dxadmin', '08-05-2013 04:34:47', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(427, 1, 0, 'dxadmin', '08-05-2013 04:34:55', 'INFO', 6, 'New Category Created'),
(428, 1, 0, 'dxadmin', '08-05-2013 04:34:56', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(429, 1, 0, 'dxadmin', '08-05-2013 04:34:59', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(430, 1, 0, 'dxadmin', '08-05-2013 04:35:03', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (menu)'),
(431, 1, 0, 'dxadmin', '08-05-2013 04:35:16', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(432, 1, 0, 'dxadmin', '08-05-2013 04:40:14', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(433, 1, 0, 'dxadmin', '08-05-2013 04:40:17', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(434, 1, 0, 'dxadmin', '08-05-2013 04:40:24', 'INFO', 6, 'New Category Created'),
(435, 1, 0, 'dxadmin', '08-05-2013 04:40:25', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(436, 1, 0, 'dxadmin', '08-05-2013 04:41:15', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(437, 1, 0, 'dxadmin', '08-05-2013 04:41:21', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(438, 1, 0, 'dxadmin', '08-05-2013 04:41:33', 'INFO', 6, 'New Category Created'),
(439, 1, 0, 'dxadmin', '08-05-2013 04:41:34', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(440, 1, 0, 'dxadmin', '08-05-2013 04:42:17', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(441, 1, 0, 'dxadmin', '08-05-2013 04:42:44', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(442, 1, 0, 'dxadmin', '08-05-2013 04:43:17', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(443, 1, 0, 'dxadmin', '08-05-2013 04:43:38', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(444, 1, 0, 'dxadmin', '08-05-2013 04:44:02', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(445, 1, 0, 'dxadmin', '08-05-2013 04:44:24', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(446, 1, 0, 'dxadmin', '08-05-2013 04:44:34', 'INFO', 6, 'New Category Created'),
(447, 1, 0, 'dxadmin', '08-05-2013 04:44:35', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(448, 1, 0, 'dxadmin', '08-05-2013 04:44:42', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(449, 1, 0, 'dxadmin', '08-05-2013 04:45:18', 'INFO', 6, 'New Item Created'),
(450, 1, 0, 'dxadmin', '08-05-2013 04:45:19', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(451, 1, 0, 'dxadmin', '08-05-2013 04:45:24', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(452, 1, 0, 'dxadmin', '08-05-2013 04:45:52', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(453, 1, 0, 'dxadmin', '08-05-2013 04:45:54', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(454, 1, 0, 'dxadmin', '08-05-2013 04:46:02', 'INFO', 6, 'New Item Created'),
(455, 1, 0, 'dxadmin', '08-05-2013 04:46:03', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(456, 1, 0, 'dxadmin', '08-05-2013 04:46:09', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(457, 1, 0, 'dxadmin', '08-05-2013 04:46:14', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(458, 1, 0, 'dxadmin', '08-05-2013 04:46:26', 'CRIT', 2, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/View/Abstract.php, Line Number:: 988, Exception Message:: script ''/partials/ui-albums.phtml'' not found in path (/Volumes/Web/Library/WebServer/www/theridge/application/skins/default/scripts/)'),
(459, 1, 0, 'dxadmin', '08-05-2013 04:47:21', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(460, 1, 0, 'dxadmin', '08-05-2013 04:48:02', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(461, 1, 0, 'dxadmin', '08-05-2013 04:48:15', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(462, 1, 0, 'dxadmin', '08-05-2013 04:50:04', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(463, 1, 0, 'dxadmin', '08-05-2013 04:51:07', 'INFO', 6, 'New Item Created'),
(464, 1, 0, 'dxadmin', '08-05-2013 04:51:08', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(465, 1, 0, 'dxadmin', '08-05-2013 04:51:15', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(466, 1, 0, 'dxadmin', '08-05-2013 04:51:36', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(467, 1, 0, 'dxadmin', '08-05-2013 04:51:41', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(468, 1, 0, 'dxadmin', '08-05-2013 04:51:46', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(469, 1, 0, 'dxadmin', '08-05-2013 04:51:48', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(470, 1, 0, 'dxadmin', '08-05-2013 04:51:52', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (menu)'),
(471, 1, 0, 'dxadmin', '08-05-2013 05:35:48', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(472, 1, 0, 'dxadmin', '08-05-2013 05:35:52', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(473, 1, 0, 'dxadmin', '08-05-2013 05:36:10', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(474, 0, 0, 'guest', '08-05-2013 05:38:29', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(475, 0, 0, 'guest', '08-05-2013 05:38:32', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(476, 0, 0, 'guest', '08-05-2013 05:38:35', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(477, 1, 0, 'dxadmin', '08-05-2013 05:38:54', 'INFO', 6, 'New Item Created'),
(478, 1, 0, 'dxadmin', '08-05-2013 05:38:54', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(479, 1, 0, 'dxadmin', '08-05-2013 05:39:04', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(480, 1, 0, 'dxadmin', '08-05-2013 05:39:07', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(481, 1, 0, 'dxadmin', '08-05-2013 05:39:10', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(482, 1, 0, 'dxadmin', '08-05-2013 05:40:47', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(483, 1, 0, 'dxadmin', '08-05-2013 05:43:35', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(484, 0, 0, 'guest', '08-05-2013 05:43:50', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (modules)'),
(485, 0, 0, 'guest', '08-05-2013 05:43:51', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(486, 0, 0, 'guest', '08-05-2013 05:43:53', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(487, 0, 0, 'guest', '08-05-2013 05:43:55', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(488, 0, 0, 'guest', '08-05-2013 05:43:56', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(489, 0, 0, 'guest', '08-05-2013 05:43:58', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(490, 1, 0, 'dxadmin', '08-05-2013 05:44:20', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(491, 0, 0, 'guest', '08-05-2013 05:45:46', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(492, 0, 0, 'guest', '08-05-2013 05:45:49', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(493, 0, 0, 'guest', '08-05-2013 05:45:50', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(494, 0, 0, 'guest', '08-05-2013 05:45:51', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(495, 0, 0, 'guest', '08-05-2013 05:45:53', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(496, 0, 0, 'guest', '08-05-2013 05:45:56', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(497, 0, 0, 'guest', '08-05-2013 05:45:58', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(498, 0, 0, 'guest', '08-05-2013 05:46:01', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (modules)'),
(499, 0, 0, 'guest', '08-05-2013 05:46:01', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(500, 0, 0, 'guest', '08-05-2013 05:46:02', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(501, 1, 0, 'dxadmin', '08-05-2013 05:46:03', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(502, 1, 0, 'dxadmin', '08-05-2013 05:46:31', 'INFO', 6, 'New Item Created'),
(503, 1, 0, 'dxadmin', '08-05-2013 05:46:32', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(504, 1, 0, 'dxadmin', '08-05-2013 05:46:38', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(505, 0, 0, 'guest', '08-05-2013 05:46:48', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(506, 0, 0, 'guest', '08-05-2013 05:46:50', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(507, 0, 0, 'guest', '08-05-2013 05:46:52', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(508, 0, 0, 'guest', '08-05-2013 05:46:53', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(509, 0, 0, 'guest', '08-05-2013 05:46:59', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(510, 0, 0, 'guest', '08-05-2013 05:47:04', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(511, 0, 0, 'guest', '08-05-2013 05:47:06', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(512, 0, 0, 'guest', '08-05-2013 05:47:11', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(513, 0, 0, 'guest', '08-05-2013 05:47:14', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(514, 0, 0, 'guest', '08-05-2013 05:47:19', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(515, 0, 0, 'guest', '08-05-2013 05:47:22', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(516, 0, 0, 'guest', '08-05-2013 05:47:42', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(517, 0, 0, 'guest', '08-05-2013 05:47:43', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(518, 0, 0, 'guest', '08-05-2013 05:47:44', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(519, 0, 0, 'guest', '08-05-2013 05:47:45', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(520, 0, 0, 'guest', '08-05-2013 05:47:49', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(521, 0, 0, 'guest', '08-06-2013 08:46:18', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(522, 1, 0, 'dxadmin', '08-06-2013 08:46:30', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(523, 0, 0, 'guest', '08-06-2013 08:46:33', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(524, 1, 0, 'dxadmin', '08-06-2013 08:47:07', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(525, 1, 0, 'dxadmin', '08-06-2013 08:47:10', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(526, 1, 0, 'dxadmin', '08-06-2013 08:48:49', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(527, 1, 0, 'dxadmin', '08-06-2013 08:48:52', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(528, 1, 0, 'dxadmin', '08-06-2013 08:48:55', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(529, 1, 0, 'dxadmin', '08-06-2013 08:48:59', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(530, 1, 0, 'dxadmin', '08-06-2013 08:49:05', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(531, 1, 0, 'dxadmin', '08-06-2013 08:49:12', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(532, 1, 0, 'dxadmin', '08-06-2013 08:50:02', 'INFO', 6, 'New Item Created'),
(533, 1, 0, 'dxadmin', '08-06-2013 08:50:03', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(534, 1, 0, 'dxadmin', '08-06-2013 08:50:12', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)');
INSERT INTO `log` (`logId`, `userId`, `fileId`, `userName`, `timeStamp`, `priorityName`, `priority`, `message`) VALUES
(535, 1, 0, 'dxadmin', '08-06-2013 08:50:43', 'INFO', 6, 'New Item Created'),
(536, 1, 0, 'dxadmin', '08-06-2013 08:50:44', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(537, 1, 0, 'dxadmin', '08-06-2013 08:50:55', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(538, 1, 0, 'dxadmin', '08-06-2013 08:51:15', 'INFO', 6, 'New Item Created'),
(539, 1, 0, 'dxadmin', '08-06-2013 08:51:16', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(540, 1, 0, 'dxadmin', '08-06-2013 08:51:20', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(541, 1, 0, 'dxadmin', '08-06-2013 08:51:50', 'INFO', 6, 'New Item Created'),
(542, 1, 0, 'dxadmin', '08-06-2013 08:51:51', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(543, 1, 0, 'dxadmin', '08-06-2013 08:58:28', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(544, 1, 0, 'dxadmin', '08-06-2013 08:58:40', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(545, 1, 0, 'dxadmin', '08-06-2013 08:58:43', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(546, 1, 0, 'dxadmin', '08-06-2013 08:59:28', 'INFO', 6, 'Deleted category'),
(547, 1, 0, 'dxadmin', '08-06-2013 08:59:28', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(548, 1, 0, 'dxadmin', '08-06-2013 08:59:32', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(549, 1, 0, 'dxadmin', '08-06-2013 08:59:35', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(550, 1, 0, 'dxadmin', '08-06-2013 08:59:56', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(551, 1, 0, 'dxadmin', '08-06-2013 08:59:58', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(552, 1, 0, 'dxadmin', '08-06-2013 09:00:08', 'INFO', 6, 'Deleted item'),
(553, 1, 0, 'dxadmin', '08-06-2013 09:00:09', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(554, 1, 0, 'dxadmin', '08-06-2013 09:00:13', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(555, 1, 0, 'dxadmin', '08-06-2013 09:00:20', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(556, 1, 0, 'dxadmin', '08-06-2013 09:00:24', 'INFO', 6, 'Edited Item'),
(557, 1, 0, 'dxadmin', '08-06-2013 09:00:24', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(558, 1, 0, 'dxadmin', '08-06-2013 09:05:23', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(559, 1, 0, 'dxadmin', '08-06-2013 09:05:34', 'INFO', 6, 'New Category Created'),
(560, 1, 0, 'dxadmin', '08-06-2013 09:05:35', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(561, 1, 0, 'dxadmin', '08-06-2013 09:05:38', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(562, 1, 0, 'dxadmin', '08-06-2013 09:06:10', 'INFO', 6, 'New Item Created'),
(563, 1, 0, 'dxadmin', '08-06-2013 09:06:11', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(564, 0, 0, 'guest', '08-06-2013 09:07:06', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(565, 0, 0, 'guest', '08-06-2013 09:07:09', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(566, 0, 0, 'guest', '08-06-2013 09:07:11', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(567, 0, 0, 'guest', '08-06-2013 09:07:13', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(568, 1, 0, 'dxadmin', '08-06-2013 09:08:04', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(569, 1, 0, 'dxadmin', '08-06-2013 09:09:08', 'INFO', 6, 'New Item Created'),
(570, 1, 0, 'dxadmin', '08-06-2013 09:09:09', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(571, 1, 0, 'dxadmin', '08-06-2013 09:11:37', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(572, 1, 0, 'dxadmin', '08-06-2013 09:12:08', 'INFO', 6, 'Deleted category'),
(573, 1, 0, 'dxadmin', '08-06-2013 09:12:08', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(574, 1, 0, 'dxadmin', '08-06-2013 09:12:11', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(575, 1, 0, 'dxadmin', '08-06-2013 09:12:23', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(576, 0, 0, 'guest', '08-06-2013 09:12:39', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(577, 0, 0, 'guest', '08-06-2013 09:16:48', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(578, 0, 0, 'guest', '08-06-2013 09:16:49', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(579, 1, 0, 'dxadmin', '08-06-2013 09:21:28', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(580, 1, 0, 'dxadmin', '08-06-2013 09:21:35', 'INFO', 6, 'New Category Created'),
(581, 1, 0, 'dxadmin', '08-06-2013 09:21:36', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(582, 1, 0, 'dxadmin', '08-06-2013 09:22:01', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(583, 1, 0, 'dxadmin', '08-06-2013 09:22:04', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(584, 1, 0, 'dxadmin', '08-06-2013 09:22:23', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(585, 1, 0, 'dxadmin', '08-06-2013 09:22:41', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(586, 1, 0, 'dxadmin', '08-06-2013 09:22:49', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (menu)'),
(587, 1, 0, 'dxadmin', '08-06-2013 09:22:55', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(588, 1, 0, 'dxadmin', '08-06-2013 09:22:57', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (menu)'),
(589, 1, 0, 'dxadmin', '08-06-2013 09:23:03', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(590, 1, 0, 'dxadmin', '08-06-2013 09:23:05', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (menu)'),
(591, 1, 0, 'dxadmin', '08-06-2013 09:23:07', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(592, 1, 0, 'dxadmin', '08-06-2013 09:23:09', 'INFO', 6, 'Deleted category'),
(593, 1, 0, 'dxadmin', '08-06-2013 09:23:09', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(594, 1, 0, 'dxadmin', '08-06-2013 09:32:50', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(595, 1, 0, 'dxadmin', '08-06-2013 09:32:56', 'INFO', 6, 'Deleted menu'),
(596, 1, 0, 'dxadmin', '08-06-2013 09:32:56', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(597, 1, 0, 'dxadmin', '08-06-2013 09:32:59', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(598, 1, 0, 'dxadmin', '08-06-2013 09:36:32', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(599, 1, 0, 'dxadmin', '08-06-2013 09:36:34', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (menu)'),
(600, 1, 0, 'dxadmin', '08-06-2013 09:36:37', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(601, 1, 0, 'dxadmin', '08-06-2013 09:36:40', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(602, 1, 0, 'dxadmin', '08-06-2013 09:36:43', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(603, 1, 0, 'dxadmin', '08-06-2013 09:36:45', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(604, 1, 0, 'dxadmin', '08-06-2013 09:36:48', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(605, 1, 0, 'dxadmin', '08-06-2013 09:38:07', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(606, 1, 0, 'dxadmin', '08-06-2013 09:38:12', 'INFO', 6, 'New Menu Created'),
(607, 1, 0, 'dxadmin', '08-06-2013 09:38:13', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(608, 1, 0, 'dxadmin', '08-06-2013 09:38:16', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(609, 1, 0, 'dxadmin', '08-06-2013 09:38:22', 'INFO', 6, 'New Category Created'),
(610, 1, 0, 'dxadmin', '08-06-2013 09:38:22', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(611, 1, 0, 'dxadmin', '08-06-2013 09:38:25', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(612, 1, 0, 'dxadmin', '08-06-2013 09:38:30', 'INFO', 6, 'New Category Created'),
(613, 1, 0, 'dxadmin', '08-06-2013 09:38:31', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(614, 1, 0, 'dxadmin', '08-06-2013 09:38:34', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(615, 1, 0, 'dxadmin', '08-06-2013 09:38:41', 'INFO', 6, 'New Category Created'),
(616, 1, 0, 'dxadmin', '08-06-2013 09:38:41', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(617, 1, 0, 'dxadmin', '08-06-2013 09:51:44', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(618, 1, 0, 'dxadmin', '08-06-2013 09:51:46', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (menu)'),
(619, 0, 0, 'guest', '08-06-2013 09:52:20', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(620, 1, 0, 'dxadmin', '08-06-2013 09:52:32', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(621, 1, 0, 'dxadmin', '08-06-2013 09:52:37', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(622, 1, 0, 'dxadmin', '08-06-2013 09:52:41', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(623, 1, 0, 'dxadmin', '08-06-2013 09:52:45', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(624, 0, 0, 'guest', '08-06-2013 09:52:56', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(625, 0, 0, 'guest', '08-06-2013 09:53:00', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(626, 0, 0, 'guest', '08-06-2013 09:53:02', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(627, 0, 0, 'guest', '08-06-2013 09:53:04', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(628, 0, 0, 'guest', '08-06-2013 09:53:06', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(629, 0, 0, 'guest', '08-06-2013 09:53:11', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(630, 1, 0, 'dxadmin', '08-06-2013 09:53:18', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(631, 1, 0, 'dxadmin', '08-06-2013 09:53:34', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(632, 1, 0, 'dxadmin', '08-06-2013 09:53:46', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (menu)'),
(633, 1, 0, 'dxadmin', '08-06-2013 09:53:56', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(634, 1, 0, 'dxadmin', '08-06-2013 09:55:40', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (menu)'),
(635, 1, 0, 'dxadmin', '08-06-2013 09:56:52', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(636, 1, 0, 'dxadmin', '08-06-2013 09:56:54', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (menu)'),
(637, 1, 0, 'dxadmin', '08-06-2013 09:59:45', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(638, 1, 0, 'dxadmin', '08-06-2013 10:00:50', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (menu)'),
(639, 1, 0, 'dxadmin', '08-06-2013 10:02:11', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(640, 1, 0, 'dxadmin', '08-06-2013 10:07:43', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(641, 1, 0, 'dxadmin', '08-06-2013 10:07:49', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(642, 1, 0, 'dxadmin', '08-06-2013 10:07:55', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(643, 1, 0, 'dxadmin', '08-06-2013 10:08:24', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(644, 1, 0, 'dxadmin', '08-06-2013 10:08:29', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(645, 1, 0, 'dxadmin', '08-06-2013 10:08:51', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(646, 1, 0, 'dxadmin', '08-06-2013 10:09:48', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(647, 1, 0, 'dxadmin', '08-06-2013 10:09:57', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(648, 1, 0, 'dxadmin', '08-06-2013 10:10:04', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(649, 1, 0, 'dxadmin', '08-06-2013 10:10:08', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(650, 1, 0, 'dxadmin', '08-06-2013 10:11:10', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(651, 0, 0, 'guest', '08-06-2013 10:15:27', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(652, 0, 0, 'guest', '08-06-2013 10:15:27', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(653, 1, 0, 'dxadmin', '08-06-2013 10:15:28', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(654, 1, 0, 'dxadmin', '08-06-2013 10:15:31', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(655, 1, 0, 'dxadmin', '08-06-2013 10:15:35', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(656, 1, 0, 'dxadmin', '08-06-2013 10:15:38', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(657, 1, 0, 'dxadmin', '08-06-2013 10:15:43', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(658, 1, 0, 'dxadmin', '08-06-2013 10:15:51', 'INFO', 6, 'Edited Category'),
(659, 1, 0, 'dxadmin', '08-06-2013 10:15:51', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(660, 1, 0, 'dxadmin', '08-06-2013 10:16:01', 'INFO', 6, 'Edited Category'),
(661, 1, 0, 'dxadmin', '08-06-2013 10:16:02', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(662, 1, 0, 'dxadmin', '08-06-2013 10:16:27', 'INFO', 6, 'Edited Category'),
(663, 1, 0, 'dxadmin', '08-06-2013 10:16:28', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(664, 1, 0, 'dxadmin', '08-06-2013 10:16:32', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(665, 1, 0, 'dxadmin', '08-06-2013 10:16:35', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(666, 1, 0, 'dxadmin', '08-06-2013 10:16:39', 'INFO', 6, 'Edited Category'),
(667, 1, 0, 'dxadmin', '08-06-2013 10:16:40', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(668, 1, 0, 'dxadmin', '08-06-2013 10:16:44', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(669, 1, 0, 'dxadmin', '08-06-2013 10:16:46', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(670, 1, 0, 'dxadmin', '08-06-2013 10:16:51', 'INFO', 6, 'Edited Category'),
(671, 1, 0, 'dxadmin', '08-06-2013 10:16:52', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(672, 1, 0, 'dxadmin', '08-06-2013 10:23:45', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(673, 1, 0, 'dxadmin', '08-06-2013 10:23:48', 'INFO', 6, 'Edited menu'),
(674, 1, 0, 'dxadmin', '08-06-2013 10:23:49', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(675, 1, 0, 'dxadmin', '08-06-2013 10:24:02', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(676, 1, 0, 'dxadmin', '08-06-2013 10:24:05', 'INFO', 6, 'Edited menu'),
(677, 1, 0, 'dxadmin', '08-06-2013 10:24:06', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(678, 1, 0, 'dxadmin', '08-06-2013 10:24:38', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (Test%20Food)'),
(679, 1, 0, 'dxadmin', '08-06-2013 10:25:04', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (TestFood)'),
(680, 1, 0, 'dxadmin', '08-06-2013 10:25:11', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (TestFood)'),
(681, 0, 0, 'guest', '08-06-2013 10:25:32', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (TestFood)'),
(682, 1, 0, 'dxadmin', '08-06-2013 10:25:33', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(683, 0, 0, 'guest', '08-06-2013 10:25:36', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (TestFood)'),
(684, 0, 0, 'guest', '08-06-2013 10:25:38', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(685, 0, 0, 'guest', '08-06-2013 10:25:44', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (TestFood)'),
(686, 0, 0, 'guest', '08-06-2013 10:25:44', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(687, 1, 0, 'dxadmin', '08-06-2013 10:27:16', 'INFO', 6, 'New Item Created'),
(688, 1, 0, 'dxadmin', '08-06-2013 10:27:17', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(689, 0, 0, 'guest', '08-06-2013 10:27:27', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(690, 0, 0, 'guest', '08-06-2013 10:31:29', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(691, 0, 0, 'guest', '08-06-2013 10:32:15', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(692, 0, 0, 'guest', '08-06-2013 10:32:17', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (TestFood)'),
(693, 0, 0, 'guest', '08-06-2013 10:32:17', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(694, 0, 0, 'guest', '08-06-2013 10:32:19', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (TestFood)'),
(695, 0, 0, 'guest', '08-06-2013 10:32:19', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(696, 0, 0, 'guest', '08-06-2013 10:32:22', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(697, 0, 0, 'guest', '08-06-2013 10:32:24', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(698, 0, 0, 'guest', '08-06-2013 10:32:26', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(699, 0, 0, 'guest', '08-06-2013 10:32:27', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (TestFood)'),
(700, 0, 0, 'guest', '08-06-2013 10:32:27', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(701, 0, 0, 'guest', '08-06-2013 10:32:49', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (TestFood)'),
(702, 0, 0, 'guest', '08-06-2013 10:32:49', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(703, 1, 0, 'dxadmin', '08-06-2013 10:32:56', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(704, 1, 0, 'dxadmin', '08-06-2013 10:33:01', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(705, 1, 0, 'dxadmin', '08-06-2013 10:33:07', 'INFO', 6, 'Edited Item'),
(706, 1, 0, 'dxadmin', '08-06-2013 10:33:08', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(707, 0, 0, 'guest', '08-06-2013 10:33:15', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (TestFood)'),
(708, 0, 0, 'guest', '08-06-2013 10:33:16', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(709, 0, 0, 'guest', '08-06-2013 10:33:25', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(710, 0, 0, 'guest', '08-06-2013 10:33:28', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (TestFood)'),
(711, 0, 0, 'guest', '08-06-2013 10:33:28', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(712, 0, 0, 'guest', '08-06-2013 10:33:32', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(713, 0, 0, 'guest', '08-06-2013 10:33:34', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(714, 1, 0, 'dxadmin', '08-06-2013 10:33:38', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(715, 1, 0, 'dxadmin', '08-06-2013 10:33:40', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(716, 1, 0, 'dxadmin', '08-06-2013 10:33:45', 'INFO', 6, 'Edited Item'),
(717, 1, 0, 'dxadmin', '08-06-2013 10:33:46', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(718, 0, 0, 'guest', '08-06-2013 10:33:50', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(719, 0, 0, 'guest', '08-06-2013 10:33:52', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (TestFood)'),
(720, 0, 0, 'guest', '08-06-2013 10:33:52', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(721, 0, 0, 'guest', '08-06-2013 10:33:53', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (TestFood)'),
(722, 0, 0, 'guest', '08-06-2013 10:33:53', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(723, 0, 0, 'guest', '08-06-2013 10:34:12', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (TestFood)'),
(724, 0, 0, 'guest', '08-06-2013 10:34:13', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(725, 0, 0, 'guest', '08-06-2013 10:34:15', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(726, 1, 0, 'dxadmin', '08-06-2013 10:34:24', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(727, 1, 0, 'dxadmin', '08-06-2013 10:34:27', 'INFO', 6, 'Edited menu'),
(728, 1, 0, 'dxadmin', '08-06-2013 10:34:28', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(729, 1, 0, 'dxadmin', '08-06-2013 10:34:33', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(730, 1, 0, 'dxadmin', '08-06-2013 10:34:35', 'INFO', 6, 'Edited menu'),
(731, 1, 0, 'dxadmin', '08-06-2013 10:34:36', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(732, 0, 0, 'guest', '08-06-2013 10:34:43', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(733, 1, 0, 'dxadmin', '08-06-2013 10:34:49', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(734, 1, 0, 'dxadmin', '08-06-2013 10:34:53', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(735, 1, 0, 'dxadmin', '08-06-2013 10:35:12', 'INFO', 6, 'Edited Item'),
(736, 1, 0, 'dxadmin', '08-06-2013 10:35:13', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(737, 1, 0, 'dxadmin', '08-06-2013 10:35:18', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(738, 1, 0, 'dxadmin', '08-06-2013 10:35:23', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(739, 1, 0, 'dxadmin', '08-06-2013 10:35:29', 'INFO', 6, 'Edited Item'),
(740, 1, 0, 'dxadmin', '08-06-2013 10:35:30', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(741, 0, 0, 'guest', '08-06-2013 10:35:36', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(742, 1, 0, 'dxadmin', '08-06-2013 10:36:19', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(743, 1, 0, 'dxadmin', '08-06-2013 10:37:00', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(744, 1, 0, 'dxadmin', '08-06-2013 10:37:03', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(745, 1, 0, 'dxadmin', '08-06-2013 10:37:07', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(746, 0, 0, 'guest', '08-06-2013 10:37:37', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)');
INSERT INTO `log` (`logId`, `userId`, `fileId`, `userName`, `timeStamp`, `priorityName`, `priority`, `message`) VALUES
(747, 0, 0, 'guest', '08-06-2013 10:37:39', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(748, 0, 0, 'guest', '08-06-2013 10:37:46', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(749, 0, 0, 'guest', '08-06-2013 10:37:47', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(750, 1, 0, 'dxadmin', '08-06-2013 10:37:52', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(751, 1, 0, 'dxadmin', '08-06-2013 10:37:58', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(752, 1, 0, 'dxadmin', '08-06-2013 10:38:01', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(753, 1, 0, 'dxadmin', '08-06-2013 10:38:05', 'INFO', 6, 'Edited Category'),
(754, 1, 0, 'dxadmin', '08-06-2013 10:38:06', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(755, 1, 0, 'dxadmin', '08-06-2013 10:38:20', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(756, 1, 0, 'dxadmin', '08-06-2013 10:40:53', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(757, 1, 0, 'dxadmin', '08-06-2013 10:40:58', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(758, 1, 0, 'dxadmin', '08-06-2013 10:42:31', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(759, 1, 0, 'dxadmin', '08-06-2013 10:42:36', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(760, 1, 0, 'dxadmin', '08-06-2013 10:44:42', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(761, 1, 0, 'dxadmin', '08-06-2013 10:44:47', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(762, 1, 0, 'dxadmin', '08-06-2013 10:45:47', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(763, 1, 0, 'dxadmin', '08-06-2013 10:48:48', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(764, 1, 0, 'dxadmin', '08-06-2013 10:48:51', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(765, 1, 0, 'dxadmin', '08-06-2013 10:49:17', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(766, 0, 0, 'guest', '08-06-2013 10:50:03', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(767, 1, 0, 'dxadmin', '08-06-2013 10:57:24', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(768, 1, 0, 'dxadmin', '08-06-2013 10:58:03', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(769, 1, 0, 'dxadmin', '08-06-2013 10:58:06', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(770, 1, 0, 'dxadmin', '08-06-2013 10:58:22', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(771, 0, 0, 'guest', '08-06-2013 11:12:02', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(772, 0, 0, 'guest', '08-06-2013 11:12:04', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(773, 0, 0, 'guest', '08-06-2013 11:17:49', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(774, 1, 0, 'dxadmin', '08-06-2013 11:17:59', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(775, 1, 0, 'dxadmin', '08-06-2013 11:18:03', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(776, 1, 0, 'dxadmin', '08-06-2013 11:20:15', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(777, 0, 0, 'guest', '08-06-2013 11:23:47', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(778, 1, 0, 'dxadmin', '08-06-2013 11:23:55', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(779, 1, 0, 'dxadmin', '08-06-2013 11:23:59', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(780, 1, 0, 'dxadmin', '08-06-2013 11:24:02', 'INFO', 6, 'Edited menu'),
(781, 1, 0, 'dxadmin', '08-06-2013 11:24:02', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(782, 1, 0, 'dxadmin', '08-06-2013 11:24:06', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(783, 1, 0, 'dxadmin', '08-06-2013 11:24:09', 'INFO', 6, 'Edited menu'),
(784, 1, 0, 'dxadmin', '08-06-2013 11:24:10', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(785, 0, 0, 'guest', '08-06-2013 11:42:50', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(786, 1, 0, 'dxadmin', '08-06-2013 11:42:53', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(787, 0, 0, 'guest', '08-06-2013 11:43:54', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(788, 0, 0, 'guest', '08-06-2013 11:43:59', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(789, 1, 0, 'dxadmin', '08-06-2013 11:44:10', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(790, 1, 0, 'dxadmin', '08-06-2013 11:44:13', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(791, 1, 0, 'dxadmin', '08-06-2013 11:46:28', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(792, 1, 0, 'dxadmin', '08-06-2013 11:46:50', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(793, 1, 0, 'dxadmin', '08-06-2013 11:46:54', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(794, 1, 0, 'dxadmin', '08-06-2013 11:47:01', 'INFO', 6, 'New Category Created'),
(795, 1, 0, 'dxadmin', '08-06-2013 11:47:02', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(796, 1, 0, 'dxadmin', '08-06-2013 11:47:06', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(797, 1, 0, 'dxadmin', '08-06-2013 11:47:17', 'INFO', 6, 'New Category Created'),
(798, 1, 0, 'dxadmin', '08-06-2013 11:47:18', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(799, 1, 0, 'dxadmin', '08-06-2013 11:47:21', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(800, 1, 0, 'dxadmin', '08-06-2013 11:47:43', 'INFO', 6, 'New Item Created'),
(801, 1, 0, 'dxadmin', '08-06-2013 11:47:44', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(802, 1, 0, 'dxadmin', '08-06-2013 11:47:47', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(803, 1, 0, 'dxadmin', '08-06-2013 11:48:03', 'INFO', 6, 'New Item Created'),
(804, 1, 0, 'dxadmin', '08-06-2013 11:48:04', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(805, 1, 0, 'dxadmin', '08-06-2013 11:48:07', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(806, 1, 0, 'dxadmin', '08-06-2013 11:48:25', 'INFO', 6, 'New Item Created'),
(807, 1, 0, 'dxadmin', '08-06-2013 11:48:26', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(808, 1, 0, 'dxadmin', '08-06-2013 11:48:34', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(809, 1, 0, 'dxadmin', '08-06-2013 11:48:41', 'INFO', 6, 'New Category Created'),
(810, 1, 0, 'dxadmin', '08-06-2013 11:48:43', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(811, 1, 0, 'dxadmin', '08-06-2013 11:48:45', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(812, 1, 0, 'dxadmin', '08-06-2013 11:49:03', 'INFO', 6, 'New Item Created'),
(813, 1, 0, 'dxadmin', '08-06-2013 11:49:04', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(814, 0, 0, 'guest', '08-06-2013 11:49:12', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(815, 1, 0, 'dxadmin', '08-06-2013 11:49:15', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(816, 1, 0, 'dxadmin', '08-06-2013 11:49:33', 'INFO', 6, 'New Item Created'),
(817, 1, 0, 'dxadmin', '08-06-2013 11:49:34', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(818, 1, 0, 'dxadmin', '08-06-2013 11:49:37', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(819, 1, 0, 'dxadmin', '08-06-2013 11:50:00', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(820, 1, 0, 'dxadmin', '08-06-2013 11:50:04', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(821, 1, 0, 'dxadmin', '08-06-2013 11:50:19', 'INFO', 6, 'New Item Created'),
(822, 1, 0, 'dxadmin', '08-06-2013 11:50:20', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(823, 1, 0, 'dxadmin', '08-06-2013 11:50:23', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(824, 1, 0, 'dxadmin', '08-06-2013 11:50:37', 'INFO', 6, 'New Item Created'),
(825, 1, 0, 'dxadmin', '08-06-2013 11:50:38', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(826, 1, 0, 'dxadmin', '08-06-2013 11:50:56', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(827, 1, 0, 'dxadmin', '08-06-2013 11:51:03', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(828, 1, 0, 'dxadmin', '08-06-2013 11:51:11', 'INFO', 6, 'New Category Created'),
(829, 1, 0, 'dxadmin', '08-06-2013 11:51:12', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(830, 1, 0, 'dxadmin', '08-06-2013 11:51:16', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(831, 1, 0, 'dxadmin', '08-06-2013 11:51:50', 'INFO', 6, 'New Item Created'),
(832, 1, 0, 'dxadmin', '08-06-2013 11:51:51', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(833, 1, 0, 'dxadmin', '08-06-2013 11:51:58', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(834, 1, 0, 'dxadmin', '08-06-2013 11:52:04', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(835, 1, 0, 'dxadmin', '08-06-2013 11:52:09', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(836, 1, 0, 'dxadmin', '08-06-2013 11:52:21', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(837, 1, 0, 'dxadmin', '08-06-2013 11:52:25', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(838, 1, 0, 'dxadmin', '08-06-2013 11:52:32', 'INFO', 6, 'New Category Created'),
(839, 1, 0, 'dxadmin', '08-06-2013 11:52:33', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(840, 1, 0, 'dxadmin', '08-06-2013 11:52:40', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(841, 1, 0, 'dxadmin', '08-06-2013 11:52:46', 'INFO', 6, 'New Category Created'),
(842, 1, 0, 'dxadmin', '08-06-2013 11:52:47', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(843, 1, 0, 'dxadmin', '08-06-2013 11:52:51', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(844, 1, 0, 'dxadmin', '08-06-2013 11:53:13', 'INFO', 6, 'New Item Created'),
(845, 1, 0, 'dxadmin', '08-06-2013 11:53:14', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(846, 1, 0, 'dxadmin', '08-06-2013 11:53:17', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(847, 1, 0, 'dxadmin', '08-06-2013 11:53:31', 'INFO', 6, 'New Item Created'),
(848, 1, 0, 'dxadmin', '08-06-2013 11:53:32', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(849, 1, 0, 'dxadmin', '08-06-2013 11:53:36', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(850, 1, 0, 'dxadmin', '08-06-2013 11:53:51', 'INFO', 6, 'New Item Created'),
(851, 1, 0, 'dxadmin', '08-06-2013 11:53:52', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(852, 1, 0, 'dxadmin', '08-06-2013 11:53:56', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(853, 1, 0, 'dxadmin', '08-06-2013 11:54:10', 'INFO', 6, 'New Item Created'),
(854, 1, 0, 'dxadmin', '08-06-2013 11:54:11', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(855, 1, 0, 'dxadmin', '08-06-2013 11:54:13', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(856, 1, 0, 'dxadmin', '08-06-2013 11:54:23', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(857, 1, 0, 'dxadmin', '08-06-2013 11:54:28', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(858, 1, 0, 'dxadmin', '08-06-2013 11:54:49', 'INFO', 6, 'New Item Created'),
(859, 1, 0, 'dxadmin', '08-06-2013 11:54:50', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(860, 0, 0, 'guest', '08-06-2013 11:54:58', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(861, 0, 0, 'guest', '08-06-2013 11:55:05', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(862, 1, 0, 'dxadmin', '08-06-2013 11:55:28', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(863, 1, 0, 'dxadmin', '08-06-2013 11:55:50', 'INFO', 6, 'New Item Created'),
(864, 1, 0, 'dxadmin', '08-06-2013 11:55:51', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(865, 1, 0, 'dxadmin', '08-06-2013 11:55:54', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(866, 1, 0, 'dxadmin', '08-06-2013 11:56:28', 'INFO', 6, 'New Item Created'),
(867, 1, 0, 'dxadmin', '08-06-2013 11:56:29', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(868, 0, 0, 'guest', '08-06-2013 11:56:32', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(869, 0, 0, 'guest', '08-06-2013 11:56:37', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(870, 0, 0, 'guest', '08-06-2013 11:56:46', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(871, 1, 0, 'dxadmin', '08-06-2013 11:56:52', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(872, 1, 0, 'dxadmin', '08-06-2013 11:56:59', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(873, 1, 0, 'dxadmin', '08-06-2013 11:57:13', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(874, 1, 0, 'dxadmin', '08-06-2013 11:57:17', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(875, 1, 0, 'dxadmin', '08-06-2013 11:57:21', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(876, 1, 0, 'dxadmin', '08-06-2013 11:57:25', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(877, 0, 0, 'guest', '08-06-2013 11:57:45', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(878, 1, 0, 'dxadmin', '08-06-2013 11:57:57', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(879, 1, 0, 'dxadmin', '08-06-2013 11:58:02', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(880, 0, 0, 'guest', '08-06-2013 11:58:36', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(881, 0, 0, 'guest', '08-06-2013 11:58:52', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(882, 0, 0, 'guest', '08-06-2013 11:58:57', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (Food)'),
(883, 0, 0, 'guest', '08-06-2013 11:58:57', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(884, 0, 0, 'guest', '08-06-2013 11:59:09', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(885, 0, 0, 'guest', '08-06-2013 11:59:20', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(886, 0, 0, 'guest', '08-06-2013 11:59:25', 'CRIT', 2, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Action/Helper/ContextSwitch.php, Line Number:: 532, Exception Message:: Context "page" does not exist'),
(887, 0, 0, 'guest', '08-06-2013 11:59:25', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(888, 0, 0, 'guest', '08-06-2013 11:59:29', 'CRIT', 2, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Action/Helper/ContextSwitch.php, Line Number:: 532, Exception Message:: Context "page" does not exist'),
(889, 0, 0, 'guest', '08-06-2013 11:59:29', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(890, 0, 0, 'guest', '08-06-2013 11:59:31', 'CRIT', 2, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Action/Helper/ContextSwitch.php, Line Number:: 532, Exception Message:: Context "page" does not exist'),
(891, 0, 0, 'guest', '08-06-2013 11:59:31', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(892, 0, 0, 'guest', '08-06-2013 11:59:34', 'CRIT', 2, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Action/Helper/ContextSwitch.php, Line Number:: 532, Exception Message:: Context "page" does not exist'),
(893, 0, 0, 'guest', '08-06-2013 11:59:34', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(894, 0, 0, 'guest', '08-06-2013 11:59:36', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (Food)'),
(895, 0, 0, 'guest', '08-06-2013 11:59:37', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(896, 0, 0, 'guest', '08-06-2013 11:59:41', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (Food)'),
(897, 0, 0, 'guest', '08-06-2013 11:59:41', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(898, 0, 0, 'guest', '08-06-2013 12:00:04', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (Food)'),
(899, 0, 0, 'guest', '08-06-2013 12:00:04', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(900, 0, 0, 'guest', '08-06-2013 12:00:10', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(901, 0, 0, 'guest', '08-06-2013 12:00:15', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(902, 0, 0, 'guest', '08-06-2013 12:00:36', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(903, 0, 0, 'guest', '08-06-2013 12:03:32', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(904, 1, 0, 'dxadmin', '08-06-2013 12:03:42', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(905, 1, 0, 'dxadmin', '08-06-2013 12:04:08', 'INFO', 6, 'New Item Created'),
(906, 1, 0, 'dxadmin', '08-06-2013 12:04:09', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(907, 1, 0, 'dxadmin', '08-06-2013 12:04:12', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(908, 1, 0, 'dxadmin', '08-06-2013 12:04:27', 'INFO', 6, 'New Item Created'),
(909, 1, 0, 'dxadmin', '08-06-2013 12:04:28', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(910, 0, 0, 'guest', '08-06-2013 12:04:34', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(911, 0, 0, 'guest', '08-06-2013 12:04:53', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(912, 0, 0, 'guest', '08-06-2013 12:04:57', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(913, 0, 0, 'guest', '08-06-2013 12:04:59', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(914, 0, 0, 'guest', '08-06-2013 12:05:00', 'INFO', 6, 'File Path to error:: /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/IndexController.php, Line Number:: 40, Exception Message:: Under Construction'),
(915, 1, 0, 'dxadmin', '08-06-2013 12:05:03', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(916, 1, 0, 'dxadmin', '08-06-2013 12:05:12', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(917, 1, 0, 'dxadmin', '08-06-2013 12:05:17', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(918, 1, 0, 'dxadmin', '08-06-2013 12:05:25', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(919, 1, 0, 'dxadmin', '08-06-2013 12:05:30', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(920, 1, 0, 'dxadmin', '08-06-2013 12:05:43', 'INFO', 6, 'New Item Created'),
(921, 1, 0, 'dxadmin', '08-06-2013 12:05:44', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(922, 1, 0, 'dxadmin', '08-06-2013 12:05:48', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(923, 1, 0, 'dxadmin', '08-06-2013 12:06:01', 'INFO', 6, 'New Item Created'),
(924, 1, 0, 'dxadmin', '08-06-2013 12:06:02', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(925, 1, 0, 'dxadmin', '08-06-2013 12:06:11', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(926, 1, 0, 'dxadmin', '08-06-2013 12:06:27', 'INFO', 6, 'New Item Created'),
(927, 1, 0, 'dxadmin', '08-06-2013 12:06:28', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(928, 1, 0, 'dxadmin', '08-06-2013 12:06:32', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(929, 1, 0, 'dxadmin', '08-06-2013 12:06:47', 'INFO', 6, 'New Item Created'),
(930, 1, 0, 'dxadmin', '08-06-2013 12:06:48', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(931, 0, 0, 'guest', '08-06-2013 12:06:54', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(932, 0, 0, 'guest', '08-06-2013 12:06:55', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(933, 1, 0, 'dxadmin', '08-06-2013 12:06:58', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(934, 1, 0, 'dxadmin', '08-06-2013 12:07:16', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(935, 1, 0, 'dxadmin', '08-06-2013 12:07:21', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(936, 1, 0, 'dxadmin', '08-06-2013 12:07:40', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(937, 1, 0, 'dxadmin', '08-06-2013 12:07:44', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(938, 1, 0, 'dxadmin', '08-06-2013 12:07:47', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(939, 1, 0, 'dxadmin', '08-06-2013 12:07:51', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(940, 1, 0, 'dxadmin', '08-06-2013 12:08:01', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(941, 0, 0, 'guest', '08-06-2013 12:10:21', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(942, 0, 0, 'guest', '08-06-2013 12:10:22', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(943, 0, 0, 'guest', '08-06-2013 12:11:17', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(944, 0, 0, 'guest', '08-06-2013 12:15:26', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(945, 1, 0, 'dxadmin', '08-06-2013 12:15:55', 'CRIT', 2, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Db/Statement/Pdo.php, Line Number:: 234, Exception Message:: SQLSTATE[HY093]: Invalid parameter number: no parameters were bound'),
(946, 1, 0, 'dxadmin', '08-06-2013 12:15:57', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(947, 1, 0, 'dxadmin', '08-06-2013 12:16:18', 'CRIT', 2, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Db/Statement/Pdo.php, Line Number:: 234, Exception Message:: SQLSTATE[HY093]: Invalid parameter number: no parameters were bound'),
(948, 1, 0, 'dxadmin', '08-06-2013 12:16:18', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(949, 1, 0, 'dxadmin', '08-06-2013 12:16:20', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(950, 1, 0, 'dxadmin', '08-06-2013 12:18:12', 'CRIT', 2, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Db/Statement/Pdo.php, Line Number:: 234, Exception Message:: SQLSTATE[HY093]: Invalid parameter number: no parameters were bound'),
(951, 1, 0, 'dxadmin', '08-06-2013 12:18:14', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(952, 0, 0, 'guest', '08-06-2013 12:18:22', 'CRIT', 2, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Db/Statement/Pdo.php, Line Number:: 234, Exception Message:: SQLSTATE[HY093]: Invalid parameter number: no parameters were bound'),
(953, 0, 0, 'guest', '08-06-2013 12:18:23', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(954, 0, 0, 'guest', '08-06-2013 12:18:25', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(955, 0, 0, 'guest', '08-06-2013 12:18:26', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(956, 1, 0, 'dxadmin', '08-06-2013 12:18:37', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(957, 1, 0, 'dxadmin', '08-06-2013 12:18:48', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)');
INSERT INTO `log` (`logId`, `userId`, `fileId`, `userName`, `timeStamp`, `priorityName`, `priority`, `message`) VALUES
(958, 1, 0, 'dxadmin', '08-06-2013 12:18:52', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(959, 1, 0, 'dxadmin', '08-06-2013 12:19:02', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(960, 1, 0, 'dxadmin', '08-06-2013 12:19:27', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(961, 1, 0, 'dxadmin', '08-06-2013 12:19:35', 'INFO', 6, 'New Category Created'),
(962, 1, 0, 'dxadmin', '08-06-2013 12:19:36', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(963, 1, 0, 'dxadmin', '08-06-2013 12:19:43', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(964, 1, 0, 'dxadmin', '08-06-2013 12:19:54', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(965, 1, 0, 'dxadmin', '08-06-2013 12:20:02', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(966, 1, 0, 'dxadmin', '08-06-2013 12:20:09', 'INFO', 6, 'New Category Created'),
(967, 1, 0, 'dxadmin', '08-06-2013 12:20:10', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(968, 1, 0, 'dxadmin', '08-06-2013 12:20:14', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(969, 1, 0, 'dxadmin', '08-06-2013 12:20:26', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(970, 1, 0, 'dxadmin', '08-06-2013 12:20:31', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(971, 1, 0, 'dxadmin', '08-06-2013 12:20:38', 'INFO', 6, 'New Category Created'),
(972, 1, 0, 'dxadmin', '08-06-2013 12:20:39', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(973, 1, 0, 'dxadmin', '08-06-2013 12:20:42', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(974, 1, 0, 'dxadmin', '08-06-2013 12:20:46', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(975, 0, 0, 'guest', '08-06-2013 12:24:03', 'CRIT', 2, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Db/Statement/Pdo.php, Line Number:: 234, Exception Message:: SQLSTATE[HY093]: Invalid parameter number: no parameters were bound'),
(976, 0, 0, 'guest', '08-06-2013 12:24:03', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(977, 0, 0, 'guest', '08-06-2013 12:24:05', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(978, 0, 0, 'guest', '08-06-2013 12:26:06', 'CRIT', 2, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Db/Statement/Pdo.php, Line Number:: 234, Exception Message:: SQLSTATE[HY093]: Invalid parameter number: no parameters were bound'),
(979, 0, 0, 'guest', '08-06-2013 12:26:07', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(980, 0, 0, 'guest', '08-06-2013 12:26:08', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(981, 1, 0, 'dxadmin', '08-06-2013 12:26:35', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(982, 1, 0, 'dxadmin', '08-06-2013 12:26:39', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(983, 1, 0, 'dxadmin', '08-06-2013 12:26:55', 'INFO', 6, 'New Item Created'),
(984, 1, 0, 'dxadmin', '08-06-2013 12:26:56', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(985, 1, 0, 'dxadmin', '08-06-2013 12:27:01', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(986, 1, 0, 'dxadmin', '08-06-2013 12:27:11', 'CRIT', 2, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Db/Statement/Pdo.php, Line Number:: 234, Exception Message:: SQLSTATE[HY093]: Invalid parameter number: no parameters were bound'),
(987, 1, 0, 'dxadmin', '08-06-2013 12:27:12', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(988, 1, 0, 'dxadmin', '08-06-2013 12:27:13', 'INFO', 6, 'New Item Created'),
(989, 1, 0, 'dxadmin', '08-06-2013 12:27:14', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(990, 1, 0, 'dxadmin', '08-06-2013 12:27:14', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(991, 1, 0, 'dxadmin', '08-06-2013 12:27:19', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(992, 1, 0, 'dxadmin', '08-06-2013 12:27:36', 'INFO', 6, 'New Item Created'),
(993, 1, 0, 'dxadmin', '08-06-2013 12:27:37', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(994, 1, 0, 'dxadmin', '08-06-2013 12:28:05', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(995, 1, 0, 'dxadmin', '08-06-2013 12:28:09', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(996, 1, 0, 'dxadmin', '08-06-2013 12:28:14', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(997, 1, 0, 'dxadmin', '08-06-2013 12:29:08', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(998, 1, 0, 'dxadmin', '08-06-2013 12:29:13', 'INFO', 6, 'New Menu Created'),
(999, 1, 0, 'dxadmin', '08-06-2013 12:29:14', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1000, 1, 0, 'dxadmin', '08-06-2013 12:29:17', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1001, 1, 0, 'dxadmin', '08-06-2013 12:29:23', 'INFO', 6, 'New Menu Created'),
(1002, 1, 0, 'dxadmin', '08-06-2013 12:29:24', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1003, 1, 0, 'dxadmin', '08-06-2013 12:29:32', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1004, 1, 0, 'dxadmin', '08-06-2013 12:29:37', 'INFO', 6, 'New Menu Created'),
(1005, 1, 0, 'dxadmin', '08-06-2013 12:29:37', 'CRIT', 2, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/View/Abstract.php, Line Number:: 988, Exception Message:: script ''partials/ui-pagination-control.phtml'' not found in path (/Volumes/Web/Library/WebServer/www/theridge/application/skins/theridge/scripts/:/Volumes/Web/Library/WebServer/www/theridge/application/skins/default/scripts/)'),
(1006, 1, 0, 'dxadmin', '08-06-2013 12:29:38', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1007, 1, 0, 'dxadmin', '08-06-2013 12:29:44', 'CRIT', 2, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/View/Abstract.php, Line Number:: 988, Exception Message:: script ''partials/ui-pagination-control.phtml'' not found in path (/Volumes/Web/Library/WebServer/www/theridge/application/skins/theridge/scripts/:/Volumes/Web/Library/WebServer/www/theridge/application/skins/default/scripts/)'),
(1008, 1, 0, 'dxadmin', '08-06-2013 12:29:45', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1009, 1, 0, 'dxadmin', '08-06-2013 12:29:48', 'CRIT', 2, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/View/Abstract.php, Line Number:: 988, Exception Message:: script ''partials/ui-pagination-control.phtml'' not found in path (/Volumes/Web/Library/WebServer/www/theridge/application/skins/theridge/scripts/:/Volumes/Web/Library/WebServer/www/theridge/application/skins/default/scripts/)'),
(1010, 1, 0, 'dxadmin', '08-06-2013 12:29:49', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1011, 0, 0, 'guest', '08-06-2013 12:30:14', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1012, 1, 0, 'dxadmin', '08-06-2013 12:30:17', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1013, 1, 0, 'dxadmin', '08-06-2013 12:30:25', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1014, 1, 0, 'dxadmin', '08-06-2013 12:38:36', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1015, 1, 0, 'dxadmin', '08-06-2013 12:38:41', 'INFO', 6, 'New Menu Created'),
(1016, 1, 0, 'dxadmin', '08-06-2013 12:38:42', 'CRIT', 2, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/View/Abstract.php, Line Number:: 988, Exception Message:: script ''partials/ui-pagination-control.phtml'' not found in path (/Volumes/Web/Library/WebServer/www/theridge/application/skins/theridge/scripts/:/Volumes/Web/Library/WebServer/www/theridge/application/skins/default/scripts/)'),
(1017, 1, 0, 'dxadmin', '08-06-2013 12:38:42', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1018, 1, 0, 'dxadmin', '08-06-2013 12:39:28', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1019, 1, 0, 'dxadmin', '08-06-2013 12:41:05', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1020, 1, 0, 'dxadmin', '08-06-2013 12:41:09', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1021, 1, 0, 'dxadmin', '08-06-2013 01:02:28', 'CRIT', 2, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Db/Statement/Pdo.php, Line Number:: 234, Exception Message:: SQLSTATE[HY093]: Invalid parameter number: no parameters were bound'),
(1022, 1, 0, 'dxadmin', '08-06-2013 01:02:28', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1023, 1, 0, 'dxadmin', '08-06-2013 01:02:47', 'CRIT', 2, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Db/Statement/Pdo.php, Line Number:: 234, Exception Message:: SQLSTATE[HY093]: Invalid parameter number: no parameters were bound'),
(1024, 1, 0, 'dxadmin', '08-06-2013 01:02:47', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1025, 1, 0, 'dxadmin', '08-06-2013 01:03:02', 'CRIT', 2, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Db/Statement/Pdo.php, Line Number:: 234, Exception Message:: SQLSTATE[HY093]: Invalid parameter number: no parameters were bound'),
(1026, 1, 0, 'dxadmin', '08-06-2013 01:03:02', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1027, 0, 0, 'guest', '08-06-2013 01:07:40', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1028, 0, 0, 'guest', '08-06-2013 01:07:42', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1029, 0, 0, 'guest', '08-06-2013 01:07:44', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1030, 1, 0, 'dxadmin', '08-06-2013 01:14:31', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1031, 1, 0, 'dxadmin', '08-06-2013 01:14:36', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1032, 1, 0, 'dxadmin', '08-06-2013 01:14:42', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1033, 1, 0, 'dxadmin', '08-06-2013 01:14:46', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1034, 1, 0, 'dxadmin', '08-06-2013 01:14:51', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1035, 1, 0, 'dxadmin', '08-06-2013 01:14:57', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1036, 1, 0, 'dxadmin', '08-06-2013 01:15:02', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1037, 1, 0, 'dxadmin', '08-06-2013 01:18:26', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1038, 1, 0, 'dxadmin', '08-06-2013 01:21:48', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1039, 1, 0, 'dxadmin', '08-06-2013 01:21:52', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1040, 1, 0, 'dxadmin', '08-06-2013 01:21:59', 'INFO', 6, 'New Menu Created'),
(1041, 1, 0, 'dxadmin', '08-06-2013 01:22:00', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1042, 1, 0, 'dxadmin', '08-06-2013 01:22:04', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1043, 1, 0, 'dxadmin', '08-06-2013 01:22:08', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1044, 1, 0, 'dxadmin', '08-06-2013 01:23:26', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1045, 1, 0, 'dxadmin', '08-06-2013 01:23:35', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1046, 1, 0, 'dxadmin', '08-06-2013 01:41:18', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1047, 1, 0, 'dxadmin', '08-06-2013 01:41:24', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1048, 1, 0, 'dxadmin', '08-06-2013 01:41:30', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1049, 1, 0, 'dxadmin', '08-06-2013 01:43:07', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1050, 1, 0, 'dxadmin', '08-06-2013 01:43:11', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1051, 1, 0, 'dxadmin', '08-06-2013 01:43:15', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1052, 1, 0, 'dxadmin', '08-06-2013 01:43:29', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1053, 1, 0, 'dxadmin', '08-06-2013 01:45:10', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1054, 1, 0, 'dxadmin', '08-06-2013 01:45:12', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1055, 1, 0, 'dxadmin', '08-06-2013 01:51:40', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1056, 1, 0, 'dxadmin', '08-06-2013 01:51:46', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1057, 1, 0, 'dxadmin', '08-06-2013 01:51:51', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1058, 1, 0, 'dxadmin', '08-06-2013 01:56:12', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1059, 1, 0, 'dxadmin', '08-06-2013 01:56:43', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1060, 1, 0, 'dxadmin', '08-06-2013 01:56:56', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1061, 1, 0, 'dxadmin', '08-06-2013 01:57:05', 'INFO', 6, 'New Category Created'),
(1062, 1, 0, 'dxadmin', '08-06-2013 01:57:06', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1063, 1, 0, 'dxadmin', '08-06-2013 01:57:11', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1064, 1, 0, 'dxadmin', '08-06-2013 01:57:31', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1065, 1, 0, 'dxadmin', '08-06-2013 01:57:37', 'INFO', 6, 'New Category Created'),
(1066, 1, 0, 'dxadmin', '08-06-2013 01:57:38', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1067, 1, 0, 'dxadmin', '08-06-2013 01:57:43', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1068, 1, 0, 'dxadmin', '08-06-2013 01:57:47', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1069, 1, 0, 'dxadmin', '08-06-2013 01:57:51', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1070, 1, 0, 'dxadmin', '08-06-2013 02:13:00', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1071, 1, 0, 'dxadmin', '08-06-2013 02:13:00', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1072, 1, 0, 'dxadmin', '08-06-2013 02:13:08', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1073, 1, 0, 'dxadmin', '08-06-2013 02:13:52', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1074, 1, 0, 'dxadmin', '08-06-2013 02:14:24', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1075, 1, 0, 'dxadmin', '08-06-2013 02:14:51', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1076, 1, 0, 'dxadmin', '08-06-2013 02:15:46', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1077, 1, 0, 'dxadmin', '08-06-2013 02:15:58', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1078, 1, 0, 'dxadmin', '08-06-2013 02:16:06', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1079, 1, 0, 'dxadmin', '08-06-2013 02:23:03', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1080, 1, 0, 'dxadmin', '08-06-2013 02:23:15', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1081, 1, 0, 'dxadmin', '08-06-2013 02:23:24', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1082, 1, 0, 'dxadmin', '08-06-2013 02:26:07', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1083, 1, 0, 'dxadmin', '08-06-2013 02:26:22', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1084, 1, 0, 'dxadmin', '08-06-2013 02:27:11', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1085, 1, 0, 'dxadmin', '08-06-2013 02:27:35', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1086, 1, 0, 'dxadmin', '08-06-2013 02:27:49', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1087, 0, 0, 'guest', '08-06-2013 02:37:10', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1088, 0, 0, 'guest', '08-06-2013 02:37:13', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1089, 0, 0, 'guest', '08-06-2013 02:37:21', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1090, 0, 0, 'guest', '08-06-2013 02:37:22', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1091, 0, 0, 'guest', '08-06-2013 02:44:14', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1092, 0, 0, 'guest', '08-06-2013 02:44:32', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1093, 0, 0, 'guest', '08-06-2013 02:44:37', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1094, 0, 0, 'guest', '08-06-2013 02:54:26', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1095, 0, 0, 'guest', '08-06-2013 02:54:31', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1096, 0, 0, 'guest', '08-06-2013 02:55:43', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1097, 0, 0, 'guest', '08-06-2013 02:55:45', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1098, 1, 0, 'dxadmin', '08-06-2013 02:56:00', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1099, 1, 0, 'dxadmin', '08-06-2013 02:56:07', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1100, 1, 0, 'dxadmin', '08-06-2013 02:56:14', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1101, 1, 0, 'dxadmin', '08-06-2013 02:56:18', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1102, 1, 0, 'dxadmin', '08-06-2013 02:56:24', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1103, 1, 0, 'dxadmin', '08-06-2013 02:57:08', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1104, 1, 0, 'dxadmin', '08-06-2013 02:57:17', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1105, 1, 0, 'dxadmin', '08-06-2013 02:57:28', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1106, 1, 0, 'dxadmin', '08-06-2013 02:57:42', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1107, 1, 0, 'dxadmin', '08-06-2013 02:57:57', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1108, 1, 0, 'dxadmin', '08-06-2013 02:58:10', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1109, 1, 0, 'dxadmin', '08-06-2013 02:58:22', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1110, 1, 0, 'dxadmin', '08-06-2013 03:03:40', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1111, 1, 0, 'dxadmin', '08-06-2013 03:04:35', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1112, 1, 0, 'dxadmin', '08-06-2013 03:04:43', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1113, 1, 0, 'dxadmin', '08-06-2013 03:04:54', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1114, 1, 0, 'dxadmin', '08-06-2013 03:10:44', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1115, 1, 0, 'dxadmin', '08-06-2013 03:10:56', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1116, 1, 0, 'dxadmin', '08-06-2013 03:11:33', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1117, 1, 0, 'dxadmin', '08-06-2013 03:11:38', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1118, 1, 0, 'dxadmin', '08-06-2013 03:14:11', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1119, 1, 0, 'dxadmin', '08-06-2013 03:14:29', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1120, 1, 0, 'dxadmin', '08-06-2013 03:14:41', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1121, 1, 0, 'dxadmin', '08-06-2013 03:14:46', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1122, 1, 0, 'dxadmin', '08-06-2013 03:14:50', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1123, 1, 0, 'dxadmin', '08-06-2013 03:14:53', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1124, 1, 0, 'dxadmin', '08-06-2013 03:17:00', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1125, 1, 0, 'dxadmin', '08-06-2013 03:17:55', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1126, 0, 0, 'guest', '08-06-2013 03:19:21', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1127, 1, 0, 'dxadmin', '08-06-2013 03:19:28', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1128, 1, 0, 'dxadmin', '08-06-2013 03:20:33', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1129, 1, 0, 'dxadmin', '08-06-2013 03:20:42', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1130, 0, 0, 'guest', '08-06-2013 03:22:02', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1131, 1, 0, 'dxadmin', '08-06-2013 03:23:07', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1132, 1, 0, 'dxadmin', '08-06-2013 03:28:33', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1133, 1, 0, 'dxadmin', '08-06-2013 03:30:53', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1134, 1, 0, 'dxadmin', '08-06-2013 03:31:23', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1135, 1, 0, 'dxadmin', '08-06-2013 03:32:24', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1136, 0, 0, 'guest', '08-06-2013 03:36:20', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1137, 0, 0, 'guest', '08-06-2013 03:37:31', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1138, 0, 0, 'guest', '08-06-2013 03:37:31', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (apple-touch-icon-precomposed.png)'),
(1139, 0, 0, 'guest', '08-06-2013 03:37:32', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (apple-touch-icon.png)'),
(1140, 0, 0, 'guest', '08-06-2013 03:42:46', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1141, 0, 0, 'guest', '08-06-2013 03:42:54', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1142, 0, 0, 'guest', '08-06-2013 04:02:40', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1143, 0, 0, 'guest', '08-06-2013 04:05:53', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1144, 1, 0, 'dxadmin', '08-06-2013 04:07:04', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1145, 1, 0, 'dxadmin', '08-06-2013 04:07:09', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1146, 1, 0, 'dxadmin', '08-06-2013 04:31:50', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1147, 1, 0, 'dxadmin', '08-06-2013 04:31:55', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1148, 1, 0, 'dxadmin', '08-06-2013 04:32:03', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1149, 1, 0, 'dxadmin', '08-06-2013 04:32:36', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1150, 1, 0, 'dxadmin', '08-06-2013 04:32:44', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1151, 1, 0, 'dxadmin', '08-06-2013 04:32:51', 'INFO', 6, 'Edited menu'),
(1152, 1, 0, 'dxadmin', '08-06-2013 04:32:52', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1153, 1, 0, 'dxadmin', '08-06-2013 04:32:57', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1154, 1, 0, 'dxadmin', '08-06-2013 04:33:01', 'INFO', 6, 'Edited menu');
INSERT INTO `log` (`logId`, `userId`, `fileId`, `userName`, `timeStamp`, `priorityName`, `priority`, `message`) VALUES
(1155, 1, 0, 'dxadmin', '08-06-2013 04:33:01', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1156, 1, 0, 'dxadmin', '08-06-2013 04:33:39', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1157, 0, 0, 'guest', '08-06-2013 04:34:04', 'CRIT', 2, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Db/Table/Rowset/Abstract.php, Line Number:: 343, Exception Message:: Illegal index 0'),
(1158, 0, 0, 'guest', '08-06-2013 04:34:05', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1159, 0, 0, 'guest', '08-06-2013 04:34:06', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1160, 0, 0, 'guest', '08-06-2013 04:34:08', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1161, 0, 0, 'guest', '08-06-2013 04:34:10', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1162, 0, 0, 'guest', '08-06-2013 04:34:12', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1163, 0, 0, 'guest', '08-06-2013 04:34:13', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1164, 0, 0, 'guest', '08-06-2013 04:34:39', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1165, 0, 0, 'guest', '08-06-2013 04:34:40', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1166, 0, 0, 'guest', '08-06-2013 04:34:43', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1167, 1, 0, 'dxadmin', '08-06-2013 04:42:51', 'CRIT', 2, 'exception ''Zend_Db_Table_Exception'' with message ''No reference rule "ParentCats" from table Menu_Model_Category to table Menu_Model_Category'' in /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Db/Table/Abstract.php:471\nStack trace:\n#0 /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Db/Table/Row/Abstract.php(856): Zend_Db_Table_Abstract->getReference(''Menu_Model_Cate...'', ''ParentCats'')\n#1 /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Db/Table/Row/Abstract.php(908): Zend_Db_Table_Row_Abstract->_prepareReference(Object(Menu_Model_Category), Object(Menu_Model_Category), ''ParentCats'')\n#2 /Volumes/Web/Library/WebServer/www/theridge/application/modules/menu/controllers/AdminController.php(260): Zend_Db_Table_Row_Abstract->findDependentRowset(''Menu_Model_Cate...'', ''ParentCats'')\n#3 /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Action.php(516): Menu_AdminController->deleteCategoryAction()\n#4 /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php(308): Zend_Controller_Action->dispatch(''deleteCategoryA...'')\n#5 /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Front.php(954): Zend_Controller_Dispatcher_Standard->dispatch(Object(Zend_Controller_Request_Http), Object(Zend_Controller_Response_Http))\n#6 /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Application/Bootstrap/Bootstrap.php(97): Zend_Controller_Front->dispatch()\n#7 /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Application.php(366): Zend_Application_Bootstrap_Bootstrap->run()\n#8 /Volumes/Web/Library/WebServer/www/theridge/public/index.php(28): Zend_Application->run()\n#9 {main}'),
(1168, 1, 0, 'dxadmin', '08-06-2013 04:42:51', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1169, 1, 0, 'dxadmin', '08-06-2013 04:43:48', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1170, 1, 0, 'dxadmin', '08-06-2013 04:46:04', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1171, 1, 0, 'dxadmin', '08-06-2013 04:46:08', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1172, 0, 0, 'guest', '08-06-2013 04:49:58', 'CRIT', 2, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Db/Table/Rowset/Abstract.php, Line Number:: 343, Exception Message:: Illegal index 0'),
(1173, 0, 0, 'guest', '08-06-2013 04:50:01', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1174, 0, 0, 'guest', '08-06-2013 04:50:01', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1175, 0, 0, 'guest', '08-06-2013 04:50:04', 'CRIT', 2, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Db/Table/Rowset/Abstract.php, Line Number:: 343, Exception Message:: Illegal index 0'),
(1176, 0, 0, 'guest', '08-06-2013 04:50:04', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1177, 0, 0, 'guest', '08-06-2013 04:50:04', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1178, 0, 0, 'guest', '08-06-2013 04:50:06', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1179, 0, 0, 'guest', '08-06-2013 04:50:35', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1180, 0, 0, 'guest', '08-06-2013 04:53:36', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1181, 0, 0, 'guest', '08-06-2013 05:01:28', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (modules)'),
(1182, 0, 0, 'guest', '08-06-2013 05:01:36', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1183, 0, 0, 'guest', '08-06-2013 05:02:09', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (modules)'),
(1184, 0, 0, 'guest', '08-06-2013 05:04:25', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1185, 0, 0, 'guest', '08-06-2013 05:08:06', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1186, 0, 0, 'guest', '08-06-2013 05:08:09', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1187, 1, 0, 'dxadmin', '08-06-2013 05:16:29', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1188, 1, 0, 'dxadmin', '08-06-2013 05:19:32', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1189, 1, 0, 'dxadmin', '08-06-2013 05:19:39', 'INFO', 6, 'Deleted category'),
(1190, 1, 0, 'dxadmin', '08-06-2013 05:23:10', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1191, 1, 0, 'dxadmin', '08-06-2013 05:24:27', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1192, 0, 0, 'guest', '08-06-2013 05:25:41', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1193, 0, 0, 'guest', '08-06-2013 05:27:55', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1194, 1, 0, 'dxadmin', '08-06-2013 05:30:52', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1195, 1, 0, 'dxadmin', '08-06-2013 05:30:57', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1196, 0, 0, 'guest', '08-06-2013 05:31:25', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1197, 0, 0, 'guest', '08-06-2013 05:31:27', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1198, 0, 0, 'guest', '08-06-2013 05:31:38', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1199, 0, 0, 'guest', '08-06-2013 05:31:43', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1200, 1, 0, 'dxadmin', '08-06-2013 05:36:46', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1201, 1, 0, 'dxadmin', '08-06-2013 05:36:56', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1202, 1, 0, 'dxadmin', '08-06-2013 05:43:42', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1203, 0, 0, 'guest', '08-06-2013 11:04:07', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1204, 0, 0, 'guest', '08-07-2013 08:46:41', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1205, 0, 0, 'guest', '08-07-2013 08:46:41', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1206, 0, 0, 'guest', '08-07-2013 09:09:39', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (favicon.ico)'),
(1207, 0, 0, 'guest', '08-07-2013 09:22:11', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (modules)'),
(1208, 0, 0, 'guest', '08-07-2013 09:22:41', 'ERR', 3, 'File Path to error:: /Volumes/Web/Library/WebServer/zend/ZendFramework-1.12.0/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (modules)'),
(1209, 0, 0, 'guest', '10-06-2013 11:06:37', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (js-src)'),
(1210, 0, 0, 'guest', '10-06-2013 11:06:37', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (js-src)'),
(1211, 0, 0, 'guest', '10-06-2013 11:06:37', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1212, 0, 0, 'guest', '10-06-2013 11:06:37', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1213, 0, 0, 'guest', '10-06-2013 11:06:37', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1214, 0, 0, 'guest', '10-06-2013 11:06:37', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (js-src)'),
(1215, 0, 0, 'guest', '10-06-2013 11:06:38', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1216, 0, 0, 'guest', '10-06-2013 11:06:38', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1217, 0, 0, 'guest', '10-06-2013 11:06:38', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1218, 0, 0, 'guest', '10-06-2013 11:06:38', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1219, 0, 0, 'guest', '10-06-2013 11:06:38', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1220, 0, 0, 'guest', '10-06-2013 11:06:38', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1221, 0, 0, 'guest', '10-06-2013 11:07:31', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (js-src)'),
(1222, 0, 0, 'guest', '10-06-2013 11:07:31', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1223, 0, 0, 'guest', '10-06-2013 11:07:31', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (js-src)'),
(1224, 0, 0, 'guest', '10-06-2013 11:07:31', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1225, 0, 0, 'guest', '10-06-2013 11:07:31', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1226, 0, 0, 'guest', '10-06-2013 11:07:31', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (js-src)'),
(1227, 0, 0, 'guest', '10-06-2013 11:07:31', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1228, 0, 0, 'guest', '10-06-2013 11:07:31', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1229, 0, 0, 'guest', '10-06-2013 11:07:31', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1230, 0, 0, 'guest', '10-06-2013 11:07:31', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1231, 0, 0, 'guest', '10-06-2013 11:07:31', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1232, 0, 0, 'guest', '10-06-2013 11:07:31', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1233, 0, 0, 'guest', '10-06-2013 11:09:49', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1234, 0, 0, 'guest', '10-06-2013 11:09:49', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1235, 0, 0, 'guest', '10-06-2013 11:09:49', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (js-src)'),
(1236, 0, 0, 'guest', '10-06-2013 11:09:49', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (js-src)'),
(1237, 0, 0, 'guest', '10-06-2013 11:09:49', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1238, 0, 0, 'guest', '10-06-2013 11:09:49', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (js-src)'),
(1239, 0, 0, 'guest', '10-06-2013 11:09:49', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1240, 0, 0, 'guest', '10-06-2013 11:09:49', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1241, 0, 0, 'guest', '10-06-2013 11:09:49', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1242, 0, 0, 'guest', '10-06-2013 11:09:49', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1243, 0, 0, 'guest', '10-06-2013 11:09:49', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1244, 0, 0, 'guest', '10-06-2013 11:09:49', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1245, 0, 0, 'guest', '10-06-2013 11:48:38', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (images)'),
(1246, 0, 0, 'guest', '10-06-2013 11:48:38', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (images)'),
(1247, 0, 0, 'guest', '10-06-2013 11:52:48', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (images)'),
(1248, 0, 0, 'guest', '10-06-2013 11:52:48', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (images)'),
(1249, 0, 0, 'guest', '10-06-2013 11:53:10', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (images)'),
(1250, 0, 0, 'guest', '10-06-2013 11:53:10', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (images)'),
(1251, 0, 0, 'guest', '10-06-2013 01:10:57', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (modules)'),
(1252, 0, 0, 'dxadmin', '10-06-2013 01:59:25', 'INFO', 6, 'Successful Login'),
(1253, 0, 0, 'dxadmin', '10-06-2013 01:59:26', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (lib)'),
(1254, 0, 0, 'dxadmin', '10-06-2013 02:00:14', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (lib)'),
(1255, 0, 0, 'dxadmin', '10-06-2013 02:01:46', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (lib)'),
(1256, 0, 0, 'dxadmin', '10-06-2013 02:01:51', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (lib)'),
(1257, 0, 0, 'dxadmin', '10-06-2013 02:02:41', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (lib)'),
(1258, 0, 0, 'dxadmin', '10-06-2013 02:03:42', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (lib)'),
(1259, 0, 0, 'dxadmin', '10-06-2013 02:03:46', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (lib)'),
(1260, 0, 0, 'dxadmin', '10-06-2013 02:04:47', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (lib)'),
(1261, 0, 0, 'dxadmin', '10-06-2013 02:04:51', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (lib)'),
(1262, 0, 0, 'dxadmin', '10-06-2013 02:05:21', 'CRIT', 2, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/View/Abstract.php, Line Number:: 988, Exception Message:: script ''dashboard.phtml'' not found in path (/Users/jsmith/Documents/zend-workspace/casittersrus/catsittersrus.com/application/skins/default/layouts/:/Users/jsmith/Documents/zend-workspace/casittersrus/catsittersrus.com/application/skins/default/scripts/)'),
(1263, 0, 0, 'dxadmin', '10-06-2013 02:06:22', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (lib)'),
(1264, 0, 0, 'dxadmin', '10-06-2013 02:07:15', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (lib)'),
(1265, 0, 0, 'dxadmin', '10-06-2013 02:10:27', 'CRIT', 2, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Navigation/Container.php, Line Number:: 465, Exception Message:: Bad method call: Unknown method Zend_Navigation::renderMenu'),
(1266, 0, 0, 'dxadmin', '10-06-2013 02:10:50', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1267, 0, 0, 'dxadmin', '10-06-2013 02:18:04', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (tour)'),
(1268, 0, 0, 'dxadmin', '10-06-2013 02:36:44', 'CRIT', 2, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Loader/PluginLoader.php, Line Number:: 412, Exception Message:: Plugin by name ''Textbox'' was not found in the registry; used paths:\nZend_Dojo_Form_Element_: Zend/Dojo/Form/Element/\nZend_Form_Element_: Zend/Form/Element/'),
(1269, 0, 0, 'dxadmin', '10-06-2013 02:39:47', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1270, 0, 0, 'dxadmin', '10-06-2013 02:39:57', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1271, 0, 0, 'dxadmin', '10-06-2013 02:51:42', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1272, 0, 0, 'dxadmin', '10-06-2013 02:52:46', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1273, 0, 0, 'dxadmin', '10-06-2013 03:02:58', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (index)'),
(1274, 0, 0, 'dxadmin', '10-06-2013 03:03:09', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (calendar)'),
(1275, 0, 0, 'dxadmin', '10-06-2013 03:03:19', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (manage-calendar)'),
(1276, 0, 0, 'dxadmin', '10-06-2013 06:21:16', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (skins)'),
(1277, 0, 0, 'dxadmin', '10-06-2013 06:57:44', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified ([object%20Object])'),
(1278, 0, 0, 'dxadmin', '10-06-2013 07:33:44', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified ([object%20Object])'),
(1279, 0, 0, 'dxadmin', '10-06-2013 07:35:23', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified ([object%20Object])'),
(1280, 0, 0, 'dxadmin', '10-06-2013 09:27:57', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (page)'),
(1281, 0, 0, 'dxadmin', '10-06-2013 09:30:49', 'ERR', 3, 'File Path to error:: /Users/jsmith/Documents/Frameworks/Zend/ZendFramework-1.12.3/library/Zend/Controller/Dispatcher/Standard.php, Line Number:: 248, Exception Message:: Invalid controller specified (page)');

-- --------------------------------------------------------

--
-- Table structure for table `mediaalbums`
--

DROP TABLE IF EXISTS `mediaalbums`;
CREATE TABLE `mediaalbums` (
  `albumId` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL DEFAULT '0',
  `albumName` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'guest',
  `passWord` varchar(40) DEFAULT NULL,
  `albumDesc` mediumtext,
  `serverPath` varchar(255) NOT NULL,
  `timestamp` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`albumId`),
  KEY `albumName` (`albumName`,`userId`),
  KEY `role` (`role`),
  KEY `parentId` (`parentId`),
  KEY `serverPath` (`serverPath`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mediaalbums`
--

INSERT INTO `mediaalbums` (`albumId`, `parentId`, `albumName`, `userId`, `role`, `passWord`, `albumDesc`, `serverPath`, `timestamp`) VALUES
(-3, 0, 'Slider', 1, 'guest', NULL, NULL, '', '0'),
(-2, 0, 'Media', 1, 'guest', NULL, 'This is the default Album for the Media module. This album can not be deleted as the system is dependent upon it for correct operation.', '', '0'),
(-1, 0, 'Pages', 1, 'guest', NULL, 'This is the default Album for the Pages module. This album can not be deleted as the system is dependent upon it for correct operation.', '', '0'),
(1, -2, 'Default', 1, 'guest', NULL, NULL, 'Default', '0');

-- --------------------------------------------------------

--
-- Table structure for table `mediafiles`
--

DROP TABLE IF EXISTS `mediafiles`;
CREATE TABLE `mediafiles` (
  `fileId` int(11) NOT NULL AUTO_INCREMENT,
  `albumId` int(11) DEFAULT NULL,
  `fileName` varchar(255) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `description` mediumtext,
  `order` int(11) NOT NULL,
  `timestamp` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fileId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `mediafiles`
--

INSERT INTO `mediafiles` (`fileId`, `albumId`, `fileName`, `title`, `alt`, `description`, `order`, `timestamp`) VALUES
(1, -3, 'slider-default-one.png', NULL, NULL, '', 0, '1353951475'),
(2, -3, 'slider-default-three.png', NULL, NULL, '', 0, '1353951475'),
(3, -3, 'slider-default-two.png', NULL, NULL, '', 0, '1353951476'),
(8, 1, 'blue-wheat-grass.jpg', NULL, NULL, '', 0, '1355802796'),
(9, 1, 'brokencar.jpg', NULL, NULL, '', 0, '1355802799'),
(10, 1, 'car.jpg', NULL, NULL, '', 0, '1355802800'),
(11, 1, 'redtruck.jpg', NULL, NULL, '', 0, '1355802800'),
(12, 1, 'sun-grass-golden.jpg', NULL, NULL, '', 0, '1355802801');

-- --------------------------------------------------------

--
-- Table structure for table `menuCategories`
--

DROP TABLE IF EXISTS `menuCategories`;
CREATE TABLE `menuCategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL DEFAULT '0',
  `menuId` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `createdDate` int(11) NOT NULL,
  `updatedDate` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parentId` (`parentId`,`menuId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `menuCategories`
--

INSERT INTO `menuCategories` (`id`, `parentId`, `menuId`, `name`, `order`, `createdDate`, `updatedDate`) VALUES
(1, 0, 1, 'Food', 1, 0, 0),
(2, 0, 1, 'Drinks', 0, 1375738068, 0),
(7, 1, 1, 'Starters', 0, 1375738816, 0),
(12, 0, 3, 'Entrees', 0, 1375799896, 1376672146),
(14, 0, 3, 'Appetizers', 0, 1375799913, 1376672161),
(17, 12, 3, 'Sandwiches', 0, 1375807713, 1376672051),
(18, 1, 1, 'Sandwiches', 0, 1375807863, 0),
(19, 2, 1, 'Beers', 0, 1375807945, 0),
(20, 2, 1, 'Wines', 0, 1375807959, 0),
(21, 1, 1, 'Entrees', 0, 1375809566, 0),
(22, 1, 1, 'Sides', 0, 1375809601, 0),
(23, 1, 1, 'Desserts', 0, 1375809630, 0),
(24, 2, 1, 'Sodas', 0, 1375815416, 0),
(25, 1, 1, 'Soups', 0, 1375815450, 0);

-- --------------------------------------------------------

--
-- Table structure for table `menuItems`
--

DROP TABLE IF EXISTS `menuItems`;
CREATE TABLE `menuItems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `categoryId` int(11) NOT NULL DEFAULT '1',
  `menuId` int(11) NOT NULL,
  `createdDate` int(11) NOT NULL,
  `updatedDate` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `availability` enum('Seasonal','All Year','Not Available') NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `shortDescription` mediumtext NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `isSpecial` tinyint(1) NOT NULL,
  `specialOrder` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `menuItems`
--

INSERT INTO `menuItems` (`id`, `name`, `categoryId`, `menuId`, `createdDate`, `updatedDate`, `price`, `availability`, `isActive`, `shortDescription`, `content`, `image`, `order`, `isSpecial`, `specialOrder`) VALUES
(4, 'Chicken', 7, 1, 1375742170, 1376947895, 10.00, 'All Year', 1, 'Chicken', '<p>\r\n	Cluck cluck</p>\r\n', '', 0, 1, 0),
(5, 'Blah', 7, 1, 1375742763, 1376947880, 12.99, 'Seasonal', 1, 'Blah blah yada', '<p>\r\n	thwthwrt5gy ethey6hw56y26</p>\r\n', '', 0, 1, 0),
(12, 'Bacon Wrapped Corn Dogs', 1, 3, 1375802732, 1376671950, 10.00, 'All Year', 1, 'Bacon Wrapped Corn Dogs', '<p>\r\n	Bacon Wrapped Corn Dogs</p>\r\n', '', 0, 1, 0),
(15, 'Test Starters', 14, 3, 1375807687, 0, 8.00, 'All Year', 1, '', 'aefjhawr;kghearg', '', 0, 0, 0),
(16, 'Test Sandwich One', 17, 3, 1375807725, 0, 12.00, 'All Year', 1, '', 'rgsekrjhgosi;egjhn', '', 0, 0, 0),
(17, 'Test Sandwich Two', 17, 3, 1375807755, 0, 15.00, 'All Year', 1, '', 'egserkgnelh', '', 0, 0, 0),
(20, 'Buffalo Chicken Sandwich', 18, 1, 1375807876, 1376947911, 12.00, 'All Year', 1, '', '<p>\r\n	f.eajrgklergn</p>\r\n', '', 0, 1, 0),
(21, 'Russian Stout', 19, 1, 1375807971, 0, 6.00, 'All Year', 1, '', 'egaergaegr', '', 0, 0, 0),
(22, 'Summer Ale', 19, 1, 1375807996, 0, 4.00, 'All Year', 1, '', 'rgkerjgioserg', '', 0, 0, 0),
(23, 'Red Wine', 20, 1, 1375808015, 0, 7.00, 'All Year', 1, '', 'rgewrshsg', '', 0, 0, 0),
(24, 'White Wine', 20, 1, 1375808035, 0, 8.00, 'All Year', 1, '', 'argaergaerg', '', 0, 0, 0),
(25, 'BLT', 18, 1, 1375808067, 0, 5.00, 'All Year', 1, '', 'Best sandwich ever.', '', 0, 0, 0),
(26, 'Fries Starter', 7, 1, 1375808127, 0, 5.00, 'All Year', 1, '', 'aregaergarf', '', 0, 0, 0),
(27, 'Buffalo Wings', 7, 1, 1375808153, 0, 8.00, 'All Year', 1, '', 'Just wonderful.', '', 0, 0, 0),
(28, 'Wine Three', 20, 1, 1375808622, 0, 34.00, 'All Year', 1, '', 'gsergserg', '', 0, 0, 0),
(29, 'Wine Four', 20, 1, 1375808652, 0, 23.00, 'All Year', 1, '', 'aergaerg', '', 0, 0, 0),
(32, 'Test Starter Three', 14, 3, 1375808770, 0, 6.00, 'All Year', 1, '', 'regergserg', '', 0, 0, 0),
(33, 'Test Starter Four', 14, 3, 1375808792, 0, 3.00, 'All Year', 1, '', 'argaerhgershg', '', 0, 0, 0),
(34, 'Entree One', 21, 1, 1375809998, 0, 10.00, 'All Year', 1, '', 'gergsgse', '', 0, 0, 0),
(35, 'Side One', 22, 1, 1375810021, 0, 0.00, 'All Year', 1, '', 'rgserhgsth', '', 0, 0, 0),
(36, 'Dessert One', 23, 1, 1375810038, 0, 7.00, 'All Year', 1, '', 'rgsdgserhsth', '', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `createdDate` int(11) NOT NULL,
  `updatedDate` int(11) NOT NULL,
  `isCurrent` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `createdDate`, `updatedDate`, `isCurrent`) VALUES
(1, 'Menu', 1375730950, 1376677477, 1),
(3, 'Test Menu', 1375799886, 1376677458, 0),
(4, 'Menu Three', 1375810148, 0, 0),
(5, 'Menu Four', 1375810156, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `message_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue_id` int(10) unsigned NOT NULL,
  `handle` char(32) DEFAULT NULL,
  `body` varchar(8192) NOT NULL,
  `md5` char(32) NOT NULL,
  `timeout` decimal(14,4) unsigned DEFAULT NULL,
  `created` int(10) unsigned NOT NULL,
  PRIMARY KEY (`message_id`),
  UNIQUE KEY `message_handle` (`handle`),
  KEY `message_queueid` (`queue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `modulesettings`
--

DROP TABLE IF EXISTS `modulesettings`;
CREATE TABLE `modulesettings` (
  `moduleName` varchar(255) NOT NULL,
  `variable` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `settingType` tinytext NOT NULL,
  PRIMARY KEY (`variable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modulesettings`
--

INSERT INTO `modulesettings` (`moduleName`, `variable`, `value`, `settingType`) VALUES
('testimonials', 'allowUserPostNew', '1', 'Checkbox'),
('contact', 'contactPhoneNumber', 'P: 205-917-5080', 'Textbox'),
('contact', 'emailAddress', 'E: david@theridgealabama.com', 'Textbox'),
('contact', 'enableContactInfo', '1', 'Checkbox'),
('user', 'enableMainMenuLogin', '1', 'Checkbox'),
('media', 'enableOnHoverDescriptions', '0', 'Checkbox'),
('user', 'enableRegistration', '1', 'Checkbox'),
('home page', 'enableSiteSlogan', '0', 'Checkbox'),
('contact', 'enableSocialMedia', '1', 'Checkbox'),
('user', 'enableUserLogin', '1', 'Checkbox'),
('contact', 'facebookUrl', 'http://www.facebook.com/theridgealabama', 'Textarea'),
('home page', 'hwBlurbLength', '300', 'Textbox'),
('media', 'mediaIsActive', '1', 'Checkbox'),
('home page', 'numSubPagesToShow', '1', 'Textbox'),
('contact', 'placeAddressLine1', '3325 Rocky Ridge Plaza', 'Textbox'),
('contact', 'placeAddressLine2', 'Vestavia Hills, AL 35243', 'Textbox'),
('contact', 'placeAddressLine3', '*"Up top" at Rocky Ridge Plaza', 'Textbox'),
('pages', 'showChildPages', '1', 'Checkbox'),
('user', 'showEmail', '1', 'Checkbox'),
('media', 'showFileDescription', '1', 'Checkbox'),
('media', 'showFileTitleInGallery', '1', 'Checkbox'),
('media', 'showFileUploadTime', '0', 'Checkbox'),
('home page', 'showHomeTextContent', '1', 'Checkbox'),
('media', 'showMostRecentFirst', '1', 'Checkbox'),
('pages', 'showPageHeading', '0', 'Checkbox'),
('media', 'showRecentByDate', '1', 'Checkbox'),
('media', 'showRecentCount', '4', 'Textbox'),
('media', 'showRecentImagesOnHome', '1', 'Checkbox'),
('media', 'showRecentInGallery', '1', 'Checkbox'),
('media', 'showRecentNumDays', '14', 'Textbox'),
('media', 'showTitlesInRecentWidget', '1', 'Checkbox'),
('home page', 'siteSloganText', 'Awesome Food', 'Textarea'),
('home page', 'siteSloganTextLine2', 'Good Times', 'Textarea'),
('testimonials', 'testimonialsIsActive', '1', 'Checkbox'),
('contact', 'twitterUrl', 'http://twitter.com/theridgealabama', 'Textarea');

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

DROP TABLE IF EXISTS `newsletter`;
CREATE TABLE `newsletter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `type` enum('all','newsletter','offers','') NOT NULL DEFAULT 'all',
  `exported` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pagecategories`
--

DROP TABLE IF EXISTS `pagecategories`;
CREATE TABLE `pagecategories` (
  `categoryId` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(50) NOT NULL,
  `parentId` int(11) NOT NULL DEFAULT '0',
  `visibility` enum('public','private') NOT NULL,
  PRIMARY KEY (`categoryId`),
  KEY `categoryName` (`categoryName`,`parentId`,`visibility`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pagecomments`
--

DROP TABLE IF EXISTS `pagecomments`;
CREATE TABLE `pagecomments` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `pageId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdDate` int(11) NOT NULL,
  `modifiedDate` int(11) NOT NULL,
  `visibility` enum('public','private') NOT NULL,
  `commentText` longtext NOT NULL,
  PRIMARY KEY (`commentId`),
  KEY `pageId` (`pageId`,`userId`,`createdDate`,`modifiedDate`,`visibility`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pagefiles`
--

DROP TABLE IF EXISTS `pagefiles`;
CREATE TABLE `pagefiles` (
  `fileId` int(11) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(255) NOT NULL,
  `pageId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `isMainImage` int(1) DEFAULT NULL,
  PRIMARY KEY (`fileId`),
  KEY `pageId` (`pageId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pagelookup`
--

DROP TABLE IF EXISTS `pagelookup`;
CREATE TABLE `pagelookup` (
  `pageId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`pageId`),
  KEY `parentId` (`parentId`,`categoryId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pagelookup`
--

INSERT INTO `pagelookup` (`pageId`, `userId`, `parentId`, `categoryId`) VALUES
(1, 1, NULL, NULL),
(15, 1, 1, NULL),
(19, 4, NULL, NULL),
(26, 4, NULL, NULL),
(29, 1, 1, NULL),
(34, 1, NULL, NULL),
(36, 1, 35, NULL),
(37, 1, NULL, NULL),
(38, 1, NULL, NULL),
(39, 1, NULL, NULL),
(40, 1, NULL, NULL),
(42, 1, NULL, NULL),
(43, 1, NULL, NULL),
(44, 1, NULL, NULL),
(45, 1, NULL, NULL),
(46, 1, NULL, NULL),
(47, 1, NULL, NULL),
(57, 1, NULL, NULL),
(62, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pagemenulinks`
--

DROP TABLE IF EXISTS `pagemenulinks`;
CREATE TABLE `pagemenulinks` (
  `menuId` int(11) NOT NULL,
  `linkText` varchar(50) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `role` varchar(100) NOT NULL,
  `resource` varchar(255) NOT NULL,
  `order` int(11) DEFAULT NULL,
  `visibility` enum('public','private') NOT NULL,
  PRIMARY KEY (`menuId`),
  KEY `linkText` (`linkText`,`uri`,`role`,`visibility`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pagemenus`
--

DROP TABLE IF EXISTS `pagemenus`;
CREATE TABLE `pagemenus` (
  `menuId` int(11) NOT NULL AUTO_INCREMENT,
  `pageId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `visibility` enum('public','private') NOT NULL,
  PRIMARY KEY (`menuId`),
  KEY `pageId` (`pageId`,`userId`,`visibility`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `pageId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL DEFAULT '0',
  `parentId` int(11) NOT NULL DEFAULT '0',
  `role` varchar(100) NOT NULL DEFAULT 'guest',
  `pageName` varchar(50) NOT NULL,
  `pageUrl` varchar(255) NOT NULL COMMENT 'page is queried by this value',
  `visibility` enum('public','private') NOT NULL DEFAULT 'public',
  `createdDate` int(11) DEFAULT NULL,
  `publishDate` int(11) DEFAULT NULL,
  `modifiedDate` int(11) DEFAULT NULL,
  `archivedDate` int(11) DEFAULT NULL,
  `pageOrder` int(11) DEFAULT NULL,
  `pageType` varchar(255) NOT NULL DEFAULT 'page',
  `pageText` longtext NOT NULL,
  `keyWords` varchar(255) NOT NULL,
  `showSlider` tinyint(1) NOT NULL DEFAULT '0',
  `showInHomeWidget` tinyint(1) NOT NULL DEFAULT '0',
  `headerImage` varchar(255) NOT NULL DEFAULT 'default_header.png',
  `image` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `linkText` varchar(255) NOT NULL,
  PRIMARY KEY (`pageId`),
  KEY `userId` (`visibility`,`createdDate`,`modifiedDate`,`archivedDate`,`pageOrder`,`pageType`),
  KEY `parentId` (`parentId`),
  KEY `role` (`role`),
  KEY `publishDate` (`publishDate`),
  KEY `userId_2` (`userId`),
  KEY `keyWords` (`keyWords`),
  KEY `pageUrl` (`pageUrl`),
  KEY `showInHomeWidget` (`showInHomeWidget`),
  KEY `pageName` (`pageName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`pageId`, `userId`, `parentId`, `role`, `pageName`, `pageUrl`, `visibility`, `createdDate`, `publishDate`, `modifiedDate`, `archivedDate`, `pageOrder`, `pageType`, `pageText`, `keyWords`, `showSlider`, `showInHomeWidget`, `headerImage`, `image`, `icon`, `logo`, `linkText`) VALUES
(1, 1, 0, 'guest', 'Home', 'home', 'public', 2012, 0, 1376727502, 0, 1, 'home', '<p>\r\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit amet neque nec erat egestas tempus. Maecenas ipsum dolor, dictum nec nulla vitae, hendrerit vestibulum enim. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer dapibus, nisl eget dictum iaculis, dui libero hendrerit odio, eget ultricies massa velit ac libero. In nibh nibh, blandit vitae mauris nec, rhoncus hendrerit enim. Maecenas faucibus vehicula felis. Curabitur consectetur ligula et nibh condimentum, ac ullamcorper neque varius. Quisque id laoreet risus, et facilisis libero.</p>\r\n', ' Testing, Extra,Keywords', 0, 0, '', '', NULL, NULL, ''),
(2, 1, 0, 'guest', 'Test', 'Test', 'public', 1374173647, NULL, 1374176034, NULL, 2, 'page', '<p>\r\n	<span style="font-size:12px;"><span style="color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; line-height: 14px; text-align: justify;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vel orci id ante euismod commodo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac dapibus augue. Maecenas a sagittis erat. Aenean hendrerit ante non libero lacinia, sit amet congue lorem porttitor. Vivamus vel lectus vel velit mattis pretium. In ut erat sit amet orci eleifend pretium eu vel tortor.</span></span></p>\r\n<p>\r\n	<span style="font-size:12px;"><span style="color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; line-height: 14px; text-align: justify;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vel orci id ante euismod commodo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac dapibus augue. Maecenas a sagittis erat. Aenean hendrerit ante non libero lacinia, sit amet congue lorem porttitor. Vivamus vel lectus vel velit mattis pretium. In ut erat sit amet orci eleifend pretium eu vel tortor.</span></span></p>\r\n<p>\r\n	<span style="font-size:12px;"><span style="color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; line-height: 14px; text-align: justify;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vel orci id ante euismod commodo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac dapibus augue. Maecenas a sagittis erat. Aenean hendrerit ante non libero lacinia, sit amet congue lorem porttitor. Vivamus vel lectus vel velit mattis pretium. In ut erat sit amet orci eleifend pretium eu vel tortor.</span></span></p>\r\n<p>\r\n	<span style="font-size:12px;"><span style="color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; line-height: 14px; text-align: justify;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vel orci id ante euismod commodo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac dapibus augue. Maecenas a sagittis erat. Aenean hendrerit ante non libero lacinia, sit amet congue lorem porttitor. Vivamus vel lectus vel velit mattis pretium. In ut erat sit amet orci eleifend pretium eu vel tortor.</span></span></p>\r\n', '', 0, 0, '', NULL, NULL, NULL, 'Test'),
(3, 0, 2, 'guest', 'Test Child', 'Test-Child', 'public', 1376662057, NULL, NULL, NULL, 3, 'page', '<p>\r\n	This is just a test page to give a child to Test</p>\r\n', '', 0, 0, 'default_header.png', NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `pagetypes`
--

DROP TABLE IF EXISTS `pagetypes`;
CREATE TABLE `pagetypes` (
  `pageTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`pageTypeId`),
  UNIQUE KEY `type_2` (`type`),
  KEY `type` (`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `pagetypes`
--

INSERT INTO `pagetypes` (`pageTypeId`, `type`) VALUES
(2, 'contact'),
(5, 'events'),
(9, 'festival'),
(1, 'home'),
(3, 'media'),
(8, 'menu'),
(7, 'ordering'),
(4, 'page');

-- --------------------------------------------------------

--
-- Table structure for table `pagewidgets`
--

DROP TABLE IF EXISTS `pagewidgets`;
CREATE TABLE `pagewidgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageId` int(11) NOT NULL,
  `pageUrl` varchar(255) NOT NULL,
  `module` varchar(255) NOT NULL,
  `controller` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pageUrl` (`pageUrl`,`module`,`controller`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
CREATE TABLE `queue` (
  `queue_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `queue_name` varchar(100) NOT NULL,
  `timeout` smallint(5) unsigned NOT NULL DEFAULT '30',
  PRIMARY KEY (`queue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) NOT NULL,
  `inheritsFrom` varchar(255) NOT NULL,
  `publicName` varchar(100) NOT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`roleId`, `role`, `inheritsFrom`, `publicName`) VALUES
(1, 'admin', 'jradmin', ''),
(2, 'jradmin', 'moderator', ''),
(3, 'moderator', 'user', ''),
(4, 'user', 'guest', ''),
(5, 'guest', 'none', '');

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE `session` (
  `id` char(32) NOT NULL DEFAULT '',
  `modified` int(11) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`id`, `modified`, `lifetime`, `data`) VALUES
('830472c52447bb3182101b2e820579fe', 1381113677, 86400, '.Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.69 Safari/537.36|a:1:{s:7:"storage";s:3187:"a:6:{s:12:"browser_type";s:7:"desktop";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:27:"Zend_Http_UserAgent_Desktop";s:6:"device";s:2593:"a:6:{s:10:"_aFeatures";a:28:{s:21:"browser_compatibility";s:6:"Safari";s:14:"browser_engine";s:11:"AppleWebKit";s:12:"browser_name";s:6:"Chrome";s:13:"browser_token";s:21:"Intel Mac OS X 10_8_5";s:15:"browser_version";s:12:"30.0.1599.69";s:7:"comment";a:2:{s:4:"full";s:32:"Macintosh; Intel Mac OS X 10_8_5";s:6:"detail";a:2:{i:0;s:9:"Macintosh";i:1;s:22:" Intel Mac OS X 10_8_5";}}s:18:"compatibility_flag";s:9:"Macintosh";s:15:"device_os_token";s:9:"Macintosh";s:6:"others";a:2:{s:4:"full";s:72:"AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.69 Safari/537.36";s:6:"detail";a:3:{i:0;a:3:{i:0;s:38:"AppleWebKit/537.36 (KHTML, like Gecko)";i:1;s:11:"AppleWebKit";i:2;s:6:"537.36";}i:1;a:3:{i:0;s:19:"Chrome/30.0.1599.69";i:1;s:6:"Chrome";i:2;s:12:"30.0.1599.69";}i:2;a:3:{i:0;s:13:"Safari/537.36";i:1;s:6:"Safari";i:2;s:6:"537.36";}}}s:12:"product_name";s:7:"Mozilla";s:15:"product_version";s:3:"5.0";s:10:"user_agent";s:11:"Mozilla/5.0";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:0;s:10:"is_desktop";b:1;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:9:"127.0.0.1";s:11:"php_version";s:6:"5.4.10";s:9:"server_os";s:6:"apache";s:17:"server_os_version";i:1;s:18:"server_http_accept";s:74:"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8";s:27:"server_http_accept_language";s:14:"en-US,en;q=0.8";s:9:"server_ip";s:9:"127.0.0.1";s:11:"server_name";s:19:"cats.webinertia.net";}s:7:"_aGroup";a:2:{s:12:"product_info";a:21:{i:0;s:21:"browser_compatibility";i:1;s:14:"browser_engine";i:2;s:12:"browser_name";i:3;s:13:"browser_token";i:4;s:15:"browser_version";i:5;s:7:"comment";i:6;s:18:"compatibility_flag";i:7;s:15:"device_os_token";i:8;s:6:"others";i:9;s:12:"product_name";i:10;s:15:"product_version";i:11;s:10:"user_agent";i:12;s:18:"is_wireless_device";i:13;s:9:"is_mobile";i:14;s:10:"is_desktop";i:15;s:9:"is_tablet";i:16;s:6:"is_bot";i:17;s:8:"is_email";i:18;s:7:"is_text";i:19;s:25:"device_claims_web_support";i:20;s:9:"client_ip";}s:11:"server_info";a:7:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:18:"server_http_accept";i:4;s:27:"server_http_accept_language";i:5;s:9:"server_ip";i:6;s:11:"server_name";}}s:8:"_browser";s:6:"Chrome";s:15:"_browserVersion";s:12:"30.0.1599.69";s:10:"_userAgent";s:119:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.69 Safari/537.36";s:7:"_images";a:6:{i:0;s:4:"jpeg";i:1;s:3:"gif";i:2;s:3:"png";i:3;s:5:"pjpeg";i:4;s:5:"x-png";i:5;s:3:"bmp";}}";s:10:"user_agent";s:119:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.69 Safari/537.36";s:11:"http_accept";s:74:"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8";}";}Zend_Auth|a:1:{s:7:"storage";O:8:"stdClass":3:{s:6:"userId";s:1:"0";s:8:"userName";s:7:"dxadmin";s:4:"role";s:7:"dxadmin";}}'),
('acc48608cb28e345a39441e96d40e71b', 1381079347, 86400, '.Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:24.0) Gecko/20100101 Firefox/24.0|a:1:{s:7:"storage";s:2936:"a:6:{s:12:"browser_type";s:7:"desktop";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:27:"Zend_Http_UserAgent_Desktop";s:6:"device";s:2392:"a:6:{s:10:"_aFeatures";a:28:{s:21:"browser_compatibility";s:7:"Firefox";s:14:"browser_engine";s:5:"Gecko";s:12:"browser_name";s:7:"Firefox";s:13:"browser_token";s:19:"Intel Mac OS X 10.7";s:15:"browser_version";s:4:"24.0";s:7:"comment";a:2:{s:4:"full";s:39:"Macintosh; Intel Mac OS X 10.7; rv:24.0";s:6:"detail";a:3:{i:0;s:9:"Macintosh";i:1;s:20:" Intel Mac OS X 10.7";i:2;s:8:" rv:24.0";}}s:18:"compatibility_flag";s:9:"Macintosh";s:15:"device_os_token";s:7:"rv:24.0";s:6:"others";a:2:{s:4:"full";s:27:"Gecko/20100101 Firefox/24.0";s:6:"detail";a:2:{i:0;a:3:{i:0;s:14:"Gecko/20100101";i:1;s:5:"Gecko";i:2;s:8:"20100101";}i:1;a:3:{i:0;s:12:"Firefox/24.0";i:1;s:7:"Firefox";i:2;s:4:"24.0";}}}s:12:"product_name";s:7:"Mozilla";s:15:"product_version";s:3:"5.0";s:10:"user_agent";s:11:"Mozilla/5.0";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:0;s:10:"is_desktop";b:1;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:13:"64.53.243.105";s:11:"php_version";s:6:"5.4.10";s:9:"server_os";s:6:"apache";s:17:"server_os_version";i:1;s:18:"server_http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";s:27:"server_http_accept_language";s:14:"en-US,en;q=0.5";s:9:"server_ip";s:12:"192.168.1.10";s:11:"server_name";s:19:"cats.webinertia.net";}s:7:"_aGroup";a:2:{s:12:"product_info";a:21:{i:0;s:21:"browser_compatibility";i:1;s:14:"browser_engine";i:2;s:12:"browser_name";i:3;s:13:"browser_token";i:4;s:15:"browser_version";i:5;s:7:"comment";i:6;s:18:"compatibility_flag";i:7;s:15:"device_os_token";i:8;s:6:"others";i:9;s:12:"product_name";i:10;s:15:"product_version";i:11;s:10:"user_agent";i:12;s:18:"is_wireless_device";i:13;s:9:"is_mobile";i:14;s:10:"is_desktop";i:15;s:9:"is_tablet";i:16;s:6:"is_bot";i:17;s:8:"is_email";i:18;s:7:"is_text";i:19;s:25:"device_claims_web_support";i:20;s:9:"client_ip";}s:11:"server_info";a:7:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:18:"server_http_accept";i:4;s:27:"server_http_accept_language";i:5;s:9:"server_ip";i:6;s:11:"server_name";}}s:8:"_browser";s:7:"Firefox";s:15:"_browserVersion";s:4:"24.0";s:10:"_userAgent";s:81:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:24.0) Gecko/20100101 Firefox/24.0";s:7:"_images";a:6:{i:0;s:4:"jpeg";i:1;s:3:"gif";i:2;s:3:"png";i:3;s:5:"pjpeg";i:4;s:5:"x-png";i:5;s:3:"bmp";}}";s:10:"user_agent";s:81:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:24.0) Gecko/20100101 Firefox/24.0";s:11:"http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";}";}'),
('c1317e9e0d234b9de7040b36e80a376c', 1381084374, 86400, '.Mozilla/5.0 (iPad; CPU OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53|a:1:{s:7:"storage";s:3312:"a:6:{s:12:"browser_type";s:6:"mobile";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:26:"Zend_Http_UserAgent_Mobile";s:6:"device";s:2724:"a:6:{s:10:"_aFeatures";a:32:{s:13:"browser_build";s:7:"9537.53";s:21:"browser_compatibility";s:6:"Safari";s:14:"browser_engine";s:11:"AppleWebKit";s:12:"browser_name";s:13:"Safari Mobile";s:13:"browser_token";s:24:"CPU OS 7_0 like Mac OS X";s:15:"browser_version";s:3:"7.0";s:7:"comment";a:2:{s:4:"full";s:30:"iPad; CPU OS 7_0 like Mac OS X";s:6:"detail";a:2:{i:0;s:4:"iPad";i:1;s:25:" CPU OS 7_0 like Mac OS X";}}s:18:"compatibility_flag";s:4:"iPad";s:6:"device";s:4:"ipad";s:15:"device_os_token";s:9:"iPhone OS";s:8:"firmware";s:6:"11A465";s:6:"others";a:2:{s:4:"full";s:81:"AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53";s:6:"detail";a:4:{i:0;a:3:{i:0;s:40:"AppleWebKit/537.51.1 (KHTML, like Gecko)";i:1;s:11:"AppleWebKit";i:2;s:8:"537.51.1";}i:1;a:3:{i:0;s:11:"Version/7.0";i:1;s:7:"Version";i:2;s:3:"7.0";}i:2;a:3:{i:0;s:13:"Mobile/11A465";i:1;s:6:"Mobile";i:2;s:6:"11A465";}i:3;a:3:{i:0;s:14:"Safari/9537.53";i:1;s:6:"Safari";i:2;s:7:"9537.53";}}}s:12:"product_name";s:7:"Mozilla";s:15:"product_version";s:3:"5.0";s:10:"user_agent";s:11:"Mozilla/5.0";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:1;s:10:"is_desktop";b:0;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:9:"127.0.0.1";s:11:"php_version";s:6:"5.4.10";s:9:"server_os";s:6:"apache";s:17:"server_os_version";i:1;s:18:"server_http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";s:27:"server_http_accept_language";s:5:"en-us";s:9:"server_ip";s:9:"127.0.0.1";s:11:"server_name";s:19:"cats.webinertia.net";s:6:"markup";s:6:"iphone";}s:7:"_aGroup";a:2:{s:12:"product_info";a:24:{i:0;s:13:"browser_build";i:1;s:21:"browser_compatibility";i:2;s:14:"browser_engine";i:3;s:12:"browser_name";i:4;s:13:"browser_token";i:5;s:15:"browser_version";i:6;s:7:"comment";i:7;s:18:"compatibility_flag";i:8;s:6:"device";i:9;s:15:"device_os_token";i:10;s:8:"firmware";i:11;s:6:"others";i:12;s:12:"product_name";i:13;s:15:"product_version";i:14;s:10:"user_agent";i:15;s:18:"is_wireless_device";i:16;s:9:"is_mobile";i:17;s:10:"is_desktop";i:18;s:9:"is_tablet";i:19;s:6:"is_bot";i:20;s:8:"is_email";i:21;s:7:"is_text";i:22;s:25:"device_claims_web_support";i:23;s:9:"client_ip";}s:11:"server_info";a:7:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:18:"server_http_accept";i:4;s:27:"server_http_accept_language";i:5;s:9:"server_ip";i:6;s:11:"server_name";}}s:8:"_browser";s:13:"Safari Mobile";s:15:"_browserVersion";s:3:"7.0";s:10:"_userAgent";s:126:"Mozilla/5.0 (iPad; CPU OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53";s:7:"_images";a:0:{}}";s:10:"user_agent";s:126:"Mozilla/5.0 (iPad; CPU OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53";s:11:"http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";}";}');

-- --------------------------------------------------------

--
-- Table structure for table `skins`
--

DROP TABLE IF EXISTS `skins`;
CREATE TABLE `skins` (
  `skinId` int(11) NOT NULL AUTO_INCREMENT,
  `skinName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`skinId`),
  UNIQUE KEY `skinName` (`skinName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `skins`
--

INSERT INTO `skins` (`skinId`, `skinName`) VALUES
(12, 'cats'),
(1, 'default');

-- --------------------------------------------------------

--
-- Table structure for table `skin_settings`
--

DROP TABLE IF EXISTS `skin_settings`;
CREATE TABLE `skin_settings` (
  `recordId` int(11) NOT NULL AUTO_INCREMENT,
  `skinId` int(11) NOT NULL,
  `spec` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`recordId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `skin_settings`
--

INSERT INTO `skin_settings` (`recordId`, `skinId`, `spec`, `value`) VALUES
(1, 1, 'skinVersion', '1.1.0'),
(2, 1, 'appVersion', '1.1.0'),
(3, 1, 'isCurrentSkin', '1'),
(9, 1, 'customAdmin', '0'),
(13, 12, 'isCurrentSkin', '0');

-- --------------------------------------------------------

--
-- Table structure for table `slidersettings`
--

DROP TABLE IF EXISTS `slidersettings`;
CREATE TABLE `slidersettings` (
  `name` varchar(255) NOT NULL,
  `isActive` int(1) NOT NULL DEFAULT '0' COMMENT 'used for boolean',
  `effect` varchar(255) NOT NULL DEFAULT 'fade',
  `slices` int(11) NOT NULL DEFAULT '15',
  `boxCols` int(11) NOT NULL DEFAULT '8',
  `boxRows` int(11) NOT NULL DEFAULT '4',
  `animSpeed` int(11) NOT NULL DEFAULT '500',
  `pauseTime` int(11) NOT NULL DEFAULT '3000',
  `startSlide` int(11) NOT NULL DEFAULT '1',
  `directionNav` int(1) NOT NULL DEFAULT '1' COMMENT 'used for boolean',
  `controlNav` int(1) NOT NULL DEFAULT '1' COMMENT 'used for boolean',
  `controlNavThumbs` int(1) NOT NULL DEFAULT '0' COMMENT 'used for boolean',
  `pauseOnHover` int(1) NOT NULL DEFAULT '1' COMMENT 'used for boolean',
  `manualAdvance` int(1) NOT NULL DEFAULT '0' COMMENT 'used for boolean',
  `prevText` varchar(25) NOT NULL DEFAULT 'Prev' COMMENT 'label for prev text',
  `nextText` varchar(25) NOT NULL DEFAULT 'Next' COMMENT 'label for next text',
  `randomStart` int(1) NOT NULL DEFAULT '0' COMMENT 'used for boolean',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slidersettings`
--

INSERT INTO `slidersettings` (`name`, `isActive`, `effect`, `slices`, `boxCols`, `boxRows`, `animSpeed`, `pauseTime`, `startSlide`, `directionNav`, `controlNav`, `controlNavThumbs`, `pauseOnHover`, `manualAdvance`, `prevText`, `nextText`, `randomStart`) VALUES
('default', 1, 'fade', 15, 8, 4, 500, 3000, 1, 1, 0, 0, 1, 0, 'Prev', 'Next', 0);

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
CREATE TABLE `testimonials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guestName` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `rating` int(1) DEFAULT NULL,
  `isApproved` tinyint(1) NOT NULL DEFAULT '0',
  `createdDate` int(11) NOT NULL,
  `updatedDate` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `guestName`, `content`, `rating`, `isApproved`, `createdDate`, `updatedDate`) VALUES
(1, 'Joey Smith', 'testing testimonials submission on front end', NULL, 1, 1355687289, 0),
(2, 'Joey Smith', 'This is a test testimonial to test adding them to the search index.', NULL, 0, 1355868709, 0),
(3, 'Joey Smith', 'Testing resource url being stored in the search index for use in the view for linking to resource.', NULL, 1, 1355873588, 0),
(4, 'James Anthis', 'Just a test testimonial', NULL, 1, 1365708400, 0),
(5, 'James Anthis', 'This is just a test of the testimonials page.', NULL, 1, 1367858636, 1367935074),
(6, 'Jake Cole', 'Test', NULL, 1, 1368477635, 1368484133);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `userName` varchar(128) NOT NULL,
  `firstName` varchar(128) NOT NULL,
  `lastName` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `passWord` char(40) NOT NULL,
  `salt` char(32) NOT NULL,
  `role` varchar(100) NOT NULL DEFAULT 'user',
  `uStatus` varchar(8) NOT NULL DEFAULT 'disabled',
  `registeredDate` varchar(11) NOT NULL,
  `hash` int(10) NOT NULL,
  PRIMARY KEY (`userId`),
  KEY `email_pass` (`email`,`passWord`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `title`, `userName`, `firstName`, `lastName`, `email`, `passWord`, `salt`, `role`, `uStatus`, `registeredDate`, `hash`) VALUES
(0, '', 'dxadmin', '', '', '', 'e1da551374f0a6f136916647ab0f157cc192ea22', '', 'dxadmin', 'enabled', '', 0),
(9, '', 'randallk', 'Randall', 'Kaemmerer', 'randallk@dirextion.com', 'e1da551374f0a6f136916647ab0f157cc192ea22', '', 'admin', 'enabled', '1375316279', 0),
(10, '', 'test', 'TEST', 'TEST', 'test@test.com', '6c30886329e3e6961495d4dc6397c04c8b94f99a', '', 'dxadmin', 'enabled', '1376009650', 1376009650);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`queue_id`) REFERENCES `queue` (`queue_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
