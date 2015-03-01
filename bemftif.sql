-- phpMyAdmin SQL Dump
-- version 4.3.3
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2015 at 12:43 PM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bemftif`
--
CREATE DATABASE IF NOT EXISTS `bemftif` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bemftif`;

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--
-- Creation: Feb 17, 2015 at 12:28 PM
--

DROP TABLE IF EXISTS `wp_commentmeta`;
CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `wp_commentmeta`:
--

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--
-- Creation: Feb 17, 2015 at 12:28 PM
--

DROP TABLE IF EXISTS `wp_comments`;
CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `wp_comments`:
--

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Mr WordPress', '', 'https://wordpress.org/', '', '2015-02-17 12:28:23', '2015-02-17 12:28:23', 'Hi, this is a comment.\nTo delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--
-- Creation: Feb 17, 2015 at 12:28 PM
--

DROP TABLE IF EXISTS `wp_links`;
CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `wp_links`:
--

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--
-- Creation: Feb 17, 2015 at 12:28 PM
--

DROP TABLE IF EXISTS `wp_options`;
CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB AUTO_INCREMENT=290 DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `wp_options`:
--

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/wordpress', 'yes'),
(2, 'home', 'http://localhost/wordpress', 'yes'),
(3, 'blogname', 'LOGO', 'yes'),
(4, 'blogdescription', '', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'fauzan14fourteen@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '', 'yes'),
(29, 'gzipcompression', '0', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:4:{i:0;s:60:"creative-clans-slide-show/creativeclans-slideshow-widget.php";i:1;s:31:"easing-slider/easing-slider.php";i:2;s:30:"formget-contact-form/index.php";i:3;s:28:"website-logo/create_logo.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'advanced_edit', '0', 'yes'),
(37, 'comment_max_links', '2', 'yes'),
(38, 'gmt_offset', '7', 'yes'),
(39, 'default_email_category', '1', 'yes'),
(40, 'recently_edited', 'a:5:{i:0;s:71:"C:\\xampp\\htdocs\\wordpress/wp-content/themes/salejunction/front-page.php";i:2;s:67:"C:\\xampp\\htdocs\\wordpress/wp-content/themes/salejunction/footer.php";i:3;s:69:"C:\\xampp\\htdocs\\wordpress/wp-content/themes/salejunction/comments.php";i:4;s:69:"C:\\xampp\\htdocs\\wordpress/wp-content/themes/salejunction/category.php";i:5;s:67:"C:\\xampp\\htdocs\\wordpress/wp-content/themes/salejunction/author.php";}', 'no'),
(41, 'template', 'salejunction', 'yes'),
(42, 'stylesheet', 'salejunction', 'yes'),
(43, 'comment_whitelist', '1', 'yes'),
(44, 'blacklist_keys', '', 'no'),
(45, 'comment_registration', '0', 'yes'),
(46, 'html_type', 'text/html', 'yes'),
(47, 'use_trackback', '0', 'yes'),
(48, 'default_role', 'subscriber', 'yes'),
(49, 'db_version', '30133', 'yes'),
(50, 'uploads_use_yearmonth_folders', '1', 'yes'),
(51, 'upload_path', '', 'yes'),
(52, 'blog_public', '1', 'yes'),
(53, 'default_link_category', '2', 'yes'),
(54, 'show_on_front', 'posts', 'yes'),
(55, 'tag_base', '', 'yes'),
(56, 'show_avatars', '1', 'yes'),
(57, 'avatar_rating', 'G', 'yes'),
(58, 'upload_url_path', '', 'yes'),
(59, 'thumbnail_size_w', '150', 'yes'),
(60, 'thumbnail_size_h', '150', 'yes'),
(61, 'thumbnail_crop', '1', 'yes'),
(62, 'medium_size_w', '300', 'yes'),
(63, 'medium_size_h', '300', 'yes'),
(64, 'avatar_default', 'mystery', 'yes'),
(65, 'large_size_w', '1024', 'yes'),
(66, 'large_size_h', '1024', 'yes'),
(67, 'image_default_link_type', 'file', 'yes'),
(68, 'image_default_size', '', 'yes'),
(69, 'image_default_align', '', 'yes'),
(70, 'close_comments_for_old_posts', '0', 'yes'),
(71, 'close_comments_days_old', '14', 'yes'),
(72, 'thread_comments', '1', 'yes'),
(73, 'thread_comments_depth', '5', 'yes'),
(74, 'page_comments', '0', 'yes'),
(75, 'comments_per_page', '50', 'yes'),
(76, 'default_comments_page', 'newest', 'yes'),
(77, 'comment_order', 'asc', 'yes'),
(78, 'sticky_posts', 'a:0:{}', 'yes'),
(79, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'widget_text', 'a:0:{}', 'yes'),
(81, 'widget_rss', 'a:0:{}', 'yes'),
(82, 'uninstall_plugins', 'a:1:{s:31:"easing-slider/easing-slider.php";a:2:{i:0;s:13:"Easing_Slider";i:1;s:12:"do_uninstall";}}', 'no'),
(83, 'timezone_string', '', 'yes'),
(84, 'page_for_posts', '0', 'yes'),
(85, 'page_on_front', '0', 'yes'),
(86, 'default_post_format', '0', 'yes'),
(87, 'link_manager_enabled', '0', 'yes'),
(88, 'initial_db_version', '30133', 'yes'),
(89, 'wp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:67:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:25:"easingslider_edit_sliders";b:1;s:28:"easingslider_publish_sliders";b:1;s:32:"easingslider_discover_extensions";b:1;s:28:"easingslider_manage_settings";b:1;s:34:"easingslider_manage_customizations";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(90, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(91, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(92, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(93, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'sidebars_widgets', 'a:9:{s:19:"wp_inactive_widgets";a:0:{}s:19:"primary-widget-area";a:7:{i:0;s:21:"easingslider_widget-2";i:1;s:8:"search-2";i:2;s:14:"recent-posts-2";i:3;s:17:"recent-comments-2";i:4;s:10:"archives-2";i:5;s:12:"categories-2";i:6;s:6:"meta-2";}s:21:"secondary-widget-area";a:0:{}s:24:"first-footer-widget-area";a:0:{}s:25:"second-footer-widget-area";a:0:{}s:24:"third-footer-widget-area";a:0:{}s:25:"fourth-footer-widget-area";a:0:{}s:4:"shop";a:0:{}s:13:"array_version";i:3;}', 'yes'),
(96, 'cron', 'a:7:{i:1424348945;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1424349011;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1424351512;a:1:{s:28:"woocommerce_cleanup_sessions";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1424352681;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1424373600;a:1:{s:20:"wp_maybe_auto_update";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1424390400;a:1:{s:27:"woocommerce_scheduled_sales";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(98, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:57:"https://downloads.wordpress.org/release/wordpress-4.1.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:57:"https://downloads.wordpress.org/release/wordpress-4.1.zip";s:10:"no_content";s:68:"https://downloads.wordpress.org/release/wordpress-4.1-no-content.zip";s:11:"new_bundled";s:69:"https://downloads.wordpress.org/release/wordpress-4.1-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:3:"4.1";s:7:"version";s:3:"4.1";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1424346076;s:15:"version_checked";s:3:"4.1";s:12:"translations";a:0:{}}', 'yes'),
(100, '_transient_random_seed', '058bf4317f49a4e2b8fd69aab6b184b8', 'yes'),
(104, 'can_compress_scripts', '1', 'yes'),
(110, '_transient_twentyfifteen_categories', '1', 'yes'),
(111, '_site_transient_timeout_wporg_theme_feature_list', '1424189382', 'yes'),
(112, '_site_transient_wporg_theme_feature_list', 'a:4:{s:6:"Colors";a:15:{i:0;s:5:"black";i:1;s:4:"blue";i:2;s:5:"brown";i:3;s:4:"gray";i:4;s:5:"green";i:5;s:6:"orange";i:6;s:4:"pink";i:7;s:6:"purple";i:8;s:3:"red";i:9;s:6:"silver";i:10;s:3:"tan";i:11;s:5:"white";i:12;s:6:"yellow";i:13;s:4:"dark";i:14;s:5:"light";}s:6:"Layout";a:9:{i:0;s:12:"fixed-layout";i:1;s:12:"fluid-layout";i:2;s:17:"responsive-layout";i:3;s:10:"one-column";i:4;s:11:"two-columns";i:5;s:13:"three-columns";i:6;s:12:"four-columns";i:7;s:12:"left-sidebar";i:8;s:13:"right-sidebar";}s:8:"Features";a:20:{i:0;s:19:"accessibility-ready";i:1;s:8:"blavatar";i:2;s:10:"buddypress";i:3;s:17:"custom-background";i:4;s:13:"custom-colors";i:5;s:13:"custom-header";i:6;s:11:"custom-menu";i:7;s:12:"editor-style";i:8;s:21:"featured-image-header";i:9;s:15:"featured-images";i:10;s:15:"flexible-header";i:11;s:20:"front-page-post-form";i:12;s:19:"full-width-template";i:13;s:12:"microformats";i:14;s:12:"post-formats";i:15;s:20:"rtl-language-support";i:16;s:11:"sticky-post";i:17;s:13:"theme-options";i:18;s:17:"threaded-comments";i:19;s:17:"translation-ready";}s:7:"Subject";a:3:{i:0;s:7:"holiday";i:1;s:13:"photoblogging";i:2;s:8:"seasonal";}}', 'yes'),
(115, '_site_transient_timeout_browser_6878de708648166377791ae326f91aec', '1424783308', 'yes'),
(116, '_site_transient_browser_6878de708648166377791ae326f91aec', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:11:"42.0.2300.2";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(117, 'theme_mods_twentyfifteen', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1424178557;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}}}}', 'yes'),
(118, 'current_theme', 'SaleJunction', 'yes'),
(119, 'theme_mods_itek', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1424178604;s:4:"data";a:5:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:16:"header-showcase1";N;s:16:"header-showcase2";N;s:16:"header-showcase3";N;}}}', 'yes'),
(120, 'theme_switched', '', 'yes'),
(122, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1424346100;s:7:"checked";a:5:{s:4:"itek";s:5:"1.1.5";s:12:"salejunction";s:5:"1.0.8";s:13:"twentyfifteen";s:3:"1.0";s:14:"twentyfourteen";s:3:"1.3";s:14:"twentythirteen";s:3:"1.4";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}', 'yes'),
(123, 'theme_mods_salejunction', 'a:2:{i:0;b:0;s:18:"nav_menu_locations";a:0:{}}', 'yes'),
(125, 'of_options', 'a:0:{}', 'yes'),
(126, '_wc_needs_pages', '1', 'yes'),
(183, 'shop_catalog_image_size', 'a:3:{s:5:"width";s:3:"150";s:6:"height";s:3:"150";s:4:"crop";b:1;}', 'yes'),
(184, 'shop_single_image_size', 'a:3:{s:5:"width";s:3:"300";s:6:"height";s:3:"300";s:4:"crop";i:1;}', 'yes'),
(185, 'shop_thumbnail_image_size', 'a:3:{s:5:"width";s:2:"90";s:6:"height";s:2:"90";s:4:"crop";i:1;}', 'yes'),
(219, '_transient_woocommerce_processing_order_count', '0', 'yes'),
(222, '_transient_wc_attribute_taxonomies', 'a:0:{}', 'yes'),
(225, 'recently_activated', 'a:1:{s:27:"woocommerce/woocommerce.php";i:1424178963;}', 'yes'),
(230, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}', 'yes'),
(234, '_site_transient_timeout_available_translations', '1424194565', 'yes'),
(235, '_site_transient_available_translations', 'a:49:{s:2:"ar";a:8:{s:8:"language";s:2:"ar";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-17 19:01:24";s:12:"english_name";s:6:"Arabic";s:11:"native_name";s:14:"العربية";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.1/ar.zip";s:3:"iso";a:2:{i:1;s:2:"ar";i:2;s:3:"ara";}s:7:"strings";a:1:{s:8:"continue";s:16:"المتابعة";}}s:2:"az";a:8:{s:8:"language";s:2:"az";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-27 15:23:28";s:12:"english_name";s:11:"Azerbaijani";s:11:"native_name";s:16:"Azərbaycan dili";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.1/az.zip";s:3:"iso";a:2:{i:1;s:2:"az";i:2;s:3:"aze";}s:7:"strings";a:1:{s:8:"continue";s:5:"Davam";}}s:5:"bg_BG";a:8:{s:8:"language";s:5:"bg_BG";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-17 19:05:14";s:12:"english_name";s:9:"Bulgarian";s:11:"native_name";s:18:"Български";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/bg_BG.zip";s:3:"iso";a:2:{i:1;s:2:"bg";i:2;s:3:"bul";}s:7:"strings";a:1:{s:8:"continue";s:22:"Продължение";}}s:5:"bs_BA";a:8:{s:8:"language";s:5:"bs_BA";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-08 17:39:56";s:12:"english_name";s:7:"Bosnian";s:11:"native_name";s:8:"Bosanski";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/bs_BA.zip";s:3:"iso";a:2:{i:1;s:2:"bs";i:2;s:3:"bos";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:2:"ca";a:8:{s:8:"language";s:2:"ca";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-19 03:45:15";s:12:"english_name";s:7:"Catalan";s:11:"native_name";s:7:"Català";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.1/ca.zip";s:3:"iso";a:2:{i:1;s:2:"ca";i:2;s:3:"cat";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:2:"cy";a:8:{s:8:"language";s:2:"cy";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-09 11:12:57";s:12:"english_name";s:5:"Welsh";s:11:"native_name";s:7:"Cymraeg";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.1/cy.zip";s:3:"iso";a:2:{i:1;s:2:"cy";i:2;s:3:"cym";}s:7:"strings";a:1:{s:8:"continue";s:6:"Parhau";}}s:5:"da_DK";a:8:{s:8:"language";s:5:"da_DK";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-29 08:44:51";s:12:"english_name";s:6:"Danish";s:11:"native_name";s:5:"Dansk";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/da_DK.zip";s:3:"iso";a:2:{i:1;s:2:"da";i:2;s:3:"dan";}s:7:"strings";a:1:{s:8:"continue";s:12:"Forts&#230;t";}}s:5:"de_CH";a:8:{s:8:"language";s:5:"de_CH";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-02-04 12:59:40";s:12:"english_name";s:20:"German (Switzerland)";s:11:"native_name";s:17:"Deutsch (Schweiz)";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/de_CH.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:5:"de_DE";a:8:{s:8:"language";s:5:"de_DE";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-02-13 12:45:29";s:12:"english_name";s:6:"German";s:11:"native_name";s:7:"Deutsch";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/de_DE.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:2:"el";a:8:{s:8:"language";s:2:"el";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-29 22:16:49";s:12:"english_name";s:5:"Greek";s:11:"native_name";s:16:"Ελληνικά";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.1/el.zip";s:3:"iso";a:2:{i:1;s:2:"el";i:2;s:3:"ell";}s:7:"strings";a:1:{s:8:"continue";s:16:"Συνέχεια";}}s:5:"en_GB";a:8:{s:8:"language";s:5:"en_GB";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-17 20:53:36";s:12:"english_name";s:12:"English (UK)";s:11:"native_name";s:12:"English (UK)";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/en_GB.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_AU";a:8:{s:8:"language";s:5:"en_AU";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-02-05 09:59:30";s:12:"english_name";s:19:"English (Australia)";s:11:"native_name";s:19:"English (Australia)";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/en_AU.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_CA";a:8:{s:8:"language";s:5:"en_CA";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-28 01:01:02";s:12:"english_name";s:16:"English (Canada)";s:11:"native_name";s:16:"English (Canada)";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/en_CA.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:2:"eo";a:8:{s:8:"language";s:2:"eo";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-08 22:46:58";s:12:"english_name";s:9:"Esperanto";s:11:"native_name";s:9:"Esperanto";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.1/eo.zip";s:3:"iso";a:2:{i:1;s:2:"eo";i:2;s:3:"epo";}s:7:"strings";a:1:{s:8:"continue";s:8:"Daŭrigi";}}s:5:"es_PE";a:8:{s:8:"language";s:5:"es_PE";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2014-12-19 08:14:32";s:12:"english_name";s:14:"Spanish (Peru)";s:11:"native_name";s:17:"Español de Perú";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/es_PE.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_ES";a:8:{s:8:"language";s:5:"es_ES";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-17 21:05:39";s:12:"english_name";s:15:"Spanish (Spain)";s:11:"native_name";s:8:"Español";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/es_ES.zip";s:3:"iso";a:1:{i:1;s:2:"es";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_MX";a:8:{s:8:"language";s:5:"es_MX";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-02-05 15:18:10";s:12:"english_name";s:16:"Spanish (Mexico)";s:11:"native_name";s:19:"Español de México";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/es_MX.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_CL";a:8:{s:8:"language";s:5:"es_CL";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-04 19:47:01";s:12:"english_name";s:15:"Spanish (Chile)";s:11:"native_name";s:17:"Español de Chile";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/es_CL.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:2:"eu";a:8:{s:8:"language";s:2:"eu";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-09 12:20:08";s:12:"english_name";s:6:"Basque";s:11:"native_name";s:7:"Euskara";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.1/eu.zip";s:3:"iso";a:2:{i:1;s:2:"eu";i:2;s:3:"eus";}s:7:"strings";a:1:{s:8:"continue";s:8:"Jarraitu";}}s:5:"fa_IR";a:8:{s:8:"language";s:5:"fa_IR";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-23 14:29:09";s:12:"english_name";s:7:"Persian";s:11:"native_name";s:10:"فارسی";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/fa_IR.zip";s:3:"iso";a:2:{i:1;s:2:"fa";i:2;s:3:"fas";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:2:"fi";a:8:{s:8:"language";s:2:"fi";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2014-12-17 07:01:16";s:12:"english_name";s:7:"Finnish";s:11:"native_name";s:5:"Suomi";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.1/fi.zip";s:3:"iso";a:2:{i:1;s:2:"fi";i:2;s:3:"fin";}s:7:"strings";a:1:{s:8:"continue";s:5:"Jatka";}}s:5:"fr_FR";a:8:{s:8:"language";s:5:"fr_FR";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-17 19:01:48";s:12:"english_name";s:15:"French (France)";s:11:"native_name";s:9:"Français";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/fr_FR.zip";s:3:"iso";a:1:{i:1;s:2:"fr";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:2:"gd";a:8:{s:8:"language";s:2:"gd";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-05 17:37:43";s:12:"english_name";s:15:"Scottish Gaelic";s:11:"native_name";s:9:"Gàidhlig";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.0/gd.zip";s:3:"iso";a:3:{i:1;s:2:"gd";i:2;s:3:"gla";i:3;s:3:"gla";}s:7:"strings";a:1:{s:8:"continue";s:15:"Lean air adhart";}}s:5:"gl_ES";a:8:{s:8:"language";s:5:"gl_ES";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-17 18:37:43";s:12:"english_name";s:8:"Galician";s:11:"native_name";s:6:"Galego";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/gl_ES.zip";s:3:"iso";a:2:{i:1;s:2:"gl";i:2;s:3:"glg";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:3:"haz";a:8:{s:8:"language";s:3:"haz";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-02-12 01:05:09";s:12:"english_name";s:8:"Hazaragi";s:11:"native_name";s:15:"هزاره گی";s:7:"package";s:60:"https://downloads.wordpress.org/translation/core/4.1/haz.zip";s:3:"iso";a:1:{i:2;s:3:"haz";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:5:"he_IL";a:8:{s:8:"language";s:5:"he_IL";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-29 14:11:31";s:12:"english_name";s:6:"Hebrew";s:11:"native_name";s:16:"עִבְרִית";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/he_IL.zip";s:3:"iso";a:1:{i:1;s:2:"he";}s:7:"strings";a:1:{s:8:"continue";s:12:"להמשיך";}}s:2:"hr";a:8:{s:8:"language";s:2:"hr";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2014-12-19 14:39:57";s:12:"english_name";s:8:"Croatian";s:11:"native_name";s:8:"Hrvatski";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.1/hr.zip";s:3:"iso";a:2:{i:1;s:2:"hr";i:2;s:3:"hrv";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:5:"hu_HU";a:8:{s:8:"language";s:5:"hu_HU";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-07 11:10:15";s:12:"english_name";s:9:"Hungarian";s:11:"native_name";s:6:"Magyar";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/hu_HU.zip";s:3:"iso";a:2:{i:1;s:2:"hu";i:2;s:3:"hun";}s:7:"strings";a:1:{s:8:"continue";s:7:"Tovább";}}s:5:"id_ID";a:8:{s:8:"language";s:5:"id_ID";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-31 07:30:24";s:12:"english_name";s:10:"Indonesian";s:11:"native_name";s:16:"Bahasa Indonesia";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/id_ID.zip";s:3:"iso";a:2:{i:1;s:2:"id";i:2;s:3:"ind";}s:7:"strings";a:1:{s:8:"continue";s:9:"Lanjutkan";}}s:5:"it_IT";a:8:{s:8:"language";s:5:"it_IT";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-02-12 09:29:09";s:12:"english_name";s:7:"Italian";s:11:"native_name";s:8:"Italiano";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/it_IT.zip";s:3:"iso";a:2:{i:1;s:2:"it";i:2;s:3:"ita";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:2:"ja";a:8:{s:8:"language";s:2:"ja";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-29 10:53:40";s:12:"english_name";s:8:"Japanese";s:11:"native_name";s:9:"日本語";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.1/ja.zip";s:3:"iso";a:1:{i:1;s:2:"ja";}s:7:"strings";a:1:{s:8:"continue";s:9:"続ける";}}s:5:"ko_KR";a:8:{s:8:"language";s:5:"ko_KR";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-21 03:05:42";s:12:"english_name";s:6:"Korean";s:11:"native_name";s:9:"한국어";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/ko_KR.zip";s:3:"iso";a:2:{i:1;s:2:"ko";i:2;s:3:"kor";}s:7:"strings";a:1:{s:8:"continue";s:6:"계속";}}s:5:"lt_LT";a:8:{s:8:"language";s:5:"lt_LT";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-02-08 00:36:50";s:12:"english_name";s:10:"Lithuanian";s:11:"native_name";s:15:"Lietuvių kalba";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/lt_LT.zip";s:3:"iso";a:2:{i:1;s:2:"lt";i:2;s:3:"lit";}s:7:"strings";a:1:{s:8:"continue";s:6:"Tęsti";}}s:5:"my_MM";a:8:{s:8:"language";s:5:"my_MM";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2014-12-21 19:07:31";s:12:"english_name";s:7:"Burmese";s:11:"native_name";s:15:"ဗမာစာ";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/my_MM.zip";s:3:"iso";a:2:{i:1;s:2:"my";i:2;s:3:"mya";}s:7:"strings";a:1:{s:8:"continue";s:54:"ဆက်လက်လုပ်ေဆာင်ပါ။";}}s:5:"nb_NO";a:8:{s:8:"language";s:5:"nb_NO";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-10 16:35:13";s:12:"english_name";s:19:"Norwegian (Bokmål)";s:11:"native_name";s:13:"Norsk bokmål";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/nb_NO.zip";s:3:"iso";a:2:{i:1;s:2:"nb";i:2;s:3:"nob";}s:7:"strings";a:1:{s:8:"continue";s:8:"Fortsett";}}s:5:"nl_NL";a:8:{s:8:"language";s:5:"nl_NL";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-23 08:38:00";s:12:"english_name";s:5:"Dutch";s:11:"native_name";s:10:"Nederlands";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/nl_NL.zip";s:3:"iso";a:2:{i:1;s:2:"nl";i:2;s:3:"nld";}s:7:"strings";a:1:{s:8:"continue";s:8:"Doorgaan";}}s:5:"pl_PL";a:8:{s:8:"language";s:5:"pl_PL";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-02-08 21:24:15";s:12:"english_name";s:6:"Polish";s:11:"native_name";s:6:"Polski";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/pl_PL.zip";s:3:"iso";a:2:{i:1;s:2:"pl";i:2;s:3:"pol";}s:7:"strings";a:1:{s:8:"continue";s:9:"Kontynuuj";}}s:5:"pt_PT";a:8:{s:8:"language";s:5:"pt_PT";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-02-02 11:59:53";s:12:"english_name";s:21:"Portuguese (Portugal)";s:11:"native_name";s:10:"Português";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/pt_PT.zip";s:3:"iso";a:1:{i:1;s:2:"pt";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"pt_BR";a:8:{s:8:"language";s:5:"pt_BR";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-21 11:05:23";s:12:"english_name";s:19:"Portuguese (Brazil)";s:11:"native_name";s:20:"Português do Brasil";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/pt_BR.zip";s:3:"iso";a:2:{i:1;s:2:"pt";i:2;s:3:"por";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"ro_RO";a:8:{s:8:"language";s:5:"ro_RO";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-02-11 09:08:03";s:12:"english_name";s:8:"Romanian";s:11:"native_name";s:8:"Română";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/ro_RO.zip";s:3:"iso";a:2:{i:1;s:2:"ro";i:2;s:3:"ron";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuă";}}s:5:"ru_RU";a:8:{s:8:"language";s:5:"ru_RU";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-17 18:16:58";s:12:"english_name";s:7:"Russian";s:11:"native_name";s:14:"Русский";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/ru_RU.zip";s:3:"iso";a:2:{i:1;s:2:"ru";i:2;s:3:"rus";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продолжить";}}s:5:"sk_SK";a:8:{s:8:"language";s:5:"sk_SK";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-12 19:18:28";s:12:"english_name";s:6:"Slovak";s:11:"native_name";s:11:"Slovenčina";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/sk_SK.zip";s:3:"iso";a:2:{i:1;s:2:"sk";i:2;s:3:"slk";}s:7:"strings";a:1:{s:8:"continue";s:12:"Pokračovať";}}s:5:"sl_SI";a:8:{s:8:"language";s:5:"sl_SI";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-13 22:38:48";s:12:"english_name";s:9:"Slovenian";s:11:"native_name";s:13:"Slovenščina";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/sl_SI.zip";s:3:"iso";a:2:{i:1;s:2:"sl";i:2;s:3:"slv";}s:7:"strings";a:1:{s:8:"continue";s:10:"Nadaljujte";}}s:5:"sr_RS";a:8:{s:8:"language";s:5:"sr_RS";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2014-12-18 19:08:01";s:12:"english_name";s:7:"Serbian";s:11:"native_name";s:23:"Српски језик";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/sr_RS.zip";s:3:"iso";a:2:{i:1;s:2:"sr";i:2;s:3:"srp";}s:7:"strings";a:1:{s:8:"continue";s:14:"Настави";}}s:5:"sv_SE";a:8:{s:8:"language";s:5:"sv_SE";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-29 09:41:07";s:12:"english_name";s:7:"Swedish";s:11:"native_name";s:7:"Svenska";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/sv_SE.zip";s:3:"iso";a:2:{i:1;s:2:"sv";i:2;s:3:"swe";}s:7:"strings";a:1:{s:8:"continue";s:9:"Fortsätt";}}s:2:"th";a:8:{s:8:"language";s:2:"th";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-02-11 11:46:46";s:12:"english_name";s:4:"Thai";s:11:"native_name";s:9:"ไทย";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.1/th.zip";s:3:"iso";a:2:{i:1;s:2:"th";i:2;s:3:"tha";}s:7:"strings";a:1:{s:8:"continue";s:15:"ต่อไป";}}s:5:"tr_TR";a:8:{s:8:"language";s:5:"tr_TR";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-19 08:42:08";s:12:"english_name";s:7:"Turkish";s:11:"native_name";s:8:"Türkçe";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/tr_TR.zip";s:3:"iso";a:2:{i:1;s:2:"tr";i:2;s:3:"tur";}s:7:"strings";a:1:{s:8:"continue";s:5:"Devam";}}s:5:"zh_CN";a:8:{s:8:"language";s:5:"zh_CN";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2014-12-26 02:21:02";s:12:"english_name";s:15:"Chinese (China)";s:11:"native_name";s:12:"简体中文";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/zh_CN.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"继续";}}s:5:"zh_TW";a:8:{s:8:"language";s:5:"zh_TW";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-08 03:46:32";s:12:"english_name";s:16:"Chinese (Taiwan)";s:11:"native_name";s:12:"繁體中文";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/zh_TW.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"繼續";}}}', 'yes'),
(236, 'WPLANG', '', 'yes'),
(239, '_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a', '1424194994', 'yes'),
(240, '_site_transient_poptags_40cd750bba9870f18aada2478b24840a', 'a:40:{s:6:"widget";a:3:{s:4:"name";s:6:"widget";s:4:"slug";s:6:"widget";s:5:"count";s:4:"4916";}s:4:"post";a:3:{s:4:"name";s:4:"Post";s:4:"slug";s:4:"post";s:5:"count";s:4:"3078";}s:6:"plugin";a:3:{s:4:"name";s:6:"plugin";s:4:"slug";s:6:"plugin";s:5:"count";s:4:"3022";}s:5:"admin";a:3:{s:4:"name";s:5:"admin";s:4:"slug";s:5:"admin";s:5:"count";s:4:"2529";}s:5:"posts";a:3:{s:4:"name";s:5:"posts";s:4:"slug";s:5:"posts";s:5:"count";s:4:"2346";}s:7:"sidebar";a:3:{s:4:"name";s:7:"sidebar";s:4:"slug";s:7:"sidebar";s:5:"count";s:4:"1892";}s:6:"google";a:3:{s:4:"name";s:6:"google";s:4:"slug";s:6:"google";s:5:"count";s:4:"1729";}s:7:"twitter";a:3:{s:4:"name";s:7:"twitter";s:4:"slug";s:7:"twitter";s:5:"count";s:4:"1680";}s:9:"shortcode";a:3:{s:4:"name";s:9:"shortcode";s:4:"slug";s:9:"shortcode";s:5:"count";s:4:"1678";}s:6:"images";a:3:{s:4:"name";s:6:"images";s:4:"slug";s:6:"images";s:5:"count";s:4:"1676";}s:8:"comments";a:3:{s:4:"name";s:8:"comments";s:4:"slug";s:8:"comments";s:5:"count";s:4:"1612";}s:4:"page";a:3:{s:4:"name";s:4:"page";s:4:"slug";s:4:"page";s:5:"count";s:4:"1609";}s:5:"image";a:3:{s:4:"name";s:5:"image";s:4:"slug";s:5:"image";s:5:"count";s:4:"1505";}s:8:"facebook";a:3:{s:4:"name";s:8:"Facebook";s:4:"slug";s:8:"facebook";s:5:"count";s:4:"1322";}s:3:"seo";a:3:{s:4:"name";s:3:"seo";s:4:"slug";s:3:"seo";s:5:"count";s:4:"1276";}s:9:"wordpress";a:3:{s:4:"name";s:9:"wordpress";s:4:"slug";s:9:"wordpress";s:5:"count";s:4:"1175";}s:5:"links";a:3:{s:4:"name";s:5:"links";s:4:"slug";s:5:"links";s:5:"count";s:4:"1171";}s:7:"gallery";a:3:{s:4:"name";s:7:"gallery";s:4:"slug";s:7:"gallery";s:5:"count";s:4:"1083";}s:6:"social";a:3:{s:4:"name";s:6:"social";s:4:"slug";s:6:"social";s:5:"count";s:4:"1079";}s:5:"email";a:3:{s:4:"name";s:5:"email";s:4:"slug";s:5:"email";s:5:"count";s:3:"918";}s:7:"widgets";a:3:{s:4:"name";s:7:"widgets";s:4:"slug";s:7:"widgets";s:5:"count";s:3:"905";}s:5:"pages";a:3:{s:4:"name";s:5:"pages";s:4:"slug";s:5:"pages";s:5:"count";s:3:"874";}s:6:"jquery";a:3:{s:4:"name";s:6:"jquery";s:4:"slug";s:6:"jquery";s:5:"count";s:3:"843";}s:3:"rss";a:3:{s:4:"name";s:3:"rss";s:4:"slug";s:3:"rss";s:5:"count";s:3:"837";}s:5:"media";a:3:{s:4:"name";s:5:"media";s:4:"slug";s:5:"media";s:5:"count";s:3:"794";}s:5:"video";a:3:{s:4:"name";s:5:"video";s:4:"slug";s:5:"video";s:5:"count";s:3:"758";}s:4:"ajax";a:3:{s:4:"name";s:4:"AJAX";s:4:"slug";s:4:"ajax";s:5:"count";s:3:"748";}s:7:"content";a:3:{s:4:"name";s:7:"content";s:4:"slug";s:7:"content";s:5:"count";s:3:"709";}s:11:"woocommerce";a:3:{s:4:"name";s:11:"woocommerce";s:4:"slug";s:11:"woocommerce";s:5:"count";s:3:"700";}s:10:"javascript";a:3:{s:4:"name";s:10:"javascript";s:4:"slug";s:10:"javascript";s:5:"count";s:3:"692";}s:5:"login";a:3:{s:4:"name";s:5:"login";s:4:"slug";s:5:"login";s:5:"count";s:3:"682";}s:5:"photo";a:3:{s:4:"name";s:5:"photo";s:4:"slug";s:5:"photo";s:5:"count";s:3:"657";}s:10:"buddypress";a:3:{s:4:"name";s:10:"buddypress";s:4:"slug";s:10:"buddypress";s:5:"count";s:3:"649";}s:4:"feed";a:3:{s:4:"name";s:4:"feed";s:4:"slug";s:4:"feed";s:5:"count";s:3:"642";}s:4:"link";a:3:{s:4:"name";s:4:"link";s:4:"slug";s:4:"link";s:5:"count";s:3:"642";}s:9:"ecommerce";a:3:{s:4:"name";s:9:"ecommerce";s:4:"slug";s:9:"ecommerce";s:5:"count";s:3:"623";}s:6:"photos";a:3:{s:4:"name";s:6:"photos";s:4:"slug";s:6:"photos";s:5:"count";s:3:"620";}s:7:"youtube";a:3:{s:4:"name";s:7:"youtube";s:4:"slug";s:7:"youtube";s:5:"count";s:3:"605";}s:5:"share";a:3:{s:4:"name";s:5:"Share";s:4:"slug";s:5:"share";s:5:"count";s:3:"600";}s:4:"spam";a:3:{s:4:"name";s:4:"spam";s:4:"slug";s:4:"spam";s:5:"count";s:3:"593";}}', 'yes'),
(241, 'add_title', 'Logo BEM FTIf', 'yes'),
(242, 'add_alt', '', 'yes'),
(243, 'add_logo', '', 'yes'),
(244, 'add_logo_path', 'http://localhost/wordpress/wp-content/plugins/website-logo/images/bem-ftif.png', 'yes'),
(245, 'add_logo_filename', 'bem-ftif.png', 'yes'),
(246, 'salejunction_options', 'a:13:{s:11:"of_template";a:16:{i:0;a:2:{s:4:"name";s:16:"General Settings";s:4:"type";s:7:"heading";}i:1;a:4:{s:4:"name";s:11:"Custom Logo";s:4:"desc";s:62:"Choose your own logo. Optimal Size: 200px Wide by 90px Height.";s:2:"id";s:17:"salejunction_logo";s:4:"type";s:6:"upload";}i:2;a:4:{s:4:"name";s:14:"Custom Favicon";s:4:"desc";s:70:"Specify a 16px x 16px image that will represent your websites favicon.";s:2:"id";s:20:"salejunction_favicon";s:4:"type";s:6:"upload";}i:3;a:2:{s:4:"name";s:20:"Top Feature Settings";s:4:"type";s:7:"heading";}i:4;a:5:{s:4:"name";s:17:"Top Feature Image";s:4:"desc";s:108:"The optimal size of the image is 1920 px wide x 654 px height, but it can be varied as per your requirement.";s:2:"id";s:24:"salejunction_slideimage1";s:3:"std";s:0:"";s:4:"type";s:6:"upload";}i:5;a:5:{s:4:"name";s:19:"Top Feature Heading";s:4:"desc";s:40:"Mention the heading for the Top Feature.";s:2:"id";s:27:"salejunction_sliderheading1";s:3:"std";s:0:"";s:4:"type";s:8:"textarea";}i:6;a:5:{s:4:"name";s:20:"Link for Top Feature";s:4:"desc";s:38:"Mention the URL for Top Feature image.";s:2:"id";s:24:"salejunction_Sliderlink1";s:3:"std";s:0:"";s:4:"type";s:4:"text";}i:7;a:5:{s:4:"name";s:23:"Top Feature Description";s:4:"desc";s:59:"Here mention a short description for the First Top Feature.";s:2:"id";s:23:"salejunction_sliderdes1";s:3:"std";s:0:"";s:4:"type";s:8:"textarea";}i:8;a:5:{s:4:"name";s:27:"Button Text for Top Feature";s:4:"desc";s:40:"Mention the text for Top Feature Button.";s:2:"id";s:27:"salejunction_slider_button1";s:3:"std";s:0:"";s:4:"type";s:4:"text";}i:9;a:2:{s:4:"name";s:18:"Home Page Category";s:4:"type";s:7:"heading";}i:10;a:6:{s:4:"name";s:32:"Select WooCommerce Category List";s:4:"desc";s:67:"Select your product category to display your products on home page.";s:2:"id";s:20:"salejunction_woo_cat";s:3:"std";s:5:"false";s:4:"type";s:10:"multicheck";s:7:"options";a:0:{}}i:11;a:2:{s:4:"name";s:30:"Home Page Blog Feature Section";s:4:"type";s:7:"heading";}i:12;a:5:{s:4:"name";s:17:"Home Blog Heading";s:4:"desc";s:28:"Enter your home blog heading";s:2:"id";s:25:"salejunction_blog_heading";s:3:"std";s:0:"";s:4:"type";s:8:"textarea";}i:13;a:5:{s:4:"name";s:21:"Home Blog Description";s:4:"desc";s:32:"Enter your home blog description";s:2:"id";s:22:"salejunction_blog_desc";s:3:"std";s:0:"";s:4:"type";s:8:"textarea";}i:14;a:2:{s:4:"name";s:15:"Styling Options";s:4:"type";s:7:"heading";}i:15;a:5:{s:4:"name";s:10:"Custom CSS";s:4:"desc";s:62:"Quickly add some CSS to your theme by adding it to this block.";s:2:"id";s:22:"salejunction_customcss";s:3:"std";s:0:"";s:4:"type";s:8:"textarea";}}s:12:"of_themename";s:18:"Salejunction Theme";s:12:"of_shortname";s:2:"of";s:17:"salejunction_logo";s:70:"http://localhost/wordpress/wp-content/uploads/2015/02/rsz_bem-ftif.png";s:20:"salejunction_favicon";s:11:"50px x 20px";s:24:"salejunction_slideimage1";s:0:"";s:27:"salejunction_sliderheading1";s:0:"";s:24:"salejunction_Sliderlink1";s:0:"";s:23:"salejunction_sliderdes1";s:0:"";s:27:"salejunction_slider_button1";s:0:"";s:25:"salejunction_blog_heading";s:0:"";s:22:"salejunction_blog_desc";s:0:"";s:22:"salejunction_customcss";s:0:"";}', 'yes'),
(247, 'widget_creativeclans_slideshow_version', '1.3.4', 'yes'),
(251, 'widget_creativeclansslideshow', 'a:0:{}', 'yes'),
(252, '_site_transient_update_plugins', 'O:8:"stdClass":5:{s:12:"last_checked";i:1424346085;s:7:"checked";a:6:{s:19:"akismet/akismet.php";s:5:"3.0.4";s:60:"creative-clans-slide-show/creativeclans-slideshow-widget.php";s:5:"1.3.4";s:31:"easing-slider/easing-slider.php";s:7:"2.2.0.8";s:30:"formget-contact-form/index.php";s:3:"5.2";s:9:"hello.php";s:3:"1.6";s:28:"website-logo/create_logo.php";s:3:"1.0";}s:8:"response";a:0:{}s:12:"translations";a:0:{}s:9:"no_update";a:6:{s:19:"akismet/akismet.php";O:8:"stdClass":6:{s:2:"id";s:2:"15";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:5:"3.0.4";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/akismet.3.0.4.zip";}s:60:"creative-clans-slide-show/creativeclans-slideshow-widget.php";O:8:"stdClass":6:{s:2:"id";s:4:"6370";s:4:"slug";s:25:"creative-clans-slide-show";s:6:"plugin";s:60:"creative-clans-slide-show/creativeclans-slideshow-widget.php";s:11:"new_version";s:5:"1.3.4";s:3:"url";s:56:"https://wordpress.org/plugins/creative-clans-slide-show/";s:7:"package";s:68:"https://downloads.wordpress.org/plugin/creative-clans-slide-show.zip";}s:31:"easing-slider/easing-slider.php";O:8:"stdClass":6:{s:2:"id";s:5:"16460";s:4:"slug";s:13:"easing-slider";s:6:"plugin";s:31:"easing-slider/easing-slider.php";s:11:"new_version";s:7:"2.2.0.8";s:3:"url";s:44:"https://wordpress.org/plugins/easing-slider/";s:7:"package";s:64:"https://downloads.wordpress.org/plugin/easing-slider.2.2.0.8.zip";}s:30:"formget-contact-form/index.php";O:8:"stdClass":6:{s:2:"id";s:5:"43959";s:4:"slug";s:20:"formget-contact-form";s:6:"plugin";s:30:"formget-contact-form/index.php";s:11:"new_version";s:3:"5.2";s:3:"url";s:51:"https://wordpress.org/plugins/formget-contact-form/";s:7:"package";s:67:"https://downloads.wordpress.org/plugin/formget-contact-form.5.2.zip";}s:9:"hello.php";O:8:"stdClass":6:{s:2:"id";s:4:"3564";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:3:"1.6";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:58:"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip";}s:28:"website-logo/create_logo.php";O:8:"stdClass":6:{s:2:"id";s:5:"36848";s:4:"slug";s:12:"website-logo";s:6:"plugin";s:28:"website-logo/create_logo.php";s:11:"new_version";s:3:"1.0";s:3:"url";s:43:"https://wordpress.org/plugins/website-logo/";s:7:"package";s:55:"https://downloads.wordpress.org/plugin/website-logo.zip";}}}', 'yes'),
(253, 'easingslider_version', '2.2.0.8', 'yes'),
(254, 'easingslider_settings', 'O:8:"stdClass":3:{s:14:"image_resizing";b:0;s:11:"load_assets";s:6:"header";s:11:"remove_data";b:0;}', 'yes'),
(257, 'widget_easingslider_widget', 'a:2:{i:2;a:2:{s:2:"id";i:82;s:5:"title";s:10:"Departemen";}s:12:"_multiwidget";i:1;}', 'yes'),
(266, '_site_transient_timeout_browser_a91083474bb399bba5d2bdee270d349b', '1424874584', 'yes'),
(267, '_site_transient_browser_a91083474bb399bba5d2bdee270d349b', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:11:"42.0.2305.3";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(283, 'auto_updater.lock', '1424346021', 'no'),
(284, '_site_transient_timeout_theme_roots', '1424347828', 'yes'),
(285, '_site_transient_theme_roots', 'a:5:{s:4:"itek";s:7:"/themes";s:12:"salejunction";s:7:"/themes";s:13:"twentyfifteen";s:7:"/themes";s:14:"twentyfourteen";s:7:"/themes";s:14:"twentythirteen";s:7:"/themes";}', 'yes'),
(286, '_transient_timeout_plugin_slugs', '1424432498', 'no'),
(287, '_transient_plugin_slugs', 'a:6:{i:0;s:19:"akismet/akismet.php";i:1;s:60:"creative-clans-slide-show/creativeclans-slideshow-widget.php";i:2;s:31:"easing-slider/easing-slider.php";i:3;s:30:"formget-contact-form/index.php";i:4;s:9:"hello.php";i:5;s:28:"website-logo/create_logo.php";}', 'no'),
(288, '_transient_timeout_dash_4077549d03da2e451c8b5f002294ff51', '1424389299', 'no'),
(289, '_transient_dash_4077549d03da2e451c8b5f002294ff51', '<div class="rss-widget"><p><strong>RSS Error</strong>: WP HTTP Error: Failed to connect to wordpress.org port 80: Connection refused</p></div><div class="rss-widget"><p><strong>RSS Error</strong>: WP HTTP Error: Failed to connect to planet.wordpress.org port 443: Connection refused</p></div><div class="rss-widget"><ul></ul></div>', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--
-- Creation: Feb 17, 2015 at 12:28 PM
--

DROP TABLE IF EXISTS `wp_postmeta`;
CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext
) ENGINE=InnoDB AUTO_INCREMENT=380 DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `wp_postmeta`:
--

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 2, '_edit_lock', '1424179852:1'),
(3, 2, '_edit_lock', '1424179852:1'),
(4, 2, '_edit_last', '1'),
(5, 5, '_edit_last', '1'),
(6, 5, '_edit_lock', '1424269881:1'),
(7, 7, '_edit_last', '1'),
(8, 7, '_edit_lock', '1424270242:1'),
(9, 9, '_edit_last', '1'),
(10, 9, '_edit_lock', '1424179877:1'),
(11, 11, '_edit_last', '1'),
(12, 11, '_edit_lock', '1424180110:1'),
(13, 13, '_edit_last', '1'),
(14, 13, '_edit_lock', '1424180136:1'),
(15, 17, '_edit_last', '1'),
(16, 17, '_edit_lock', '1424180148:1'),
(17, 19, '_edit_last', '1'),
(18, 19, '_edit_lock', '1424270748:1'),
(19, 21, '_edit_last', '1'),
(20, 21, '_edit_lock', '1424270942:1'),
(21, 23, '_edit_last', '1'),
(22, 23, '_edit_lock', '1424272044:1'),
(23, 25, '_edit_last', '1'),
(24, 25, '_edit_lock', '1424270776:1'),
(25, 27, '_edit_last', '1'),
(26, 27, '_edit_lock', '1424270944:1'),
(27, 29, '_edit_last', '1'),
(28, 29, '_edit_lock', '1424270941:1'),
(29, 32, '_edit_last', '1'),
(30, 32, '_edit_lock', '1424271927:1'),
(31, 34, '_edit_last', '1'),
(32, 34, '_edit_lock', '1424180463:1'),
(33, 36, '_edit_last', '1'),
(34, 36, '_edit_lock', '1424180483:1'),
(35, 38, '_edit_last', '1'),
(36, 38, '_edit_lock', '1424180590:1'),
(37, 41, '_menu_item_type', 'custom'),
(38, 41, '_menu_item_menu_item_parent', '0'),
(39, 41, '_menu_item_object_id', '41'),
(40, 41, '_menu_item_object', 'custom'),
(41, 41, '_menu_item_target', ''),
(42, 41, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(43, 41, '_menu_item_xfn', ''),
(44, 41, '_menu_item_url', 'http://localhost/wordpress/'),
(45, 41, '_menu_item_orphaned', '1424181389'),
(46, 42, '_menu_item_type', 'post_type'),
(47, 42, '_menu_item_menu_item_parent', '0'),
(48, 42, '_menu_item_object_id', '2'),
(49, 42, '_menu_item_object', 'page'),
(50, 42, '_menu_item_target', ''),
(51, 42, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(52, 42, '_menu_item_xfn', ''),
(53, 42, '_menu_item_url', ''),
(54, 42, '_menu_item_orphaned', '1424181390'),
(55, 43, '_menu_item_type', 'post_type'),
(56, 43, '_menu_item_menu_item_parent', '0'),
(57, 43, '_menu_item_object_id', '5'),
(58, 43, '_menu_item_object', 'page'),
(59, 43, '_menu_item_target', ''),
(60, 43, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(61, 43, '_menu_item_xfn', ''),
(62, 43, '_menu_item_url', ''),
(63, 43, '_menu_item_orphaned', '1424181390'),
(64, 44, '_menu_item_type', 'post_type'),
(65, 44, '_menu_item_menu_item_parent', '0'),
(66, 44, '_menu_item_object_id', '7'),
(67, 44, '_menu_item_object', 'page'),
(68, 44, '_menu_item_target', ''),
(69, 44, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(70, 44, '_menu_item_xfn', ''),
(71, 44, '_menu_item_url', ''),
(72, 44, '_menu_item_orphaned', '1424181391'),
(73, 45, '_menu_item_type', 'post_type'),
(74, 45, '_menu_item_menu_item_parent', '0'),
(75, 45, '_menu_item_object_id', '34'),
(76, 45, '_menu_item_object', 'page'),
(77, 45, '_menu_item_target', ''),
(78, 45, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(79, 45, '_menu_item_xfn', ''),
(80, 45, '_menu_item_url', ''),
(81, 45, '_menu_item_orphaned', '1424181391'),
(82, 46, '_menu_item_type', 'post_type'),
(83, 46, '_menu_item_menu_item_parent', '0'),
(84, 46, '_menu_item_object_id', '36'),
(85, 46, '_menu_item_object', 'page'),
(86, 46, '_menu_item_target', ''),
(87, 46, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(88, 46, '_menu_item_xfn', ''),
(89, 46, '_menu_item_url', ''),
(90, 46, '_menu_item_orphaned', '1424181392'),
(91, 47, '_menu_item_type', 'post_type'),
(92, 47, '_menu_item_menu_item_parent', '0'),
(93, 47, '_menu_item_object_id', '38'),
(94, 47, '_menu_item_object', 'page'),
(95, 47, '_menu_item_target', ''),
(96, 47, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(97, 47, '_menu_item_xfn', ''),
(98, 47, '_menu_item_url', ''),
(99, 47, '_menu_item_orphaned', '1424181393'),
(100, 48, '_menu_item_type', 'post_type'),
(101, 48, '_menu_item_menu_item_parent', '0'),
(102, 48, '_menu_item_object_id', '9'),
(103, 48, '_menu_item_object', 'page'),
(104, 48, '_menu_item_target', ''),
(105, 48, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(106, 48, '_menu_item_xfn', ''),
(107, 48, '_menu_item_url', ''),
(108, 48, '_menu_item_orphaned', '1424181394'),
(109, 49, '_menu_item_type', 'post_type'),
(110, 49, '_menu_item_menu_item_parent', '0'),
(111, 49, '_menu_item_object_id', '11'),
(112, 49, '_menu_item_object', 'page'),
(113, 49, '_menu_item_target', ''),
(114, 49, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(115, 49, '_menu_item_xfn', ''),
(116, 49, '_menu_item_url', ''),
(117, 49, '_menu_item_orphaned', '1424181395'),
(118, 50, '_menu_item_type', 'post_type'),
(119, 50, '_menu_item_menu_item_parent', '0'),
(120, 50, '_menu_item_object_id', '17'),
(121, 50, '_menu_item_object', 'page'),
(122, 50, '_menu_item_target', ''),
(123, 50, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(124, 50, '_menu_item_xfn', ''),
(125, 50, '_menu_item_url', ''),
(126, 50, '_menu_item_orphaned', '1424181396'),
(127, 51, '_menu_item_type', 'post_type'),
(128, 51, '_menu_item_menu_item_parent', '0'),
(129, 51, '_menu_item_object_id', '32'),
(130, 51, '_menu_item_object', 'page'),
(131, 51, '_menu_item_target', ''),
(132, 51, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(133, 51, '_menu_item_xfn', ''),
(134, 51, '_menu_item_url', ''),
(135, 51, '_menu_item_orphaned', '1424181396'),
(136, 52, '_menu_item_type', 'post_type'),
(137, 52, '_menu_item_menu_item_parent', '0'),
(138, 52, '_menu_item_object_id', '13'),
(139, 52, '_menu_item_object', 'page'),
(140, 52, '_menu_item_target', ''),
(141, 52, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(142, 52, '_menu_item_xfn', ''),
(143, 52, '_menu_item_url', ''),
(144, 52, '_menu_item_orphaned', '1424181397'),
(145, 53, '_menu_item_type', 'post_type'),
(146, 53, '_menu_item_menu_item_parent', '0'),
(147, 53, '_menu_item_object_id', '23'),
(148, 53, '_menu_item_object', 'page'),
(149, 53, '_menu_item_target', ''),
(150, 53, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(151, 53, '_menu_item_xfn', ''),
(152, 53, '_menu_item_url', ''),
(153, 53, '_menu_item_orphaned', '1424181397'),
(154, 54, '_menu_item_type', 'post_type'),
(155, 54, '_menu_item_menu_item_parent', '0'),
(156, 54, '_menu_item_object_id', '29'),
(157, 54, '_menu_item_object', 'page'),
(158, 54, '_menu_item_target', ''),
(159, 54, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(160, 54, '_menu_item_xfn', ''),
(161, 54, '_menu_item_url', ''),
(162, 54, '_menu_item_orphaned', '1424181397'),
(163, 55, '_menu_item_type', 'post_type'),
(164, 55, '_menu_item_menu_item_parent', '0'),
(165, 55, '_menu_item_object_id', '21'),
(166, 55, '_menu_item_object', 'page'),
(167, 55, '_menu_item_target', ''),
(168, 55, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(169, 55, '_menu_item_xfn', ''),
(170, 55, '_menu_item_url', ''),
(171, 55, '_menu_item_orphaned', '1424181398'),
(172, 56, '_menu_item_type', 'post_type'),
(173, 56, '_menu_item_menu_item_parent', '0'),
(174, 56, '_menu_item_object_id', '27'),
(175, 56, '_menu_item_object', 'page'),
(176, 56, '_menu_item_target', ''),
(177, 56, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(178, 56, '_menu_item_xfn', ''),
(179, 56, '_menu_item_url', ''),
(180, 56, '_menu_item_orphaned', '1424181400'),
(181, 57, '_menu_item_type', 'post_type'),
(182, 57, '_menu_item_menu_item_parent', '0'),
(183, 57, '_menu_item_object_id', '25'),
(184, 57, '_menu_item_object', 'page'),
(185, 57, '_menu_item_target', ''),
(186, 57, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(187, 57, '_menu_item_xfn', ''),
(188, 57, '_menu_item_url', ''),
(189, 57, '_menu_item_orphaned', '1424181401'),
(190, 58, '_menu_item_type', 'post_type'),
(191, 58, '_menu_item_menu_item_parent', '0'),
(192, 58, '_menu_item_object_id', '19'),
(193, 58, '_menu_item_object', 'page'),
(194, 58, '_menu_item_target', ''),
(195, 58, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(196, 58, '_menu_item_xfn', ''),
(197, 58, '_menu_item_url', ''),
(198, 58, '_menu_item_orphaned', '1424181403'),
(199, 59, '_menu_item_type', 'custom'),
(200, 59, '_menu_item_menu_item_parent', '0'),
(201, 59, '_menu_item_object_id', '59'),
(202, 59, '_menu_item_object', 'custom'),
(203, 59, '_menu_item_target', ''),
(204, 59, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(205, 59, '_menu_item_xfn', ''),
(206, 59, '_menu_item_url', 'http://localhost/wordpress/'),
(207, 59, '_menu_item_orphaned', '1424181823'),
(208, 60, '_menu_item_type', 'post_type'),
(209, 60, '_menu_item_menu_item_parent', '0'),
(210, 60, '_menu_item_object_id', '2'),
(211, 60, '_menu_item_object', 'page'),
(212, 60, '_menu_item_target', ''),
(213, 60, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(214, 60, '_menu_item_xfn', ''),
(215, 60, '_menu_item_url', ''),
(216, 60, '_menu_item_orphaned', '1424181824'),
(217, 61, '_menu_item_type', 'post_type'),
(218, 61, '_menu_item_menu_item_parent', '0'),
(219, 61, '_menu_item_object_id', '5'),
(220, 61, '_menu_item_object', 'page'),
(221, 61, '_menu_item_target', ''),
(222, 61, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(223, 61, '_menu_item_xfn', ''),
(224, 61, '_menu_item_url', ''),
(225, 61, '_menu_item_orphaned', '1424181824'),
(226, 62, '_menu_item_type', 'post_type'),
(227, 62, '_menu_item_menu_item_parent', '0'),
(228, 62, '_menu_item_object_id', '7'),
(229, 62, '_menu_item_object', 'page'),
(230, 62, '_menu_item_target', ''),
(231, 62, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(232, 62, '_menu_item_xfn', ''),
(233, 62, '_menu_item_url', ''),
(234, 62, '_menu_item_orphaned', '1424181825'),
(235, 63, '_menu_item_type', 'post_type'),
(236, 63, '_menu_item_menu_item_parent', '0'),
(237, 63, '_menu_item_object_id', '34'),
(238, 63, '_menu_item_object', 'page'),
(239, 63, '_menu_item_target', ''),
(240, 63, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(241, 63, '_menu_item_xfn', ''),
(242, 63, '_menu_item_url', ''),
(243, 63, '_menu_item_orphaned', '1424181826'),
(244, 64, '_menu_item_type', 'post_type'),
(245, 64, '_menu_item_menu_item_parent', '0'),
(246, 64, '_menu_item_object_id', '36'),
(247, 64, '_menu_item_object', 'page'),
(248, 64, '_menu_item_target', ''),
(249, 64, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(250, 64, '_menu_item_xfn', ''),
(251, 64, '_menu_item_url', ''),
(252, 64, '_menu_item_orphaned', '1424181826'),
(253, 65, '_menu_item_type', 'post_type'),
(254, 65, '_menu_item_menu_item_parent', '0'),
(255, 65, '_menu_item_object_id', '38'),
(256, 65, '_menu_item_object', 'page'),
(257, 65, '_menu_item_target', ''),
(258, 65, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(259, 65, '_menu_item_xfn', ''),
(260, 65, '_menu_item_url', ''),
(261, 65, '_menu_item_orphaned', '1424181827'),
(262, 66, '_menu_item_type', 'post_type'),
(263, 66, '_menu_item_menu_item_parent', '0'),
(264, 66, '_menu_item_object_id', '9'),
(265, 66, '_menu_item_object', 'page'),
(266, 66, '_menu_item_target', ''),
(267, 66, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(268, 66, '_menu_item_xfn', ''),
(269, 66, '_menu_item_url', ''),
(270, 66, '_menu_item_orphaned', '1424181827'),
(271, 67, '_menu_item_type', 'post_type'),
(272, 67, '_menu_item_menu_item_parent', '0'),
(273, 67, '_menu_item_object_id', '11'),
(274, 67, '_menu_item_object', 'page'),
(275, 67, '_menu_item_target', ''),
(276, 67, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(277, 67, '_menu_item_xfn', ''),
(278, 67, '_menu_item_url', ''),
(279, 67, '_menu_item_orphaned', '1424181827'),
(280, 68, '_menu_item_type', 'post_type'),
(281, 68, '_menu_item_menu_item_parent', '0'),
(282, 68, '_menu_item_object_id', '17'),
(283, 68, '_menu_item_object', 'page'),
(284, 68, '_menu_item_target', ''),
(285, 68, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(286, 68, '_menu_item_xfn', ''),
(287, 68, '_menu_item_url', ''),
(288, 68, '_menu_item_orphaned', '1424181828'),
(289, 69, '_menu_item_type', 'post_type'),
(290, 69, '_menu_item_menu_item_parent', '0'),
(291, 69, '_menu_item_object_id', '32'),
(292, 69, '_menu_item_object', 'page'),
(293, 69, '_menu_item_target', ''),
(294, 69, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(295, 69, '_menu_item_xfn', ''),
(296, 69, '_menu_item_url', ''),
(297, 69, '_menu_item_orphaned', '1424181828'),
(298, 70, '_menu_item_type', 'post_type'),
(299, 70, '_menu_item_menu_item_parent', '0'),
(300, 70, '_menu_item_object_id', '13'),
(301, 70, '_menu_item_object', 'page'),
(302, 70, '_menu_item_target', ''),
(303, 70, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(304, 70, '_menu_item_xfn', ''),
(305, 70, '_menu_item_url', ''),
(306, 70, '_menu_item_orphaned', '1424181829'),
(307, 71, '_menu_item_type', 'post_type'),
(308, 71, '_menu_item_menu_item_parent', '0'),
(309, 71, '_menu_item_object_id', '23'),
(310, 71, '_menu_item_object', 'page'),
(311, 71, '_menu_item_target', ''),
(312, 71, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(313, 71, '_menu_item_xfn', ''),
(314, 71, '_menu_item_url', ''),
(315, 71, '_menu_item_orphaned', '1424181830'),
(316, 72, '_menu_item_type', 'post_type'),
(317, 72, '_menu_item_menu_item_parent', '0'),
(318, 72, '_menu_item_object_id', '29'),
(319, 72, '_menu_item_object', 'page'),
(320, 72, '_menu_item_target', ''),
(321, 72, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(322, 72, '_menu_item_xfn', ''),
(323, 72, '_menu_item_url', ''),
(324, 72, '_menu_item_orphaned', '1424181831'),
(325, 73, '_menu_item_type', 'post_type'),
(326, 73, '_menu_item_menu_item_parent', '0'),
(327, 73, '_menu_item_object_id', '21'),
(328, 73, '_menu_item_object', 'page'),
(329, 73, '_menu_item_target', ''),
(330, 73, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(331, 73, '_menu_item_xfn', ''),
(332, 73, '_menu_item_url', ''),
(333, 73, '_menu_item_orphaned', '1424181832'),
(334, 74, '_menu_item_type', 'post_type'),
(335, 74, '_menu_item_menu_item_parent', '0'),
(336, 74, '_menu_item_object_id', '27'),
(337, 74, '_menu_item_object', 'page'),
(338, 74, '_menu_item_target', ''),
(339, 74, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(340, 74, '_menu_item_xfn', ''),
(341, 74, '_menu_item_url', ''),
(342, 74, '_menu_item_orphaned', '1424181833'),
(343, 75, '_menu_item_type', 'post_type'),
(344, 75, '_menu_item_menu_item_parent', '0'),
(345, 75, '_menu_item_object_id', '25'),
(346, 75, '_menu_item_object', 'page'),
(347, 75, '_menu_item_target', ''),
(348, 75, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(349, 75, '_menu_item_xfn', ''),
(350, 75, '_menu_item_url', ''),
(351, 75, '_menu_item_orphaned', '1424181834'),
(352, 76, '_menu_item_type', 'post_type'),
(353, 76, '_menu_item_menu_item_parent', '0'),
(354, 76, '_menu_item_object_id', '19'),
(355, 76, '_menu_item_object', 'page'),
(356, 76, '_menu_item_target', ''),
(357, 76, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(358, 76, '_menu_item_xfn', ''),
(359, 76, '_menu_item_url', ''),
(360, 76, '_menu_item_orphaned', '1424181836'),
(365, 78, '_wp_attached_file', '2015/02/bem-ftif1.png'),
(366, 78, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1177;s:6:"height";i:800;s:4:"file";s:21:"2015/02/bem-ftif1.png";s:5:"sizes";a:5:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"bem-ftif1-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:21:"bem-ftif1-300x204.png";s:5:"width";i:300;s:6:"height";i:204;s:9:"mime-type";s:9:"image/png";}s:5:"large";a:4:{s:4:"file";s:22:"bem-ftif1-1024x696.png";s:5:"width";i:1024;s:6:"height";i:696;s:9:"mime-type";s:9:"image/png";}s:16:"index-categories";a:4:{s:4:"file";s:21:"bem-ftif1-200x150.png";s:5:"width";i:200;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:11:"page-single";a:4:{s:4:"file";s:21:"bem-ftif1-600x600.png";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(367, 79, '_wp_attached_file', '2015/02/Logo-HMSI.jpg'),
(368, 79, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1000;s:6:"height";i:789;s:4:"file";s:21:"2015/02/Logo-HMSI.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"Logo-HMSI-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:21:"Logo-HMSI-300x237.jpg";s:5:"width";i:300;s:6:"height";i:237;s:9:"mime-type";s:10:"image/jpeg";}s:16:"index-categories";a:4:{s:4:"file";s:21:"Logo-HMSI-200x150.jpg";s:5:"width";i:200;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:11:"page-single";a:4:{s:4:"file";s:21:"Logo-HMSI-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:1;}}'),
(369, 80, '_wp_attached_file', '2015/02/Logo-HMTC.jpg'),
(370, 80, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:203;s:6:"height";i:248;s:4:"file";s:21:"2015/02/Logo-HMTC.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"Logo-HMTC-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:16:"index-categories";a:4:{s:4:"file";s:21:"Logo-HMTC-200x150.jpg";s:5:"width";i:200;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(371, 81, '_wp_attached_file', '2015/02/Logo-IM-BEM-FTIF.jpg'),
(372, 81, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:640;s:6:"height";i:414;s:4:"file";s:28:"2015/02/Logo-IM-BEM-FTIF.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:28:"Logo-IM-BEM-FTIF-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:28:"Logo-IM-BEM-FTIF-300x194.jpg";s:5:"width";i:300;s:6:"height";i:194;s:9:"mime-type";s:10:"image/jpeg";}s:16:"index-categories";a:4:{s:4:"file";s:28:"Logo-IM-BEM-FTIF-200x150.jpg";s:5:"width";i:200;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:11:"page-single";a:4:{s:4:"file";s:28:"Logo-IM-BEM-FTIF-600x414.jpg";s:5:"width";i:600;s:6:"height";i:414;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(373, 82, '_easingslider_slides', 'a:4:{i:0;O:8:"stdClass":10:{s:4:"type";s:5:"image";s:13:"attachment_id";i:78;s:3:"alt";s:0:"";s:11:"aspectRatio";N;s:4:"link";s:4:"none";s:7:"linkUrl";s:0:"";s:15:"linkTargetBlank";b:0;s:5:"title";s:0:"";s:3:"url";N;s:2:"id";i:1;}i:1;O:8:"stdClass":10:{s:4:"type";s:5:"image";s:13:"attachment_id";i:79;s:3:"alt";s:0:"";s:11:"aspectRatio";N;s:4:"link";s:4:"none";s:7:"linkUrl";s:0:"";s:15:"linkTargetBlank";b:0;s:5:"title";s:0:"";s:3:"url";N;s:2:"id";i:2;}i:2;O:8:"stdClass":10:{s:4:"type";s:5:"image";s:13:"attachment_id";i:80;s:3:"alt";s:0:"";s:11:"aspectRatio";N;s:4:"link";s:4:"none";s:7:"linkUrl";s:0:"";s:15:"linkTargetBlank";b:0;s:5:"title";s:0:"";s:3:"url";N;s:2:"id";i:3;}i:3;O:8:"stdClass":10:{s:4:"type";s:5:"image";s:13:"attachment_id";i:81;s:3:"alt";s:0:"";s:11:"aspectRatio";N;s:4:"link";s:4:"none";s:7:"linkUrl";s:0:"";s:15:"linkTargetBlank";b:0;s:5:"title";s:0:"";s:3:"url";N;s:2:"id";i:4;}}'),
(374, 82, '_easingslider_general', 'O:8:"stdClass":1:{s:9:"randomize";b:0;}'),
(375, 82, '_easingslider_dimensions', 'O:8:"stdClass":3:{s:5:"width";i:640;s:6:"height";i:400;s:10:"responsive";b:1;}'),
(376, 82, '_easingslider_transitions', 'O:8:"stdClass":2:{s:6:"effect";s:4:"fade";s:8:"duration";i:400;}'),
(377, 82, '_easingslider_navigation', 'O:8:"stdClass":7:{s:6:"arrows";b:1;s:12:"arrows_hover";b:0;s:15:"arrows_position";s:6:"inside";s:10:"pagination";b:1;s:16:"pagination_hover";b:0;s:19:"pagination_position";s:6:"inside";s:19:"pagination_location";s:13:"bottom-center";}'),
(378, 82, '_easingslider_playback', 'O:8:"stdClass":2:{s:7:"enabled";b:1;s:5:"pause";i:4000;}'),
(379, 82, '_easingslider_customizations', 'O:8:"stdClass":4:{s:6:"arrows";O:8:"stdClass":4:{s:4:"next";s:85:"http://localhost/wordpress/wp-content/plugins/easing-slider/images/nav-arrow-next.png";s:4:"prev";s:85:"http://localhost/wordpress/wp-content/plugins/easing-slider/images/nav-arrow-prev.png";s:5:"width";i:30;s:6:"height";i:30;}s:10:"pagination";O:8:"stdClass":4:{s:8:"inactive";s:88:"http://localhost/wordpress/wp-content/plugins/easing-slider/images/nav-icon-inactive.png";s:6:"active";s:86:"http://localhost/wordpress/wp-content/plugins/easing-slider/images/nav-icon-active.png";s:5:"width";i:15;s:6:"height";i:15;}s:6:"border";O:8:"stdClass":3:{s:5:"color";s:7:"#000000";s:5:"width";i:0;s:6:"radius";i:0;}s:6:"shadow";O:8:"stdClass":2:{s:7:"enabled";b:0;s:5:"image";s:77:"http://localhost/wordpress/wp-content/plugins/easing-slider/images/shadow.png";}}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--
-- Creation: Feb 17, 2015 at 12:28 PM
--

DROP TABLE IF EXISTS `wp_posts`;
CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `wp_posts`:
--

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(2, 1, '2015-02-17 12:28:23', '2015-02-17 12:28:23', 'This is an example page. It''s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I''m a bike messenger by day, aspiring actor by night, and this is my blog. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin'' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href="http://localhost/wordpress/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'About Us', '', 'publish', 'open', 'closed', '', 'about-us', '', '', '2015-02-17 13:30:51', '2015-02-17 13:30:51', '', 0, 'http://localhost/wordpress/?page_id=2', 0, 'page', '', 0),
(3, 1, '2015-02-17 12:30:00', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-02-17 12:30:00', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?p=3', 0, 'post', '', 0),
(4, 1, '2015-02-17 13:30:51', '2015-02-17 13:30:51', 'This is an example page. It''s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I''m a bike messenger by day, aspiring actor by night, and this is my blog. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin'' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href="http://localhost/wordpress/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'About Us', '', 'inherit', 'open', 'open', '', '2-revision-v1', '', '', '2015-02-17 13:30:51', '2015-02-17 13:30:51', '', 2, 'http://localhost/wordpress/?p=4', 0, 'revision', '', 0),
(5, 1, '2015-02-17 13:31:53', '2015-02-17 13:31:53', '<p style="text-align: center;">Sejarah BEM FTIf ITS</p>\r\n<p style="text-align: left;">\r\nBEM FTIf singkatan dari Badan Eksekutif Mahasiswa Fakultas Teknologi Informasi. Didirikan pada tanggal 25 Agustus 2009 di Gedung Fakultas Teknologi Informasi Ruang TC 301. Dengan kepemimpinan:\r\nPresiden BEM FTIf 2009/2010 = Mas Novan (SI 2007)\r\nPresiden BEM FTIf 2010/2011 = Mas Faris (TC 2008)\r\nPresiden BEM FTIf 2011/2012 = Mas Aldy (SI 2009)\r\nKetua BEM FTIf 2012/2013 = Mas Feb (TC 2010)\r\nKetua BEM FTIf 2013/2014 = Mas Ade (TC 2011)\r\nKetua BEM FTIf 2014/2015 = Mas Riko (TC 2012)\r\nTujuan BEM FTIf dikaitkan dengan cita-cita fakultas dan MUBES IV\r\n1. BEM FTIf sebagai badan yang melaksanakan fungsi eksekutif di tingkat fakultas\r\n2. BEM FTIf sebagai wadah komunikasi antar mahasiswa FTIf\r\n3. BEM FTIf mengembangkan aspek keilmiahan di FTIf untuk mengabdi kepada masyarakat\r\n4. BEM FTIf melaksanakan amanah KDKM ITS terkait sosial masyarakat dari mahasiswa FTIf yang bersifat instruktif koordinatif\r\nMakna Lambang BEM FTIf\r\n\r\n1. Roda gerigi melambangkan kerja keras dan dinamisasi KM ITS yang termaktub dalam KDKM ITS.\r\n2. Tipografi FTIf melambangkan jurusan di Fakultas Teknologi Informasi yang memiliki independensi diri namun saling melengkapi satu sama lain.\r\n3. Warna abu-abu melambangkan warna dari Fakultas Teknologi Informasi.\r\n4. Warna hitam melambangkan warna dari HMJ di Jurusan Sistem Informasi.\r\n5. Warna biru melambangkan warna dari HMJ di JurusanTeknik Informatika.\r\n6. Tulisan “BEM” dan “Fakultas Teknologi Informasi” sebagai identitas.\r\n7. Warna biru pada tulisan “BEM” dan “Fakultas Teknologi Informasi” melambangkan warna dari KM ITS yang bermakna integralistik.\r\nDepartemen</p>', 'Sejarah BEM FTIf', '', 'publish', 'open', 'open', '', 'sejarah-bem-ftif', '', '', '2015-02-18 21:33:39', '2015-02-18 14:33:39', '', 2, 'http://localhost/wordpress/?page_id=5', 0, 'page', '', 0),
(6, 1, '2015-02-17 13:31:53', '2015-02-17 13:31:53', '', 'Sejarah BEM FTIf', '', 'inherit', 'open', 'open', '', '5-revision-v1', '', '', '2015-02-17 13:31:53', '2015-02-17 13:31:53', '', 5, 'http://localhost/wordpress/?p=6', 0, 'revision', '', 0),
(7, 1, '2015-02-17 13:32:18', '2015-02-17 13:32:18', 'VISI\r\nTerwujudnya FTIf Sinergi dengan semangat kebermanfaatan dan berdaya saing tinggi untuk ITS dan bangsa\r\n\r\nMISI\r\n1. Mewujudkan rasa kekeluargan antar elemen FTIf\r\n2. Menumbuhkan rasa peka dan peduli terhadap lingkungan FTIf dan masyarakat\r\n3. Mengingkatkan daya saing mahasiswa FTIf untuk menghadapi tantangan zaman\r\n4. Menumbuhkan semnagat berkreasi dan berkontribusi untuk kebermanfaatan', 'Visi Misi', '', 'publish', 'open', 'open', '', 'visi-misi', '', '', '2015-02-18 21:39:43', '2015-02-18 14:39:43', '', 2, 'http://localhost/wordpress/?page_id=7', 0, 'page', '', 0),
(8, 1, '2015-02-17 13:32:18', '2015-02-17 13:32:18', '', 'Visi Misi', '', 'inherit', 'open', 'open', '', '7-revision-v1', '', '', '2015-02-17 13:32:18', '2015-02-17 13:32:18', '', 7, 'http://localhost/wordpress/?p=8', 0, 'revision', '', 0),
(9, 1, '2015-02-17 13:33:23', '2015-02-17 13:33:23', '', 'News', '', 'publish', 'open', 'open', '', 'news', '', '', '2015-02-17 13:33:23', '2015-02-17 13:33:23', '', 0, 'http://localhost/wordpress/?page_id=9', 0, 'page', '', 0),
(10, 1, '2015-02-17 13:33:23', '2015-02-17 13:33:23', '', 'News', '', 'inherit', 'open', 'open', '', '9-revision-v1', '', '', '2015-02-17 13:33:23', '2015-02-17 13:33:23', '', 9, 'http://localhost/wordpress/?p=10', 0, 'revision', '', 0),
(11, 1, '2015-02-17 13:34:08', '2015-02-17 13:34:08', '', 'Profile', '', 'publish', 'open', 'open', '', 'profile-departemen', '', '', '2015-02-17 13:37:33', '2015-02-17 13:37:33', '', 0, 'http://localhost/wordpress/?page_id=11', 0, 'page', '', 0),
(12, 1, '2015-02-17 13:34:08', '2015-02-17 13:34:08', '', 'Profile Departemen', '', 'inherit', 'open', 'open', '', '11-revision-v1', '', '', '2015-02-17 13:34:08', '2015-02-17 13:34:08', '', 11, 'http://localhost/wordpress/?p=12', 0, 'revision', '', 0),
(13, 1, '2015-02-17 13:35:20', '2015-02-17 13:35:20', '', 'Departemen', '', 'publish', 'open', 'open', '', 'srd', '', '', '2015-02-17 13:37:57', '2015-02-17 13:37:57', '', 11, 'http://localhost/wordpress/?page_id=13', 0, 'page', '', 0),
(14, 1, '2015-02-17 13:35:20', '2015-02-17 13:35:20', '', 'SRD', '', 'inherit', 'open', 'open', '', '13-revision-v1', '', '', '2015-02-17 13:35:20', '2015-02-17 13:35:20', '', 13, 'http://localhost/wordpress/?p=14', 0, 'revision', '', 0),
(15, 1, '2015-02-17 13:37:33', '2015-02-17 13:37:33', '', 'Profile', '', 'inherit', 'open', 'open', '', '11-revision-v1', '', '', '2015-02-17 13:37:33', '2015-02-17 13:37:33', '', 11, 'http://localhost/wordpress/?p=15', 0, 'revision', '', 0),
(16, 1, '2015-02-17 13:37:57', '2015-02-17 13:37:57', '', 'Departemen', '', 'inherit', 'open', 'open', '', '13-revision-v1', '', '', '2015-02-17 13:37:57', '2015-02-17 13:37:57', '', 13, 'http://localhost/wordpress/?p=16', 0, 'revision', '', 0),
(17, 1, '2015-02-17 13:38:09', '2015-02-17 13:38:09', '', 'Biro', '', 'publish', 'open', 'open', '', 'biro', '', '', '2015-02-17 13:38:09', '2015-02-17 13:38:09', '', 11, 'http://localhost/wordpress/?page_id=17', 0, 'page', '', 0),
(18, 1, '2015-02-17 13:38:09', '2015-02-17 13:38:09', '', 'Biro', '', 'inherit', 'open', 'open', '', '17-revision-v1', '', '', '2015-02-17 13:38:09', '2015-02-17 13:38:09', '', 17, 'http://localhost/wordpress/?p=18', 0, 'revision', '', 0),
(19, 1, '2015-02-17 13:38:32', '2015-02-17 13:38:32', '<ol>\r\n	<li><em>Student Resources Developments (SRD)</em> atau PSDM.</li>\r\n</ol>\r\nMerupakan departemen yang fokus pada pengembangan mahasiswa. Program kerja / agenda yang dilaksanakan oleh Departemen SRD adalah:\r\n<ul>\r\n	<li>LKMM Pra-TD</li>\r\n</ul>\r\nLatihan Ketrampilan Manajemen Mahasiswa Tingkat Pra Dasar yang mencakup materi manajemen diri\r\n<ul>\r\n	<li>LKMM TM</li>\r\n</ul>\r\nLatihan Ketrampilan Manajemen Mahasiswa Tingkat Menengah yang mencakup materi manajemen organisasi\r\n<ul>\r\n	<li>PP LKMM</li>\r\n</ul>\r\nPelatihan Pemandu LKMM, pelatihan untuk pembentukan/regenerasi pemandu LKMM selanjutnya.\r\n<ul>\r\n	<li>Welcome Party Mahasiswa Baru FTIf</li>\r\n</ul>\r\nPenyambutan mahasiswa baru FTIf\r\n<ul>\r\n	<li>FTIf Journey</li>\r\n</ul>\r\nKaderisasi tingkat fakultas yang bertujuan untuk meningkatkan rasa kepemilikan mahasiswa khususnya mahasiswa baru\r\n<ul>\r\n	<li>Upgrading Staff</li>\r\n</ul>\r\nInternalisasi dari staff-staff BEM FTIf\r\n<ul>\r\n	<li>Training for Leaders (TFL)</li>\r\n</ul>\r\nPelatihan untuk staff BEM FTIf yang mau dan mampu untuk melanjutkan kepengurusan\r\n<ul>\r\n	<li>Forum PSDM</li>\r\n</ul>\r\nMempertemukan PSDM dari jurusan-jurusan untuk melakukan koordinasi dan kontroling terkait pengembangan mahasiswa\r\n<ul>\r\n	<li>Forum SC</li>\r\n</ul>\r\nMempertemukan perwakilan SC dari jurusan-jurusan untuk mengonsep dan mengontrol kaderisasi tingkat fakultas (FTIf Journey)\r\n\r\nArti logo departemen <em>(opsional)</em>\r\n<ul>\r\n	<li>Warna biru pada orang melingkar pada logo melambangkan jurusan Teknik Informatika</li>\r\n	<li>Warna hitam pada orang melingkar pada logo melambangkan jurusan Sistem Informasi</li>\r\n	<li>Warna abu abu pada tulisan BEM FTIf – ITS melambangkan fakultas teknologi informasi</li>\r\n	<li>Lingkaran yang ada pada logo melambangkan kesolidan</li>\r\n	<li>Selang – seling antara orang melingkar biru dan hitam melambangakan kerukunan dan juga kebersamaan keluarga BEM FTIf – ITS yang akan ditimbulkan melalui proses kaderisasi fakultas oleh SRD BEM FTIf – ITS</li>\r\n	<li>Kedekatan antara orang-orang yang melingkari logo melambangkan kepaduan yang akan dibentuk antara kedua jurusan sebagai tujuan dar SRD BEM FTIf – ITS</li>\r\n</ul>\r\nTangan ke atas yang dilakukan setiap orang dalam lingkaran logo melambangkan sebagai visi dari departemen SRD BEM FTIf – ITS yaitu keinginan untuk mengembangkan bentuk-bentuk potensi sumber daya mahasiswa yang ada guna', 'Student Resources Developments', '', 'publish', 'open', 'closed', '', 'student-resources-development', '', '', '2015-02-18 21:48:07', '2015-02-18 14:48:07', '', 13, 'http://localhost/wordpress/?page_id=19', 0, 'page', '', 0),
(20, 1, '2015-02-17 13:38:32', '2015-02-17 13:38:32', '', 'Student Resources Development', '', 'inherit', 'open', 'open', '', '19-revision-v1', '', '', '2015-02-17 13:38:32', '2015-02-17 13:38:32', '', 19, 'http://localhost/wordpress/?p=20', 0, 'revision', '', 0),
(21, 1, '2015-02-17 13:38:58', '2015-02-17 13:38:58', '<em>Internal Affairs (IA) </em>atau DAGRI.\r\n\r\nMerupakan departemen yang fokus pada internal secara keseluruhan Mahasiswa FTIf. Program kerja / agenda yang dilaksanakan oleh Departemen IA adalah:\r\n<ul>\r\n	<li>FTIf FUN (tahun sebelumnya FTIf Festival)</li>\r\n</ul>\r\nSerankaian game-game yang mempererat FTIf\r\n<ul>\r\n	<li>Forum Dagri</li>\r\n</ul>\r\nMempertemukan Dagri dari kedua jurusan untuk bahasan tertentu\r\n<ul>\r\n	<li>Forum Kabinet</li>\r\n	<li>Devile (Dies Natalis)</li>\r\n</ul>\r\nMengorganisir arak-arakan saat pembukaan Dies Natalis\r\n<ul>\r\n	<li>Kantin Sekre</li>\r\n</ul>\r\nPengadaan kantin berupa ATK untuk keperluan mahasiswa FTIf\r\n<ul>\r\n	<li>Temu warga FTIf</li>\r\n</ul>\r\nMempertemukan seluruh warga fakultas dalam bahasan tertentu (jaring aspirasi)\r\n<ul>\r\n	<li>Jaket BEM F</li>\r\n</ul>\r\nPengadaan Jaket BEM F untuk atribut organisasi dan keperluan dana\r\n<ul>\r\n	<li>Malam Inagurasi</li>\r\n</ul>\r\nArti logo departemen <em>(opsional)</em>\r\n<ul>\r\n	<li>Warna biru menandakan jurusan Teknik Informatika. Warna hitam menandakan jurusan Sistem Informasi</li>\r\n	<li>Relationship menandakan penguatan internalisasi yang merujuk pada penanaman nilai kesolidan dan sinergitas FTIf</li>\r\n	<li>Refleksi bayangan tengah gambar menunjukkan seperti kubah rumah yaitu tujuan departemen IA yang seperti rumah mengayomi dan melindungi internal FTIf</li>\r\n	<li>Bayangan Toga mengartikan kesejahteraan mahasiswa FTIf dimana Departemen IA yang juga memiliki fungsi sebagai koordinatif dalam hal akademik di 2 jurusan</li>\r\n	<li>Segi enam mengartikan 6 teori manajemen yang memfokuskan pada kewirausahaan dan kemandirian yang diusung BEM FTIf tahun ini.</li>\r\n	<li>Keseluruhan Gambar menyimpulkan 3 nilai visi departemen yang diusung IA yaitu terwujudnya harmonisasi, kekeluargaan dan sinergitas di dalam internalisasi FTIf</li>\r\n	<li>Tulisan Internal Affairs dan BEM FTIf – ITS merupakan identitas departemen IA</li>\r\n</ul>', 'Internal Affairs', '', 'publish', 'open', 'open', '', 'internal-affairs', '', '', '2015-02-18 21:50:19', '2015-02-18 14:50:19', '', 13, 'http://localhost/wordpress/?page_id=21', 0, 'page', '', 0),
(22, 1, '2015-02-17 13:38:58', '2015-02-17 13:38:58', '', 'Internal Affairs', '', 'inherit', 'open', 'open', '', '21-revision-v1', '', '', '2015-02-17 13:38:58', '2015-02-17 13:38:58', '', 21, 'http://localhost/wordpress/?p=22', 0, 'revision', '', 0),
(23, 1, '2015-02-17 13:39:10', '2015-02-17 13:39:10', '<ol>\r\n	<li>\r\n<ol>\r\n	<li><em>External Affairs (EA) </em>atau HUBLU.</li>\r\n</ol>\r\nMerupakan departemen yang fokus pada hubungan ke luar BEM FTIf. Program kerja / agenda yang dilaksanakan oleh Departemen EA adalah:\r\n<ul>\r\n	<li><em>Benchmarking</em></li>\r\n</ul>\r\nDimana BEM Ftif melakukan kunjungan ke ormawa lain (baik dalam ITS maupun luar ITS) guna melakukan pembelajaran untuk pengembangn organisasi lebih baik\r\n<ul>\r\n	<li><em>Open House</em></li>\r\n</ul>\r\nDimana  BEM FTIf menerima kunjungan dari ormawa yang ingin berkunjung ke BEM FTIf\r\n<ul>\r\n	<li>Seminar AEC</li>\r\n</ul>\r\nTerkait dengan persiapan mahasiswa FTIf dalam menghadapi AEC\r\n<ul>\r\n	<li><em>Teleconference</em></li>\r\n</ul>\r\n<em>Benchmarking </em>dengan ormawa dari luar negri\r\n<ul>\r\n	<li>PRT</li>\r\n</ul>\r\nPelatihan <em>public speaking</em> untuk mahasiswa FTIf\r\n<ul>\r\n	<li><em>Public Circle</em></li>\r\n</ul>\r\nKajian terhadap berita/isu yang sedang hangat diperbincangkan\r\n\r\nArti logo departemen <em>(opsional)</em>\r\n<ul>\r\n	<li>Warna biru pada sayap kiri garuda melambangkan jurusan Teknik Informatika</li>\r\n	<li>Warna hitam pada sayap kanan garuda melambangkan jurusan Sistem Informasi</li>\r\n	<li>Warna abu abu pada kepala garuda melambangkan fakultas teknologi informasi</li>\r\n	<li>Gerigi melambangkan keteknikan</li>\r\n	<li>Bola Dunia melambangkan beberapa hal, yaitu : Keilmuan dalam fakultas teknologi informasi yang mendukung globalisasi Dunia pada umumnya</li>\r\n	<li>Bola dunia yang terikat oleh kait biru di dalam gerigi melambangkan kami siap mengabdi untuk membantu menyelesaikan masalah bangsa dan dunia melalui keilmuan kami.</li>\r\n	<li>Gambar secara keseluruhan yang berupa burung garuda yang indah sedang mengepakkan sayap adalah sesuai visi departemen yaitu terciptanya citra positif Bem FTIf melalui perluasan jaringan nasional.</li>\r\n</ul>\r\n</li>\r\n</ol>', 'External Affairs', '', 'publish', 'open', 'open', '', 'external-affairs', '', '', '2015-02-18 21:49:53', '2015-02-18 14:49:53', '', 13, 'http://localhost/wordpress/?page_id=23', 0, 'page', '', 0),
(24, 1, '2015-02-17 13:39:10', '2015-02-17 13:39:10', '', 'External Affairs', '', 'inherit', 'open', 'open', '', '23-revision-v1', '', '', '2015-02-17 13:39:10', '2015-02-17 13:39:10', '', 23, 'http://localhost/wordpress/?p=24', 0, 'revision', '', 0),
(25, 1, '2015-02-17 13:39:57', '2015-02-17 13:39:57', '<ol>\r\n	<li><em>Research and Technology Developments (RTD) </em>atau RISTEK.</li>\r\n</ol>\r\nMerupakan departemen yang fokus pada pengembangan teknologi dalam ruang lingkup FTIf. Program kerja / agenda yang dilaksanakan oleh Departemen IA adalah:\r\n<ul>\r\n	<li>FOIL (forum keilmiahan)</li>\r\n</ul>\r\nDiskusi terkait keilmiahan\r\n<ul>\r\n	<li>PKPK (Pelatihan Kakak Pendamping Keilmiahan)</li>\r\n</ul>\r\nPelatihan untuk pembentukan/regenerasi kakak pendamping keilmiahan\r\n<ul>\r\n	<li>KKTI (Kompetisi Karya Tulis Ilmiah)</li>\r\n</ul>\r\nKompetisi KTI untuk mahasiswa FTIf\r\n<ul>\r\n	<li>E-Voting</li>\r\n</ul>\r\nMengkampanyekan e-voting terhadap pemilihan-pemilihan yang terjadi di KM ITS\r\n<ul>\r\n	<li>Gemastik</li>\r\n</ul>\r\nFasilitator terhadap peserta-peserta Gemastik\r\n\r\nArti logo departemen <em>(opsional)</em>\r\n<ul>\r\n	<li>garis-garis kaku menggambarkan kerja keras</li>\r\n	<li>garis yang menghubungkan antara titik hitam melambangkan bahwa department RISTEK ini sebagai penghubung antara department ristek HMTC dan HMSI</li>\r\n	<li>gambar kotak melambangkan bahwa basis dari ristek itu adalah computer</li>\r\n	<li>bentuk R menggambarkan nama dari department ini yaitu RISTEK</li>\r\n	<li>Warna yangmelinkupi logo menandahkan bahwa Ristek ini bagian dari FTIf</li>\r\n</ul>', 'Research and Technology Department', '', 'publish', 'open', 'open', '', 'research-and-technology-department', '', '', '2015-02-18 21:48:35', '2015-02-18 14:48:35', '', 13, 'http://localhost/wordpress/?page_id=25', 0, 'page', '', 0),
(26, 1, '2015-02-17 13:39:57', '2015-02-17 13:39:57', '', 'Research and Technology Department', '', 'inherit', 'open', 'open', '', '25-revision-v1', '', '', '2015-02-17 13:39:57', '2015-02-17 13:39:57', '', 25, 'http://localhost/wordpress/?p=26', 0, 'revision', '', 0),
(27, 1, '2015-02-17 13:41:18', '2015-02-17 13:41:18', '<ol>\r\n	<li><em>Organization Social Responsibility (OSR) </em>atau SOSMAS.</li>\r\n</ol>\r\nMerupakan departemen yang fokus pada pengabdian masyarakat. Program kerja / agenda yang dilaksanakan oleh Departemen OSR adalah:\r\n<ul>\r\n	<li><em>SRW (Social Responsibility Week)</em></li>\r\n</ul>\r\nMinggu sosmas, dimana terdapat mading dan <em>Social Point</em> yang akan mengenalkan sosial masyarakat.\r\n<ul>\r\n	<li><em>FUSION (FTIf Unity in Socialaction)</em></li>\r\n</ul>\r\nRangkaian acara yang mencakup pengembangan masyarakat kampung binaan (di Tempurejo) dan sekitarnya\r\n<ul>\r\n	<li><em>FTIf Berkurban</em></li>\r\n</ul>\r\nAgenda terkait perayaan Idul Adha\r\n<ul>\r\n	<li><em>OSR Forum</em></li>\r\n</ul>\r\nMempertemukan departemen sosmas dari jurusan-jurusan\r\n<ul>\r\n	<li><em>FAST (insidental)</em></li>\r\n</ul>\r\nAgenda terkait insiden/bencana yang terjadi baik di Surabaya maupun di Indonesia\r\n<ul>\r\n	<li><em>Smaller Bigger</em></li>\r\n</ul>\r\nPembekalan IT terhadap UKM-UKM yang nantinya diharapkan dapat mengembangkan UKM tersebut\r\n\r\nArti logo departemen <em>(opsional)</em>\r\n<ul>\r\n	<li>Warna biru melambangkan TC ,warnahitam melambangkan SI danwarnaabu-abu melambangkan FTIf.</li>\r\n	<li>Bentuk hati yang merupakan simbol ketulusan dalam mengabdi.</li>\r\n	<li>Orang bergandengan mengartikan bahwa TC dan SI bersama-sama dalam memberikan pelayanan kepada masyarakat.</li>\r\n</ul>', 'Organization Social Responsibility', '', 'publish', 'open', 'open', '', 'organization-social-responsibility', '', '', '2015-02-18 21:50:21', '2015-02-18 14:50:21', '', 13, 'http://localhost/wordpress/?page_id=27', 0, 'page', '', 0),
(28, 1, '2015-02-17 13:41:18', '2015-02-17 13:41:18', '', 'Organization Social Responsibility', '', 'inherit', 'open', 'open', '', '27-revision-v1', '', '', '2015-02-17 13:41:18', '2015-02-17 13:41:18', '', 27, 'http://localhost/wordpress/?p=28', 0, 'revision', '', 0),
(29, 1, '2015-02-17 13:41:30', '2015-02-17 13:41:30', '<ol>\r\n	<li><em>Information Media (IM) </em>atau MEDFO.</li>\r\n</ol>\r\nMerupakan departemen yang fokus pada komunikasi dan informasi terkait BEM FTIf. Program kerja / agenda yang dilaksanakan oleh Departemen IM adalah:\r\n<ul>\r\n	<li>PJTL (Pelatihan Jurnalistik Tingkat Lanjut)</li>\r\n</ul>\r\nPelatihan jurnalistik yang merupakan kelanjutan dari PJTD yang dilaksanakan oleh jurusan\r\n<ul>\r\n	<li>Formed</li>\r\n</ul>\r\nMempertemukan departemen medfo (media informasi) dari kedua jurusan yang diadakan setiap bulan\r\n<ul>\r\n	<li>Liputan</li>\r\n	<li>Buletin (RELOAD)</li>\r\n	<li>Majalah (PSEUDOCODE)</li>\r\n	<li>Media Sosial</li>\r\n	<li>Mading</li>\r\n</ul>\r\nArti logo departemen <em>(opsional)</em>\r\n<ul>\r\n	<li>Warna: Biru melambangkan TC. Hitam melambangkan SI. Abu-abu melambangkan BEM FTIf</li>\r\n	<li>Sinyal dengan warna biru, hitam, dan abu-abu melambangkan informasi yang berkaitan tentang TC, SI, dan BEM FTIf</li>\r\n	<li>Orang yang memncarkan sinyal melambangkan bahwa IM akan memancarkan dan menyalurkan semua informasi yang berkaitan dengan TC, SI, dan BEM FTIf baik di dalam maupun di luar ITS.</li>\r\n</ul>', 'Information Media', '', 'publish', 'open', 'open', '', 'information-media', '', '', '2015-02-18 21:50:18', '2015-02-18 14:50:18', '', 13, 'http://localhost/wordpress/?page_id=29', 0, 'page', '', 0),
(30, 1, '2015-02-17 13:41:30', '2015-02-17 13:41:30', '', 'Information Media', '', 'inherit', 'open', 'open', '', '29-revision-v1', '', '', '2015-02-17 13:41:30', '2015-02-17 13:41:30', '', 29, 'http://localhost/wordpress/?p=30', 0, 'revision', '', 0),
(31, 1, '2015-02-17 13:42:10', '2015-02-17 13:42:10', '', 'Student Resources Developments', '', 'inherit', 'open', 'open', '', '19-revision-v1', '', '', '2015-02-17 13:42:10', '2015-02-17 13:42:10', '', 19, 'http://localhost/wordpress/?p=31', 0, 'revision', '', 0),
(32, 1, '2015-02-17 13:42:53', '2015-02-17 13:42:53', '<ol>\r\n	<li><em>Bakor Pemandu FTIf.</em></li>\r\n</ol>\r\n<em> </em>\r\n\r\nMerupakan departemen yang fokus pada koordinasi pemandu FTIf. Program kerja / agenda yang dilaksanakan oleh Bakor Pemandu adalah:\r\n<ul>\r\n	<li>Upgrading Pemandu</li>\r\n</ul>\r\nPembekalan terhadap pemandu untuk menghadapi LKMM Pra TD dan TD di masing-masing jurusan\r\n<ul>\r\n	<li>Data Center Pemandu</li>\r\n</ul>\r\nMenjadi pusat data dan informasi terkait kepemanduan yang ada di FTIf\r\n<ul>\r\n	<li>Controling LKMM</li>\r\n</ul>\r\nControling untuk LKMM PraTD, TD di FTIf.\r\n\r\nArti logo departemen <em>(opsional)</em>\r\n<ul>\r\n	<li>Warna biru melambangkan HMTC, warna hitam melambangkan HMSI, dan warna abu-abu melambangkan FTIF</li>\r\n	<li>Dua orang saling berdekatan dengan tangan terbuka melambangkan kesatuan antar Pemandu dan Pemandu yang berpikiran terbuka</li>\r\n	<li>Atap melambangkan Bakor FTIF sebagai rumah bagi Pemandu FTIF</li>\r\n</ul>', 'Bakor Pemandu FTIf', '', 'publish', 'open', 'open', '', 'bakor-pemandu-ftif', '', '', '2015-02-18 21:51:50', '2015-02-18 14:51:50', '', 17, 'http://localhost/wordpress/?page_id=32', 0, 'page', '', 0),
(33, 1, '2015-02-17 13:42:53', '2015-02-17 13:42:53', '', 'Bakor Pemandu FTIf', '', 'inherit', 'open', 'open', '', '32-revision-v1', '', '', '2015-02-17 13:42:53', '2015-02-17 13:42:53', '', 32, 'http://localhost/wordpress/?p=33', 0, 'revision', '', 0),
(34, 1, '2015-02-17 13:43:25', '2015-02-17 13:43:25', '', 'Apps', '', 'publish', 'open', 'open', '', 'apps', '', '', '2015-02-17 13:43:25', '2015-02-17 13:43:25', '', 0, 'http://localhost/wordpress/?page_id=34', 0, 'page', '', 0),
(35, 1, '2015-02-17 13:43:25', '2015-02-17 13:43:25', '', 'Apps', '', 'inherit', 'open', 'open', '', '34-revision-v1', '', '', '2015-02-17 13:43:25', '2015-02-17 13:43:25', '', 34, 'http://localhost/wordpress/?p=35', 0, 'revision', '', 0),
(36, 1, '2015-02-17 13:43:45', '2015-02-17 13:43:45', '', 'Galeri Karya', '', 'publish', 'open', 'open', '', 'galeri-karya', '', '', '2015-02-17 13:43:45', '2015-02-17 13:43:45', '', 34, 'http://localhost/wordpress/?page_id=36', 0, 'page', '', 0),
(37, 1, '2015-02-17 13:43:45', '2015-02-17 13:43:45', '', 'Galeri Karya', '', 'inherit', 'open', 'open', '', '36-revision-v1', '', '', '2015-02-17 13:43:45', '2015-02-17 13:43:45', '', 36, 'http://localhost/wordpress/?p=37', 0, 'revision', '', 0),
(38, 1, '2015-02-17 13:45:28', '2015-02-17 13:45:28', '', 'Halaman Staff', '', 'publish', 'open', 'open', '', 'halaman-staff', '', '', '2015-02-17 13:45:28', '2015-02-17 13:45:28', '', 34, 'http://localhost/wordpress/?page_id=38', 0, 'page', '', 0),
(39, 1, '2015-02-17 13:45:28', '2015-02-17 13:45:28', '', 'Halaman Staff', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2015-02-17 13:45:28', '2015-02-17 13:45:28', '', 38, 'http://localhost/wordpress/?p=39', 0, 'revision', '', 0),
(40, 1, '2015-02-17 13:45:34', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-02-17 13:45:34', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?page_id=40', 0, 'page', '', 0),
(41, 1, '2015-02-17 13:56:29', '0000-00-00 00:00:00', '', 'Home', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 13:56:29', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?p=41', 1, 'nav_menu_item', '', 0),
(42, 1, '2015-02-17 13:56:29', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 13:56:29', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?p=42', 1, 'nav_menu_item', '', 0),
(43, 1, '2015-02-17 13:56:30', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 13:56:30', '0000-00-00 00:00:00', '', 2, 'http://localhost/wordpress/?p=43', 1, 'nav_menu_item', '', 0),
(44, 1, '2015-02-17 13:56:31', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 13:56:31', '0000-00-00 00:00:00', '', 2, 'http://localhost/wordpress/?p=44', 1, 'nav_menu_item', '', 0),
(45, 1, '2015-02-17 13:56:31', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 13:56:31', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?p=45', 1, 'nav_menu_item', '', 0),
(46, 1, '2015-02-17 13:56:32', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 13:56:32', '0000-00-00 00:00:00', '', 34, 'http://localhost/wordpress/?p=46', 1, 'nav_menu_item', '', 0),
(47, 1, '2015-02-17 13:56:32', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 13:56:32', '0000-00-00 00:00:00', '', 34, 'http://localhost/wordpress/?p=47', 1, 'nav_menu_item', '', 0),
(48, 1, '2015-02-17 13:56:33', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 13:56:33', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?p=48', 1, 'nav_menu_item', '', 0),
(49, 1, '2015-02-17 13:56:34', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 13:56:34', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?p=49', 1, 'nav_menu_item', '', 0),
(50, 1, '2015-02-17 13:56:35', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 13:56:35', '0000-00-00 00:00:00', '', 11, 'http://localhost/wordpress/?p=50', 1, 'nav_menu_item', '', 0),
(51, 1, '2015-02-17 13:56:36', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 13:56:36', '0000-00-00 00:00:00', '', 17, 'http://localhost/wordpress/?p=51', 1, 'nav_menu_item', '', 0),
(52, 1, '2015-02-17 13:56:36', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 13:56:36', '0000-00-00 00:00:00', '', 11, 'http://localhost/wordpress/?p=52', 1, 'nav_menu_item', '', 0),
(53, 1, '2015-02-17 13:56:37', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 13:56:37', '0000-00-00 00:00:00', '', 13, 'http://localhost/wordpress/?p=53', 1, 'nav_menu_item', '', 0),
(54, 1, '2015-02-17 13:56:37', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 13:56:37', '0000-00-00 00:00:00', '', 13, 'http://localhost/wordpress/?p=54', 1, 'nav_menu_item', '', 0),
(55, 1, '2015-02-17 13:56:38', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 13:56:38', '0000-00-00 00:00:00', '', 13, 'http://localhost/wordpress/?p=55', 1, 'nav_menu_item', '', 0),
(56, 1, '2015-02-17 13:56:39', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 13:56:39', '0000-00-00 00:00:00', '', 13, 'http://localhost/wordpress/?p=56', 1, 'nav_menu_item', '', 0),
(57, 1, '2015-02-17 13:56:40', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 13:56:40', '0000-00-00 00:00:00', '', 13, 'http://localhost/wordpress/?p=57', 1, 'nav_menu_item', '', 0),
(58, 1, '2015-02-17 13:56:41', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 13:56:41', '0000-00-00 00:00:00', '', 13, 'http://localhost/wordpress/?p=58', 1, 'nav_menu_item', '', 0),
(59, 1, '2015-02-17 14:03:40', '0000-00-00 00:00:00', '', 'Home', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 14:03:40', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?p=59', 1, 'nav_menu_item', '', 0),
(60, 1, '2015-02-17 14:03:43', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 14:03:43', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?p=60', 1, 'nav_menu_item', '', 0),
(61, 1, '2015-02-17 14:03:44', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 14:03:44', '0000-00-00 00:00:00', '', 2, 'http://localhost/wordpress/?p=61', 1, 'nav_menu_item', '', 0),
(62, 1, '2015-02-17 14:03:45', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 14:03:45', '0000-00-00 00:00:00', '', 2, 'http://localhost/wordpress/?p=62', 1, 'nav_menu_item', '', 0),
(63, 1, '2015-02-17 14:03:45', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 14:03:45', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?p=63', 1, 'nav_menu_item', '', 0),
(64, 1, '2015-02-17 14:03:46', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 14:03:46', '0000-00-00 00:00:00', '', 34, 'http://localhost/wordpress/?p=64', 1, 'nav_menu_item', '', 0),
(65, 1, '2015-02-17 14:03:46', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 14:03:46', '0000-00-00 00:00:00', '', 34, 'http://localhost/wordpress/?p=65', 1, 'nav_menu_item', '', 0),
(66, 1, '2015-02-17 14:03:47', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 14:03:47', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?p=66', 1, 'nav_menu_item', '', 0),
(67, 1, '2015-02-17 14:03:47', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 14:03:47', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?p=67', 1, 'nav_menu_item', '', 0),
(68, 1, '2015-02-17 14:03:47', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 14:03:47', '0000-00-00 00:00:00', '', 11, 'http://localhost/wordpress/?p=68', 1, 'nav_menu_item', '', 0),
(69, 1, '2015-02-17 14:03:48', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 14:03:48', '0000-00-00 00:00:00', '', 17, 'http://localhost/wordpress/?p=69', 1, 'nav_menu_item', '', 0),
(70, 1, '2015-02-17 14:03:48', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 14:03:48', '0000-00-00 00:00:00', '', 11, 'http://localhost/wordpress/?p=70', 1, 'nav_menu_item', '', 0),
(71, 1, '2015-02-17 14:03:49', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 14:03:49', '0000-00-00 00:00:00', '', 13, 'http://localhost/wordpress/?p=71', 1, 'nav_menu_item', '', 0),
(72, 1, '2015-02-17 14:03:50', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 14:03:50', '0000-00-00 00:00:00', '', 13, 'http://localhost/wordpress/?p=72', 1, 'nav_menu_item', '', 0),
(73, 1, '2015-02-17 14:03:51', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 14:03:51', '0000-00-00 00:00:00', '', 13, 'http://localhost/wordpress/?p=73', 1, 'nav_menu_item', '', 0),
(74, 1, '2015-02-17 14:03:52', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 14:03:52', '0000-00-00 00:00:00', '', 13, 'http://localhost/wordpress/?p=74', 1, 'nav_menu_item', '', 0),
(75, 1, '2015-02-17 14:03:53', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 14:03:53', '0000-00-00 00:00:00', '', 13, 'http://localhost/wordpress/?p=75', 1, 'nav_menu_item', '', 0),
(76, 1, '2015-02-17 14:03:54', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-02-17 14:03:54', '0000-00-00 00:00:00', '', 13, 'http://localhost/wordpress/?p=76', 1, 'nav_menu_item', '', 0),
(78, 1, '2015-02-17 22:09:48', '2015-02-17 15:09:48', '', 'bem-ftif', '', 'inherit', 'open', 'open', '', 'bem-ftif', '', '', '2015-02-17 22:09:48', '2015-02-17 15:09:48', '', 0, 'http://localhost/wordpress/wp-content/uploads/2015/02/bem-ftif1.png', 0, 'attachment', 'image/png', 0),
(79, 1, '2015-02-17 22:10:30', '2015-02-17 15:10:30', '', 'Logo HMSI', '', 'inherit', 'open', 'open', '', 'logo-hmsi', '', '', '2015-02-17 22:10:30', '2015-02-17 15:10:30', '', 0, 'http://localhost/wordpress/wp-content/uploads/2015/02/Logo-HMSI.jpg', 0, 'attachment', 'image/jpeg', 0),
(80, 1, '2015-02-17 22:10:31', '2015-02-17 15:10:31', '', 'Logo HMTC', '', 'inherit', 'open', 'open', '', 'logo-hmtc', '', '', '2015-02-17 22:10:31', '2015-02-17 15:10:31', '', 0, 'http://localhost/wordpress/wp-content/uploads/2015/02/Logo-HMTC.jpg', 0, 'attachment', 'image/jpeg', 0),
(81, 1, '2015-02-17 22:10:32', '2015-02-17 15:10:32', '', 'Logo IM BEM FTIF', '', 'inherit', 'open', 'open', '', 'logo-im-bem-ftif', '', '', '2015-02-17 22:10:32', '2015-02-17 15:10:32', '', 0, 'http://localhost/wordpress/wp-content/uploads/2015/02/Logo-IM-BEM-FTIF.jpg', 0, 'attachment', 'image/jpeg', 0),
(82, 1, '2015-02-17 22:11:05', '2015-02-17 15:11:05', '', 'Departemen', '', 'publish', 'open', 'open', '', 'departemen', '', '', '2015-02-17 22:11:05', '2015-02-17 15:11:05', '', 0, 'http://localhost/wordpress/?post_type=easingslider&p=82', 0, 'easingslider', '', 0),
(83, 1, '2015-02-18 21:33:01', '2015-02-18 14:33:01', '<p style="text-align: center;">Sejarah BEM FTIf ITS</p>\n\nBEM FTIf singkatan dari Badan Eksekutif Mahasiswa Fakultas Teknologi Informasi. Didirikan pada tanggal 25 Agustus 2009 di Gedung Fakultas Teknologi Informasi Ruang TC 301. Dengan kepemimpinan:\nPresiden BEM FTIf 2009/2010 = Mas Novan (SI 2007)\nPresiden BEM FTIf 2010/2011 = Mas Faris (TC 2008)\nPresiden BEM FTIf 2011/2012 = Mas Aldy (SI 2009)\nKetua BEM FTIf 2012/2013 = Mas Feb (TC 2010)\nKetua BEM FTIf 2013/2014 = Mas Ade (TC 2011)\nKetua BEM FTIf 2014/2015 = Mas Riko (TC 2012)\nTujuan BEM FTIf dikaitkan dengan cita-cita fakultas dan MUBES IV\n1. BEM FTIf sebagai badan yang melaksanakan fungsi eksekutif di tingkat fakultas\n2. BEM FTIf sebagai wadah komunikasi antar mahasiswa FTIf\n3. BEM FTIf mengembangkan aspek keilmiahan di FTIf untuk mengabdi kepada masyarakat\n4. BEM FTIf melaksanakan amanah KDKM ITS terkait sosial masyarakat dari mahasiswa FTIf yang bersifat instruktif koordinatif\nMakna Lambang BEM FTIf\n\n1. Roda gerigi melambangkan kerja keras dan dinamisasi KM ITS yang termaktub dalam KDKM ITS.\n2. Tipografi FTIf melambangkan jurusan di Fakultas Teknologi Informasi yang memiliki independensi diri namun saling melengkapi satu sama lain.\n3. Warna abu-abu melambangkan warna dari Fakultas Teknologi Informasi.\n4. Warna hitam melambangkan warna dari HMJ di Jurusan Sistem Informasi.\n5. Warna biru melambangkan warna dari HMJ di JurusanTeknik Informatika.\n6. Tulisan “BEM” dan “Fakultas Teknologi Informasi” sebagai identitas.\n7. Warna biru pada tulisan “BEM” dan “Fakultas Teknologi Informasi” melambangkan warna dari KM ITS yang bermakna integralistik.\nDepartemen\n\n&nbsp;', 'Sejarah BEM FTIf', '', 'inherit', 'open', 'open', '', '5-autosave-v1', '', '', '2015-02-18 21:33:01', '2015-02-18 14:33:01', '', 5, 'http://localhost/wordpress/?p=83', 0, 'revision', '', 0),
(84, 1, '2015-02-18 21:33:39', '2015-02-18 14:33:39', '<p style="text-align: center;">Sejarah BEM FTIf ITS</p>\r\n<p style="text-align: left;">\r\nBEM FTIf singkatan dari Badan Eksekutif Mahasiswa Fakultas Teknologi Informasi. Didirikan pada tanggal 25 Agustus 2009 di Gedung Fakultas Teknologi Informasi Ruang TC 301. Dengan kepemimpinan:\r\nPresiden BEM FTIf 2009/2010 = Mas Novan (SI 2007)\r\nPresiden BEM FTIf 2010/2011 = Mas Faris (TC 2008)\r\nPresiden BEM FTIf 2011/2012 = Mas Aldy (SI 2009)\r\nKetua BEM FTIf 2012/2013 = Mas Feb (TC 2010)\r\nKetua BEM FTIf 2013/2014 = Mas Ade (TC 2011)\r\nKetua BEM FTIf 2014/2015 = Mas Riko (TC 2012)\r\nTujuan BEM FTIf dikaitkan dengan cita-cita fakultas dan MUBES IV\r\n1. BEM FTIf sebagai badan yang melaksanakan fungsi eksekutif di tingkat fakultas\r\n2. BEM FTIf sebagai wadah komunikasi antar mahasiswa FTIf\r\n3. BEM FTIf mengembangkan aspek keilmiahan di FTIf untuk mengabdi kepada masyarakat\r\n4. BEM FTIf melaksanakan amanah KDKM ITS terkait sosial masyarakat dari mahasiswa FTIf yang bersifat instruktif koordinatif\r\nMakna Lambang BEM FTIf\r\n\r\n1. Roda gerigi melambangkan kerja keras dan dinamisasi KM ITS yang termaktub dalam KDKM ITS.\r\n2. Tipografi FTIf melambangkan jurusan di Fakultas Teknologi Informasi yang memiliki independensi diri namun saling melengkapi satu sama lain.\r\n3. Warna abu-abu melambangkan warna dari Fakultas Teknologi Informasi.\r\n4. Warna hitam melambangkan warna dari HMJ di Jurusan Sistem Informasi.\r\n5. Warna biru melambangkan warna dari HMJ di JurusanTeknik Informatika.\r\n6. Tulisan “BEM” dan “Fakultas Teknologi Informasi” sebagai identitas.\r\n7. Warna biru pada tulisan “BEM” dan “Fakultas Teknologi Informasi” melambangkan warna dari KM ITS yang bermakna integralistik.\r\nDepartemen</p>', 'Sejarah BEM FTIf', '', 'inherit', 'open', 'open', '', '5-revision-v1', '', '', '2015-02-18 21:33:39', '2015-02-18 14:33:39', '', 5, 'http://localhost/wordpress/?p=84', 0, 'revision', '', 0),
(85, 1, '2015-02-18 21:39:43', '2015-02-18 14:39:43', 'VISI\r\nTerwujudnya FTIf Sinergi dengan semangat kebermanfaatan dan berdaya saing tinggi untuk ITS dan bangsa\r\n\r\nMISI\r\n1. Mewujudkan rasa kekeluargan antar elemen FTIf\r\n2. Menumbuhkan rasa peka dan peduli terhadap lingkungan FTIf dan masyarakat\r\n3. Mengingkatkan daya saing mahasiswa FTIf untuk menghadapi tantangan zaman\r\n4. Menumbuhkan semnagat berkreasi dan berkontribusi untuk kebermanfaatan', 'Visi Misi', '', 'inherit', 'open', 'open', '', '7-revision-v1', '', '', '2015-02-18 21:39:43', '2015-02-18 14:39:43', '', 7, 'http://localhost/wordpress/?p=85', 0, 'revision', '', 0),
(86, 1, '2015-02-18 21:46:35', '2015-02-18 14:46:35', '<ol>\r\n	<li><em>Student Resources Developments (SRD)</em> atau PSDM.</li>\r\n</ol>\r\nMerupakan departemen yang fokus pada pengembangan mahasiswa. Program kerja / agenda yang dilaksanakan oleh Departemen SRD adalah:\r\n<ul>\r\n	<li>LKMM Pra-TD</li>\r\n</ul>\r\nLatihan Ketrampilan Manajemen Mahasiswa Tingkat Pra Dasar yang mencakup materi manajemen diri\r\n<ul>\r\n	<li>LKMM TM</li>\r\n</ul>\r\nLatihan Ketrampilan Manajemen Mahasiswa Tingkat Menengah yang mencakup materi manajemen organisasi\r\n<ul>\r\n	<li>PP LKMM</li>\r\n</ul>\r\nPelatihan Pemandu LKMM, pelatihan untuk pembentukan/regenerasi pemandu LKMM selanjutnya.\r\n<ul>\r\n	<li>Welcome Party Mahasiswa Baru FTIf</li>\r\n</ul>\r\nPenyambutan mahasiswa baru FTIf\r\n<ul>\r\n	<li>FTIf Journey</li>\r\n</ul>\r\nKaderisasi tingkat fakultas yang bertujuan untuk meningkatkan rasa kepemilikan mahasiswa khususnya mahasiswa baru\r\n<ul>\r\n	<li>Upgrading Staff</li>\r\n</ul>\r\nInternalisasi dari staff-staff BEM FTIf\r\n<ul>\r\n	<li>Training for Leaders (TFL)</li>\r\n</ul>\r\nPelatihan untuk staff BEM FTIf yang mau dan mampu untuk melanjutkan kepengurusan\r\n<ul>\r\n	<li>Forum PSDM</li>\r\n</ul>\r\nMempertemukan PSDM dari jurusan-jurusan untuk melakukan koordinasi dan kontroling terkait pengembangan mahasiswa\r\n<ul>\r\n	<li>Forum SC</li>\r\n</ul>\r\nMempertemukan perwakilan SC dari jurusan-jurusan untuk mengonsep dan mengontrol kaderisasi tingkat fakultas (FTIf Journey)\r\n\r\nArti logo departemen <em>(opsional)</em>\r\n<ul>\r\n	<li>Warna biru pada orang melingkar pada logo melambangkan jurusan Teknik Informatika</li>\r\n	<li>Warna hitam pada orang melingkar pada logo melambangkan jurusan Sistem Informasi</li>\r\n	<li>Warna abu abu pada tulisan BEM FTIf – ITS melambangkan fakultas teknologi informasi</li>\r\n	<li>Lingkaran yang ada pada logo melambangkan kesolidan</li>\r\n	<li>Selang – seling antara orang melingkar biru dan hitam melambangakan kerukunan dan juga kebersamaan keluarga BEM FTIf – ITS yang akan ditimbulkan melalui proses kaderisasi fakultas oleh SRD BEM FTIf – ITS</li>\r\n	<li>Kedekatan antara orang-orang yang melingkari logo melambangkan kepaduan yang akan dibentuk antara kedua jurusan sebagai tujuan dar SRD BEM FTIf – ITS</li>\r\n	<li>Tangan ke atas yang dilakukan setiap orang dalam lingkaran logo melambangkan sebagai visi dari departemen SRD BEM FTIf – ITS yaitu keinginan untuk mengembangkan bentuk-bentuk potensi sumber daya mahasiswa yang ada guna menciptakan kader-kader FTIf</li>\r\n</ul>', 'External Affairs', '', 'inherit', 'open', 'open', '', '23-revision-v1', '', '', '2015-02-18 21:46:35', '2015-02-18 14:46:35', '', 23, 'http://localhost/wordpress/?p=86', 0, 'revision', '', 0),
(87, 1, '2015-02-18 21:47:26', '2015-02-18 14:47:26', '<em>Internal Affairs (IA) </em>atau DAGRI.\r\n\r\nMerupakan departemen yang fokus pada internal secara keseluruhan Mahasiswa FTIf. Program kerja / agenda yang dilaksanakan oleh Departemen IA adalah:\r\n<ul>\r\n	<li>FTIf FUN (tahun sebelumnya FTIf Festival)</li>\r\n</ul>\r\nSerankaian game-game yang mempererat FTIf\r\n<ul>\r\n	<li>Forum Dagri</li>\r\n</ul>\r\nMempertemukan Dagri dari kedua jurusan untuk bahasan tertentu\r\n<ul>\r\n	<li>Forum Kabinet</li>\r\n	<li>Devile (Dies Natalis)</li>\r\n</ul>\r\nMengorganisir arak-arakan saat pembukaan Dies Natalis\r\n<ul>\r\n	<li>Kantin Sekre</li>\r\n</ul>\r\nPengadaan kantin berupa ATK untuk keperluan mahasiswa FTIf\r\n<ul>\r\n	<li>Temu warga FTIf</li>\r\n</ul>\r\nMempertemukan seluruh warga fakultas dalam bahasan tertentu (jaring aspirasi)\r\n<ul>\r\n	<li>Jaket BEM F</li>\r\n</ul>\r\nPengadaan Jaket BEM F untuk atribut organisasi dan keperluan dana\r\n<ul>\r\n	<li>Malam Inagurasi</li>\r\n</ul>\r\nArti logo departemen <em>(opsional)</em>\r\n<ul>\r\n	<li>Warna biru menandakan jurusan Teknik Informatika. Warna hitam menandakan jurusan Sistem Informasi</li>\r\n	<li>Relationship menandakan penguatan internalisasi yang merujuk pada penanaman nilai kesolidan dan sinergitas FTIf</li>\r\n	<li>Refleksi bayangan tengah gambar menunjukkan seperti kubah rumah yaitu tujuan departemen IA yang seperti rumah mengayomi dan melindungi internal FTIf</li>\r\n	<li>Bayangan Toga mengartikan kesejahteraan mahasiswa FTIf dimana Departemen IA yang juga memiliki fungsi sebagai koordinatif dalam hal akademik di 2 jurusan</li>\r\n	<li>Segi enam mengartikan 6 teori manajemen yang memfokuskan pada kewirausahaan dan kemandirian yang diusung BEM FTIf tahun ini.</li>\r\n	<li>Keseluruhan Gambar menyimpulkan 3 nilai visi departemen yang diusung IA yaitu terwujudnya harmonisasi, kekeluargaan dan sinergitas di dalam internalisasi FTIf</li>\r\n	<li>Tulisan Internal Affairs dan BEM FTIf – ITS merupakan identitas departemen IA</li>\r\n</ul>', 'Internal Affairs', '', 'inherit', 'open', 'open', '', '21-revision-v1', '', '', '2015-02-18 21:47:26', '2015-02-18 14:47:26', '', 21, 'http://localhost/wordpress/?p=87', 0, 'revision', '', 0),
(88, 1, '2015-02-18 21:48:07', '2015-02-18 14:48:07', '<ol>\r\n	<li><em>Student Resources Developments (SRD)</em> atau PSDM.</li>\r\n</ol>\r\nMerupakan departemen yang fokus pada pengembangan mahasiswa. Program kerja / agenda yang dilaksanakan oleh Departemen SRD adalah:\r\n<ul>\r\n	<li>LKMM Pra-TD</li>\r\n</ul>\r\nLatihan Ketrampilan Manajemen Mahasiswa Tingkat Pra Dasar yang mencakup materi manajemen diri\r\n<ul>\r\n	<li>LKMM TM</li>\r\n</ul>\r\nLatihan Ketrampilan Manajemen Mahasiswa Tingkat Menengah yang mencakup materi manajemen organisasi\r\n<ul>\r\n	<li>PP LKMM</li>\r\n</ul>\r\nPelatihan Pemandu LKMM, pelatihan untuk pembentukan/regenerasi pemandu LKMM selanjutnya.\r\n<ul>\r\n	<li>Welcome Party Mahasiswa Baru FTIf</li>\r\n</ul>\r\nPenyambutan mahasiswa baru FTIf\r\n<ul>\r\n	<li>FTIf Journey</li>\r\n</ul>\r\nKaderisasi tingkat fakultas yang bertujuan untuk meningkatkan rasa kepemilikan mahasiswa khususnya mahasiswa baru\r\n<ul>\r\n	<li>Upgrading Staff</li>\r\n</ul>\r\nInternalisasi dari staff-staff BEM FTIf\r\n<ul>\r\n	<li>Training for Leaders (TFL)</li>\r\n</ul>\r\nPelatihan untuk staff BEM FTIf yang mau dan mampu untuk melanjutkan kepengurusan\r\n<ul>\r\n	<li>Forum PSDM</li>\r\n</ul>\r\nMempertemukan PSDM dari jurusan-jurusan untuk melakukan koordinasi dan kontroling terkait pengembangan mahasiswa\r\n<ul>\r\n	<li>Forum SC</li>\r\n</ul>\r\nMempertemukan perwakilan SC dari jurusan-jurusan untuk mengonsep dan mengontrol kaderisasi tingkat fakultas (FTIf Journey)\r\n\r\nArti logo departemen <em>(opsional)</em>\r\n<ul>\r\n	<li>Warna biru pada orang melingkar pada logo melambangkan jurusan Teknik Informatika</li>\r\n	<li>Warna hitam pada orang melingkar pada logo melambangkan jurusan Sistem Informasi</li>\r\n	<li>Warna abu abu pada tulisan BEM FTIf – ITS melambangkan fakultas teknologi informasi</li>\r\n	<li>Lingkaran yang ada pada logo melambangkan kesolidan</li>\r\n	<li>Selang – seling antara orang melingkar biru dan hitam melambangakan kerukunan dan juga kebersamaan keluarga BEM FTIf – ITS yang akan ditimbulkan melalui proses kaderisasi fakultas oleh SRD BEM FTIf – ITS</li>\r\n	<li>Kedekatan antara orang-orang yang melingkari logo melambangkan kepaduan yang akan dibentuk antara kedua jurusan sebagai tujuan dar SRD BEM FTIf – ITS</li>\r\n</ul>\r\nTangan ke atas yang dilakukan setiap orang dalam lingkaran logo melambangkan sebagai visi dari departemen SRD BEM FTIf – ITS yaitu keinginan untuk mengembangkan bentuk-bentuk potensi sumber daya mahasiswa yang ada guna', 'Student Resources Developments', '', 'inherit', 'open', 'open', '', '19-revision-v1', '', '', '2015-02-18 21:48:07', '2015-02-18 14:48:07', '', 19, 'http://localhost/wordpress/?p=88', 0, 'revision', '', 0),
(89, 1, '2015-02-18 21:48:35', '2015-02-18 14:48:35', '<ol>\r\n	<li><em>Research and Technology Developments (RTD) </em>atau RISTEK.</li>\r\n</ol>\r\nMerupakan departemen yang fokus pada pengembangan teknologi dalam ruang lingkup FTIf. Program kerja / agenda yang dilaksanakan oleh Departemen IA adalah:\r\n<ul>\r\n	<li>FOIL (forum keilmiahan)</li>\r\n</ul>\r\nDiskusi terkait keilmiahan\r\n<ul>\r\n	<li>PKPK (Pelatihan Kakak Pendamping Keilmiahan)</li>\r\n</ul>\r\nPelatihan untuk pembentukan/regenerasi kakak pendamping keilmiahan\r\n<ul>\r\n	<li>KKTI (Kompetisi Karya Tulis Ilmiah)</li>\r\n</ul>\r\nKompetisi KTI untuk mahasiswa FTIf\r\n<ul>\r\n	<li>E-Voting</li>\r\n</ul>\r\nMengkampanyekan e-voting terhadap pemilihan-pemilihan yang terjadi di KM ITS\r\n<ul>\r\n	<li>Gemastik</li>\r\n</ul>\r\nFasilitator terhadap peserta-peserta Gemastik\r\n\r\nArti logo departemen <em>(opsional)</em>\r\n<ul>\r\n	<li>garis-garis kaku menggambarkan kerja keras</li>\r\n	<li>garis yang menghubungkan antara titik hitam melambangkan bahwa department RISTEK ini sebagai penghubung antara department ristek HMTC dan HMSI</li>\r\n	<li>gambar kotak melambangkan bahwa basis dari ristek itu adalah computer</li>\r\n	<li>bentuk R menggambarkan nama dari department ini yaitu RISTEK</li>\r\n	<li>Warna yangmelinkupi logo menandahkan bahwa Ristek ini bagian dari FTIf</li>\r\n</ul>', 'Research and Technology Department', '', 'inherit', 'open', 'open', '', '25-revision-v1', '', '', '2015-02-18 21:48:35', '2015-02-18 14:48:35', '', 25, 'http://localhost/wordpress/?p=89', 0, 'revision', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(90, 1, '2015-02-18 21:49:01', '2015-02-18 14:49:01', '<ol>\r\n	<li><em>Organization Social Responsibility (OSR) </em>atau SOSMAS.</li>\r\n</ol>\r\nMerupakan departemen yang fokus pada pengabdian masyarakat. Program kerja / agenda yang dilaksanakan oleh Departemen OSR adalah:\r\n<ul>\r\n	<li><em>SRW (Social Responsibility Week)</em></li>\r\n</ul>\r\nMinggu sosmas, dimana terdapat mading dan <em>Social Point</em> yang akan mengenalkan sosial masyarakat.\r\n<ul>\r\n	<li><em>FUSION (FTIf Unity in Socialaction)</em></li>\r\n</ul>\r\nRangkaian acara yang mencakup pengembangan masyarakat kampung binaan (di Tempurejo) dan sekitarnya\r\n<ul>\r\n	<li><em>FTIf Berkurban</em></li>\r\n</ul>\r\nAgenda terkait perayaan Idul Adha\r\n<ul>\r\n	<li><em>OSR Forum</em></li>\r\n</ul>\r\nMempertemukan departemen sosmas dari jurusan-jurusan\r\n<ul>\r\n	<li><em>FAST (insidental)</em></li>\r\n</ul>\r\nAgenda terkait insiden/bencana yang terjadi baik di Surabaya maupun di Indonesia\r\n<ul>\r\n	<li><em>Smaller Bigger</em></li>\r\n</ul>\r\nPembekalan IT terhadap UKM-UKM yang nantinya diharapkan dapat mengembangkan UKM tersebut\r\n\r\nArti logo departemen <em>(opsional)</em>\r\n<ul>\r\n	<li>Warna biru melambangkan TC ,warnahitam melambangkan SI danwarnaabu-abu melambangkan FTIf.</li>\r\n	<li>Bentuk hati yang merupakan simbol ketulusan dalam mengabdi.</li>\r\n	<li>Orang bergandengan mengartikan bahwa TC dan SI bersama-sama dalam memberikan pelayanan kepada masyarakat.</li>\r\n</ul>', 'Organization Social Responsibility', '', 'inherit', 'open', 'open', '', '27-revision-v1', '', '', '2015-02-18 21:49:01', '2015-02-18 14:49:01', '', 27, 'http://localhost/wordpress/?p=90', 0, 'revision', '', 0),
(91, 1, '2015-02-18 21:49:53', '2015-02-18 14:49:53', '<ol>\r\n	<li>\r\n<ol>\r\n	<li><em>External Affairs (EA) </em>atau HUBLU.</li>\r\n</ol>\r\nMerupakan departemen yang fokus pada hubungan ke luar BEM FTIf. Program kerja / agenda yang dilaksanakan oleh Departemen EA adalah:\r\n<ul>\r\n	<li><em>Benchmarking</em></li>\r\n</ul>\r\nDimana BEM Ftif melakukan kunjungan ke ormawa lain (baik dalam ITS maupun luar ITS) guna melakukan pembelajaran untuk pengembangn organisasi lebih baik\r\n<ul>\r\n	<li><em>Open House</em></li>\r\n</ul>\r\nDimana  BEM FTIf menerima kunjungan dari ormawa yang ingin berkunjung ke BEM FTIf\r\n<ul>\r\n	<li>Seminar AEC</li>\r\n</ul>\r\nTerkait dengan persiapan mahasiswa FTIf dalam menghadapi AEC\r\n<ul>\r\n	<li><em>Teleconference</em></li>\r\n</ul>\r\n<em>Benchmarking </em>dengan ormawa dari luar negri\r\n<ul>\r\n	<li>PRT</li>\r\n</ul>\r\nPelatihan <em>public speaking</em> untuk mahasiswa FTIf\r\n<ul>\r\n	<li><em>Public Circle</em></li>\r\n</ul>\r\nKajian terhadap berita/isu yang sedang hangat diperbincangkan\r\n\r\nArti logo departemen <em>(opsional)</em>\r\n<ul>\r\n	<li>Warna biru pada sayap kiri garuda melambangkan jurusan Teknik Informatika</li>\r\n	<li>Warna hitam pada sayap kanan garuda melambangkan jurusan Sistem Informasi</li>\r\n	<li>Warna abu abu pada kepala garuda melambangkan fakultas teknologi informasi</li>\r\n	<li>Gerigi melambangkan keteknikan</li>\r\n	<li>Bola Dunia melambangkan beberapa hal, yaitu : Keilmuan dalam fakultas teknologi informasi yang mendukung globalisasi Dunia pada umumnya</li>\r\n	<li>Bola dunia yang terikat oleh kait biru di dalam gerigi melambangkan kami siap mengabdi untuk membantu menyelesaikan masalah bangsa dan dunia melalui keilmuan kami.</li>\r\n	<li>Gambar secara keseluruhan yang berupa burung garuda yang indah sedang mengepakkan sayap adalah sesuai visi departemen yaitu terciptanya citra positif Bem FTIf melalui perluasan jaringan nasional.</li>\r\n</ul>\r\n</li>\r\n</ol>', 'External Affairs', '', 'inherit', 'open', 'open', '', '23-revision-v1', '', '', '2015-02-18 21:49:53', '2015-02-18 14:49:53', '', 23, 'http://localhost/wordpress/?p=91', 0, 'revision', '', 0),
(92, 1, '2015-02-18 21:50:18', '2015-02-18 14:50:18', '<ol>\r\n	<li><em>Information Media (IM) </em>atau MEDFO.</li>\r\n</ol>\r\nMerupakan departemen yang fokus pada komunikasi dan informasi terkait BEM FTIf. Program kerja / agenda yang dilaksanakan oleh Departemen IM adalah:\r\n<ul>\r\n	<li>PJTL (Pelatihan Jurnalistik Tingkat Lanjut)</li>\r\n</ul>\r\nPelatihan jurnalistik yang merupakan kelanjutan dari PJTD yang dilaksanakan oleh jurusan\r\n<ul>\r\n	<li>Formed</li>\r\n</ul>\r\nMempertemukan departemen medfo (media informasi) dari kedua jurusan yang diadakan setiap bulan\r\n<ul>\r\n	<li>Liputan</li>\r\n	<li>Buletin (RELOAD)</li>\r\n	<li>Majalah (PSEUDOCODE)</li>\r\n	<li>Media Sosial</li>\r\n	<li>Mading</li>\r\n</ul>\r\nArti logo departemen <em>(opsional)</em>\r\n<ul>\r\n	<li>Warna: Biru melambangkan TC. Hitam melambangkan SI. Abu-abu melambangkan BEM FTIf</li>\r\n	<li>Sinyal dengan warna biru, hitam, dan abu-abu melambangkan informasi yang berkaitan tentang TC, SI, dan BEM FTIf</li>\r\n	<li>Orang yang memncarkan sinyal melambangkan bahwa IM akan memancarkan dan menyalurkan semua informasi yang berkaitan dengan TC, SI, dan BEM FTIf baik di dalam maupun di luar ITS.</li>\r\n</ul>', 'Information Media', '', 'inherit', 'open', 'open', '', '29-revision-v1', '', '', '2015-02-18 21:50:18', '2015-02-18 14:50:18', '', 29, 'http://localhost/wordpress/?p=92', 0, 'revision', '', 0),
(93, 1, '2015-02-18 21:51:04', '2015-02-18 14:51:04', '<ol>\r\n	<li><em>Bakor Pemandu FTIf.</em></li>\r\n</ol>\r\n<em> </em>\r\n\r\nMerupakan departemen yang fokus pada koordinasi pemandu FTIf. Program kerja / agenda yang dilaksanakan oleh Bakor Pemandu adalah:\r\n<ul>\r\n	<li>Upgrading Pemandu</li>\r\n</ul>\r\nPembekalan terhadap pemandu untuk menghadapi LKMM Pra TD dan TD di masing-masing jurusan\r\n<ul>\r\n	<li>Data Center Pemandu</li>\r\n</ul>\r\nMenjadi pusat data dan informasi terkait kepemanduan yang ada di FTIf\r\n<ul>\r\n	<li>Controling LKMM</li>\r\n</ul>\r\nControling untuk LKMM PraTD, TD di FTIf.\r\n\r\nArti logo departemen <em>(opsional)</em>\r\n<ul>\r\n	<li>Warna biru melambangkan HMTC, warna hitam melambangkan HMSI, dan warna abu-abu melambangkan FTIF</li>\r\n	<li>Dua orang saling berdekatan dengan tangan terbuka melambangkan kesatuan antar Pemandu dan Pemandu yang berpikiran terbuka</li>\r\n	<li>Atap melambangkan Bakor FTIF sebagai rumah bagi Pemandu FTIF</li>\r\n</ul>', 'Bakor Pemandu FTIf', '', 'inherit', 'open', 'open', '', '32-revision-v1', '', '', '2015-02-18 21:51:04', '2015-02-18 14:51:04', '', 32, 'http://localhost/wordpress/?p=93', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--
-- Creation: Feb 17, 2015 at 12:28 PM
--

DROP TABLE IF EXISTS `wp_terms`;
CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `wp_terms`:
--

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'simple', 'simple', 0),
(3, 'grouped', 'grouped', 0),
(4, 'variable', 'variable', 0),
(5, 'external', 'external', 0),
(6, 'pending', 'pending', 0),
(7, 'failed', 'failed', 0),
(8, 'on-hold', 'on-hold', 0),
(9, 'processing', 'processing', 0),
(10, 'completed', 'completed', 0),
(11, 'refunded', 'refunded', 0),
(12, 'cancelled', 'cancelled', 0),
(13, 'Menu', 'menu', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--
-- Creation: Feb 17, 2015 at 12:28 PM
--

DROP TABLE IF EXISTS `wp_term_relationships`;
CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `wp_term_relationships`:
--

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--
-- Creation: Feb 17, 2015 at 12:28 PM
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `wp_term_taxonomy`:
--

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(13, 13, 'nav_menu', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--
-- Creation: Feb 17, 2015 at 12:28 PM
--

DROP TABLE IF EXISTS `wp_usermeta`;
CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `wp_usermeta`:
--

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'kelompok3'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 1, 'wp_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', 'wp360_locks,wp390_widgets,wp410_dfw'),
(13, 1, 'show_welcome_panel', '1'),
(14, 1, 'session_tokens', 'a:1:{s:64:"31a61d70cca8caa5afacd15511a877580cbed604e295f4efc1221dba15e4e30c";a:4:{s:10:"expiration";i:1425385772;s:2:"ip";s:3:"::1";s:2:"ua";s:112:"Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2300.2 Safari/537.36";s:5:"login";i:1424176172;}}'),
(15, 1, 'wp_dashboard_quick_press_last_post_id', '3'),
(16, 1, 'tgmpa_dismissed_notice', '1'),
(17, 1, 'admin_ignore_notice', 'true'),
(18, 1, 'managenav-menuscolumnshidden', 'a:4:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";}'),
(19, 1, 'metaboxhidden_nav-menus', 'a:2:{i:0;s:8:"add-post";i:1;s:12:"add-post_tag";}'),
(20, 1, 'wp_user-settings', 'widgets_access=off&mfold=o&libraryContent=browse'),
(21, 1, 'wp_user-settings-time', '1424185860');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--
-- Creation: Feb 17, 2015 at 12:28 PM
--

DROP TABLE IF EXISTS `wp_users`;
CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) unsigned NOT NULL,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `wp_users`:
--

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'kelompok3', '$P$BeXJWGtNSWRwE.KkV.Gi7vNtlymf320', 'kelompok3', 'fauzan14fourteen@gmail.com', '', '2015-02-17 12:28:22', '', 0, 'kelompok3');

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_order_itemmeta`
--
-- Creation: Feb 17, 2015 at 01:11 PM
--

DROP TABLE IF EXISTS `wp_woocommerce_order_itemmeta`;
CREATE TABLE IF NOT EXISTS `wp_woocommerce_order_itemmeta` (
  `meta_id` bigint(20) NOT NULL,
  `order_item_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `wp_woocommerce_order_itemmeta`:
--

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_order_items`
--
-- Creation: Feb 17, 2015 at 01:11 PM
--

DROP TABLE IF EXISTS `wp_woocommerce_order_items`;
CREATE TABLE IF NOT EXISTS `wp_woocommerce_order_items` (
  `order_item_id` bigint(20) NOT NULL,
  `order_item_name` longtext NOT NULL,
  `order_item_type` varchar(200) NOT NULL DEFAULT '',
  `order_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `wp_woocommerce_order_items`:
--

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`), ADD KEY `comment_id` (`comment_id`), ADD KEY `meta_key` (`meta_key`);

--
-- Indexes for table `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`), ADD KEY `comment_post_ID` (`comment_post_ID`), ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`), ADD KEY `comment_date_gmt` (`comment_date_gmt`), ADD KEY `comment_parent` (`comment_parent`), ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`), ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`), ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`), ADD KEY `post_id` (`post_id`), ADD KEY `meta_key` (`meta_key`);

--
-- Indexes for table `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`), ADD KEY `post_name` (`post_name`), ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`), ADD KEY `post_parent` (`post_parent`), ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`), ADD KEY `slug` (`slug`), ADD KEY `name` (`name`);

--
-- Indexes for table `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`), ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`), ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`), ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`), ADD KEY `user_id` (`user_id`), ADD KEY `meta_key` (`meta_key`);

--
-- Indexes for table `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`), ADD KEY `user_login_key` (`user_login`), ADD KEY `user_nicename` (`user_nicename`);

--
-- Indexes for table `wp_woocommerce_order_itemmeta`
--
ALTER TABLE `wp_woocommerce_order_itemmeta`
  ADD PRIMARY KEY (`meta_id`), ADD KEY `order_item_id` (`order_item_id`), ADD KEY `meta_key` (`meta_key`);

--
-- Indexes for table `wp_woocommerce_order_items`
--
ALTER TABLE `wp_woocommerce_order_items`
  ADD PRIMARY KEY (`order_item_id`), ADD KEY `order_id` (`order_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=290;
--
-- AUTO_INCREMENT for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=380;
--
-- AUTO_INCREMENT for table `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=94;
--
-- AUTO_INCREMENT for table `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wp_woocommerce_order_itemmeta`
--
ALTER TABLE `wp_woocommerce_order_itemmeta`
  MODIFY `meta_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_woocommerce_order_items`
--
ALTER TABLE `wp_woocommerce_order_items`
  MODIFY `order_item_id` bigint(20) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
