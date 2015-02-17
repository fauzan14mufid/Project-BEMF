<?php
/*  Copyright 2010  Guido Tonnaer  (email : info@creativeclans.nl)

    creativeclans-slideshow-proxy.php is part of the creative clans
    slideshow Wordpress widget.

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
    
    The CCSlideShow.swf flash file contained in this widget is released under 
    a different license, but as long as it is a part of this widget, you are
    free to use it as if it was released under the GNU/GPL license. 
    If you want to use it outside of the Wordpress widget, please refer to 
    http://www.creativeclans.nl for more info.
*/
  if (!function_exists('add_action')) {
	  $root = '../../..';
    if (file_exists($root.'/wp-load.php')) {
		  require_once($root.'/wp-load.php');
	  } else {
		  if (!file_exists($root.'/wp-config.php'))
			  die;
		  require_once($root.'/wp-config.php');
	  }
  }

  require_once "creativeclans-slideshow-functions.php";

  // validate passed values
  $action = (isset($_GET['action'])) ? widget_creativeclans_slideshow_checkinput($_GET['action']) : '';
  $slideShowId = (isset($_GET['slideShowId'])) ? widget_creativeclans_slideshow_checkinput($_GET['slideShowId']) : '';
  $pic = (isset($_GET['pic'])) ? widget_creativeclans_slideshow_checkinput($_GET['pic']) : '';

  // get slide show settings
  $options_all = get_option('widget_creativeclans_slideshow');
  if (!isset($options_all[$slideShowId])) die;
  $options = $options_all[$slideShowId];
 
  switch ($action) {
    case 'loadimagesfromfolder':
      $path = (isset($options['path'])) ? $options['path'] : 'images/';
      $path = parse_url($path);
      $documentroot = (substr($_SERVER['DOCUMENT_ROOT'], -1) == '/') ? substr($_SERVER['DOCUMENT_ROOT'], 0, -1) : $_SERVER['DOCUMENT_ROOT'];
      $path = $documentroot . (($path['path'][0] != '/') ? '/' : '') . $path['path']; 
      $options['images'] = widget_creativeclans_slideshow_getSlidesFromFolder($path);
      $options['links'] = '';
      $options['captions'] = '';
      $options['linktargets'] = '';
      echo widget_creativeclans_slideshow_buildSlidesXML($options);
      break;
      
    case 'loadimage':
      echo widget_creativeclans_slideshow_loadImage($options['path'] . $pic);
      break;
      
    case 'loadwatermark':
      echo widget_creativeclans_slideshow_loadImage($options['watermark']);
      break;
      
    case 'loadcaptionimage':
      echo widget_creativeclans_slideshow_loadImage($options['captionImage']);
      break;
      
    case 'loadborderimage':
      echo widget_creativeclans_slideshow_loadImage($options['borderImage']);
      break;

    case 'dynamicConfigCreation':
      $module_absolute_path = get_bloginfo('wpurl') . '/'.PLUGINDIR.'/creative-clans-slide-show/';
      echo widget_creativeclans_slideshow_buildConfigXML($options, $module_absolute_path);
      break;

    case 'dynamicSlidesCreation':
      echo widget_creativeclans_slideshow_buildSlidesXML($options);
      break;

  }
?>