# --------------------------------------------------------
# Host:                         localhost
# Database:                     single
# Server version:               5.0.45-community-nt
# Server OS:                    Win32
# HeidiSQL version:             5.0.0.3272
# Date/time:                    2010-10-11 14:04:15
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping structure for table single.emp_album
CREATE TABLE IF NOT EXISTS `emp_album` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `description` text,
  `create_time` datetime NOT NULL,
  `weight` int(3) NOT NULL default '0',
  `is_active` int(1) NOT NULL default '0',
  `shows` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

# Dumping data for table single.emp_album: 0 rows
/*!40000 ALTER TABLE `emp_album` DISABLE KEYS */;
INSERT INTO `emp_album` (`id`, `name`, `url`, `description`, `create_time`, `weight`, `is_active`, `shows`) VALUES (1, 'альбом 1', 'albom_1', '', '0000-00-00 00:00:00', 0, 1, 4);
/*!40000 ALTER TABLE `emp_album` ENABLE KEYS */;


# Dumping structure for table single.emp_album2media
CREATE TABLE IF NOT EXISTS `emp_album2media` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `weight` int(3) NOT NULL default '0',
  `is_active` int(1) NOT NULL default '0',
  `album_id` int(11) unsigned NOT NULL,
  `media_id` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `album_id_media_id` (`album_id`,`media_id`),
  KEY `relation2media` (`media_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

# Dumping data for table single.emp_album2media: 0 rows
/*!40000 ALTER TABLE `emp_album2media` DISABLE KEYS */;
INSERT INTO `emp_album2media` (`id`, `name`, `weight`, `is_active`, `album_id`, `media_id`) VALUES (6, '', 0, 1, 1, 2), (5, '', 0, 1, 1, 1), (7, '', 0, 1, 1, 3), (8, '', 0, 1, 1, 4);
/*!40000 ALTER TABLE `emp_album2media` ENABLE KEYS */;


# Dumping structure for table single.emp_album2tag
CREATE TABLE IF NOT EXISTS `emp_album2tag` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `album_id` int(11) unsigned NOT NULL,
  `tag_id` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `album_id_tag_id` (`album_id`,`tag_id`),
  KEY `a2trelation2tag` (`tag_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

# Dumping data for table single.emp_album2tag: 0 rows
/*!40000 ALTER TABLE `emp_album2tag` DISABLE KEYS */;
INSERT INTO `emp_album2tag` (`id`, `album_id`, `tag_id`) VALUES (2, 1, 1);
/*!40000 ALTER TABLE `emp_album2tag` ENABLE KEYS */;


# Dumping structure for table single.emp_category
CREATE TABLE IF NOT EXISTS `emp_category` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(127) NOT NULL,
  `url` varchar(127) NOT NULL,
  `weight` int(3) unsigned NOT NULL,
  `is_active` int(1) unsigned NOT NULL,
  `parent_id` int(11) unsigned default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 PACK_KEYS=1 COMMENT='project categories';

# Dumping data for table single.emp_category: 0 rows
/*!40000 ALTER TABLE `emp_category` DISABLE KEYS */;
INSERT INTO `emp_category` (`id`, `name`, `url`, `weight`, `is_active`, `parent_id`) VALUES (1, 'Категория 1', 'kategorija_1', 0, 1, 0), (2, 'Категория 2', 'kategorija_2', 0, 1, 1);
/*!40000 ALTER TABLE `emp_category` ENABLE KEYS */;


# Dumping structure for table single.emp_log
CREATE TABLE IF NOT EXISTS `emp_log` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `object_type` varchar(255) NOT NULL,
  `object_name` varchar(255) NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `manager_id` int(10) unsigned NOT NULL,
  `date` datetime NOT NULL,
  `message` text NOT NULL,
  `operation` varchar(45) NOT NULL,
  `edit_link` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `date_idx` (`date`),
  KEY `manager_idx` (`manager_id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

# Dumping data for table single.emp_log: 8 rows
/*!40000 ALTER TABLE `emp_log` DISABLE KEYS */;
INSERT INTO `emp_log` (`id`, `object_type`, `object_name`, `object_id`, `manager_id`, `date`, `message`, `operation`, `edit_link`) VALUES (1, 'Tag', 'Тег 1', 1, 1, '2010-10-11 11:27:13', 'Тег был создан в 2010-10-11 11:27:13. Менеджер [1] admin ()', 'insert', '/backend/country/?id=1'), (2, 'Tag', 'тег 2', 2, 1, '2010-10-11 11:27:31', 'Тег был создан в 2010-10-11 11:27:31. Менеджер [1] admin ()', 'insert', '/backend/country/?id=2'), (3, 'MediaBank', '4cb2ccf48e909cd003d0f28ec7121b1985f8723dd9609.jpg(  )', 1, 1, '2010-10-11 11:38:21', 'Объект медиаБанка был создан в 2010-10-11 11:38:21. Менеджер [1] admin ()', 'insert', '/backend/country/?id=1'), (4, 'MediaBank', '4cb2ccf4bfa3ccd003d0f28ec7121b1985f8723dd9609.jpg(  )', 2, 1, '2010-10-11 11:38:21', 'Объект медиаБанка был создан в 2010-10-11 11:38:21. Менеджер [1] admin ()', 'insert', '/backend/country/?id=2'), (5, 'MediaBank', '4cb2ccf47f6d4cd003d0f28ec7121b1985f8723dd9609.jpg(  )', 3, 1, '2010-10-11 11:38:22', 'Объект медиаБанка был создан в 2010-10-11 11:38:22. Менеджер [1] admin ()', 'insert', '/backend/country/?id=3'), (6, 'MediaBank', '4cb2ccf4a96becd003d0f28ec7121b1985f8723dd9609.jpg(  )', 4, 1, '2010-10-11 11:38:22', 'Объект медиаБанка был создан в 2010-10-11 11:38:22. Менеджер [1] admin ()', 'insert', '/backend/country/?id=4'), (7, 'MediaBank', '4cb2ccf4a2574cd003d0f28ec7121b1985f8723dd9609.jpg(  )', 5, 1, '2010-10-11 11:38:23', 'Объект медиаБанка был создан в 2010-10-11 11:38:23. Менеджер [1] admin ()', 'insert', '/backend/country/?id=5'), (8, 'MediaBank', '4cb2ccf46e561cd003d0f28ec7121b1985f8723dd9609.jpg(  )', 6, 1, '2010-10-11 11:38:23', 'Объект медиаБанка был создан в 2010-10-11 11:38:23. Менеджер [1] admin ()', 'insert', '/backend/country/?id=6'), (9, 'Category', 'Категория 1', 1, 1, '2010-10-11 12:15:10', 'Тег был создан в 2010-10-11 12:15:10. Менеджер [1] admin ()', 'insert', '/backend/country/?id=1'), (10, 'Category', 'Категория 2', 2, 1, '2010-10-11 12:15:23', 'Тег был создан в 2010-10-11 12:15:23. Менеджер [1] admin ()', 'insert', '/backend/country/?id=2'), (11, 'News', 'Новость 1', 1, 1, '2010-10-11 12:18:15', 'Тег был создан в 2010-10-11 12:18:15. Менеджер [1] admin ()', 'insert', '/backend/news/?id=1'), (12, 'Album', 'альбом 1', 1, 1, '2010-10-11 12:53:57', 'Альбом был создан в 2010-10-11 12:53:57. Менеджер [1] admin ()', 'insert', '/backend/albums/?id=1'), (13, 'Album', 'альбом 1', 1, 1, '2010-10-11 13:03:09', 'Альбом был изменен в 2010-10-11 13:03:09. Менеджер [1] admin ()', 'update', '/backend/albums/?id=1'), (14, 'Album2Tag', '1 - 1', 1, 1, '2010-10-11 13:03:09', 'Связь альбом-тег была создана в 2010-10-11 13:03:09. Менеджер [1] admin ()', 'insert', '/backend/albums/?id=1'), (15, 'Page', 'index', 1, 1, '2010-10-11 13:08:56', 'Страница была изменена в 2010-10-11 13:08:56. Менеджер [1] admin ()', 'update', '/backend/pages/?id=1'), (16, 'Page', 'index', 1, 1, '2010-10-11 13:10:14', 'Страница была изменена в 2010-10-11 13:10:14. Менеджер [1] admin ()', 'update', '/backend/pages/?id=1'), (17, 'News', 'Новость 1', 1, 1, '2010-10-11 13:11:29', 'Тег был изменен в 2010-10-11 13:11:29. Менеджер [1] admin ()', 'update', '/backend/news/?id=1'), (18, 'News', 'Новость 1', 1, 1, '2010-10-11 13:12:21', 'Тег был изменен в 2010-10-11 13:12:21. Менеджер [1] admin ()', 'update', '/backend/news/?id=1'), (19, 'Page', 'news', 3, 1, '2010-10-11 13:16:00', 'Страница была создана в 2010-10-11 13:16:00. Менеджер [1] admin ()', 'insert', '/backend/pages/?id=3'), (20, 'News', 'Новость 1', 1, 1, '2010-10-11 13:16:04', 'Тег был изменен в 2010-10-11 13:16:04. Менеджер [1] admin ()', 'update', '/news/?id=1'), (21, 'News', 'Новость 1', 1, 1, '2010-10-11 13:16:18', 'Тег был изменен в 2010-10-11 13:16:18. Менеджер [1] admin ()', 'update', '/news/?id=1'), (22, 'News', 'Новость 1', 1, 1, '2010-10-11 13:17:29', 'Тег был изменен в 2010-10-11 13:17:29. Менеджер [1] admin ()', 'update', '/news/?id=1'), (23, 'News', 'Новость 1', 1, 1, '2010-10-11 13:17:29', 'Тег был изменен в 2010-10-11 13:17:29. Менеджер [1] admin ()', 'update', '/news/?id=1'), (24, 'News', 'Новость 1', 1, 1, '2010-10-11 13:17:54', 'Тег был изменен в 2010-10-11 13:17:54. Менеджер [1] admin ()', 'update', '/news/?id=1'), (25, 'News', 'Новость 1', 1, 1, '2010-10-11 13:18:10', 'Тег был изменен в 2010-10-11 13:18:10. Менеджер [1] admin ()', 'update', '/news/?id=1'), (26, 'News', 'Новость 1', 1, 1, '2010-10-11 13:18:39', 'Тег был изменен в 2010-10-11 13:18:39. Менеджер [1] admin ()', 'update', '/news/?id=1'), (27, 'News', 'Новость 1', 1, 1, '2010-10-11 13:20:30', 'Тег был изменен в 2010-10-11 13:20:30. Менеджер [1] admin ()', 'update', '/news/?id=1'), (28, 'News', 'Новость 1', 1, 1, '2010-10-11 13:20:38', 'Тег был изменен в 2010-10-11 13:20:38. Менеджер [1] admin ()', 'update', '/news/?id=1'), (29, 'News', 'Новость 1', 1, 1, '2010-10-11 13:20:45', 'Тег был изменен в 2010-10-11 13:20:45. Менеджер [1] admin ()', 'update', '/news/?id=1'), (30, 'News', 'Новость 1', 1, 1, '2010-10-11 13:21:01', 'Тег был изменен в 2010-10-11 13:21:01. Менеджер [1] admin ()', 'update', '/news/?id=1'), (31, 'News', 'Новость 1', 1, 1, '2010-10-11 13:22:01', 'Тег был изменен в 2010-10-11 13:22:01. Менеджер [1] admin ()', 'update', '/news/?id=1'), (32, 'Page', 'news', 3, 1, '2010-10-11 13:22:26', 'Страница была изменена в 2010-10-11 13:22:26. Менеджер [1] admin ()', 'update', '/backend/pages/?id=3'), (33, 'News', 'Новость 1', 1, 1, '2010-10-11 13:22:28', 'Тег был изменен в 2010-10-11 13:22:28. Менеджер [1] admin ()', 'update', '/news/?id=1'), (34, 'News', 'Новость 1', 1, 1, '2010-10-11 13:23:14', 'Тег был изменен в 2010-10-11 13:23:14. Менеджер [1] admin ()', 'update', '/backend/news/?id=1'), (35, 'News', 'Новость 1', 1, 1, '2010-10-11 13:23:16', 'Тег был изменен в 2010-10-11 13:23:16. Менеджер [1] admin ()', 'update', '/news/?id=1'), (36, 'News', 'Новость 1', 1, 1, '2010-10-11 13:24:17', 'Тег был изменен в 2010-10-11 13:24:17. Менеджер [1] admin ()', 'update', '/news/?id=1'), (37, 'News', 'Новость 1', 1, 1, '2010-10-11 13:25:11', 'Тег был изменен в 2010-10-11 13:25:11. Менеджер [1] admin ()', 'update', '/news/?id=1'), (38, 'News', 'Новость 1', 1, 1, '2010-10-11 13:26:28', 'Тег был изменен в 2010-10-11 13:26:28. Менеджер [1] admin ()', 'update', '/news/?id=1'), (39, 'News', 'Новость 1', 1, 1, '2010-10-11 13:26:36', 'Тег был изменен в 2010-10-11 13:26:36. Менеджер [1] admin ()', 'update', '/news/?id=1'), (40, 'News', 'Новость 1', 1, 1, '2010-10-11 13:26:53', 'Тег был изменен в 2010-10-11 13:26:53. Менеджер [1] admin ()', 'update', '/news/?id=1'), (41, 'News', 'Новость 1', 1, 1, '2010-10-11 13:27:43', 'Тег был изменен в 2010-10-11 13:27:43. Менеджер [1] admin ()', 'update', '/news/?id=1'), (42, 'Album', 'альбом 1', 1, 1, '2010-10-11 13:28:15', 'Альбом был изменен в 2010-10-11 13:28:15. Менеджер [1] admin ()', 'update', '/backend/albums/?id=1'), (43, 'Album2Tag', '1 - 1', 2, 1, '2010-10-11 13:28:15', 'Связь альбом-тег была создана в 2010-10-11 13:28:15. Менеджер [1] admin ()', 'insert', '/backend/albums/?id=1'), (44, 'Page', 'index', 1, 1, '2010-10-11 13:28:38', 'Страница была изменена в 2010-10-11 13:28:38. Менеджер [1] admin ()', 'update', '/backend/pages/?id=1'), (45, 'Page', 'gallery', 4, 1, '2010-10-11 13:32:59', 'Страница была создана в 2010-10-11 13:32:59. Менеджер [1] admin ()', 'insert', '/backend/pages/?id=4'), (46, 'Album', 'альбом 1', 1, 1, '2010-10-11 13:33:04', 'Альбом был изменен в 2010-10-11 13:33:04. Менеджер [1] admin ()', 'update', '/albums/?id=1'), (47, 'Album', 'альбом 1', 1, 1, '2010-10-11 13:36:04', 'Альбом был изменен в 2010-10-11 13:36:04. Менеджер [1] admin ()', 'update', '/albums/?id=1'), (48, 'Album', 'альбом 1', 1, 1, '2010-10-11 13:36:07', 'Альбом был изменен в 2010-10-11 13:36:07. Менеджер [1] admin ()', 'update', '/albums/?id=1'), (49, 'Album', 'альбом 1', 1, 1, '2010-10-11 13:36:39', 'Альбом был изменен в 2010-10-11 13:36:39. Менеджер [1] admin ()', 'update', '/albums/?id=1'), (50, 'Page', 'index', 1, 1, '2010-10-11 13:48:52', 'Страница была изменена в 2010-10-11 13:48:52. Менеджер [1] admin ()', 'update', '/backend/pages/?id=1'), (51, 'News', 'Новость 1', 1, 1, '2010-10-11 13:51:33', 'Тег был изменен в 2010-10-11 13:51:33. Менеджер [1] admin ()', 'update', '/backend/news/?id=1'), (52, 'News', 'Новость 1', 1, 1, '2010-10-11 13:51:50', 'Тег был изменен в 2010-10-11 13:51:50. Менеджер [1] admin ()', 'update', '/news/?id=1'), (53, 'Page', 'gallery', 4, 1, '2010-10-11 14:02:31', 'Страница была изменена в 2010-10-11 14:02:31. Менеджер [1] admin ()', 'update', '/backend/pages/?id=4');
/*!40000 ALTER TABLE `emp_log` ENABLE KEYS */;


# Dumping structure for table single.emp_media2news
CREATE TABLE IF NOT EXISTS `emp_media2news` (
  `id` int(10) NOT NULL auto_increment,
  `media_id` int(11) unsigned NOT NULL,
  `news_id` int(11) unsigned NOT NULL,
  `name` varchar(255) default NULL,
  `weight` int(3) unsigned NOT NULL default '0',
  `is_active` int(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `media_id_news_id` (`media_id`,`news_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

# Dumping data for table single.emp_media2news: 0 rows
/*!40000 ALTER TABLE `emp_media2news` DISABLE KEYS */;
INSERT INTO `emp_media2news` (`id`, `media_id`, `news_id`, `name`, `weight`, `is_active`) VALUES (12, 5, 1, '', 2, 1), (11, 6, 1, '', 2, 1), (10, 4, 1, '', 2, 1), (9, 3, 1, '', 2, 1), (8, 2, 1, '', 2, 1), (7, 1, 1, '', 2, 1);
/*!40000 ALTER TABLE `emp_media2news` ENABLE KEYS */;


# Dumping structure for table single.emp_media2tag
CREATE TABLE IF NOT EXISTS `emp_media2tag` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `media_id` int(11) unsigned NOT NULL,
  `tag_id` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `media_id_tag_id` (`media_id`,`tag_id`),
  KEY `mtrelation2tag` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# Dumping data for table single.emp_media2tag: 0 rows
/*!40000 ALTER TABLE `emp_media2tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `emp_media2tag` ENABLE KEYS */;


# Dumping structure for table single.emp_media_bank
CREATE TABLE IF NOT EXISTS `emp_media_bank` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `file` varchar(255) default NULL,
  `alt` varchar(255) NOT NULL default '',
  `weight` int(3) unsigned NOT NULL default '0',
  `is_active` int(1) unsigned NOT NULL default '0',
  `type_id` int(2) unsigned NOT NULL default '1' COMMENT '1:image;2:video',
  `src` text,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `file` (`file`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Media bank:\r\nphotos and videos';

# Dumping data for table single.emp_media_bank: 6 rows
/*!40000 ALTER TABLE `emp_media_bank` DISABLE KEYS */;
INSERT INTO `emp_media_bank` (`id`, `file`, `alt`, `weight`, `is_active`, `type_id`, `src`) VALUES (1, '4cb2ccf48e909cd003d0f28ec7121b1985f8723dd9609.jpg', '', 0, 1, 1, NULL), (2, '4cb2ccf4bfa3ccd003d0f28ec7121b1985f8723dd9609.jpg', '', 0, 1, 1, NULL), (3, '4cb2ccf47f6d4cd003d0f28ec7121b1985f8723dd9609.jpg', '', 0, 0, 1, NULL), (4, '4cb2ccf4a96becd003d0f28ec7121b1985f8723dd9609.jpg', '', 0, 1, 1, NULL), (5, '4cb2ccf4a2574cd003d0f28ec7121b1985f8723dd9609.jpg', '', 0, 0, 1, NULL), (6, '4cb2ccf46e561cd003d0f28ec7121b1985f8723dd9609.jpg', '', 0, 1, 1, NULL);
/*!40000 ALTER TABLE `emp_media_bank` ENABLE KEYS */;


# Dumping structure for table single.emp_news
CREATE TABLE IF NOT EXISTS `emp_news` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `image_id` int(11) unsigned NOT NULL default '0',
  `heading` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `url` varchar(255) NOT NULL default '',
  `text` text NOT NULL,
  `create_time` datetime NOT NULL,
  `shows` int(10) unsigned NOT NULL default '0',
  `site_node` int(11) unsigned NOT NULL default '1',
  `is_top` int(1) unsigned NOT NULL default '0',
  `is_hot` int(1) unsigned NOT NULL default '0',
  `author` varchar(255) NOT NULL default '',
  `source` varchar(255) NOT NULL default '',
  `photoalbum_id` int(11) unsigned default NULL,
  `category_id` int(11) unsigned default NULL,
  `weight` int(3) unsigned NOT NULL default '0',
  `is_active` int(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `news2cats` (`category_id`),
  KEY `news2images` (`image_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='@site_node is FK 2 mainMenu';

# Dumping data for table single.emp_news: 0 rows
/*!40000 ALTER TABLE `emp_news` DISABLE KEYS */;
INSERT INTO `emp_news` (`id`, `image_id`, `heading`, `name`, `url`, `text`, `create_time`, `shows`, `site_node`, `is_top`, `is_hot`, `author`, `source`, `photoalbum_id`, `category_id`, `weight`, `is_active`) VALUES (1, 4, 'qwertyuiolkjhgfdsaxcvb', 'Новость 1', 'novost_1', '<p>&nbsp;вапвап</p>', '2010-10-11 12:18:15', 21, 1, 0, 1, 'пыв', 'вапвап', NULL, 2, 2, 1);
/*!40000 ALTER TABLE `emp_news` ENABLE KEYS */;


# Dumping structure for table single.emp_news2tag
CREATE TABLE IF NOT EXISTS `emp_news2tag` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `news_id` int(11) unsigned default '0',
  `tag_id` int(11) unsigned default '0',
  PRIMARY KEY  (`id`),
  KEY `logicalNews2tag` (`tag_id`),
  KEY `logicalNews2news` (`news_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

# Dumping data for table single.emp_news2tag: 0 rows
/*!40000 ALTER TABLE `emp_news2tag` DISABLE KEYS */;
INSERT INTO `emp_news2tag` (`id`, `news_id`, `tag_id`) VALUES (1, 1, 1), (2, 1, 2);
/*!40000 ALTER TABLE `emp_news2tag` ENABLE KEYS */;


# Dumping structure for table single.emp_news_comments
CREATE TABLE IF NOT EXISTS `emp_news_comments` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `comment` text NOT NULL,
  `author` varchar(255) NOT NULL,
  `news_id` int(11) unsigned NOT NULL,
  `parent_id` int(11) unsigned NOT NULL default '0',
  `is_active` int(1) unsigned NOT NULL default '1',
  `create_time` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `comment2news` (`news_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

# Dumping data for table single.emp_news_comments: 0 rows
/*!40000 ALTER TABLE `emp_news_comments` DISABLE KEYS */;
INSERT INTO `emp_news_comments` (`id`, `comment`, `author`, `news_id`, `parent_id`, `is_active`, `create_time`) VALUES (1, 'test', 'test', 1, 0, 1, '0000-00-00 00:00:00'), (2, 'answer test', 'testtest', 1, 1, 1, '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `emp_news_comments` ENABLE KEYS */;


# Dumping structure for table single.emp_pages
CREATE TABLE IF NOT EXISTS `emp_pages` (
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
  PRIMARY KEY  (`id`),
  UNIQUE KEY `page_name` (`page_name`),
  KEY `page_url_key` (`page_url`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

# Dumping data for table single.emp_pages: 2 rows
/*!40000 ALTER TABLE `emp_pages` DISABLE KEYS */;
INSERT INTO `emp_pages` (`id`, `page_parent_id`, `page_name`, `page_url`, `page_template`, `page_title`, `page_description`, `page_content`, `page_keywords`, `js`, `css`) VALUES (1, 0, 'index', 'index', '', '', '', '<?xml version="1.0"?>\n<page id="a90ce777f8357780aa6706c5327d75a3"><content_part name="page_content" id="167a90313d6a415c1e9aa719e85e337e"><module id="9d8cf6efeca7bf786b646896269bba3b" order="0" name="news" view="strip" parameters="N;"/><module id="7da243ec196e2431477db0912d126dfd" order="1" name="tags" view="news" parameters="N;"/></content_part></page>\n', '', NULL, NULL), (2, 0, 'Меню', 'menu', '', '', '', '<?xml version="1.0"?>\n<page id="38e87910d58db03a34ab744b9c5f1096"><content_part name="page_content" id="bc1a762022e6462bafbce3565a3e3b38"><current_module id="e39a686f3c583320bfc2c2ace40fd407" order="0" name="menu"/></content_part></page>\n', '', NULL, NULL), (3, 0, 'news', 'news', '', '', '', '<?xml version="1.0"?>\n<page id="284fd72b57778a715610f60f272c0f6c"><content_part name="page_content" id="2a0edce7cf0b3848aa5b3900ee497d3b"><current_module id="52c08118faa16c3cf942060ea4674f5c" order="0" name="news"/></content_part></page>\n', '', NULL, NULL), (4, 0, 'gallery', 'gallery', '', '', '', '<?xml version="1.0"?>\n<page id="b4da72f331e79eb0319c09d85d0e388a"><content_part name="page_content" id="69c73f21775a0a15064a833183c0fc55"><current_module id="97b80cfc9bae9da9df211062a991304a" order="0" name="gallery"/></content_part></page>', '', NULL, NULL);
/*!40000 ALTER TABLE `emp_pages` ENABLE KEYS */;


# Dumping structure for table single.emp_photo_comments
CREATE TABLE IF NOT EXISTS `emp_photo_comments` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `comment` text NOT NULL,
  `author` varchar(255) NOT NULL,
  `photo_id` int(11) unsigned NOT NULL,
  `parent_id` int(11) unsigned NOT NULL default '0',
  `is_active` int(1) unsigned NOT NULL default '1',
  `create_time` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `comment2photo` (`photo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

# Dumping data for table single.emp_photo_comments: 0 rows
/*!40000 ALTER TABLE `emp_photo_comments` DISABLE KEYS */;
INSERT INTO `emp_photo_comments` (`id`, `comment`, `author`, `photo_id`, `parent_id`, `is_active`, `create_time`) VALUES (1, 'интеркулер!', 'test', 7, 0, 1, '0000-00-00 00:00:00'), (2, 'нет!', 'тест', 7, 1, 1, '0000-00-00 00:00:00'), (3, 'да!!!', 'тест', 7, 2, 1, '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `emp_photo_comments` ENABLE KEYS */;


# Dumping structure for table single.emp_session
CREATE TABLE IF NOT EXISTS `emp_session` (
  `sess_id` varchar(32) NOT NULL default '',
  `last_updated` int(11) default NULL,
  `value` text,
  PRIMARY KEY  (`sess_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table single.emp_session: 1 rows
/*!40000 ALTER TABLE `emp_session` DISABLE KEYS */;
INSERT INTO `emp_session` (`sess_id`, `last_updated`, `value`) VALUES ('20ba4bba96e9da2b149db6ec228e80e8', 1286794951, 'prevURL|s:39:"http://single.sys/pages/getmoduleparam/";curURL|s:29:"http://single.sys/pages/save/";login/loggedUser|O:4:"User":6:{s:16:"\0*\0currentEntity";s:4:"User";s:9:"\0*\0fields";a:12:{s:8:"group_id";a:3:{s:5:"value";i:0;s:7:"changed";b:0;s:4:"type";s:3:"int";}s:5:"login";a:5:{s:5:"value";s:5:"admin";s:7:"changed";b:0;s:4:"type";s:6:"string";s:8:"validate";b:1;s:14:"invalid_string";s:171:"Логин должен быть уникальным содержать не менее 4-х символов и состоять из цифр букв и знака "_"";}s:8:"password";a:6:{s:5:"value";s:32:"d8578edf8458ce06fbc5bb76a58c5ca4";s:7:"changed";b:0;s:4:"type";s:6:"string";s:8:"pre_func";s:3:"md5";s:8:"validate";b:1;s:14:"invalid_string";s:67:"Пароль должен быть более 4-х символов";}s:5:"email";a:5:{s:5:"value";s:19:"alex@newname.com.ua";s:7:"changed";b:0;s:4:"type";s:6:"string";s:8:"validate";b:1;s:14:"invalid_string";s:97:"Введите пожалуйста валидный адрес электронной почты";}s:11:"create_date";a:5:{s:5:"value";s:19:"2010-09-06 19:39:54";s:7:"changed";b:0;s:4:"type";s:4:"date";s:8:"auto_set";s:6:"Insert";s:10:"auto_value";s:5:"now()";}s:11:"update_date";a:5:{s:5:"value";s:19:"0000-00-00 00:00:00";s:7:"changed";b:0;s:4:"type";s:4:"date";s:8:"auto_set";s:6:"Update";s:10:"auto_value";s:5:"now()";}s:9:"full_name";a:3:{s:5:"value";s:0:"";s:7:"changed";b:0;s:4:"type";s:6:"string";}s:4:"info";a:3:{s:5:"value";s:0:"";s:7:"changed";b:0;s:4:"type";s:6:"string";}s:6:"active";a:3:{s:5:"value";b:0;s:7:"changed";b:0;s:4:"type";s:4:"bool";}s:10:"permitions";a:3:{s:5:"value";a:1:{i:0;b:0;}s:7:"changed";b:0;s:4:"type";s:5:"array";}s:7:"is_root";a:3:{s:5:"value";b:1;s:7:"changed";b:0;s:4:"type";s:4:"bool";}s:7:"inherit";a:3:{s:5:"value";b:0;s:7:"changed";b:0;s:4:"type";s:4:"bool";}}s:6:"\0*\0key";s:1:"1";s:10:"\0*\0keyName";s:2:"id";s:12:"\0*\0tableName";s:9:"emp_users";s:8:"\0*\0valid";a:0:{}}');
/*!40000 ALTER TABLE `emp_session` ENABLE KEYS */;


# Dumping structure for table single.emp_static_pages
CREATE TABLE IF NOT EXISTS `emp_static_pages` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `tech_url` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` text,
  `is_system` tinyint(3) unsigned NOT NULL default '0',
  `title` text NOT NULL,
  PRIMARY KEY  (`id`),
  FULLTEXT KEY `FULLTEXT` (`name`,`content`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table single.emp_static_pages: 0 rows
/*!40000 ALTER TABLE `emp_static_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `emp_static_pages` ENABLE KEYS */;


# Dumping structure for table single.emp_tag
CREATE TABLE IF NOT EXISTS `emp_tag` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(127) NOT NULL,
  `url` varchar(127) NOT NULL,
  `weight` int(3) unsigned NOT NULL,
  `is_active` int(1) unsigned NOT NULL,
  `is_nav` int(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 PACK_KEYS=1 COMMENT='project tags';

# Dumping data for table single.emp_tag: 2 rows
/*!40000 ALTER TABLE `emp_tag` DISABLE KEYS */;
INSERT INTO `emp_tag` (`id`, `name`, `url`, `weight`, `is_active`, `is_nav`) VALUES (1, 'Тег 1', 'teg_1', 0, 1, 1), (2, 'тег 2', 'tag2', 0, 1, 1);
/*!40000 ALTER TABLE `emp_tag` ENABLE KEYS */;


# Dumping structure for table single.emp_users
CREATE TABLE IF NOT EXISTS `emp_users` (
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

# Dumping data for table single.emp_users: 1 rows
/*!40000 ALTER TABLE `emp_users` DISABLE KEYS */;
INSERT INTO `emp_users` (`id`, `group_id`, `login`, `password`, `create_date`, `update_date`, `full_name`, `info`, `active`, `permitions`, `params`, `is_root`, `inherit`, `email`) VALUES (1, 0, 'admin', 'd8578edf8458ce06fbc5bb76a58c5ca4', '2010-09-06 19:39:54', '0000-00-00 00:00:00', NULL, NULL, 0, NULL, NULL, 1, 0, 'alex@newname.com.ua');
/*!40000 ALTER TABLE `emp_users` ENABLE KEYS */;


# Dumping structure for table single.emp_user_groups
CREATE TABLE IF NOT EXISTS `emp_user_groups` (
  `id` int(11) NOT NULL auto_increment,
  `group_name` varchar(255) NOT NULL default '',
  `info` text,
  `permitions` text,
  `params` text,
  `default_group` int(10) unsigned NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 PACK_KEYS=1;

# Dumping data for table single.emp_user_groups: 1 rows
/*!40000 ALTER TABLE `emp_user_groups` DISABLE KEYS */;
INSERT INTO `emp_user_groups` (`id`, `group_name`, `info`, `permitions`, `params`, `default_group`, `last_update`) VALUES (1, 'default', NULL, NULL, NULL, 1, '2010-09-06 19:40:31');
/*!40000 ALTER TABLE `emp_user_groups` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
