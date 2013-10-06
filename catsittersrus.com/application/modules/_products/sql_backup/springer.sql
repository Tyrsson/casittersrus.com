-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost:443
-- Generation Time: May 21, 2013 at 10:34 AM
-- Server version: 5.5.24
-- PHP Version: 5.3.15

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `springer`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `productId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `categoryId` int(10) unsigned NOT NULL,
  `companyId` int(11) NOT NULL,
  `ident` varchar(56) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `shortDescription` varchar(200) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `discountPercent` int(3) NOT NULL,
  `taxable` enum('Yes','No') NOT NULL,
  `shippingWeight` decimal(10,2) NOT NULL,
  `shippingCost` decimal(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `featured` int(1) NOT NULL DEFAULT '0',
  `slider` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`productId`),
  UNIQUE KEY `ident` (`ident`),
  KEY `category` (`categoryId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productId`, `categoryId`, `companyId`, `ident`, `name`, `description`, `shortDescription`, `price`, `discountPercent`, `taxable`, `shippingWeight`, `shippingCost`, `image`, `featured`, `slider`) VALUES
(1, 1, 0, '1', 'Product 1', '<p>Nam adipiscing sagittis elementum. Donec lorem est, tristique sed sagittis eget, vestibulum vulputate nisi. Nulla facilisi. Donec feugiat odio et odio rhoncus bibendum. Nunc leo ligula, porta et vestibulum vitae, placerat ut diam. Curabitur dictum dolor et enim dictum a aliquam felis imperdiet.</p>', 'fgfgfgfg 22222', '14.99', 0, 'Yes', '0.00', '0.00', '/modules/products/images/products/1a3bd900d64827f5dfc2e51a3369c45f-d4ez39k.jpg', 1, 1),
(2, 1, 0, '2', 'Product 2', '<p>Nam adipiscing sagittis elementum. Donec lorem est, tristique sed sagittis eget, vestibulum vulputate nisi. Nulla facilisi. Donec feugiat odio et odio rhoncus bibendum. Nunc leo ligula, porta et vestibulum vitae, placerat ut diam. Curabitur dictum dolor et enim dictum a aliquam felis imperdiet.</p>', 'African Daisy', '2.99', 0, 'Yes', '0.00', '0.00', '', 0, 0),
(3, 1, 0, '3', 'Product 3', '<p>Nam adipiscing sagittis elementum. Donec lorem est, tristique sed sagittis eget, vestibulum vulputate nisi. Nulla facilisi. Donec feugiat odio et odio rhoncus bibendum. Nunc leo ligula, porta et vestibulum vitae, placerat ut diam. Curabitur dictum dolor et enim dictum a aliquam felis imperdiet.</p>', 'desc', '3.99', 0, 'Yes', '0.00', '0.00', '', 0, 1),
(5, 1, 0, '4', 'Product 4', 'Transcend Hard drive page text', 'Transcend Hard Drive', '4.99', 0, 'Yes', '0.00', '0.00', '', 1, 0),
(6, 1, 0, '5', 'Product 5', 'Product text.', 'Some another product', '5.99', 0, 'Yes', '0.00', '0.00', '/modules/products/images/products/1680_Motorbike.jpg', 0, 1),
(7, 4, 0, '6', 'Product 6', 'Product 6 description.', 'Product desc', '6.99', 0, 'Yes', '0.00', '0.00', '', 0, 1),
(8, 1, 0, 'F34CW', 'Fluorescent', '4'' T12 34w linear Fluorescent\r\n\r\nWe add some more text cause we forgot it when we made the product.', '4'' T12 34w linear Fluorescent', '2.99', 0, 'Yes', '0.00', '0.00', '', 1, 0),
(9, 1, 0, '123456', 'New Price Feature', 'This is to test and make sure that the price is no longer a required field for a product listing.', 'Testing the new price is not required feature.', '0.00', 0, 'Yes', '0.00', '0.00', '', 0, 0),
(10, 5, 0, '4568', 'Product Price Test', '<p>\r\n	This is to test adding a price after the required field for price was taken off.</p>', 'short description area', '14.99', 0, 'Yes', '0.00', '0.00', '', 0, 0),
(11, 7, 0, 'blah101', 'Testing', '<p>\r\n	This text should also be searchable, we just cant display all of it.</p>', 'This text should be searchable', '10.99', 0, 'Yes', '0.00', '0.00', '', 0, 0),
(12, 1, 0, 'yada102', 'Yada Bulb', '<p>\r\n	Long description for product</p>', 'Short Description', '12.99', 0, 'Yes', '0.00', '0.00', '', 0, 0),
(13, 1, 0, 'TSTNEW', 'Search Test', '<p>\r\n	This is the long description for the TSTNEW ident name is Search Test.</p>', 'TSTNEW short description', '14.99', 0, 'Yes', '0.00', '0.00', '', 0, 0),
(14, 8, 0, 'TSTNEWER', 'Another Search Test', '<p>\r\n	This text should be searchable for TSTNEWER key word blue.</p>', 'Short description for TSTNEWER', '99.99', 0, 'Yes', '0.00', '0.00', '', 0, 0),
(15, 4, 0, 'PHP101', 'Php 101', '<p>\r\n	This will be the long description for the Php101 product. This text should return a hit in the search but we can not display the content of this column. We will have a keyword of purple since that is the color of php.</p>', 'Short description for php101', '299.99', 0, 'Yes', '0.00', '0.00', '', 0, 0),
(16, 5, 0, '2222222', 'Test 1A', '<p>\r\n	Test Product 1A</p>', 'Test Product 1A', '35.00', 0, 'Yes', '0.00', '0.00', '', 0, 0),
(17, 5, 0, 'devproduct', 'Dev Product', '<p>\r\n	This is some test text to test the formatting of the text area for each project blah yada</p>', 'This is to test image paths', '12.99', 0, 'Yes', '0.00', '0.00', '/modules/products/images/products/defaultimg.png', 1, 1),
(18, 1, 0, 'TP2B', 'Test 2B', '<p>\r\n	Test product 2B</p>', 'Test product', '49.99', 0, 'Yes', '0.00', '0.00', '/modules/products/images/products/folderwithglass.jpg', 0, 0),
(19, 14, 0, 'ThumbTest', 'ThumbNail Test', '<p>\r\n	The image for this product should only be 60 x 60.</p>', 'testing thumnail creation', '12.99', 0, 'Yes', '0.00', '0.00', '', 1, 1),
(20, 4, 0, 'ImgTestThree', 'Image Test Three', '<p>\r\n	setting is 60 x 60</p>', 'testing image upload creation again......', '12.99', 0, 'Yes', '0.00', '0.00', '', 0, 1),
(21, 4, 0, 'Blahblah', 'TestingBlahImgYada', '<p>\r\n	60 x 60</p>', 'This is a description', '12.99', 0, 'Yes', '0.00', '0.00', '/modules/products/images/products/Downloads.png', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE IF NOT EXISTS `product_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ident` varchar(255) NOT NULL,
  `catName` varchar(255) NOT NULL,
  `catDescription` mediumtext NOT NULL,
  `catIcon` varchar(255) NOT NULL,
  `catImage` varchar(255) DEFAULT NULL,
  `menuText` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catName` (`catName`),
  KEY `ident` (`ident`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `ident`, `catName`, `catDescription`, `catIcon`, `catImage`, `menuText`, `order`) VALUES
(1, 'lft_trk', 'Lift Trucks', '', '', NULL, NULL, 0),
(2, 'linde', 'Linde', '', '', 'index_linde.jpg', NULL, 0),
(3, 'hyundai', 'Hyundai', '', '', 'index_hyundai.jpg', NULL, 0),
(4, 'kmtsu', 'Komatsu', '', '', 'index_komatsu.jpg', NULL, 0),
(5, 'linde_class_1', 'Linde Class I', '', '', 'class_one.png', 'Class I', 0),
(7, 'first_level_two', 'Second Top Level Cat', '', '', NULL, 'Second Parent', 0),
(9, 'scnd_top_lvl_child', 'Second Top level child', '', '', NULL, 'second level', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_catlookup`
--

CREATE TABLE IF NOT EXISTS `product_catlookup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catId` int(11) NOT NULL,
  `parentId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catId` (`catId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `product_catlookup`
--

INSERT INTO `product_catlookup` (`id`, `catId`, `parentId`) VALUES
(1, 2, 1),
(2, 3, 1),
(3, 4, 1),
(4, 5, 2),
(5, 1, 0),
(6, 7, 0),
(8, 9, 7);

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE IF NOT EXISTS `product_image` (
  `imageId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productId` int(10) unsigned NOT NULL,
  `thumbnail` varchar(200) NOT NULL,
  `full` varchar(200) NOT NULL,
  `isDefault` enum('Yes','No') NOT NULL DEFAULT 'No',
  PRIMARY KEY (`imageId`),
  KEY `productId` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_lookup`
--

CREATE TABLE IF NOT EXISTS `product_lookup` (
  `productId` int(11) NOT NULL,
  `catergoryId` int(11) NOT NULL,
  `pageId` int(11) NOT NULL,
  `imageId` int(11) NOT NULL,
  PRIMARY KEY (`productId`),
  KEY `catergoryId` (`catergoryId`,`pageId`,`imageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_lookup`
--

INSERT INTO `product_lookup` (`productId`, `catergoryId`, `pageId`, `imageId`) VALUES
(3, 0, 0, 0),
(4, 0, 0, 0),
(5, 0, 0, 0),
(6, 0, 0, 0),
(7, 0, 0, 0),
(8, 0, 0, 0),
(9, 0, 0, 0),
(10, 0, 0, 0),
(11, 0, 0, 0),
(14, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_page`
--

CREATE TABLE IF NOT EXISTS `product_page` (
  `pageId` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `body` text NOT NULL,
  PRIMARY KEY (`pageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
