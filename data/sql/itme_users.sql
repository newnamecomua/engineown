# --------------------------------------------------------
# Host:                         mysql.h4.newname.com.ua
# Server version:               5.0.51a-24+lenny5-log
# Server OS:                    debian-linux-gnu
# HeidiSQL version:             6.0.0.3603
# Date/time:                    2012-01-26 15:48:24
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping database structure for itme
CREATE DATABASE IF NOT EXISTS `itme` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `itme`;


# Dumping structure for table itme.itme_users
CREATE TABLE IF NOT EXISTS `itme_users` (
  `id` int(11) NOT NULL auto_increment,
  `group_id` int(11) NOT NULL default '0',
  `login` varchar(30) NOT NULL default '',
  `password` varchar(32) NOT NULL default '',
  `create_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL default '0000-00-00 00:00:00',
  `full_name` varchar(255) default NULL,
  `info` text,
  `active` tinyint(4) NOT NULL default '0',
  `permitions` text,
  `params` text,
  `is_root` tinyint(4) NOT NULL default '0',
  `inherit` tinyint(4) NOT NULL default '0',
  `email` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

# Dumping data for table itme.itme_users: 1 rows
/*!40000 ALTER TABLE `itme_users` DISABLE KEYS */;
REPLACE INTO `itme_users` (`id`, `group_id`, `login`, `password`, `create_date`, `update_date`, `full_name`, `info`, `active`, `permitions`, `params`, `is_root`, `inherit`, `email`) VALUES
	(1, 3, 'admin', 'a2550eeab0724a691192ca13982e6ebd', '2010-09-06 19:39:54', '2011-11-25 17:31:45', NULL, NULL, 1, 'a:0:{}', NULL, 1, 0, 'alex@newname.com.ua');
/*!40000 ALTER TABLE `itme_users` ENABLE KEYS */;


# Dumping structure for table itme.itme_user_groups
CREATE TABLE IF NOT EXISTS `itme_user_groups` (
  `id` int(11) NOT NULL auto_increment,
  `group_name` varchar(255) NOT NULL default '',
  `info` text,
  `permitions` text,
  `params` text,
  `default_group` int(10) unsigned NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 PACK_KEYS=1;

# Dumping data for table itme.itme_user_groups: 1 rows
/*!40000 ALTER TABLE `itme_user_groups` DISABLE KEYS */;
REPLACE INTO `itme_user_groups` (`id`, `group_name`, `info`, `permitions`, `params`, `default_group`, `last_update`) VALUES
	(3, 'первая', '', 'a:0:{}', NULL, 0, '2011-11-25 17:26:08');
/*!40000 ALTER TABLE `itme_user_groups` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
