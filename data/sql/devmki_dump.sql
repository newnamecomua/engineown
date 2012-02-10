# --------------------------------------------------------
# Host:                         mysql.h4.newname.com.ua
# Server version:               5.0.51a-24+lenny5-log
# Server OS:                    debian-linux-gnu
# HeidiSQL version:             6.0.0.3603
# Date/time:                    2012-01-10 12:25:02
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping database structure for devmki
CREATE DATABASE IF NOT EXISTS `devmki` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `devmki`;


# Dumping structure for table devmki.devmki_advertise
CREATE TABLE IF NOT EXISTS `devmki_advertise` (
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


# Dumping structure for table devmki.devmki_advertise_en
CREATE TABLE IF NOT EXISTS `devmki_advertise_en` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(50) default NULL,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_devmki.devmki_advertise_title__en` FOREIGN KEY (`id`) REFERENCES `devmki_advertise` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table devmki.devmki_advertise_ru
CREATE TABLE IF NOT EXISTS `devmki_advertise_ru` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(50) default NULL,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_devmki.devmki_advertise_title__ru` FOREIGN KEY (`id`) REFERENCES `devmki_advertise` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table devmki.devmki_advertise_ua
CREATE TABLE IF NOT EXISTS `devmki_advertise_ua` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(50) default NULL,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_devmki.devmki_advertise_title__ua` FOREIGN KEY (`id`) REFERENCES `devmki_advertise` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for view devmki.devmki_advertise_view_en
/* SQL Error (1109): Unknown table 'devmki_advertise_view_en' in information_schema */

# Dumping structure for view devmki.devmki_advertise_view_ru
/* SQL Error (1109): Unknown table 'devmki_advertise_view_ru' in information_schema */

# Dumping structure for view devmki.devmki_advertise_view_ua
/* SQL Error (1109): Unknown table 'devmki_advertise_view_ua' in information_schema */

# Dumping structure for table devmki.devmki_feedback
CREATE TABLE IF NOT EXISTS `devmki_feedback` (
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


# Dumping structure for table devmki.devmki_log
CREATE TABLE IF NOT EXISTS `devmki_log` (
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


# Dumping structure for table devmki.devmki_menu
CREATE TABLE IF NOT EXISTS `devmki_menu` (
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
  CONSTRAINT `FK_fmm_menu_fmm_menu` FOREIGN KEY (`parent_id`) REFERENCES `devmki_menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Меню';

# Data exporting was unselected.


# Dumping structure for table devmki.devmki_menu_en
CREATE TABLE IF NOT EXISTS `devmki_menu_en` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_devmki.devmki_menu_name__en` FOREIGN KEY (`id`) REFERENCES `devmki_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table devmki.devmki_menu_ru
CREATE TABLE IF NOT EXISTS `devmki_menu_ru` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_devmki.devmki_menu_name__ru` FOREIGN KEY (`id`) REFERENCES `devmki_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table devmki.devmki_menu_ua
CREATE TABLE IF NOT EXISTS `devmki_menu_ua` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_devmki.devmki_menu_name__ua` FOREIGN KEY (`id`) REFERENCES `devmki_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for view devmki.devmki_menu_view_en
/* SQL Error (1109): Unknown table 'devmki_menu_view_en' in information_schema */

# Dumping structure for view devmki.devmki_menu_view_ru
/* SQL Error (1109): Unknown table 'devmki_menu_view_ru' in information_schema */

# Dumping structure for view devmki.devmki_menu_view_ua
/* SQL Error (1109): Unknown table 'devmki_menu_view_ua' in information_schema */

# Dumping structure for table devmki.devmki_meta
CREATE TABLE IF NOT EXISTS `devmki_meta` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `description` text,
  `keywords` text,
  `ctime` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `ctime` (`ctime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table devmki.devmki_meta_en
CREATE TABLE IF NOT EXISTS `devmki_meta_en` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  `description` mediumtext,
  `keywords` mediumtext,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_fmm.fmm_meta_title_description_keywords__en` FOREIGN KEY (`id`) REFERENCES `devmki_meta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table devmki.devmki_meta_ru
CREATE TABLE IF NOT EXISTS `devmki_meta_ru` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  `description` mediumtext,
  `keywords` mediumtext,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_fmm.fmm_meta_title_description_keywords__ru` FOREIGN KEY (`id`) REFERENCES `devmki_meta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table devmki.devmki_meta_ua
CREATE TABLE IF NOT EXISTS `devmki_meta_ua` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  `description` mediumtext,
  `keywords` mediumtext,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_fmm.fmm_meta_title_description_keywords__ua` FOREIGN KEY (`id`) REFERENCES `devmki_meta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for view devmki.devmki_meta_view_en
/* SQL Error (1109): Unknown table 'devmki_meta_view_en' in information_schema */

# Dumping structure for view devmki.devmki_meta_view_ru
/* SQL Error (1109): Unknown table 'devmki_meta_view_ru' in information_schema */

# Dumping structure for view devmki.devmki_meta_view_ua
/* SQL Error (1109): Unknown table 'devmki_meta_view_ua' in information_schema */

# Dumping structure for table devmki.devmki_news
CREATE TABLE IF NOT EXISTS `devmki_news` (
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


# Dumping structure for table devmki.devmki_news_en
CREATE TABLE IF NOT EXISTS `devmki_news_en` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `heading` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `text` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Новости';

# Data exporting was unselected.


# Dumping structure for table devmki.devmki_news_ru
CREATE TABLE IF NOT EXISTS `devmki_news_ru` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `heading` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `text` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Новости';

# Data exporting was unselected.


# Dumping structure for table devmki.devmki_news_ua
CREATE TABLE IF NOT EXISTS `devmki_news_ua` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `heading` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `text` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Новости';

# Data exporting was unselected.


# Dumping structure for view devmki.devmki_news_view_en
/* SQL Error (1109): Unknown table 'devmki_news_view_en' in information_schema */

# Dumping structure for view devmki.devmki_news_view_ru
/* SQL Error (1109): Unknown table 'devmki_news_view_ru' in information_schema */

# Dumping structure for view devmki.devmki_news_view_ua
/* SQL Error (1109): Unknown table 'devmki_news_view_ua' in information_schema */

# Dumping structure for table devmki.devmki_pages
CREATE TABLE IF NOT EXISTS `devmki_pages` (
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


# Dumping structure for table devmki.devmki_partner
CREATE TABLE IF NOT EXISTS `devmki_partner` (
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


# Dumping structure for table devmki.devmki_partner_en
CREATE TABLE IF NOT EXISTS `devmki_partner_en` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(50) default NULL,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_devmki.devmki_partner_title__en` FOREIGN KEY (`id`) REFERENCES `devmki_partner` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table devmki.devmki_partner_ru
CREATE TABLE IF NOT EXISTS `devmki_partner_ru` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(50) default NULL,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_devmki.devmki_partner_title__ru` FOREIGN KEY (`id`) REFERENCES `devmki_partner` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table devmki.devmki_partner_ua
CREATE TABLE IF NOT EXISTS `devmki_partner_ua` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(50) default NULL,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_devmki.devmki_partner_title__ua` FOREIGN KEY (`id`) REFERENCES `devmki_partner` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for view devmki.devmki_partner_view_en
/* SQL Error (1109): Unknown table 'devmki_partner_view_en' in information_schema */

# Dumping structure for view devmki.devmki_partner_view_ru
/* SQL Error (1109): Unknown table 'devmki_partner_view_ru' in information_schema */

# Dumping structure for view devmki.devmki_partner_view_ua
/* SQL Error (1109): Unknown table 'devmki_partner_view_ua' in information_schema */

# Dumping structure for table devmki.devmki_press_centre
CREATE TABLE IF NOT EXISTS `devmki_press_centre` (
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


# Dumping structure for table devmki.devmki_press_centre_en
CREATE TABLE IF NOT EXISTS `devmki_press_centre_en` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_devmki.devmki_press_centre_name__en` FOREIGN KEY (`id`) REFERENCES `devmki_press_centre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table devmki.devmki_press_centre_ru
CREATE TABLE IF NOT EXISTS `devmki_press_centre_ru` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_devmki.devmki_press_centre_name__ru` FOREIGN KEY (`id`) REFERENCES `devmki_press_centre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table devmki.devmki_press_centre_ua
CREATE TABLE IF NOT EXISTS `devmki_press_centre_ua` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_devmki.devmki_press_centre_name__ua` FOREIGN KEY (`id`) REFERENCES `devmki_press_centre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for view devmki.devmki_press_centre_view_en
/* SQL Error (1109): Unknown table 'devmki_press_centre_view_en' in information_schema */

# Dumping structure for view devmki.devmki_press_centre_view_ru
/* SQL Error (1109): Unknown table 'devmki_press_centre_view_ru' in information_schema */

# Dumping structure for view devmki.devmki_press_centre_view_ua
/* SQL Error (1109): Unknown table 'devmki_press_centre_view_ua' in information_schema */

# Dumping structure for table devmki.devmki_project
CREATE TABLE IF NOT EXISTS `devmki_project` (
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


# Dumping structure for table devmki.devmki_project_en
CREATE TABLE IF NOT EXISTS `devmki_project_en` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `short_text` mediumtext,
  `full_text` mediumtext,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_devmki.devmki_project_name_short_text_full_text__en` FOREIGN KEY (`id`) REFERENCES `devmki_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table devmki.devmki_project_ru
CREATE TABLE IF NOT EXISTS `devmki_project_ru` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `short_text` mediumtext,
  `full_text` mediumtext,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_devmki.devmki_project_name_short_text_full_text__ru` FOREIGN KEY (`id`) REFERENCES `devmki_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table devmki.devmki_project_ua
CREATE TABLE IF NOT EXISTS `devmki_project_ua` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `short_text` mediumtext,
  `full_text` mediumtext,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_devmki.devmki_project_name_short_text_full_text__ua` FOREIGN KEY (`id`) REFERENCES `devmki_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for view devmki.devmki_project_view_en
/* SQL Error (1109): Unknown table 'devmki_project_view_en' in information_schema */

# Dumping structure for view devmki.devmki_project_view_ru
/* SQL Error (1109): Unknown table 'devmki_project_view_ru' in information_schema */

# Dumping structure for view devmki.devmki_project_view_ua
/* SQL Error (1109): Unknown table 'devmki_project_view_ua' in information_schema */

# Dumping structure for table devmki.devmki_service
CREATE TABLE IF NOT EXISTS `devmki_service` (
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


# Dumping structure for table devmki.devmki_service_en
CREATE TABLE IF NOT EXISTS `devmki_service_en` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `short_text` mediumtext,
  `full_text` mediumtext,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_devmki.devmki_service_name_short_text_full_text__en` FOREIGN KEY (`id`) REFERENCES `devmki_service` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table devmki.devmki_service_ru
CREATE TABLE IF NOT EXISTS `devmki_service_ru` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `short_text` mediumtext,
  `full_text` mediumtext,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_devmki.devmki_service_name_short_text_full_text__ru` FOREIGN KEY (`id`) REFERENCES `devmki_service` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table devmki.devmki_service_ua
CREATE TABLE IF NOT EXISTS `devmki_service_ua` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `short_text` mediumtext,
  `full_text` mediumtext,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_devmki.devmki_service_name_short_text_full_text__ua` FOREIGN KEY (`id`) REFERENCES `devmki_service` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for view devmki.devmki_service_view_en
/* SQL Error (1109): Unknown table 'devmki_service_view_en' in information_schema */

# Dumping structure for view devmki.devmki_service_view_ru
/* SQL Error (1109): Unknown table 'devmki_service_view_ru' in information_schema */

# Dumping structure for view devmki.devmki_service_view_ua
/* SQL Error (1109): Unknown table 'devmki_service_view_ua' in information_schema */

# Dumping structure for table devmki.devmki_session
CREATE TABLE IF NOT EXISTS `devmki_session` (
  `sess_id` varchar(32) NOT NULL default '',
  `last_updated` int(11) default NULL,
  `value` text,
  PRIMARY KEY  (`sess_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table devmki.devmki_solution
CREATE TABLE IF NOT EXISTS `devmki_solution` (
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


# Dumping structure for table devmki.devmki_solution_en
CREATE TABLE IF NOT EXISTS `devmki_solution_en` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `short_text` mediumtext,
  `full_text` mediumtext,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_devmki.devmki_solution_name_short_text_full_text__en` FOREIGN KEY (`id`) REFERENCES `devmki_solution` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table devmki.devmki_solution_ru
CREATE TABLE IF NOT EXISTS `devmki_solution_ru` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `short_text` mediumtext,
  `full_text` mediumtext,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_devmki.devmki_solution_name_short_text_full_text__ru` FOREIGN KEY (`id`) REFERENCES `devmki_solution` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table devmki.devmki_solution_ua
CREATE TABLE IF NOT EXISTS `devmki_solution_ua` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `short_text` mediumtext,
  `full_text` mediumtext,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_devmki.devmki_solution_name_short_text_full_text__ua` FOREIGN KEY (`id`) REFERENCES `devmki_solution` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for view devmki.devmki_solution_view_en
/* SQL Error (1109): Unknown table 'devmki_solution_view_en' in information_schema */

# Dumping structure for view devmki.devmki_solution_view_ru
/* SQL Error (1109): Unknown table 'devmki_solution_view_ru' in information_schema */

# Dumping structure for view devmki.devmki_solution_view_ua
/* SQL Error (1109): Unknown table 'devmki_solution_view_ua' in information_schema */

# Dumping structure for table devmki.devmki_static_pages
CREATE TABLE IF NOT EXISTS `devmki_static_pages` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `tech_url` varchar(255) NOT NULL,
  `name` varchar(255) default NULL,
  `content` text,
  `is_system` tinyint(3) unsigned NOT NULL default '0',
  `title` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table devmki.devmki_static_pages_en
CREATE TABLE IF NOT EXISTS `devmki_static_pages_en` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `title` mediumtext NOT NULL,
  `content` mediumtext,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_fmm.fmm_static_pages_name_title_content__en` FOREIGN KEY (`id`) REFERENCES `devmki_static_pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table devmki.devmki_static_pages_ru
CREATE TABLE IF NOT EXISTS `devmki_static_pages_ru` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `title` mediumtext NOT NULL,
  `content` mediumtext,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_fmm.fmm_static_pages_name_title_content__ru` FOREIGN KEY (`id`) REFERENCES `devmki_static_pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table devmki.devmki_static_pages_ua
CREATE TABLE IF NOT EXISTS `devmki_static_pages_ua` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `title` mediumtext NOT NULL,
  `content` mediumtext,
  PRIMARY KEY  (`id`),
  CONSTRAINT `FK_fmm.fmm_static_pages_name_title_content__ua` FOREIGN KEY (`id`) REFERENCES `devmki_static_pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for view devmki.devmki_static_pages_view_en
/* SQL Error (1109): Unknown table 'devmki_static_pages_view_en' in information_schema */

# Dumping structure for view devmki.devmki_static_pages_view_ru
/* SQL Error (1109): Unknown table 'devmki_static_pages_view_ru' in information_schema */

# Dumping structure for view devmki.devmki_static_pages_view_ua
/* SQL Error (1109): Unknown table 'devmki_static_pages_view_ua' in information_schema */

# Dumping structure for table devmki.devmki_users
CREATE TABLE IF NOT EXISTS `devmki_users` (
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


# Dumping structure for table devmki.devmki_user_groups
CREATE TABLE IF NOT EXISTS `devmki_user_groups` (
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


# Dumping structure for view devmki.devmki_advertise_view_en
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `devmki_advertise_view_en`;
CREATE ALGORITHM=MERGE DEFINER=`devmki`@`%` SQL SECURITY DEFINER VIEW `devmki_advertise_view_en` AS select `t1`.`id` AS `id`,`t1`.`image` AS `image`,`t1`.`url` AS `url`,`t1`.`weight` AS `weight`,`t1`.`is_show` AS `is_show`,`t1`.`is_target` AS `is_target`,`t2`.`title` AS `title` from (`devmki_advertise` `t1` left join `devmki_advertise_en` `t2` on((`t1`.`id` = `t2`.`id`)));


# Dumping structure for view devmki.devmki_advertise_view_ru
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `devmki_advertise_view_ru`;
CREATE ALGORITHM=MERGE DEFINER=`devmki`@`%` SQL SECURITY DEFINER VIEW `devmki_advertise_view_ru` AS select `t1`.`id` AS `id`,`t1`.`image` AS `image`,`t1`.`url` AS `url`,`t1`.`weight` AS `weight`,`t1`.`is_show` AS `is_show`,`t1`.`is_target` AS `is_target`,`t2`.`title` AS `title` from (`devmki_advertise` `t1` left join `devmki_advertise_ru` `t2` on((`t1`.`id` = `t2`.`id`)));


# Dumping structure for view devmki.devmki_advertise_view_ua
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `devmki_advertise_view_ua`;
CREATE ALGORITHM=MERGE DEFINER=`devmki`@`%` SQL SECURITY DEFINER VIEW `devmki_advertise_view_ua` AS select `t1`.`id` AS `id`,`t1`.`image` AS `image`,`t1`.`url` AS `url`,`t1`.`weight` AS `weight`,`t1`.`is_show` AS `is_show`,`t1`.`is_target` AS `is_target`,`t2`.`title` AS `title` from (`devmki_advertise` `t1` left join `devmki_advertise_ua` `t2` on((`t1`.`id` = `t2`.`id`)));


# Dumping structure for view devmki.devmki_menu_view_en
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `devmki_menu_view_en`;
CREATE ALGORITHM=MERGE DEFINER=`devmki`@`%` SQL SECURITY DEFINER VIEW `devmki_menu_view_en` AS select `t1`.`id` AS `id`,`t1`.`type_id` AS `type_id`,`t1`.`url` AS `url`,`t1`.`is_target` AS `is_target`,`t1`.`weight` AS `weight`,`t1`.`parent_id` AS `parent_id`,`t1`.`is_show` AS `is_show`,`t2`.`name` AS `name` from (`devmki_menu` `t1` left join `devmki_menu_en` `t2` on((`t1`.`id` = `t2`.`id`)));


# Dumping structure for view devmki.devmki_menu_view_ru
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `devmki_menu_view_ru`;
CREATE ALGORITHM=MERGE DEFINER=`devmki`@`%` SQL SECURITY DEFINER VIEW `devmki_menu_view_ru` AS select `t1`.`id` AS `id`,`t1`.`type_id` AS `type_id`,`t1`.`url` AS `url`,`t1`.`is_target` AS `is_target`,`t1`.`weight` AS `weight`,`t1`.`parent_id` AS `parent_id`,`t1`.`is_show` AS `is_show`,`t2`.`name` AS `name` from (`devmki_menu` `t1` left join `devmki_menu_ru` `t2` on((`t1`.`id` = `t2`.`id`)));


# Dumping structure for view devmki.devmki_menu_view_ua
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `devmki_menu_view_ua`;
CREATE ALGORITHM=MERGE DEFINER=`devmki`@`%` SQL SECURITY DEFINER VIEW `devmki_menu_view_ua` AS select `t1`.`id` AS `id`,`t1`.`type_id` AS `type_id`,`t1`.`url` AS `url`,`t1`.`is_target` AS `is_target`,`t1`.`weight` AS `weight`,`t1`.`parent_id` AS `parent_id`,`t1`.`is_show` AS `is_show`,`t2`.`name` AS `name` from (`devmki_menu` `t1` left join `devmki_menu_ua` `t2` on((`t1`.`id` = `t2`.`id`)));


# Dumping structure for view devmki.devmki_meta_view_en
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `devmki_meta_view_en`;
CREATE ALGORITHM=MERGE DEFINER=`devmki`@`%` SQL SECURITY DEFINER VIEW `devmki_meta_view_en` AS select `t1`.`id` AS `id`,`t1`.`ctime` AS `ctime`,`t2`.`title` AS `title`,`t2`.`description` AS `description`,`t2`.`keywords` AS `keywords` from (`devmki_meta` `t1` left join `devmki_meta_en` `t2` on((`t1`.`id` = `t2`.`id`)));


# Dumping structure for view devmki.devmki_meta_view_ru
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `devmki_meta_view_ru`;
CREATE ALGORITHM=MERGE DEFINER=`devmki`@`%` SQL SECURITY DEFINER VIEW `devmki_meta_view_ru` AS select `t1`.`id` AS `id`,`t1`.`ctime` AS `ctime`,`t2`.`title` AS `title`,`t2`.`description` AS `description`,`t2`.`keywords` AS `keywords` from (`devmki_meta` `t1` left join `devmki_meta_ru` `t2` on((`t1`.`id` = `t2`.`id`)));


# Dumping structure for view devmki.devmki_meta_view_ua
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `devmki_meta_view_ua`;
CREATE ALGORITHM=MERGE DEFINER=`devmki`@`%` SQL SECURITY DEFINER VIEW `devmki_meta_view_ua` AS select `t1`.`id` AS `id`,`t1`.`ctime` AS `ctime`,`t2`.`title` AS `title`,`t2`.`description` AS `description`,`t2`.`keywords` AS `keywords` from (`devmki_meta` `t1` left join `devmki_meta_ua` `t2` on((`t1`.`id` = `t2`.`id`)));


# Dumping structure for view devmki.devmki_news_view_en
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `devmki_news_view_en`;
CREATE ALGORITHM=MERGE DEFINER=`devmki`@`%` SQL SECURITY DEFINER VIEW `devmki_news_view_en` AS select `t1`.`id` AS `id`,`t1`.`meta_id` AS `meta_id`,`t1`.`url` AS `url`,`t1`.`create_time` AS `create_time`,`t1`.`shows` AS `shows`,`t1`.`weight` AS `weight`,`t1`.`is_active` AS `is_active`,`t2`.`heading` AS `heading`,`t2`.`name` AS `name`,`t2`.`text` AS `text` from (`devmki_news` `t1` left join `devmki_news_en` `t2` on((`t1`.`id` = `t2`.`id`)));


# Dumping structure for view devmki.devmki_news_view_ru
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `devmki_news_view_ru`;
CREATE ALGORITHM=MERGE DEFINER=`devmki`@`%` SQL SECURITY DEFINER VIEW `devmki_news_view_ru` AS select `t1`.`id` AS `id`,`t1`.`meta_id` AS `meta_id`,`t1`.`url` AS `url`,`t1`.`create_time` AS `create_time`,`t1`.`shows` AS `shows`,`t1`.`weight` AS `weight`,`t1`.`is_active` AS `is_active`,`t2`.`heading` AS `heading`,`t2`.`name` AS `name`,`t2`.`text` AS `text` from (`devmki_news` `t1` left join `devmki_news_ru` `t2` on((`t1`.`id` = `t2`.`id`)));


# Dumping structure for view devmki.devmki_news_view_ua
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `devmki_news_view_ua`;
CREATE ALGORITHM=MERGE DEFINER=`devmki`@`%` SQL SECURITY DEFINER VIEW `devmki_news_view_ua` AS select `t1`.`id` AS `id`,`t1`.`meta_id` AS `meta_id`,`t1`.`url` AS `url`,`t1`.`create_time` AS `create_time`,`t1`.`shows` AS `shows`,`t1`.`weight` AS `weight`,`t1`.`is_active` AS `is_active`,`t2`.`heading` AS `heading`,`t2`.`name` AS `name`,`t2`.`text` AS `text` from (`devmki_news` `t1` left join `devmki_news_ua` `t2` on((`t1`.`id` = `t2`.`id`)));


# Dumping structure for view devmki.devmki_partner_view_en
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `devmki_partner_view_en`;
CREATE ALGORITHM=MERGE DEFINER=`devmki`@`%` SQL SECURITY DEFINER VIEW `devmki_partner_view_en` AS select `t1`.`id` AS `id`,`t1`.`image` AS `image`,`t1`.`url` AS `url`,`t1`.`weight` AS `weight`,`t1`.`is_show` AS `is_show`,`t1`.`is_target` AS `is_target`,`t2`.`title` AS `title` from (`devmki_partner` `t1` left join `devmki_partner_en` `t2` on((`t1`.`id` = `t2`.`id`)));


# Dumping structure for view devmki.devmki_partner_view_ru
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `devmki_partner_view_ru`;
CREATE ALGORITHM=MERGE DEFINER=`devmki`@`%` SQL SECURITY DEFINER VIEW `devmki_partner_view_ru` AS select `t1`.`id` AS `id`,`t1`.`image` AS `image`,`t1`.`url` AS `url`,`t1`.`weight` AS `weight`,`t1`.`is_show` AS `is_show`,`t1`.`is_target` AS `is_target`,`t2`.`title` AS `title` from (`devmki_partner` `t1` left join `devmki_partner_ru` `t2` on((`t1`.`id` = `t2`.`id`)));


# Dumping structure for view devmki.devmki_partner_view_ua
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `devmki_partner_view_ua`;
CREATE ALGORITHM=MERGE DEFINER=`devmki`@`%` SQL SECURITY DEFINER VIEW `devmki_partner_view_ua` AS select `t1`.`id` AS `id`,`t1`.`image` AS `image`,`t1`.`url` AS `url`,`t1`.`weight` AS `weight`,`t1`.`is_show` AS `is_show`,`t1`.`is_target` AS `is_target`,`t2`.`title` AS `title` from (`devmki_partner` `t1` left join `devmki_partner_ua` `t2` on((`t1`.`id` = `t2`.`id`)));


# Dumping structure for view devmki.devmki_press_centre_view_en
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `devmki_press_centre_view_en`;
CREATE ALGORITHM=MERGE DEFINER=`devmki`@`%` SQL SECURITY DEFINER VIEW `devmki_press_centre_view_en` AS select `t1`.`id` AS `id`,`t1`.`url` AS `url`,`t1`.`file` AS `file`,`t1`.`icon` AS `icon`,`t1`.`weight` AS `weight`,`t1`.`is_show` AS `is_show`,`t2`.`name` AS `name` from (`devmki_press_centre` `t1` left join `devmki_press_centre_en` `t2` on((`t1`.`id` = `t2`.`id`)));


# Dumping structure for view devmki.devmki_press_centre_view_ru
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `devmki_press_centre_view_ru`;
CREATE ALGORITHM=MERGE DEFINER=`devmki`@`%` SQL SECURITY DEFINER VIEW `devmki_press_centre_view_ru` AS select `t1`.`id` AS `id`,`t1`.`url` AS `url`,`t1`.`file` AS `file`,`t1`.`icon` AS `icon`,`t1`.`weight` AS `weight`,`t1`.`is_show` AS `is_show`,`t2`.`name` AS `name` from (`devmki_press_centre` `t1` left join `devmki_press_centre_ru` `t2` on((`t1`.`id` = `t2`.`id`)));


# Dumping structure for view devmki.devmki_press_centre_view_ua
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `devmki_press_centre_view_ua`;
CREATE ALGORITHM=MERGE DEFINER=`devmki`@`%` SQL SECURITY DEFINER VIEW `devmki_press_centre_view_ua` AS select `t1`.`id` AS `id`,`t1`.`url` AS `url`,`t1`.`file` AS `file`,`t1`.`icon` AS `icon`,`t1`.`weight` AS `weight`,`t1`.`is_show` AS `is_show`,`t2`.`name` AS `name` from (`devmki_press_centre` `t1` left join `devmki_press_centre_ua` `t2` on((`t1`.`id` = `t2`.`id`)));


# Dumping structure for view devmki.devmki_project_view_en
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `devmki_project_view_en`;
CREATE ALGORITHM=MERGE DEFINER=`devmki`@`%` SQL SECURITY DEFINER VIEW `devmki_project_view_en` AS select `t1`.`id` AS `id`,`t1`.`image` AS `image`,`t1`.`url` AS `url`,`t1`.`weight` AS `weight`,`t1`.`is_show` AS `is_show`,`t2`.`name` AS `name`,`t2`.`short_text` AS `short_text`,`t2`.`full_text` AS `full_text` from (`devmki_project` `t1` left join `devmki_project_en` `t2` on((`t1`.`id` = `t2`.`id`)));


# Dumping structure for view devmki.devmki_project_view_ru
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `devmki_project_view_ru`;
CREATE ALGORITHM=MERGE DEFINER=`devmki`@`%` SQL SECURITY DEFINER VIEW `devmki_project_view_ru` AS select `t1`.`id` AS `id`,`t1`.`image` AS `image`,`t1`.`url` AS `url`,`t1`.`weight` AS `weight`,`t1`.`is_show` AS `is_show`,`t2`.`name` AS `name`,`t2`.`short_text` AS `short_text`,`t2`.`full_text` AS `full_text` from (`devmki_project` `t1` left join `devmki_project_ru` `t2` on((`t1`.`id` = `t2`.`id`)));


# Dumping structure for view devmki.devmki_project_view_ua
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `devmki_project_view_ua`;
CREATE ALGORITHM=MERGE DEFINER=`devmki`@`%` SQL SECURITY DEFINER VIEW `devmki_project_view_ua` AS select `t1`.`id` AS `id`,`t1`.`image` AS `image`,`t1`.`url` AS `url`,`t1`.`weight` AS `weight`,`t1`.`is_show` AS `is_show`,`t2`.`name` AS `name`,`t2`.`short_text` AS `short_text`,`t2`.`full_text` AS `full_text` from (`devmki_project` `t1` left join `devmki_project_ua` `t2` on((`t1`.`id` = `t2`.`id`)));


# Dumping structure for view devmki.devmki_service_view_en
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `devmki_service_view_en`;
CREATE ALGORITHM=MERGE DEFINER=`devmki`@`%` SQL SECURITY DEFINER VIEW `devmki_service_view_en` AS select `t1`.`id` AS `id`,`t1`.`image` AS `image`,`t1`.`url` AS `url`,`t1`.`weight` AS `weight`,`t1`.`service_type` AS `service_type`,`t1`.`is_show` AS `is_show`,`t2`.`name` AS `name`,`t2`.`short_text` AS `short_text`,`t2`.`full_text` AS `full_text` from (`devmki_service` `t1` left join `devmki_service_en` `t2` on((`t1`.`id` = `t2`.`id`)));


# Dumping structure for view devmki.devmki_service_view_ru
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `devmki_service_view_ru`;
CREATE ALGORITHM=MERGE DEFINER=`devmki`@`%` SQL SECURITY DEFINER VIEW `devmki_service_view_ru` AS select `t1`.`id` AS `id`,`t1`.`image` AS `image`,`t1`.`url` AS `url`,`t1`.`weight` AS `weight`,`t1`.`service_type` AS `service_type`,`t1`.`is_show` AS `is_show`,`t2`.`name` AS `name`,`t2`.`short_text` AS `short_text`,`t2`.`full_text` AS `full_text` from (`devmki_service` `t1` left join `devmki_service_ru` `t2` on((`t1`.`id` = `t2`.`id`)));


# Dumping structure for view devmki.devmki_service_view_ua
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `devmki_service_view_ua`;
CREATE ALGORITHM=MERGE DEFINER=`devmki`@`%` SQL SECURITY DEFINER VIEW `devmki_service_view_ua` AS select `t1`.`id` AS `id`,`t1`.`image` AS `image`,`t1`.`url` AS `url`,`t1`.`weight` AS `weight`,`t1`.`service_type` AS `service_type`,`t1`.`is_show` AS `is_show`,`t2`.`name` AS `name`,`t2`.`short_text` AS `short_text`,`t2`.`full_text` AS `full_text` from (`devmki_service` `t1` left join `devmki_service_ua` `t2` on((`t1`.`id` = `t2`.`id`)));


# Dumping structure for view devmki.devmki_solution_view_en
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `devmki_solution_view_en`;
CREATE ALGORITHM=MERGE DEFINER=`devmki`@`%` SQL SECURITY DEFINER VIEW `devmki_solution_view_en` AS select `t1`.`id` AS `id`,`t1`.`image` AS `image`,`t1`.`url` AS `url`,`t1`.`weight` AS `weight`,`t1`.`is_show` AS `is_show`,`t2`.`name` AS `name`,`t2`.`short_text` AS `short_text`,`t2`.`full_text` AS `full_text` from (`devmki_solution` `t1` left join `devmki_solution_en` `t2` on((`t1`.`id` = `t2`.`id`)));


# Dumping structure for view devmki.devmki_solution_view_ru
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `devmki_solution_view_ru`;
CREATE ALGORITHM=MERGE DEFINER=`devmki`@`%` SQL SECURITY DEFINER VIEW `devmki_solution_view_ru` AS select `t1`.`id` AS `id`,`t1`.`image` AS `image`,`t1`.`url` AS `url`,`t1`.`weight` AS `weight`,`t1`.`is_show` AS `is_show`,`t2`.`name` AS `name`,`t2`.`short_text` AS `short_text`,`t2`.`full_text` AS `full_text` from (`devmki_solution` `t1` left join `devmki_solution_ru` `t2` on((`t1`.`id` = `t2`.`id`)));


# Dumping structure for view devmki.devmki_solution_view_ua
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `devmki_solution_view_ua`;
CREATE ALGORITHM=MERGE DEFINER=`devmki`@`%` SQL SECURITY DEFINER VIEW `devmki_solution_view_ua` AS select `t1`.`id` AS `id`,`t1`.`image` AS `image`,`t1`.`url` AS `url`,`t1`.`weight` AS `weight`,`t1`.`is_show` AS `is_show`,`t2`.`name` AS `name`,`t2`.`short_text` AS `short_text`,`t2`.`full_text` AS `full_text` from (`devmki_solution` `t1` left join `devmki_solution_ua` `t2` on((`t1`.`id` = `t2`.`id`)));


# Dumping structure for view devmki.devmki_static_pages_view_en
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `devmki_static_pages_view_en`;
CREATE ALGORITHM=MERGE DEFINER=`devmki`@`%` SQL SECURITY DEFINER VIEW `devmki_static_pages_view_en` AS select `t1`.`id` AS `id`,`t1`.`tech_url` AS `tech_url`,`t1`.`is_system` AS `is_system`,`t2`.`name` AS `name`,`t2`.`title` AS `title`,`t2`.`content` AS `content` from (`devmki_static_pages` `t1` left join `devmki_static_pages_en` `t2` on((`t1`.`id` = `t2`.`id`)));


# Dumping structure for view devmki.devmki_static_pages_view_ru
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `devmki_static_pages_view_ru`;
CREATE ALGORITHM=MERGE DEFINER=`devmki`@`%` SQL SECURITY DEFINER VIEW `devmki_static_pages_view_ru` AS select `t1`.`id` AS `id`,`t1`.`tech_url` AS `tech_url`,`t1`.`is_system` AS `is_system`,`t2`.`name` AS `name`,`t2`.`title` AS `title`,`t2`.`content` AS `content` from (`devmki_static_pages` `t1` left join `devmki_static_pages_ru` `t2` on((`t1`.`id` = `t2`.`id`)));


# Dumping structure for view devmki.devmki_static_pages_view_ua
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `devmki_static_pages_view_ua`;
CREATE ALGORITHM=MERGE DEFINER=`devmki`@`%` SQL SECURITY DEFINER VIEW `devmki_static_pages_view_ua` AS select `t1`.`id` AS `id`,`t1`.`tech_url` AS `tech_url`,`t1`.`is_system` AS `is_system`,`t2`.`name` AS `name`,`t2`.`title` AS `title`,`t2`.`content` AS `content` from (`devmki_static_pages` `t1` left join `devmki_static_pages_ua` `t2` on((`t1`.`id` = `t2`.`id`)));
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
