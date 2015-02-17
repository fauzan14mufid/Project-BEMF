=== Creative Clans Slide Show  ====
Contributors: tonnaer
Donate link: http://www.creativeclans.nl
Tags: slideshow, presentation, flash, widget, creative clans
Requires at least: 2.7
Tested up to: 4.0
Stable tag: 1.3.4

A free widget to use the Creative Clans Slide Show in your Wordpress website. 

== Description ==

A free, small (only 13Kb) flash slide show widget, that can easily be integrated
into your Wordpress 3.4 website, and can be entirely (or almost) personalized 
through a bunch of parameters.

New features:
* A title can be set
* Slides can be loaded through a proxy, enabling cross domain image loading
* The transparancy of the slide show's background can be set
* A watermark image, its transparancy, position and full-window display can be set
* A new border type: image
* The possibility to set a different target window for each slide
* The possibility to load all images (jpeg, gif and png) in a folder
* The possibility to use dynamic xml creation, which should resolve any write permission problems
* The possibility to choose if images must be resized to fit the slideshow window

Other features:
* also works if you've given [Wordpress its own directory](http://codex.wordpress.org/Giving_WordPress_Its_Own_Directory "Giving Wordpress its own directory")
* works with redirects
* works with permalinks
* height and width can be set
* 28 transition types
* links can be enabled (one for the whole slide show, or one for each slide)
* slides can be shown in forward, backward or random order
* border style, color, width and transparancy can be specified
* caption can be text or image
* caption can be the same for the whole slide show, or a different one for each slide
* caption characteristics (position, style, font, fontsize, color, transparancy, etc)
  can be specified
* you can have more than one slide show on your pages.
* etc.

== Installation ==

1. There are two ways to install the plugin:
   a) Use the 'automatic install from the Wordpress plugin directory' option in the
      Wordpress New widgets admin panel
   OR
   b) Download the zip-file, and use the 'upload' option in the Wordpress New widgets
      admin panel
2. Activate the plugin through the 'Plugins' menu in WordPress
3. Upload some pictures (remember to disable 'Organize my uploads into
   month- and year-based folders' in the Wordpress miscellanious settings, or use
   a plugin that allows you to upload the images to a folder with a fixed name, 
   or else you'll have to know the folder of each image and include it in the image
   name).
4. You can add the slide show through the 'Widgets' menu, and change the
   settings by editing the added widget.
5. You can add as many slide shows as you want. Each slide show has it's own 
   set of settings.
6. To make the images appear in the slide show, you need to set the first two
   parameters:
   * path : the absolute path (meaning it has to start with 'http://') to the slides 
            folder, WITH the final slash.
       (use this setting when you have disabled 'Organize my uploads into
        month- and year-based folders' in the Wordpress miscellanious settings, 
        or use a plugin that allows you to upload the images to a single folder)
   * Images : list of the image names, one image per line.    
       (if you didn't use the 'path' setting, or only put a part of the path
        there (because you've enabled 'Organize my uploads into month- and 
        year-based folders' in the Wordpress miscellanious settings, or anyway
        the images are stored in different folders), then you'll have to add
        the (missing part of) the path to the image names)
    
== Frequently Asked Questions ==

= Where I can find more documentation? =
On the plugin homepage, and in the 'settings documentation.txt' document included in the package.

= Can I make the slide show multi-lingual? =
Yes you can. It involves using the qTranslate plugin and the Widget Logic plugin. Read all the details on the plugin homepage.

= Why don't my .bmp images show? =
The slide show can use .jpeg, .jpg, .gif and .png. All other image formats won't be shown.

== Screenshots ==
No screenshots are available

== Changelog ==

= 1.3.4 =
* Bugfix: load from folders didn't work correctly in 1.3.3

= 1.3.3 =
* Improved image loading management (consumes less bandwidth)

= 1.3.2 =
* Bugfix - hmtl wmode parameter set from opaque to transparent to get the transparent background to work

= 1.3.1 =
* Fixes a problem with the title when no title is set

= 1.3 =
* title can be set
* proxy can be used to enable cross domain image loading
* background transparancy can be set
* a watermark image can be used and its transparancy, position and resizing to fit slideshow window set
* a new border type (image) can be used
* a different target window for each slide can be set
* the possibility to load all images (jpeg, gif and png) in a folder
* the possibility to use dynamic xml creation, which should resolve any write permission problems
* the possibility to choose if images must be resized to fit the slideshow window
* 'link for all slides' behavior has changed: it does no longer override the links specified for each single slide, but is used only if the slide has no link specified
* 'caption text for all slides' behaviour has changed: it does no longer override the captions specified for each single slide, but is used only if the slide has no caption

= 1.2.2 =
* resolves a problem that presented itself on GoDaddy sites

= 1.2.1 =
* also works if you've given 'Wordpress its own directory'

= 1.2 =
* Works with redirects

= 1.1 =
* Works with permalinks

= 1.0 =
* Initial release version
