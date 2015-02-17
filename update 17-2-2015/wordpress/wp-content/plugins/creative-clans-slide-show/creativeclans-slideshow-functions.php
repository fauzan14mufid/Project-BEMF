<?php
/*  Copyright 2009-2010  Guido Tonnaer  (email : info@creativeclans.nl)

    creativeclans-slideshow-functions.php is part of the creative clans
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

    function widget_creativeclans_slideshow_checkinput ($value)
    {
      if (get_magic_quotes_gpc()) 
      {
        return trim(stripslashes($value));
      }
      else
      {
        return trim($value);
      }
    }

    function widget_creativeclans_slideshow_checkEffects($effects) { 
      $effectArrayIn = explode("\r\n", $effects);
      if (1 == count($effectArrayIn)) $effectArrayIn = explode("\n", $effectArrayIn[0]);
      $effectArrayOut = array();
	    foreach ($effectArrayIn as $key=>$value) {
        if ('' != trim($value)) $effectArrayOut[] = trim($value);
      }
      return implode(',', $effectArrayOut);
    }

    function widget_creativeclans_slideshow_checkSlideInfo($info) 
    { 
      $infoArray = explode("\r\n", $info);
      if (1 == count($infoArray)) $infoArray = explode("\n", $infoArray[0]);
      return $infoArray;
    }

    function widget_creativeclans_slideshow_buildConfigXML($par, $module_absolute_path) 
    { 
      // check and create effect strings
      if ('' != $par['includeEffects']) $par['includeEffects'] = widget_creativeclans_slideshow_checkEffects($par['includeEffects']);
      if ('' != $par['excludeEffects']) $par['excludeEffects'] = widget_creativeclans_slideshow_checkEffects($par['excludeEffects']);
     
      // create config XML file        
      $xml_data = '<?xml version="1.0" encoding="utf-8"?>'."\n";
?><?php
      $xml_data .= "<parameters>\n";
      foreach ($par as $key=>$value) {
      	$xml_data .= "<parameter name=\"$key\">$value</parameter>\n";
      }
      $xml_data .= "</parameters>\n";
      
      return $xml_data;    
    }

    function widget_creativeclans_slideshow_buildSlidesXML($par) 
    { 
      // check and create slide info strings
      $image      = ('' != $par['images'])      ? widget_creativeclans_slideshow_checkSlideInfo($par['images'])      : array();
      $url        = ('' != $par['links'])       ? widget_creativeclans_slideshow_checkSlideInfo($par['links'])       : array();
      $title      = ('' != $par['captions'])    ? widget_creativeclans_slideshow_checkSlideInfo($par['captions'])    : array();
      $linktarget = ('' != $par['linktargets']) ? widget_creativeclans_slideshow_checkSlideInfo($par['linktargets']) : array();

      // Build slides XML file
      $xml_data = '<?xml version="1.0" encoding="utf-8"?>'."\n";
?><?php
      $xml_data .= "<images>\n";
      for($i=0; $i<count($image); $i++) {
        $xml_data .= "<image>\n";
        $xml_data .= "<itemName>".trim($image[$i])."</itemName>\n";
        if (isset($title[$i])) {
          $xml_data .= "<itemCaption>".trim($title[$i])."</itemCaption>\n";
        } else {
          $xml_data .= "<itemCaption></itemCaption>\n";
        }
        if (isset($url[$i])) {
          $xml_data .= "<itemLink>".trim($url[$i])."</itemLink>\n";
        } else {
          $xml_data .= "<itemLink></itemLink>\n";
        }
        if (isset($linktarget[$i])) {
          $xml_data .= "<itemLinkTarget>".trim($linktarget[$i])."</itemLinkTarget>\n";
        } else {
          $xml_data .= "<itemLinkTarget></itemLinkTarget>\n";
        }
        $xml_data .= "</image>\n";
      }
      $xml_data .= '</images>'."\n";
      
      return $xml_data;    
    }
    
    function widget_creativeclans_slideshow_getSlidesFromFolder($path = '') 
    {
      $validExtensions = array('JPG', 'JPEG', 'GIF', 'PNG');
      $result = '';
      $dir = dir($path);
      while (false !== ($object = $dir->read())) {
        if (is_file($path.$object)) {
          $path_parts = pathinfo($path.$object);
          $extension = strtoupper($path_parts['extension']);
          if (in_array($extension, $validExtensions)) {
            $result .= ($result == '') ? $object : "\n" . $object;          	
          }
        }
      }
      $dir->close();
      return $result;
    }
    
    function widget_creativeclans_slideshow_loadImage($file) {
      $curl = curl_init($file);
      curl_setopt($curl, CURLOPT_HEADER, false);
      curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true); 
      curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
      $result = curl_exec($curl);
      if(curl_errno($curl))
      {
        curl_close($curl);
        return false;
      }
      curl_close($curl);
      return $result;
    }
     
?>