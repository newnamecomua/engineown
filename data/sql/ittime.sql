# --------------------------------------------------------
# Host:                         mysql.h4.newname.com.ua
# Server version:               5.0.51a-24+lenny5-log
# Server OS:                    debian-linux-gnu
# HeidiSQL version:             6.0.0.3603
# Date/time:                    2012-01-26 13:55:28
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping database structure for itme
CREATE DATABASE IF NOT EXISTS `itme` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `itme`;


# Dumping structure for table itme.itme_advertise
CREATE TABLE IF NOT EXISTS `itme_advertise` (
  `id` int(11) unsigned NOT NULL auto_increment COMMENT 'id',
  `title` varchar(50) default NULL COMMENT 'Заголовок',
  `image` varchar(50) default NULL COMMENT 'изображение',
  `url` varchar(255) default NULL COMMENT 'url',
  `weight` int(11) default '0' COMMENT 'вес',
  `is_show` tinyint(1) unsigned default '0' COMMENT 'показывать 1 - да, 0- тоже да.',
  `is_target` tinyint(1) unsigned default '0' COMMENT 'открывать или нет в новом окне 1 - да, 0- тоже да.',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ЦРБ';

# Data exporting was unselected.


# Dumping structure for table itme.itme_advertise_en
CREATE TABLE IF NOT EXISTS `itme_advertise_en` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(50) default NULL,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_itme.itme_advertise_title__en` FOREIGN KEY (`id`) REFERENCES `itme_advertise` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table itme.itme_advertise_ru
CREATE TABLE IF NOT EXISTS `itme_advertise_ru` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(50) default NULL,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_itme.itme_advertise_title__ru` FOREIGN KEY (`id`) REFERENCES `itme_advertise` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table itme.itme_advertise_ua
CREATE TABLE IF NOT EXISTS `itme_advertise_ua` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(50) default NULL,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_itme.itme_advertise_title__ua` FOREIGN KEY (`id`) REFERENCES `itme_advertise` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table itme.itme_feedback
CREATE TABLE IF NOT EXISTS `itme_feedback` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL default '',
  `message` text NOT NULL,
  `ctime` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `ctime` (`ctime`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Форма обратной связи';

# Data exporting was unselected.


# Dumping structure for table itme.itme_log
CREATE TABLE IF NOT EXISTS `itme_log` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `object_type` varchar(255) NOT NULL,
  `object_name` varchar(255) NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `manager_id` int(10) NOT NULL,
  `date` datetime NOT NULL,
  `message` text NOT NULL,
  `operation` varchar(45) NOT NULL,
  `edit_link` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `date_idx` (`date`),
  KEY `manager_idx` (`manager_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table itme.itme_menu
CREATE TABLE IF NOT EXISTS `itme_menu` (
  `id` int(11) unsigned NOT NULL auto_increment COMMENT 'ID',
  `name` varchar(255) default NULL COMMENT 'Название',
  `type_id` tinyint(1) NOT NULL COMMENT 'Тип меню',
  `url` varchar(128) NOT NULL COMMENT 'УРЛ',
  `is_target` tinyint(1) NOT NULL default '0' COMMENT 'Открывать в новом окне',
  `weight` int(11) default NULL COMMENT 'Вес',
  `parent_id` int(11) unsigned default NULL COMMENT 'Родитель ID',
  `is_show` tinyint(1) unsigned NOT NULL default '0' COMMENT 'показывать',
  PRIMARY KEY  (`id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `FK_fmm_menu_fmm_menu` FOREIGN KEY (`parent_id`) REFERENCES `itme_menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Меню';

# Data exporting was unselected.


# Dumping structure for table itme.itme_menu_en
CREATE TABLE IF NOT EXISTS `itme_menu_en` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_itme.itme_menu_name__en` FOREIGN KEY (`id`) REFERENCES `itme_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table itme.itme_menu_ru
CREATE TABLE IF NOT EXISTS `itme_menu_ru` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_itme.itme_menu_name__ru` FOREIGN KEY (`id`) REFERENCES `itme_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table itme.itme_menu_ua
CREATE TABLE IF NOT EXISTS `itme_menu_ua` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_itme.itme_menu_name__ua` FOREIGN KEY (`id`) REFERENCES `itme_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table itme.itme_meta
CREATE TABLE IF NOT EXISTS `itme_meta` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `description` text,
  `keywords` text,
  `ctime` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `ctime` (`ctime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table itme.itme_meta_en
CREATE TABLE IF NOT EXISTS `itme_meta_en` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  `description` mediumtext,
  `keywords` mediumtext,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_fmm.fmm_meta_title_description_keywords__en` FOREIGN KEY (`id`) REFERENCES `itme_meta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table itme.itme_meta_ru
CREATE TABLE IF NOT EXISTS `itme_meta_ru` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  `description` mediumtext,
  `keywords` mediumtext,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_fmm.fmm_meta_title_description_keywords__ru` FOREIGN KEY (`id`) REFERENCES `itme_meta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table itme.itme_meta_ua
CREATE TABLE IF NOT EXISTS `itme_meta_ua` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  `description` mediumtext,
  `keywords` mediumtext,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_fmm.fmm_meta_title_description_keywords__ua` FOREIGN KEY (`id`) REFERENCES `itme_meta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table itme.itme_news
CREATE TABLE IF NOT EXISTS `itme_news` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `heading` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `url` varchar(255) NOT NULL default '',
  `text` text,
  `create_time` datetime default NULL,
  `shows` int(10) unsigned NOT NULL default '0',
  `weight` int(3) unsigned NOT NULL default '0',
  `is_active` int(1) unsigned NOT NULL default '1',
  `meta_id` int(11) unsigned default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Новости';

# Data exporting was unselected.


# Dumping structure for table itme.itme_news_en
CREATE TABLE IF NOT EXISTS `itme_news_en` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `heading` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `text` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Новости';

# Data exporting was unselected.


# Dumping structure for table itme.itme_news_ru
CREATE TABLE IF NOT EXISTS `itme_news_ru` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `heading` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `text` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Новости';

# Data exporting was unselected.


# Dumping structure for table itme.itme_news_ua
CREATE TABLE IF NOT EXISTS `itme_news_ua` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `heading` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `text` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Новости';

# Data exporting was unselected.


# Dumping structure for table itme.itme_pages
CREATE TABLE IF NOT EXISTS `itme_pages` (
  `id` int(11) NOT NULL auto_increment,
  `page_parent_id` int(11) NOT NULL,
  `page_name` varchar(255) NOT NULL default '',
  `page_url` varchar(255) NOT NULL default '',
  `page_template` varchar(255) NOT NULL default '',
  `page_title` varchar(255) NOT NULL default '',
  `page_description` text,
  `page_content` text,
  `page_keywords` text,
  `js` text COMMENT 'js code files',
  `css` text COMMENT 'css code files',
  `meta_id` int(10) unsigned default NULL,
  `image` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `page_name` (`page_name`),
  KEY `page_url_key` (`page_url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table itme.itme_partner
CREATE TABLE IF NOT EXISTS `itme_partner` (
  `id` int(11) unsigned NOT NULL auto_increment COMMENT 'id',
  `title` varchar(50) default NULL COMMENT 'Заголовок',
  `image` varchar(50) default NULL COMMENT 'изображение',
  `url` varchar(255) default NULL COMMENT 'URL',
  `weight` int(11) default '0' COMMENT 'вес',
  `is_show` tinyint(1) unsigned default '0' COMMENT 'показывать 1 - да, 0- тоже да.',
  `is_target` tinyint(1) unsigned default '0' COMMENT 'открывать или нет в новом окне 1 - да, 0- тоже да.',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Партнеры';

# Data exporting was unselected.


# Dumping structure for table itme.itme_partner_en
CREATE TABLE IF NOT EXISTS `itme_partner_en` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(50) default NULL,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_itme.itme_partner_title__en` FOREIGN KEY (`id`) REFERENCES `itme_partner` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table itme.itme_partner_ru
CREATE TABLE IF NOT EXISTS `itme_partner_ru` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(50) default NULL,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_itme.itme_partner_title__ru` FOREIGN KEY (`id`) REFERENCES `itme_partner` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table itme.itme_partner_ua
CREATE TABLE IF NOT EXISTS `itme_partner_ua` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(50) default NULL,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_itme.itme_partner_title__ua` FOREIGN KEY (`id`) REFERENCES `itme_partner` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table itme.itme_press_centre
CREATE TABLE IF NOT EXISTS `itme_press_centre` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `url` varchar(255) default NULL,
  `file` varchar(50) default NULL,
  `icon` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL,
  `is_show` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table itme.itme_press_centre_en
CREATE TABLE IF NOT EXISTS `itme_press_centre_en` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_itme.itme_press_centre_name__en` FOREIGN KEY (`id`) REFERENCES `itme_press_centre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table itme.itme_press_centre_ru
CREATE TABLE IF NOT EXISTS `itme_press_centre_ru` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_itme.itme_press_centre_name__ru` FOREIGN KEY (`id`) REFERENCES `itme_press_centre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table itme.itme_press_centre_ua
CREATE TABLE IF NOT EXISTS `itme_press_centre_ua` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_itme.itme_press_centre_name__ua` FOREIGN KEY (`id`) REFERENCES `itme_press_centre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table itme.itme_project
CREATE TABLE IF NOT EXISTS `itme_project` (
  `id` int(11) unsigned NOT NULL auto_increment COMMENT 'id',
  `name` varchar(50) default NULL COMMENT 'название',
  `image` varchar(50) default NULL COMMENT 'изображение',
  `url` varchar(255) default NULL COMMENT 'URL',
  `weight` int(11) default '0' COMMENT 'вес',
  `is_show` tinyint(1) unsigned default '0' COMMENT 'показывать 1 - да, 0- нет',
  `full_text` text COMMENT 'полный текст',
  `short_text` text COMMENT 'короткий текст',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `url` (`url`),
  KEY `weight` (`weight`),
  KEY `is_show` (`is_show`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Проекты';

# Data exporting was unselected.


# Dumping structure for table itme.itme_project_en
CREATE TABLE IF NOT EXISTS `itme_project_en` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `short_text` mediumtext,
  `full_text` mediumtext,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_itme.itme_project_name_short_text_full_text__en` FOREIGN KEY (`id`) REFERENCES `itme_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table itme.itme_project_ru
CREATE TABLE IF NOT EXISTS `itme_project_ru` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `short_text` mediumtext,
  `full_text` mediumtext,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_itme.itme_project_name_short_text_full_text__ru` FOREIGN KEY (`id`) REFERENCES `itme_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table itme.itme_project_ua
CREATE TABLE IF NOT EXISTS `itme_project_ua` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `short_text` mediumtext,
  `full_text` mediumtext,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_itme.itme_project_name_short_text_full_text__ua` FOREIGN KEY (`id`) REFERENCES `itme_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table itme.itme_service
CREATE TABLE IF NOT EXISTS `itme_service` (
  `id` int(11) unsigned NOT NULL auto_increment COMMENT 'id',
  `name` varchar(50) default NULL COMMENT 'название',
  `image` varchar(50) default NULL COMMENT 'изображение',
  `url` varchar(255) default NULL COMMENT 'URL',
  `weight` int(11) default '0' COMMENT 'вес',
  `is_show` tinyint(1) unsigned default '0' COMMENT 'показывать 1 - да, 0- нет',
  `full_text` text COMMENT 'полный текст',
  `short_text` text COMMENT 'короткий текст',
  `service_type` int(11) NOT NULL COMMENT 'тип сервиса',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `url` (`url`),
  KEY `weight` (`weight`),
  KEY `is_show` (`is_show`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Услуги';

# Data exporting was unselected.


# Dumping structure for table itme.itme_service_en
CREATE TABLE IF NOT EXISTS `itme_service_en` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `short_text` mediumtext,
  `full_text` mediumtext,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_itme.itme_service_name_short_text_full_text__en` FOREIGN KEY (`id`) REFERENCES `itme_service` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table itme.itme_service_ru
CREATE TABLE IF NOT EXISTS `itme_service_ru` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `short_text` mediumtext,
  `full_text` mediumtext,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_itme.itme_service_name_short_text_full_text__ru` FOREIGN KEY (`id`) REFERENCES `itme_service` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table itme.itme_service_ua
CREATE TABLE IF NOT EXISTS `itme_service_ua` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `short_text` mediumtext,
  `full_text` mediumtext,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_itme.itme_service_name_short_text_full_text__ua` FOREIGN KEY (`id`) REFERENCES `itme_service` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table itme.itme_session
CREATE TABLE IF NOT EXISTS `itme_session` (
  `sess_id` varchar(32) NOT NULL default '',
  `last_updated` int(11) default NULL,
  `value` text,
  PRIMARY KEY  (`sess_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table itme.itme_solution
CREATE TABLE IF NOT EXISTS `itme_solution` (
  `id` int(11) unsigned NOT NULL auto_increment COMMENT 'id',
  `name` varchar(50) default NULL COMMENT 'название',
  `image` varchar(50) default NULL COMMENT 'изображение',
  `url` varchar(255) default NULL COMMENT 'URL',
  `weight` int(11) default '0' COMMENT 'вес',
  `is_show` tinyint(1) unsigned default '0' COMMENT 'показывать 1 - да, 0- нет',
  `full_text` text COMMENT 'полный текст',
  `short_text` text COMMENT 'короткий текст',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `url` (`url`),
  KEY `weight` (`weight`),
  KEY `is_show` (`is_show`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Решения';

# Data exporting was unselected.


# Dumping structure for table itme.itme_solution_en
CREATE TABLE IF NOT EXISTS `itme_solution_en` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `short_text` mediumtext,
  `full_text` mediumtext,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_itme.itme_solution_name_short_text_full_text__en` FOREIGN KEY (`id`) REFERENCES `itme_solution` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table itme.itme_solution_ru
CREATE TABLE IF NOT EXISTS `itme_solution_ru` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `short_text` mediumtext,
  `full_text` mediumtext,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_itme.itme_solution_name_short_text_full_text__ru` FOREIGN KEY (`id`) REFERENCES `itme_solution` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table itme.itme_solution_ua
CREATE TABLE IF NOT EXISTS `itme_solution_ua` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `short_text` mediumtext,
  `full_text` mediumtext,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_itme.itme_solution_name_short_text_full_text__ua` FOREIGN KEY (`id`) REFERENCES `itme_solution` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table itme.itme_static_pages
CREATE TABLE IF NOT EXISTS `itme_static_pages` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `tech_url` varchar(255) NOT NULL,
  `name` varchar(255) default NULL,
  `content` text,
  `is_system` tinyint(3) unsigned NOT NULL default '0',
  `title` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table itme.itme_static_pages_en
CREATE TABLE IF NOT EXISTS `itme_static_pages_en` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `title` mediumtext NOT NULL,
  `content` mediumtext,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_fmm.fmm_static_pages_name_title_content__en` FOREIGN KEY (`id`) REFERENCES `itme_static_pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table itme.itme_static_pages_ru
CREATE TABLE IF NOT EXISTS `itme_static_pages_ru` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `title` mediumtext NOT NULL,
  `content` mediumtext,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_fmm.fmm_static_pages_name_title_content__ru` FOREIGN KEY (`id`) REFERENCES `itme_static_pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table itme.itme_static_pages_ua
CREATE TABLE IF NOT EXISTS `itme_static_pages_ua` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `title` mediumtext NOT NULL,
  `content` mediumtext,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_fmm.fmm_static_pages_name_title_content__ua` FOREIGN KEY (`id`) REFERENCES `itme_static_pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Data exporting was unselected.


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=1;

# Data exporting was unselected.
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
