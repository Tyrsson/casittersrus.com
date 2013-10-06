-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost:443
-- Generation Time: May 04, 2013 at 11:32 AM
-- Server version: 5.5.24
-- PHP Version: 5.3.15

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `ttob-aurora`
--

-- --------------------------------------------------------

--
-- Table structure for table `mediaalbums`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mediafiles`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
