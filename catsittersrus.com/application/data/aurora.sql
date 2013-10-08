-- phpMyAdmin SQL Dump
-- version 3.5.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 07, 2013 at 11:31 PM
-- Server version: 5.5.29
-- PHP Version: 5.4.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

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
('siteName', 'Aurora CMS', 'Text'),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
('1d78f28c3e613ab201cb453763b92812', 1381175494, 86400, ''),
('830472c52447bb3182101b2e820579fe', 1381205991, 86400, '.Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.69 Safari/537.36|a:1:{s:7:"storage";s:3187:"a:6:{s:12:"browser_type";s:7:"desktop";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:27:"Zend_Http_UserAgent_Desktop";s:6:"device";s:2593:"a:6:{s:10:"_aFeatures";a:28:{s:21:"browser_compatibility";s:6:"Safari";s:14:"browser_engine";s:11:"AppleWebKit";s:12:"browser_name";s:6:"Chrome";s:13:"browser_token";s:21:"Intel Mac OS X 10_8_5";s:15:"browser_version";s:12:"30.0.1599.69";s:7:"comment";a:2:{s:4:"full";s:32:"Macintosh; Intel Mac OS X 10_8_5";s:6:"detail";a:2:{i:0;s:9:"Macintosh";i:1;s:22:" Intel Mac OS X 10_8_5";}}s:18:"compatibility_flag";s:9:"Macintosh";s:15:"device_os_token";s:9:"Macintosh";s:6:"others";a:2:{s:4:"full";s:72:"AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.69 Safari/537.36";s:6:"detail";a:3:{i:0;a:3:{i:0;s:38:"AppleWebKit/537.36 (KHTML, like Gecko)";i:1;s:11:"AppleWebKit";i:2;s:6:"537.36";}i:1;a:3:{i:0;s:19:"Chrome/30.0.1599.69";i:1;s:6:"Chrome";i:2;s:12:"30.0.1599.69";}i:2;a:3:{i:0;s:13:"Safari/537.36";i:1;s:6:"Safari";i:2;s:6:"537.36";}}}s:12:"product_name";s:7:"Mozilla";s:15:"product_version";s:3:"5.0";s:10:"user_agent";s:11:"Mozilla/5.0";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:0;s:10:"is_desktop";b:1;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:9:"127.0.0.1";s:11:"php_version";s:6:"5.4.10";s:9:"server_os";s:6:"apache";s:17:"server_os_version";i:1;s:18:"server_http_accept";s:74:"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8";s:27:"server_http_accept_language";s:14:"en-US,en;q=0.8";s:9:"server_ip";s:9:"127.0.0.1";s:11:"server_name";s:19:"cats.webinertia.net";}s:7:"_aGroup";a:2:{s:12:"product_info";a:21:{i:0;s:21:"browser_compatibility";i:1;s:14:"browser_engine";i:2;s:12:"browser_name";i:3;s:13:"browser_token";i:4;s:15:"browser_version";i:5;s:7:"comment";i:6;s:18:"compatibility_flag";i:7;s:15:"device_os_token";i:8;s:6:"others";i:9;s:12:"product_name";i:10;s:15:"product_version";i:11;s:10:"user_agent";i:12;s:18:"is_wireless_device";i:13;s:9:"is_mobile";i:14;s:10:"is_desktop";i:15;s:9:"is_tablet";i:16;s:6:"is_bot";i:17;s:8:"is_email";i:18;s:7:"is_text";i:19;s:25:"device_claims_web_support";i:20;s:9:"client_ip";}s:11:"server_info";a:7:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:18:"server_http_accept";i:4;s:27:"server_http_accept_language";i:5;s:9:"server_ip";i:6;s:11:"server_name";}}s:8:"_browser";s:6:"Chrome";s:15:"_browserVersion";s:12:"30.0.1599.69";s:10:"_userAgent";s:119:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.69 Safari/537.36";s:7:"_images";a:6:{i:0;s:4:"jpeg";i:1;s:3:"gif";i:2;s:3:"png";i:3;s:5:"pjpeg";i:4;s:5:"x-png";i:5;s:3:"bmp";}}";s:10:"user_agent";s:119:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.69 Safari/537.36";s:11:"http_accept";s:74:"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8";}";}Zend_Auth|a:1:{s:7:"storage";O:8:"stdClass":3:{s:6:"userId";s:1:"0";s:8:"userName";s:7:"dxadmin";s:4:"role";s:7:"dxadmin";}}__ZF|a:2:{s:50:"Zend_Form_Captcha_775ebf470f24cb4ef4fd8a73ffef9b6b";a:2:{s:4:"ENNH";i:1;s:3:"ENT";i:1381206190;}s:50:"Zend_Form_Captcha_9ab7f9b43e763055f9c2f65d9b08b236";a:2:{s:4:"ENNH";i:1;s:3:"ENT";i:1381206291;}}Zend_Form_Captcha_775ebf470f24cb4ef4fd8a73ffef9b6b|a:1:{s:4:"word";s:6:"fa9in3";}Zend_Form_Captcha_9ab7f9b43e763055f9c2f65d9b08b236|a:1:{s:4:"word";s:6:"c9his2";}');

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
