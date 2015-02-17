<?php
/*
Plugin Name: Creative Clans Slide Show Wordpress Widget
Plugin URI: http://www.creativeclans.nl
Description: A widget to use the Creative Clans SlideShow in Wordpress. For more info visit the <a href="http://www.creativeclans.nl">Creative Clans website</a>.
Version: 1.3.4
Author: Guido Tonnaer
Author URI: http://www.creativeclans.nl
*/

/*  Copyright 2009-2010  Guido Tonnaer  (email : info@creativeclans.nl)

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

    require_once "creativeclans-slideshow-functions.php";
    
    function widget_ccss_init() {
      if (!$options = get_option('widget_creativeclans_slideshow')) $options = array();
            
      $widget_ops = array('classname' => 'widget_creativeclans_slideshow', 'description' => 'Creative Clans Slide Show');
      $control_ops = array('width' => 400, 'height' => 350, 'id_base' => 'creativeclansslideshow');
      $name = 'Creative Clans Slide Show';
        
      $registered = false;
      foreach (array_keys($options) as $o) {
        if (!isset($options[$o]['width'])) continue;
                
        $id = "creativeclansslideshow-$o";
        $registered = true;
        wp_register_sidebar_widget($id, $name, 'widget_creativeclans_slideshow', $widget_ops, array( 'number' => $o ) );
        wp_register_widget_control($id, $name, 'widget_creativeclans_slideshow_control', $control_ops, array( 'number' => $o ) );
      }
      if (!$registered) {
        wp_register_sidebar_widget('creativeclansslideshow-1', $name, 'widget_creativeclans_slideshow', $widget_ops, array( 'number' => -1 ) );
        wp_register_widget_control('creativeclansslideshow-1', $name, 'widget_creativeclans_slideshow_control', $control_ops, array( 'number' => -1 ) );
      }
    }

    function widget_creativeclans_slideshow($args, $widget_args = 1) {
      extract($args, EXTR_SKIP );

      if (is_numeric($widget_args)) $widget_args = array('number' => $widget_args);
      $widget_args = wp_parse_args($widget_args, array( 'number' => -1 ));
      extract($widget_args, EXTR_SKIP);
      $options_all = get_option('widget_creativeclans_slideshow');
      if (!isset($options_all[$number])) return;

      $options = $options_all[$number];

      echo $before_widget;

	// Widget title
	    if ('' != trim($options['title'])) {
        echo $before_title;
        echo $options['title'];
        echo $after_title;
      }
      
      echo render_widget_creativeclans_slideshow($options, $number);
      echo $after_widget;
    }

    function widget_creativeclans_slideshow_control($widget_args = 1) {

      global $wp_registered_widgets;
      static $updated = false;
      $default_options = array(
            'title' => ''
          , 'width' => 400
          , 'height' => 300
          , 'backgroundColor' => '0xFFFFFF'
          , 'loops' => 0
          , 'wait' => 3000
          , 'effectTime' => 1
          , 'includeEffects' => ''
          , 'excludeEffects' => ''
          , 'stopOnMouseOver' => 'no'
          , 'enableLinks' => 'no'
          , 'linkTarget' => '_blank'
          , 'link' => ''
          , 'path' => ''
          , 'order' => 'forward'
          , 'slides' => 0
          , 'borderStyle' => 'none'
          , 'borderColor' => '0x000000'
          , 'borderThickness' => 1
          , 'borderAlpha' => 1.0
          , 'captionStyle' => 'none'
          , 'captionType' => 'text'
          , 'captionBackgroundColor' => '0x000000'
          , 'captionColor' => '0xFFFFFF'
          , 'captionText' => ''
          , 'captionTextRightMargin' => 0
          , 'captionTextLeftMargin' => 0
          , 'captionTextBottomMargin' => 0
          , 'captionTextFont' => 'Times New Roman'
          , 'captionTextFontSize' => 10
          , 'captionBackgroundAlpha' => 1.0
          , 'captionPosition' => 'top'
          , 'captionHorizontalOffset' => 0
          , 'captionVerticalOffset' => 0
          , 'captionImage' => ''
          , 'images' => ''
          , 'links' => ''
          , 'captions' => ''
          , 'proxyFlag' => 'no'
          , 'loadFromFolder' => 'no'
          , 'dynamicXmlCreation' => 'no'
          , 'watermark' => ''
          , 'watermarkAlpha' => 1.0
          , 'watermarkFullScreen' => 'no'
          , 'watermarkHorizontalOffset' => 0
          , 'watermarkVerticalOffset' => 0
          , 'borderImage' => ''
          , 'linktargets' => ''
          , 'backgroundAlpha' => 1.0
      );

//      $module_absolute_path = get_option('siteurl') . '/'.PLUGINDIR.'/creative-clans-slide-show/';
      $module_absolute_path = get_bloginfo('wpurl') . '/'.PLUGINDIR.'/creative-clans-slide-show/';
//      $module_path = PLUGINDIR.'/creative-clans-slide-show/';
      $pathArray = explode('/', get_bloginfo('wpurl'));

      // change of module path identification after problems with GoDaddy
      $module_path = dirname(__FILE__) . '/';

      if ( is_numeric($widget_args) ) $widget_args = array('number' => $widget_args);
      $widget_args = wp_parse_args($widget_args, array('number' => -1));
      extract($widget_args, EXTR_SKIP);
      $options_all = get_option('widget_creativeclans_slideshow');
      if (!is_array($options_all)) $options_all = array();  
      if (!$updated && !empty($_POST['sidebar'])) {
        $sidebar = (string)$_POST['sidebar'];

        $sidebars_widgets = wp_get_sidebars_widgets();
        if (isset($sidebars_widgets[$sidebar])) $this_sidebar =& $sidebars_widgets[$sidebar];
        else $this_sidebar = array();

        foreach ($this_sidebar as $_widget_id) {
          if ('widget_creativeclans_slideshow' == $wp_registered_widgets[$_widget_id]['callback'] && isset($wp_registered_widgets[$_widget_id]['params'][0]['number'])) {
            $widget_number = $wp_registered_widgets[$_widget_id]['params'][0]['number'];
            if (!in_array("creativeclansslideshow-$widget_number", $_POST['widget-id']))
              unset($options_all[$widget_number]);
              @unlink($module_path.'xmlconfig'.$widget_number.'.xml');
              @unlink($module_path.'xmlslides'.$widget_number.'.xml');
          }
        }
        foreach ((array)$_POST['widget_creativeclans_slideshow'] as $widget_number => $posted) {
          if (!isset($posted['width']) && isset($options_all[$widget_number]))
            continue;

          $options = array();
          foreach ($posted as $key => $value) {
            // fixing a WP bug: the first line of the textarea must contain at least a space
            if ($key == 'links' || $key == 'captions' || $key == 'linktargets') {
              if ('' != $value) {
                $checkFirstLineArray = widget_creativeclans_slideshow_checkSlideInfo($value);
                if ('' == $checkFirstLineArray[0]) $value = ' ' . $value;
              }
            }
          	$options[$key] = widget_creativeclans_slideshow_checkinput($value);
          }

          // create the WP specific settings
          $options['scriptPath'] = $module_absolute_path . 'creativeclans-slideshow-proxy.php';

          $options_all[$widget_number] = $options;

          // --> if dynamicXmlCreation is 'no', then create the two xml files
          if ('no' == $options['dynamicXmlCreation']) {
            $xmlconfig_filename = $module_path.'xmlconfig'.$widget_number.'.xml';
            $xml_data = widget_creativeclans_slideshow_buildConfigXML($options, $module_absolute_path);
            $xmlconfig_file = fopen($xmlconfig_filename,'w');
            fwrite($xmlconfig_file, $xml_data);
            fclose($xmlconfig_file);
            $xmlslides_filename = $module_path.'xmlslides'.$widget_number.'.xml';
            $xml_data = widget_creativeclans_slideshow_buildSlidesXML($options);
            $xmlslides_file = fopen($xmlslides_filename,'w');
            fwrite($xmlslides_file, $xml_data);
            fclose($xmlslides_file);
          }

        }
        update_option('widget_creativeclans_slideshow', $options_all);
        $updated = true;
      }

      if (-1 == $number) {
        $number = '%i%';
        $values = $default_options;
      }
      else {
        $values = $options_all[$number];
      }
      
?>    
version: <?php echo get_option('widget_creativeclans_slideshow_version'); ?><br /> 
<label for="ccslideshow-name" title="The title of the slideshow.">Title:</label>
<input class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-title" name="widget_creativeclans_slideshow[<?php echo $number; ?>][title]" type="text" value="<?php echo htmlspecialchars($values['title'], ENT_QUOTES); ?>" /><br />
<hr />
<B>Slide settings</B><br />
<label for="ccslideshow-path" title="Contains the absolute path (has to begin with http://) to the slides folder, WITH the final slash (for example: http://www.sitename.com/wp-content/uploads/).">Path:</label>
<input class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-path" name="widget_creativeclans_slideshow[<?php echo $number; ?>][path]" type="text" value="<?php echo htmlspecialchars($values['path'], ENT_QUOTES); ?>" /><br />
<label for="ccslideshow-loadFromFolder" title="If 'yes', the slide show will load all images present in the folder set in the 'Path' setting. Attention: cross domain access isn't allowed.">Load all images from folder:</label>
<select class="widefat" style="width: 100;" name="widget_creativeclans_slideshow[<?php echo $number; ?>][loadFromFolder]" id="widget_creativeclans_slideshow-<?php echo $number; ?>-loadFromFolder">
    <option value="yes"<?php echo $values['loadFromFolder'] == 'yes' ? ' selected="selected"' : ''; ?>>yes</option>
    <option value="no"<?php echo $values['loadFromFolder'] == 'no' ? ' selected="selected"' : ''; ?>>no</option>
</select>
<label for="ccslideshow-images" title="List of the image names, one image per line. If 'Load all images from folder' is 'no', the image names must be set here.">Images:</label>
<textarea class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-images" name="widget_creativeclans_slideshow[<?php echo $number; ?>][images]" rows="8"><?php echo htmlspecialchars($values['images'], ENT_QUOTES); ?></textarea><br />
<label for="ccslideshow-captions" title="List of the captions, one caption per line.">Captions:</label>
<textarea class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-captions" name="widget_creativeclans_slideshow[<?php echo $number; ?>][captions]" rows="8"><?php echo htmlspecialchars($values['captions'], ENT_QUOTES); ?></textarea><br />
<label for="ccslideshow-links" title="List of links, one link per line.">Links:</label>
<textarea class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-links" name="widget_creativeclans_slideshow[<?php echo $number; ?>][links]" rows="8"><?php echo htmlspecialchars($values['links'], ENT_QUOTES); ?></textarea><br />
<label for="ccslideshow-linktargets" title="List of link targets, one target per line. Possible values : _self (The current frame in the current window), _blank (A new window), _parent (The parent of the current frame), _top (The top-level frame in the current window).">Link targets:</label>
<textarea class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-linktargets" name="widget_creativeclans_slideshow[<?php echo $number; ?>][linktargets]" rows="8"><?php echo htmlspecialchars($values['linktargets'], ENT_QUOTES); ?></textarea><br />
<hr />
<B>Several settings</B><br />
<label for="ccslideshow-width" title="The width of slideshow module specified in pixels.">Width (px):</label>
<input class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-width" name="widget_creativeclans_slideshow[<?php echo $number; ?>][width]" type="text" value="<?php echo htmlspecialchars($values['width'], ENT_QUOTES); ?>" /><br />
<label for="ccslideshow-height" title="The height of slideshow module specified in pixels.">Height (px):</label>
<input class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-height" name="widget_creativeclans_slideshow[<?php echo $number; ?>][height]" type="text" value="<?php echo htmlspecialchars($values['height'], ENT_QUOTES); ?>" /><br />
<label for="ccslideshow-backgroundColor" title="The slideshow background color. The color value must be specified in the format 0xXXXXXX. For example: 0xFFFFFF (white).">Background Color:</label>
<input class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-backgroundColor" name="widget_creativeclans_slideshow[<?php echo $number; ?>][backgroundColor]" type="text" value="<?php echo htmlspecialchars($values['backgroundColor'], ENT_QUOTES); ?>" /><br />
<label for="ccslideshow-backgroundAlpha" title="Value has to be numeric from 0 (invisible) to 1.0 (solid).">Background transparancy:</label>
<input class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-backgroundAlpha" name="widget_creativeclans_slideshow[<?php echo $number; ?>][backgroundAlpha]" type="text" value="<?php echo htmlspecialchars($values['backgroundAlpha'], ENT_QUOTES); ?>" /><br />
<label for="ccslideshow-loops" title="You can specify how many times the slide show must loop through the images. Value '0' means infinite loops. Value has to be numeric.">Loops:</label>
<input class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-loops" name="widget_creativeclans_slideshow[<?php echo $number; ?>][loops]" type="text" value="<?php echo htmlspecialchars($values['loops'], ENT_QUOTES); ?>" /><br />
<label for="ccslideshow-wait" title="Time the slide is shown (in milliseconds). Value has to be numeric.">Wait (ms):</label>
<input class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-wait" name="widget_creativeclans_slideshow[<?php echo $number; ?>][wait]" type="text" value="<?php echo htmlspecialchars($values['wait'], ENT_QUOTES); ?>" /><br />
<label for="ccslideshow-effectTime" title="Duration of the transition effect between slides (in seconds). Value has to be numeric.">Effect Time (s):</label>
<input class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-effectTime" name="widget_creativeclans_slideshow[<?php echo $number; ?>][effectTime]" type="text" value="<?php echo htmlspecialchars($values['effectTime'], ENT_QUOTES); ?>" /><br />
<label for="ccslideshow-includeEffects" title="List of transition effects to be used (one effect per line). If you want to use all available effects, leave it empty.	Possible values: see documentation (www.creativeclans.nl).">Include Effects:</label>
<textarea class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-includeEffects" name="widget_creativeclans_slideshow[<?php echo $number; ?>][includeEffects]" rows="8"><?php echo htmlspecialchars($values['includeEffects'], ENT_QUOTES); ?></textarea><br />
<label for="ccslideshow-excludeEffects" title="List of transition effects not to be used (one effect per line). If you want to use all available effects, leave it empty.	Possible values: see documentation (www.creativeclans.nl).">Exclude Effects:</label>
<textarea class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-excludeEffects" name="widget_creativeclans_slideshow[<?php echo $number; ?>][excludeEffects]" rows="8"><?php echo htmlspecialchars($values['excludeEffects'], ENT_QUOTES); ?></textarea><br />
<label for="ccslideshow-stopOnMouseOver" title="If 'yes', the slide show is paused while the mouse hovers over the slideshow.">Stop on Mouse Over:</label>
<select class="widefat" style="width: 100;" name="widget_creativeclans_slideshow[<?php echo $number; ?>][stopOnMouseOver]" id="widget_creativeclans_slideshow-<?php echo $number; ?>-stopOnMouseOver">
    <option value="yes"<?php echo $values['stopOnMouseOver'] == 'yes' ? ' selected="selected"' : ''; ?>>yes</option>
    <option value="no"<?php echo $values['stopOnMouseOver'] == 'no' ? ' selected="selected"' : ''; ?>>no</option>
</select>
<label for="ccslideshow-enableLinks" title="If 'yes', clicking on the slide will open the link defined for the slide in 'Slide settings - Links', or, if that doesn't have a value, the link defined in 'Several settings - Link'.">Enable Links:</label>
<select class="widefat" style="width: 100;" name="widget_creativeclans_slideshow[<?php echo $number; ?>][enableLinks]" id="widget_creativeclans_slideshow-<?php echo $number; ?>-enableLinks">
    <option value="yes"<?php echo $values['enableLinks'] == 'yes' ? ' selected="selected"' : ''; ?>>yes</option>
    <option value="no"<?php echo $values['enableLinks'] == 'no' ? ' selected="selected"' : ''; ?>>no</option>
</select>
<label for="ccslideshow-link" title="Specifies one link for all slides. Is used when no link has been specified for the slide">Link:</label>
<input class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-link" name="widget_creativeclans_slideshow[<?php echo $number; ?>][link]" type="text" value="<?php echo htmlspecialchars($values['link'], ENT_QUOTES); ?>" /><br />
<label for="ccslideshow-linkTarget" title="Specify the target of all links. Is used when no target has been specified for the slide.">Link Target:</label>
<select class="widefat" style="width: 100;" name="widget_creativeclans_slideshow[<?php echo $number; ?>][linkTarget]" id="widget_creativeclans_slideshow-<?php echo $number; ?>-linkTarget">
    <option value="_self"<?php echo $values['linkTarget'] == '_self' ? ' selected="selected"' : ''; ?>>The current frame in the current window</option>
    <option value="_blank"<?php echo $values['linkTarget'] == '_blank' ? ' selected="selected"' : ''; ?>>A new window</option>
    <option value="_parent"<?php echo $values['linkTarget'] == '_parent' ? ' selected="selected"' : ''; ?>>The parent of the current frame</option>
    <option value="_top"<?php echo $values['linkTarget'] == '_top' ? ' selected="selected"' : ''; ?>>The top-level frame in the current window</option>
</select>
<label for="ccslideshow-order" title="Order in which the slides are shown.">Order:</label>
<select class="widefat" style="width: 100;" name="widget_creativeclans_slideshow[<?php echo $number; ?>][order]" id="widget_creativeclans_slideshow-<?php echo $number; ?>-order">
    <option value="forward"<?php echo $values['order'] == 'forward' ? ' selected="selected"' : ''; ?>>forward</option>
    <option value="backward"<?php echo $values['order'] == 'backward' ? ' selected="selected"' : ''; ?>>backward</option>
    <option value="random"<?php echo $values['order'] == 'random' ? ' selected="selected"' : ''; ?>>random</option>
</select>
<label for="ccslideshow-slides" title="You can specify how many of the images must be shown. Is used when 'Order' is 'random'. Value '0' means all images. Value has to be numeric.">Number of slides:</label>
<input class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-slides" name="widget_creativeclans_slideshow[<?php echo $number; ?>][slides]" type="text" value="<?php echo htmlspecialchars($values['slides'], ENT_QUOTES); ?>" /><br />
<label for="ccslideshow-autoResize" title="If 'yes', the images used in the slide show will be resized to the size of the slide show.">Auto resize images:</label>
<select class="widefat" style="width: 100;" name="widget_creativeclans_slideshow[<?php echo $number; ?>][autoResize]" id="widget_creativeclans_slideshow-<?php echo $number; ?>-autoResize">
    <option value="yes"<?php echo $values['autoResize'] == 'yes' ? ' selected="selected"' : ''; ?>>yes</option>
    <option value="no"<?php echo $values['autoResize'] == 'no' ? ' selected="selected"' : ''; ?>>no</option>
</select>
<label for="ccslideshow-proxyFlag" title="If 'yes', the slide show will be able to show images stored on another domain.">Enable proxy for cross-domain access:</label>
<select class="widefat" style="width: 100;" name="widget_creativeclans_slideshow[<?php echo $number; ?>][proxyFlag]" id="widget_creativeclans_slideshow-<?php echo $number; ?>-proxyFlag">
    <option value="yes"<?php echo $values['proxyFlag'] == 'yes' ? ' selected="selected"' : ''; ?>>yes</option>
    <option value="no"<?php echo $values['proxyFlag'] == 'no' ? ' selected="selected"' : ''; ?>>no</option>
</select>
<label for="ccslideshow-watermark" title="Has to contain the absolute path (has to start with 'http://') to the image to be used as a watermark, or leave it empty if you don't want to use it.">Watermark image:</label>
<input class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-watermark" name="widget_creativeclans_slideshow[<?php echo $number; ?>][watermark]" type="text" value="<?php echo htmlspecialchars($values['watermark'], ENT_QUOTES); ?>" /><br />
<label for="ccslideshow-watermarkAlpha" title="The watermark transparancy is used when 'Watermark image' contains a value. Value has to be numeric from 0 (invisible) to 1.0 (solid).">Watermark transparancy:</label>
<input class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-watermarkAlpha" name="widget_creativeclans_slideshow[<?php echo $number; ?>][watermarkAlpha]" type="text" value="<?php echo htmlspecialchars($values['watermarkAlpha'], ENT_QUOTES); ?>" /><br />
<label for="ccslideshow-watermarkFullScreen" title="If 'yes', the watermark image will be stretched to fill the entire slide show window.">Watermark full screen:</label>
<select class="widefat" style="width: 100;" name="widget_creativeclans_slideshow[<?php echo $number; ?>][watermarkFullScreen]" id="widget_creativeclans_slideshow-<?php echo $number; ?>-watermarkFullScreen">
    <option value="yes"<?php echo $values['watermarkFullScreen'] == 'yes' ? ' selected="selected"' : ''; ?>>yes</option>
    <option value="no"<?php echo $values['watermarkFullScreen'] == 'no' ? ' selected="selected"' : ''; ?>>no</option>
</select>
<label for="ccslideshow-watermarkHorizontalOffset" title="The watermark horizontal offset is used when 'Watermark full screen' is 'no'. Has to be a numeric value.">Watermark horizontal offset:</label>
<input class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-watermarkHorizontalOffset" name="widget_creativeclans_slideshow[<?php echo $number; ?>][watermarkHorizontalOffset]" type="text" value="<?php echo htmlspecialchars($values['watermarkHorizontalOffset'], ENT_QUOTES); ?>" /><br />
<label for="ccslideshow-watermarkVerticalOffset" title="The watermark vertical offset is used when 'Watermark full screen' is 'no'. Has to be a numeric value.">Watermark vertical offset:</label>
<input class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-watermarkVerticalOffset" name="widget_creativeclans_slideshow[<?php echo $number; ?>][watermarkVerticalOffset]" type="text" value="<?php echo htmlspecialchars($values['watermarkVerticalOffset'], ENT_QUOTES); ?>" /><br />
<label for="ccslideshow-dynamicXmlCreation" title="If 'yes', the widget will not create any files in the widget folder. The XML files needed will be created 'on the fly' every time the slide show is loaded.">Dynamic XML creation:</label>
<select class="widefat" style="width: 100;" name="widget_creativeclans_slideshow[<?php echo $number; ?>][dynamicXmlCreation]" id="widget_creativeclans_slideshow-<?php echo $number; ?>-dynamicXmlCreation">
    <option value="yes"<?php echo $values['dynamicXmlCreation'] == 'yes' ? ' selected="selected"' : ''; ?>>yes</option>
    <option value="no"<?php echo $values['dynamicXmlCreation'] == 'no' ? ' selected="selected"' : ''; ?>>no</option>
</select>
<hr />
<B>Border settings</B><br />
<label for="ccslideshow-borderStyle" title="Choose the border style.">Style:</label>
<select class="widefat" style="width: 100;" name="widget_creativeclans_slideshow[<?php echo $number; ?>][borderStyle]" id="widget_creativeclans_slideshow-<?php echo $number; ?>-borderStyle">
    <option value="none"<?php echo $values['borderStyle'] == 'none' ? ' selected="selected"' : ''; ?>>none</option>
    <option value="solid"<?php echo $values['borderStyle'] == 'solid' ? ' selected="selected"' : ''; ?>>solid</option>
    <option value="blurred"<?php echo $values['borderStyle'] == 'blurred' ? ' selected="selected"' : ''; ?>>blurred</option>
    <option value="image"<?php echo $values['borderStyle'] == 'image' ? ' selected="selected"' : ''; ?>>image</option>
</select>
<label for="ccslideshow-borderColor" title="The border color is used when 'Style' is 'solid' or 'blurred'. The color value must be specified in the format 0xXXXXXX. For example: 0x000000 (black).">Color:</label>
<input class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-borderColor" name="widget_creativeclans_slideshow[<?php echo $number; ?>][borderColor]" type="text" value="<?php echo htmlspecialchars($values['borderColor'], ENT_QUOTES); ?>" /><br />
<label for="ccslideshow-borderThickness" title="The border thickness is used when 'Style' is 'solid' or 'blurred'. Value has to be numeric.">Thickness (px):</label>
<input class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-borderThickness" name="widget_creativeclans_slideshow[<?php echo $number; ?>][borderThickness]" type="text" value="<?php echo htmlspecialchars($values['borderThickness'], ENT_QUOTES); ?>" /><br />
<label for="ccslideshow-borderAlpha" title="The border transparancy is used when 'Style' is 'solid' or 'blurred'. Value has to be numeric from 0 (invisible) to 1.0 (solid).">Transparancy:</label>
<input class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-borderAlpha" name="widget_creativeclans_slideshow[<?php echo $number; ?>][borderAlpha]" type="text" value="<?php echo htmlspecialchars($values['borderAlpha'], ENT_QUOTES); ?>" /><br />
<label for="ccslideshow-borderImage" title="The border image is used when 'Style' is 'image'. Has to contain the absolute path (has to start with 'http://') to the image to be used.">Image:</label>
<input class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-borderImage" name="widget_creativeclans_slideshow[<?php echo $number; ?>][borderImage]" type="text" value="<?php echo htmlspecialchars($values['borderImage'], ENT_QUOTES); ?>" /><br />
<hr />
<B>Caption settings</B><br />
<label for="ccslideshow-captionStyle" title="Choose the caption style.">Style:</label>
<select class="widefat" style="width: 100;" name="widget_creativeclans_slideshow[<?php echo $number; ?>][captionStyle]" id="widget_creativeclans_slideshow-<?php echo $number; ?>-captionStyle">
    <option value="none"<?php echo $values['captionStyle'] == 'none' ? ' selected="selected"' : ''; ?>>none</option>
    <option value="fixed"<?php echo $values['captionStyle'] == 'fixed' ? ' selected="selected"' : ''; ?>>fixed</option>
    <option value="hide"<?php echo $values['captionStyle'] == 'hide' ? ' selected="selected"' : ''; ?>>hide</option>
</select>
<label for="ccslideshow-captionType" title="The caption type is used when 'Style' is 'fixed' or 'hide'.">Type:</label>
<select class="widefat" style="width: 100;" name="widget_creativeclans_slideshow[<?php echo $number; ?>][captionType]" id="widget_creativeclans_slideshow-<?php echo $number; ?>-captionType">
    <option value="text"<?php echo $values['captionType'] == 'text' ? ' selected="selected"' : ''; ?>>text</option>
    <option value="image"<?php echo $values['captionType'] == 'image' ? ' selected="selected"' : ''; ?>>image</option>
</select>
<label for="ccslideshow-captionBackgroundColor" title="The caption background color is used when 'Style' is 'fixed' or 'hide', and 'Type' is 'text'. The color value must be specified in the format 0xXXXXXX. For example: 0x000000 (black).">Background Color:</label>
<input class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-captionBackgroundColor" name="widget_creativeclans_slideshow[<?php echo $number; ?>][captionBackgroundColor]" type="text" value="<?php echo htmlspecialchars($values['captionBackgroundColor'], ENT_QUOTES); ?>" /><br />
<label for="ccslideshow-captionColor" title="The caption color is used when 'Style' is 'fixed' or 'hide', and 'Type' is 'text'. The color value must be specified in the format 0xXXXXXX. For example: 0xFFFFFF (white).">Color:</label>
<input class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-captionColor" name="widget_creativeclans_slideshow[<?php echo $number; ?>][captionColor]" type="text" value="<?php echo htmlspecialchars($values['captionColor'], ENT_QUOTES); ?>" /><br />
<label for="ccslideshow-captionText" title="The caption text is used when 'Style' is 'fixed' or 'hide', and 'Type' is 'text'. Used as caption text when no caption text has been specified for the single slide in 'Slide settings - Captions'.">Text:</label>
<input class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-captionText" name="widget_creativeclans_slideshow[<?php echo $number; ?>][captionText]" type="text" value="<?php echo htmlspecialchars($values['captionText'], ENT_QUOTES); ?>" /><br />
<label for="ccslideshow-captionTextRightMargin" title="The caption text right margin is used when 'Style' is 'fixed' or 'hide', and 'Type' is 'text'. Has to be a numeric value.">Text right margin:</label>
<input class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-captionTextRightMargin" name="widget_creativeclans_slideshow[<?php echo $number; ?>][captionTextRightMargin]" type="text" value="<?php echo htmlspecialchars($values['captionTextRightMargin'], ENT_QUOTES); ?>" /><br />
<label for="ccslideshow-captionTextLeftMargin" title="The caption text left margin is used when 'Style' is 'fixed' or 'hide', and 'Type' is 'text'. Has to be a numeric value.">Text left margin:</label>
<input class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-captionTextLeftMargin" name="widget_creativeclans_slideshow[<?php echo $number; ?>][captionTextLeftMargin]" type="text" value="<?php echo htmlspecialchars($values['captionTextLeftMargin'], ENT_QUOTES); ?>" /><br />
<label for="ccslideshow-captionTextBottomMargin" title="The caption text bottom margin is used when 'Style' is 'fixed' or 'hide', and 'Type' is 'text'. Has to be a numeric value.">Text bottom margin:</label>
<input class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-captionTextBottomMargin" name="widget_creativeclans_slideshow[<?php echo $number; ?>][captionTextBottomMargin]" type="text" value="<?php echo htmlspecialchars($values['captionTextBottomMargin'], ENT_QUOTES); ?>" /><br />
<label for="ccslideshow-captionTextFont" title="The caption text font is used when 'Style' is 'fixed' or 'hide', and 'Type' is 'text'. If the font doesn't exist, the default flash font (Times New Roman) will be used.">Font:</label>
<input class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-captionTextFont" name="widget_creativeclans_slideshow[<?php echo $number; ?>][captionTextFont]" type="text" value="<?php echo htmlspecialchars($values['captionTextFont'], ENT_QUOTES); ?>" /><br />
<label for="ccslideshow-captionTextFontSize" title="The caption text font size is used when 'Style' is 'fixed' or 'hide', and 'Type' is 'text'. Has to be a numeric value.">Font size:</label>
<input class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-captionTextFontSize" name="widget_creativeclans_slideshow[<?php echo $number; ?>][captionTextFontSize]" type="text" value="<?php echo htmlspecialchars($values['captionTextFontSize'], ENT_QUOTES); ?>" /><br />
<label for="ccslideshow-captionBackgroundAlpha" title="The caption transparancy is used when 'Style' is 'fixed' or 'hide', and 'Type' is 'text'. Value has to be numeric from 0 (invisible) to 1.0 (solid).">Transparancy:</label>
<input class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-captionBackgroundAlpha" name="widget_creativeclans_slideshow[<?php echo $number; ?>][captionBackgroundAlpha]" type="text" value="<?php echo htmlspecialchars($values['captionBackgroundAlpha'], ENT_QUOTES); ?>" /><br />
<label for="ccslideshow-captionPosition" title="The caption position is used when 'Style' is 'fixed' or 'hide'.">Position:</label>
<select class="widefat" style="width: 100;" name="widget_creativeclans_slideshow[<?php echo $number; ?>][captionPosition]" id="widget_creativeclans_slideshow-<?php echo $number; ?>-captionPosition">
    <option value="top"<?php echo $values['captionPosition'] == 'top' ? ' selected="selected"' : ''; ?>>top</option>
    <option value="bottom"<?php echo $values['captionPosition'] == 'bottom' ? ' selected="selected"' : ''; ?>>bottom</option>
    <option value="offset"<?php echo $values['captionPosition'] == 'offset' ? ' selected="selected"' : ''; ?>>offset</option>
</select>
<label for="ccslideshow-captionHorizontalOffset" title="The caption horizontal offset is used when 'Position' is 'offset'. Has to be a numeric value.">Horizontal offset:</label>
<input class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-captionHorizontalOffset" name="widget_creativeclans_slideshow[<?php echo $number; ?>][captionHorizontalOffset]" type="text" value="<?php echo htmlspecialchars($values['captionHorizontalOffset'], ENT_QUOTES); ?>" /><br />
<label for="ccslideshow-captionVerticalOffset" title="The caption vertical offset is used when 'Position' is 'offset'. Has to be a numeric value.">Vertical offset:</label>
<input class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-captionVerticalOffset" name="widget_creativeclans_slideshow[<?php echo $number; ?>][captionVerticalOffset]" type="text" value="<?php echo htmlspecialchars($values['captionVerticalOffset'], ENT_QUOTES); ?>" /><br />
<label for="ccslideshow-captionImage" title="The caption image is used when 'Style' is 'fixed' or 'hide', and 'Type' is 'image'. Has to contain the absolute path (has to begin with 'http://') to the image to be used.">Image:</label>
<input class="widefat" id="widget_creativeclans_slideshow-<?php echo $number; ?>-captionImage" name="widget_creativeclans_slideshow[<?php echo $number; ?>][captionImage]" type="text" value="<?php echo htmlspecialchars($values['captionImage'], ENT_QUOTES); ?>" /><br />
<?php
    }
    
    function render_widget_creativeclans_slideshow($par, $moduleid) {

//      $module_absolute_path = get_option('home') . '/'.PLUGINDIR.'/creative-clans-slide-show/';
      $module_absolute_path = get_bloginfo('wpurl') . '/'.PLUGINDIR.'/creative-clans-slide-show/';
//      $module_path = PLUGINDIR.'/creative-clans-slide-show/';
      $pathArray = explode('/', get_bloginfo('wpurl'));

      // change of module path identification after problems with GoDaddy
//      $module_path = dirname(__FILE__) . '/';
      $write_module_path = dirname(__FILE__) . '/';

      // --> if dynamicXmlCreation is 'no', then create the two xml files
      if ('no' == $par['dynamicXmlCreation']) {
        // If it doesn't exist yet, build config XML file
        $xmlconfig_filename = $write_module_path.'xmlconfig'.$moduleid.'.xml';
        if (!file_exists($xmlconfig_filename)) {
          $xml_data = widget_creativeclans_slideshow_buildConfigXML($par, $module_absolute_path);

          // Write config XML file
          $xmlconfig_file = fopen($xmlconfig_filename,'w');
          fwrite($xmlconfig_file, $xml_data);
          fclose($xmlconfig_file);
        }

        // If it doesn't exist yet, build slides XML file
        $xmlslides_filename = $write_module_path.'xmlslides'.$moduleid.'.xml';
        if (!file_exists($xmlslides_filename)) {
          $xml_data = widget_creativeclans_slideshow_buildSlidesXML($par);

          // Write slides XML file
          $xmlslides_file = fopen($xmlslides_filename,'w');
          fwrite($xmlslides_file, $xml_data);
          fclose($xmlslides_file);
        }
      }

      $result = 
<<<CCSSWIDGET
<div id="cc-is{$moduleid}" class="ccslideshow" style="width:{$par['width']}px height:{$par['height']}px">
    <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
            codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0"
            width="{$par['width']}" height="{$par['height']}">
      <param name="wmode" value="transparent" />
      <param name="movie" value="{$module_absolute_path}CCSlideShow.swf" />
      <param name="FlashVars" value="config={$module_absolute_path}xmlconfig{$moduleid}.xml&amp;slides={$module_absolute_path}xmlslides{$moduleid}.xml&amp;widget_number={$moduleid}&amp;scriptPath={$par['scriptPath']}&amp;dynamicXmlCreation={$par['dynamicXmlCreation']}" />
      <embed src="{$module_absolute_path}CCSlideShow.swf" 
             type="application/x-shockwave-flash"
             pluginspage="http://www.macromedia.com/go/getflashplayer"
             wmode="transparent"
             width="{$par['width']}" height="{$par['height']}" 
      			 FlashVars="config={$module_absolute_path}xmlconfig{$moduleid}.xml&amp;slides={$module_absolute_path}xmlslides{$moduleid}.xml&amp;widget_number={$moduleid}&amp;scriptPath={$par['scriptPath']}&amp;dynamicXmlCreation={$par['dynamicXmlCreation']}" />
    </object>
</div>
CCSSWIDGET;

?><?php
      return $result;
    }

add_action('widgets_init', 'widget_ccss_init');
      if (!$ccssversion = get_option('widget_creativeclans_slideshow_version')) $ccssversion = '';
      if ($ccssversion != '1.3.4') {
        // upgrade existing slideshows to version 1.3
        if ($ccssversion != '1.3' && $ccssversion != '1.3.1' && $ccssversion != '1.3.2' && $ccssversion != '1.3.3') {
          if ($options = get_option('widget_creativeclans_slideshow')) {
            foreach ($options as $key=>$value) {
            	$options[$key]['proxyFlag'] = 0;
            	$options[$key]['name'] = '';
            	$options[$key]['backgroundAlpha'] = 1.0;
            	$options[$key]['watermark'] = '';
            	$options[$key]['watermarkAlpha'] = 1.0;
            	$options[$key]['watermarkFullScreen'] = 'no';
            	$options[$key]['watermarkHorizontalOffset'] = 0;
            	$options[$key]['watermarkVerticalOffset'] = 0;
            	$options[$key]['borderImage'] = '';
            	$options[$key]['linktargets'] = '';
            	$options[$key]['loadFromFolder'] = 'no';
            	$options[$key]['dynamicXmlCreation'] = 'no';
            	$options[$key]['autoResize'] = 'yes';
              $options[$key]['scriptPath'] = get_bloginfo('wpurl') . '/'.PLUGINDIR.'/creative-clans-slide-show/creativeclans-slideshow-proxy.php';
            }  
            update_option('widget_creativeclans_slideshow', $options);
          }  
        }  
        // save new version number
        update_option('widget_creativeclans_slideshow_version', '1.3.4');
      }
?>