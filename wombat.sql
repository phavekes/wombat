-- phpMyAdmin SQL Dump
-- version 2.11.8.1deb5+lenny9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 13, 2014 at 02:48 PM
-- Server version: 5.0.51
-- PHP Version: 5.2.6-1+lenny16

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `wombatv2`
--

-- --------------------------------------------------------

--
-- Table structure for table `ctelimport`
--

DROP TABLE IF EXISTS `ctelimport`;
CREATE TABLE IF NOT EXISTS `ctelimport` (
  `id` int(11) NOT NULL auto_increment,
  `mac` varchar(20) default NULL,
  `ruimte` varchar(20) default NULL,
  `ci` varchar(20) default NULL,
  `serial` varchar(100) default NULL,
  PRIMARY KEY  (`id`),
  KEY `ctelimport_mac` (`mac`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4775415 ;

-- --------------------------------------------------------

--
-- Table structure for table `ff`
--

DROP TABLE IF EXISTS `ff`;
CREATE TABLE IF NOT EXISTS `ff` (
  `pc` varchar(25) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fplusimport`
--

DROP TABLE IF EXISTS `fplusimport`;
CREATE TABLE IF NOT EXISTS `fplusimport` (
  `id` int(11) NOT NULL auto_increment,
  `lokatie` varchar(20) default NULL,
  `ruimte` varchar(30) default NULL,
  `beschrijving` varchar(256) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fplusimport_ruimte_index` (`ruimte`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2186513 ;

-- --------------------------------------------------------

--
-- Table structure for table `groepen`
--

DROP TABLE IF EXISTS `groepen`;
CREATE TABLE IF NOT EXISTS `groepen` (
  `id` int(11) NOT NULL auto_increment,
  `groep` varchar(32) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `ingelogdeusers`
--

DROP TABLE IF EXISTS `ingelogdeusers`;
CREATE TABLE IF NOT EXISTS `ingelogdeusers` (
  `id` int(11) NOT NULL auto_increment,
  `networkAddress` varchar(255) default NULL,
  `username` varchar(255) default NULL,
  `hsbunitcode` char(255) default NULL,
  `time` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `locatie`
--

DROP TABLE IF EXISTS `locatie`;
CREATE TABLE IF NOT EXISTS `locatie` (
  `id` int(11) NOT NULL auto_increment,
  `naam` varchar(25) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
  `id` int(11) NOT NULL auto_increment,
  `user` varchar(20) default NULL,
  `log` varchar(1024) default NULL,
  `date` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `log_user_index` (`user`),
  FULLTEXT KEY `log_index` (`log`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=897452 ;

-- --------------------------------------------------------

--
-- Table structure for table `macs`
--

DROP TABLE IF EXISTS `macs`;
CREATE TABLE IF NOT EXISTS `macs` (
  `switchnaam` varchar(25) default NULL,
  `module` int(11) default NULL,
  `poort` int(11) default NULL,
  `mac` varchar(25) NOT NULL default '',
  `ip` varchar(20) default '0.0.0.0',
  `lastseenip` datetime default NULL,
  `lastseenmac` datetime default NULL,
  PRIMARY KEY  (`mac`),
  KEY `macs_aansluiting_index` (`switchnaam`,`module`,`poort`),
  KEY `macs_ip_index` (`ip`),
  FULLTEXT KEY `mac_ip` (`mac`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `macstest`
--

DROP TABLE IF EXISTS `macstest`;
CREATE TABLE IF NOT EXISTS `macstest` (
  `switchnaam` varchar(25) default NULL,
  `module` int(11) default NULL,
  `poort` int(11) default NULL,
  `mac` varchar(25) NOT NULL,
  `ip` varchar(20) default '0.0.0.0',
  `lastseenip` datetime default NULL,
  `lastseenmac` datetime default NULL,
  PRIMARY KEY  (`mac`),
  UNIQUE KEY `macs_ip_index` (`mac`,`ip`),
  KEY `macs_aansluiting_index` (`switchnaam`,`module`,`poort`),
  KEY `macs_mac_index` (`mac`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Modules`
--

DROP TABLE IF EXISTS `Modules`;
CREATE TABLE IF NOT EXISTS `Modules` (
  `switchnaam` varchar(25) default NULL,
  `positie` int(11) default NULL,
  `poorten` int(11) default NULL,
  `type` varchar(255) default NULL,
  `model` varchar(25) default NULL,
  `serienummer` varchar(25) NOT NULL,
  PRIMARY KEY  (`serienummer`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `msnauth`
--

DROP TABLE IF EXISTS `msnauth`;
CREATE TABLE IF NOT EXISTS `msnauth` (
  `id` int(11) NOT NULL auto_increment,
  `email` char(40) NOT NULL,
  `admin` int(11) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Table structure for table `NETSET`
--

DROP TABLE IF EXISTS `NETSET`;
CREATE TABLE IF NOT EXISTS `NETSET` (
  `Macaddress` varchar(50) NOT NULL,
  `Omschrijving` varchar(100) character set latin1 collate latin1_bin default NULL,
  `Img` varchar(50) default NULL,
  `Processor` varchar(100) character set latin1 collate latin1_bin default NULL,
  `Ruimte` varchar(50) character set latin1 collate latin1_bin default NULL,
  `Barcode` varchar(20) character set latin1 collate latin1_bin default NULL,
  `niet_in_netset` tinyint(4) default NULL,
  `niet_in_sccm` tinyint(4) default '0',
  PRIMARY KEY  (`Macaddress`),
  KEY `niet_in_sccm` (`niet_in_sccm`),
  FULLTEXT KEY `Barcode_idx` (`Barcode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `omnummering2001`
--

DROP TABLE IF EXISTS `omnummering2001`;
CREATE TABLE IF NOT EXISTS `omnummering2001` (
  `oud` varchar(50) default NULL,
  `nieuw` varchar(50) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `outlets`
--

DROP TABLE IF EXISTS `outlets`;
CREATE TABLE IF NOT EXISTS `outlets` (
  `id` int(11) NOT NULL auto_increment,
  `outlet` varchar(20) NOT NULL,
  `switch` varchar(12) default NULL,
  `module` int(11) default NULL,
  `port` int(11) default NULL,
  `vlan` int(11) default NULL,
  `speed` varchar(10) default 'Auto',
  `duplex` varchar(10) default 'Auto',
  `soort` varchar(20) default NULL,
  `opmerkingen` varchar(255) default NULL,
  `ruimte` varchar(25) default NULL,
  `locatie` int(11) default NULL,
  `voicevlan` int(11) default NULL,
  `shutdown` int(11) default '0',
  `portsecurity` int(11) default '1',
  `PortSecViolations` int(11) default NULL,
  `portstate` varchar(20) default NULL,
  `negeerhubzoeker` int(11) default '0',
  `inoct` bigint(20) default '-1',
  `outoct` bigint(20) default '-1',
  `JumboFrames` int(11) default '0',
  PRIMARY KEY  (`id`),
  KEY `aansluiting` (`switch`,`module`,`port`),
  KEY `portsec_index` (`portsecurity`),
  KEY `switch_portsec_index` (`switch`,`portsecurity`),
  FULLTEXT KEY `outlet_index` (`outlet`),
  FULLTEXT KEY `ruimte_index` (`ruimte`),
  FULLTEXT KEY `switch_index` (`switch`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24243 ;

-- --------------------------------------------------------

--
-- Table structure for table `portstates`
--

DROP TABLE IF EXISTS `portstates`;
CREATE TABLE IF NOT EXISTS `portstates` (
  `id` int(11) NOT NULL,
  `switchnaam` varchar(20) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `printerlijst`
--

DROP TABLE IF EXISTS `printerlijst`;
CREATE TABLE IF NOT EXISTS `printerlijst` (
  `id` bigint(20) NOT NULL auto_increment,
  `naam` varchar(255) NOT NULL,
  `unc` varchar(1024) NOT NULL,
  `locatie` varchar(1024) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22642 ;

-- --------------------------------------------------------

--
-- Table structure for table `printers`
--

DROP TABLE IF EXISTS `printers`;
CREATE TABLE IF NOT EXISTS `printers` (
  `id` bigint(20) NOT NULL auto_increment,
  `ruimte` varchar(255) NOT NULL,
  `printers` varchar(2048) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=921 ;

-- --------------------------------------------------------

--
-- Table structure for table `switches`
--

DROP TABLE IF EXISTS `switches`;
CREATE TABLE IF NOT EXISTS `switches` (
  `id` int(11) NOT NULL auto_increment,
  `switchnaam` varchar(20) NOT NULL default '',
  `locatie` int(11) default NULL,
  `interfaces` varchar(12) default NULL,
  `logintype` tinyint(4) default '0',
  `loginpassword` varchar(50) default NULL,
  `enpassword` varchar(50) default NULL,
  `aantalpoorten` int(11) NOT NULL default '0',
  `core` tinyint(4) default '0',
  PRIMARY KEY  (`id`),
  FULLTEXT KEY `switchnaam_index` (`switchnaam`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=134 ;

-- --------------------------------------------------------

--
-- Table structure for table `switchFRU`
--

DROP TABLE IF EXISTS `switchFRU`;
CREATE TABLE IF NOT EXISTS `switchFRU` (
  `id` int(11) NOT NULL auto_increment,
  `switchid` int(11) default NULL,
  `FRU` varchar(20) default NULL,
  `PID` varchar(30) default NULL,
  `SN` varchar(15) default NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vlanrechten`
--

DROP TABLE IF EXISTS `vlanrechten`;
CREATE TABLE IF NOT EXISTS `vlanrechten` (
  `id` int(11) NOT NULL auto_increment,
  `vlanid` int(11) NOT NULL,
  `groepid` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `vlan_group_index` (`vlanid`,`groepid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=112 ;

-- --------------------------------------------------------

--
-- Table structure for table `vlans`
--

DROP TABLE IF EXISTS `vlans`;
CREATE TABLE IF NOT EXISTS `vlans` (
  `vlan` int(11) NOT NULL default '0',
  `omschrijving` varchar(100) default NULL,
  `locatie` int(11) default NULL,
  `id` int(10) unsigned NOT NULL auto_increment,
  `voicevlan` tinyint(4) NOT NULL default '0',
  `PortSecNodig` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `vlan_index` (`vlan`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=195 ;

-- --------------------------------------------------------

--
-- Table structure for table `wifilog`
--

DROP TABLE IF EXISTS `wifilog`;
CREATE TABLE IF NOT EXISTS `wifilog` (
  `ID` int(11) NOT NULL auto_increment,
  `USERNAME` varchar(50) default NULL,
  `NASIP` varchar(50) default NULL,
  `REALM` varchar(50) default NULL,
  `TIME` varchar(50) default NULL,
  `CALLINGSTATION` varchar(50) default NULL,
  `CALLEDSTATION` varchar(50) default NULL,
  `CLASS` varchar(50) default NULL,
  `VLAN` varchar(50) default NULL,
  `fullName` varchar(50) default NULL,
  `mail` varchar(50) default NULL,
  `ou` varchar(50) default NULL,
  `hsbStudentNumber` varchar(50) default NULL,
  `employeeNumber` varchar(50) default NULL,
  `AP` varchar(25) default NULL,
  `IP` varchar(25) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `wifilog_username_index` (`USERNAME`),
  KEY `wifilog_mac_index` (`CALLINGSTATION`),
  KEY `wifilog_ip_index` (`IP`),
  FULLTEXT KEY `wifilog_username_text_index` (`USERNAME`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20899216 ;

-- --------------------------------------------------------

--
-- Table structure for table `wifilog_2008`
--

DROP TABLE IF EXISTS `wifilog_2008`;
CREATE TABLE IF NOT EXISTS `wifilog_2008` (
  `ID` int(11) NOT NULL default '0',
  `USERNAME` varchar(50) default NULL,
  `NASIP` varchar(50) default NULL,
  `REALM` varchar(50) default NULL,
  `TIME` varchar(50) default NULL,
  `CALLINGSTATION` varchar(50) default NULL,
  `CALLEDSTATION` varchar(50) default NULL,
  `CLASS` varchar(50) default NULL,
  `VLAN` varchar(50) default NULL,
  `fullName` varchar(50) default NULL,
  `mail` varchar(50) default NULL,
  `ou` varchar(50) default NULL,
  `hsbStudentNumber` varchar(50) default NULL,
  `employeeNumber` varchar(50) default NULL,
  `AP` varchar(25) default NULL,
  `IP` varchar(25) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wifilog_2009`
--

DROP TABLE IF EXISTS `wifilog_2009`;
CREATE TABLE IF NOT EXISTS `wifilog_2009` (
  `ID` int(11) NOT NULL default '0',
  `USERNAME` varchar(50) default NULL,
  `NASIP` varchar(50) default NULL,
  `REALM` varchar(50) default NULL,
  `TIME` varchar(50) default NULL,
  `CALLINGSTATION` varchar(50) default NULL,
  `CALLEDSTATION` varchar(50) default NULL,
  `CLASS` varchar(50) default NULL,
  `VLAN` varchar(50) default NULL,
  `fullName` varchar(50) default NULL,
  `mail` varchar(50) default NULL,
  `ou` varchar(50) default NULL,
  `hsbStudentNumber` varchar(50) default NULL,
  `employeeNumber` varchar(50) default NULL,
  `AP` varchar(25) default NULL,
  `IP` varchar(25) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `workstations`
--

DROP TABLE IF EXISTS `workstations`;
CREATE TABLE IF NOT EXISTS `workstations` (
  `cn` varchar(20) NOT NULL,
  `operatingSystem` varchar(512) NOT NULL,
  `operatingSystemVersion` varchar(20) NOT NULL,
  `operatingSystemServicePack` varchar(20) NOT NULL,
  `lastseen` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`cn`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Workstations`
--

DROP TABLE IF EXISTS `Workstations`;
CREATE TABLE IF NOT EXISTS `Workstations` (
  `id` int(11) NOT NULL auto_increment,
  `wMNetworkAddress` varchar(255) default NULL,
  `wMNAMEComputer` varchar(255) default NULL,
  `zenwmMACAddress` varchar(50) default NULL,
  `locatie` varchar(10) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2876 ;
