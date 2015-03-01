<?php
/**
 * Circles Gallery.
 *
 * @package   CirclesGallery_Admin
 * @author    GreenTreeLabs <diego@greentreelabs.net>
 * @license   GPL-2.0+
 * @link      http://greentreelabs.net
 * @copyright 2014 GreenTreeLabs
 */

class CirclesGallery_Admin
{
	/**
	 * Instance of this class.
	 *
	 * @since    1.0.0
	 *
	 * @var      object
	 */
	protected static $instance = null;

	/**
	 * Default settings values
	 *
	 * @since    1.0.0
	 *
	 * @var      object
	 */
	 protected $settings = null;
	 protected $fields;

	/**
	 * Slug of the plugin screen.
	 *
	 * @since    1.0.0
	 *
	 * @var      string
	 */
	protected $plugin_slug;

	protected $plugin_screen_hook_suffix = null;	
	
	/**
	 * Default values
	 *
	 * @since    1.0.0
	 *
	 * @var      string
	 */
	protected $defaults = array(
		'gallery_width' => '100%',
		'circle_width' => '200',
		'circle_max_width' => '98%',
		'item_height' => '',
		'columns_no' => '4',
		'columns_no_1024' => '4',
		'columns_no_768' => '3',
		'columns_no_phone' => '2',
		'circle_border_size' => '16',
		'circle_border_color' => '#ffffff',
		'circle_background_color' => '#333333',
		'title_font_size' => '22',
		'title_color' => '#ffffff',
		'description_font_size' => '12',
		'description_color' => '#ffffff',
		'text_position' => 'outside',
		'circle_icon' => 'fa-link',
		'circle_icon_color' => '#ffffff',
		'hover_effect' => '1|effect1',
		'margin_bottom' => '40',
		'click_action' => 'none',
		'colorbox_theme' => 'style1',
		'prettyphoto_theme' => 'pp_default',
		'custom_css' => '',
		'cache_writable' => false
	);

	/**
	 * Initialize the plugin by loading admin scripts & styles and adding a
	 * settings page and menu.
	 *
	 * @since     1.0.0
	 */
	private function __construct()
	{
		$plugin = CirclesGallery::get_instance();
		$this->plugin_slug = $plugin->get_plugin_slug();

		$this->default_settings = $this->defaults;
		$this->settings = $this->get_options();

		//delete_option(CIRCLES_GALLERY_OPT_NAME);

		/*$opt = get_option(CIRCLES_GALLERY_OPT_NAME);
		if(! $opt)
		{
			$this->assign_default_values();
		}
		else
		{
			$this->settings = (array)json_decode($opt);
		}*/

		// Load admin style sheet and JavaScript.
		add_action( 'admin_enqueue_scripts', array( $this, 'enqueue_admin_styles' ) );
		add_action( 'admin_enqueue_scripts', array( $this, 'enqueue_admin_scripts' ) );
		add_filter( 'plugin_row_meta',array( $this, 'register_links' ), 10, 2);
		
		// Add the options page and menu item.
		global $current_user;
		if(current_user_can('manage_options'))
		{
			add_action('admin_menu', array($this, 'add_plugin_admin_menu'));
			add_action('admin_init', array($this, 'init'));
		}		

		// Add an action link pointing to the options page.
		$plugin_basename = plugin_basename( plugin_dir_path( realpath( dirname( __FILE__ ) ) ) . $this->plugin_slug . '.php' );
		add_filter( 'plugin_action_links_' . $plugin_basename, array( $this, 'add_action_links' ) );

		add_filter("attachment_fields_to_edit", array($this, 'cg_image_attachment_fields_to_edit'), null, 2);
		add_filter("attachment_fields_to_save", array($this, 'cg_image_attachment_fields_to_save'), null , 2);

		add_filter('mce_buttons', array($this, 'editor_button'));
		add_filter('mce_external_plugins', array($this, 'register_editor_plugin'));
		add_action('wp_ajax_cg_shortcode_editor', array($this, 'cg_shortcode_editor'));	

		add_action( 'admin_bar_menu', array($this, 'gallery_admin_bar'), 100);
	}
	
	public function register_links($links, $file)
	{
		$base = plugin_basename(CIRCLES_GALLERY_FILE);
        if ($file == $base) {
            $links[] = '<a href="options-general.php?page=circles-gallery" title="Circles Gallery Settings">Settings</a>';
            $links[] = '<a href="http://circles-gallery.com/wordpress/purchase.html" title="Buy a PRO license">Buy a PRO license</a>';
            $links[] = '<a href="https://twitter.com/greentreelabs" title="@GreenTreeLabs on Twitter">Twitter</a>';
            $links[] = '<a href="https://www.facebook.com/greentreelabs" title="GreenTreeLabs on Facebook">Facebook</a>';
            $links[] = '<a href="https://www.google.com/+GreentreelabsNetjs" title="GreenTreeLabs on Google+">Google+</a>';
        }
        return $links;
	}

	
	public function gallery_admin_bar()
		{
            global $wp_admin_bar;

            $wp_admin_bar->add_menu( array(
                    'id'     => 'cg-upgrade-bar',
                    'href' => 'http://circles-gallery.com/wordpress/purchase.html',
                    'parent' => 'top-secondary',
					'title' => __('Upgrade to Circles Gallery PRO'),
                    'meta'   => array('class' => 'cg-upgrade-to-pro', 'target' => '_blank' ),
                ) );
		}

	function get_options()
	{
		$saved_options = get_option(CIRCLES_GALLERY_OPT_NAME);
		if (!empty($saved_options))
		{
			foreach($this->default_settings as $key => $val)
			{
				if(isset($saved_options[$key])){
					if($saved_options[$key] !== '-1'){
						$this->default_settings[$key] = $saved_options[$key];
					}
				}
			}
		}
		return $this->default_settings;
	}

	/**
	 * Register the administration menu for this plugin into the WordPress Dashboard menu.
	 *
	 * @since    1.0.0
	 */
	public function add_plugin_admin_menu()
	{
		$this->plugin_screen_hook_suffix = add_options_page(
			__( 'Circles Gallery Settings', $this->plugin_slug ),
			__( 'Circles Gallery', $this->plugin_slug ),
			'manage_options',
			$this->plugin_slug,
			array( $this, 'build_settings_page' )
		);
	}	

	public function init()
	{		
		$this->fields = array(
			"gallery_width" => array(
				"name" => "Gallery width",
				"type" => "text",
				"description" => "Width of the entire gallery. Use a % value in case of responsive themes."
			),
			"circle_width" => array(
				"name" => "Circle width",
				"type" => "text",
				"description" => "Width of circles in pixels"
			),
			"circle_max_width" => array(
				"name" => "Circle max width",
				"type" => "text",
				"description" => "Max width of circles. You <strong>MUST</strong> include the measuring unit: px or %"
			),			
			"columns_no" => array(
				"name" => "Column number",
				"type" => "text",
				"description" => "Number of columns for each row"
			),
			"columns_no_1024" => array(
				"name" => "Column number (tablet landscape)",
				"type" => "text",
				"description" => "Number of columns for each row on tablets with landascape orientation"
			),
			"columns_no_768" => array(
				"name" => "Column number (tablet portrait)",
				"type" => "text",
				"description" => "Number of columns for each row on tablets with portrait orientation"
			),
			"columns_no_phone" => array(
				"name" => "Column number (phones)",
				"type" => "text",
				"description" => "Number of columns for each row on mobile phones"
			),
	    	"hover_effect" => array(
	        	"name" => "Hover effect",
	        	"type" => "hover_selection",
	        	"description" => "Choose the effect to apply on mouse over. <a class='buy' target='_blank' href='http://circles-gallery.com/wordpress/purchase.html'>PURCHASE a license to unlock <em>57</em> additional effects.</a>"
	    	),
	    	"circle_background_color" => array(
				"name" => "Circle background color",
				"type" => "color",
				"description" => "Color of the background."
			),
			"circle_border_size" => array(
				"name" => "Border size",
				"type" => "text",
				"description" => "Size of the opaque border around the image"
			),
			"circle_border_color" => array(
				"name" => "Border color",
				"type" => "color",
				"description" => "Color of the opaque border around the image"
			),
			"text_position" => array(
				"name" => "Text position",
				"type" => "select",
				"description" => "Choose whether to have the text inside the circle or outside",
				"options" => array(
					"Inside" => "inside",
					"Outside" => "outside"
				)
			),
			"item_height"  => array(
				"name" => "Item height",
				"type" => "text",
				"description" => "Height of the outside text (when <i>Text position</i> is set to <i>Outside</i>). Leave the field empty to have an automatic height, otherwise enter the amount of pixels"
			),
			"circle_icon" => array(
				"name" => "Circle icon",
				"type" => "select",
				"options" => array(
					"Link"=> "fa-link",
					"Camera" => "fa-camera",
					"Heart" => "fa-heart",
					"Lens" => "fa-search-plus",
					"Star" => "fa-star"
				),
				"description" => "Choose an icon, visible only with <i>Text position: Outside</i>. <a class='buy' target='_blank' href='http://circles-gallery.com/wordpress/purchase.html'>PURCHASE a license to unlock 5 additional lightboxes.</strong>"
			),
			"circle_icon_color" => array(
				"name" => "Circle icon color",
				"type" => "color",
				"description" => "Color of the icon. Visible only with <i>Text position: Outside</i>"
			),
			"title_font_size" => array(
				"name" => "Title font size",
				"type" => "text",
				"description" => "Size of the font used for the title (leave blank to inherit from your theme style)"
			),
			"title_color" => array(
				"name" => "Title color",
				"type" => "text",
				"description" => "Color of the title (leave blank to inherit from your theme style)"
			),
			"description_font_size" => array(
				"name" => "Description font size",
				"type" => "text",
				"description" => "Size of the font used for the description (leave blank to inherit from your theme style)"
			),
			"description_color" => array(
				"name" => "Description color",
				"type" => "color",
				"description" => "Color of the description (leave blank to inherit from your theme style)"
			),
			"click_action" => array(
				"name" => "Click action",
				"type" => "select",
				"description" => "Choose what happens when an image is clicked. Custom links will automatically override this settings. <a class='buy' target='_blank' href='http://circles-gallery.com/wordpress/purchase.html'>PURCHASE a license to unlock 5 additional lightboxes.</a>",
				"options" => array(
					"Turn the links off. Disable pointer cursor and clickability."=> "none", 				
					"Link to the attachment page" => "attachment_page",
					"Link to the image file" => "image",
					"Lightbox" => "lightbox"
				)
			),
			"colorbox_theme" => array(
				"name" => "ColorBox theme",
				"type" => "select",
				"options" => array(
					 "Style 1" => "style1",
					 "Style 2" => "style2",
					 "Style 3" => "style3",
					 "Style 4" => "style4",
					 "Style 5" => "style5"
				),
				"description" => "Theme of the ColorBox lightbox. <a class='buy' target='_blank' href='http://circles-gallery.com/wordpress/purchase.html'>PURCHASE a license to unlock 5 additional lightboxes.</a>"
			),
			"prettyphoto_theme" => array(
				"name" => "PrettyPhoto theme",
				"type" => "select",
				"options" => array(
					"Dark rounded" => "dark_rounded",
					"Dark_square" => "dark_square",
					"Default" => "pp_default",
					"Facebook" => "facebook",
					"Light rounded" => "light_rounded",
					"Light square" => "light_square"
				),
				"description" => "Theme of the PrettyPhoto lightbox. <a class='buy' target='_blank' href='http://circles-gallery.com/wordpress/purchase.html'>PURCHASE a license to unlock 5 additional lightboxes.</a>"
			),
			"margin_bottom" => array(
				"name" => "Bottom margin",
				"type" => "text",
				"description" => "Margin between image rows"
			),
			"custom_css" => array(
				"name" => "Custom CSS",
				"type" => "textarea",
				"description" => "In case you need some fine tuning you can write here your custom CSS rules (tag &lt;style&gt; is not needed)"
			)
		);

		register_setting(CIRCLES_GALLERY_OPT_NAME, CIRCLES_GALLERY_OPT_NAME);

		add_settings_section(
			'cg_general_settings_section',
			__('General settings', 'cg_td'),
			array($this, 'cg_print_general_settings_desc'),
			$this->plugin_slug
		);  

		foreach ($this->fields as $key => $field) 
		{
			if(! array_key_exists('options', $field))
				$field['options'] = array();

			add_settings_field(
				'cg_' . $key,
				__($field['name'], 'cg_td'),
				array($this, 'print_field_' . $field['type']),
				$this->plugin_slug,
				'cg_general_settings_section',
				array(	'id' => $key,
						'label' => __($field["description"]),
						'options' => $field["options"]	
				)
			);
		}		
	}

	function print_field_text($args)
	{
		extract($args);
		print '<input type="text" autocomplete="off" id="'.$id.'" name="'.CIRCLES_GALLERY_OPT_NAME.'['.$id.']" value="'.$this->settings[$id].'" /><div class="help">'.$label.'</div>';
	}

	function print_field_select($args)
	{
		extract($args);
		print '<select id="'.$id.'" name="'.CIRCLES_GALLERY_OPT_NAME.'['.$id.']">';
		foreach ($options as $l => $value) 
		{
			print "<option ".($this->settings[$id] == $value ? "selected" : "")." value='$value'>$l</option>";
		}
		print '</select><div class="help">'.$label.'</div>';
	}

	function print_field_color($args)
	{
		extract($args);
		print '<input type="text"  class="color-field" autocomplete="off" id="'.$id.'" name="'.CIRCLES_GALLERY_OPT_NAME.'['.$id.']" value="'.$this->settings[$id].'" /><div class="help">'.$label.'</div>';
	}
	
	function print_field_textarea($args)
	{
		extract($args);
		print '<textarea autocomplete="off" id="'.$id.'" name="'.CIRCLES_GALLERY_OPT_NAME.'['.$id.']">'.$this->settings[$id].'</textarea><div class="help">'.$label.'</div>';
	}

	function print_field_hover_selection($args)
	{
		$assets = plugins_url( 'assets', __FILE__ );
		extract($args);
		print '<select class="effect-name" id="'.$id.'" name="'.CIRCLES_GALLERY_OPT_NAME.'['.$id.']"><option value="none">None</option></select>' .
				'<div class="help"><a class=\'buy\' href=\'http://circles-gallery.com/wordpress/purchase.html\'>PURCHASE a license to unlock <em>57</em> additional effects.</a></div>' .
				'<input type="hidden" value="'.$this->settings[$id].'" name="hover_effect_bridge" />' .
                '<div class="effects">' .
                    '<ul class="slides">';
                        include("views/hover_slider.php");
        print      	'</ul>';
        print  '</div>';
	}

	function cg_print_general_settings_desc()
	{
		echo '<p id="cg_general_settings">'.__('General layout, appearance and behavior settings, utilities for your Circles Gallery.', 'cg_td').'</p>';  
	} 

	function attempt_chmod()
	{
		//check_ajax_referer('attempt_chmod', 'security');
		$permission = $_REQUEST['permission'];
		$output = array();
		$output['message'] = '';

		if(chmod(CIRCLES_GALLERY_DIR . "/public/cache", ($permission == "0755" ? 0755 : 0777)))
			$output['message'] .= sprintf(__('Plugin folder %s chmod is <strong>successful</strong> to %s.<br/>','td'),'(<span style="color:#888">'.dirname(__FILE__).'</span>)',$permission);
		else
			$output['message'] .= sprintf(__('Plugin folder %s chmod <strong>failed</strong>.<br/>','td'),'(<span style="color:#888">'.dirname(__FILE__).'</span>)');

		if(chmod(CIRCLES_GALLERY_DIR . "/timthumb.php", ($permission == "0755" ? 0755 : 0777)))
			$output['message'] .= sprintf(__('File %s chmod is <strong>successful</strong> to %s.<br/>','td'),'(<span style="color:#888">'.dirname(__FILE__)."/timthumb.php".'</span>)',$permission);
		else
			$output['message'] .= sprintf(__('File %s chmod <strong>failed</strong>.<br/>','td'),'(<span style="color:#888">'.dirname(__FILE__)."/timthumb.php".'</span>)');

		if(chmod(CIRCLES_GALLERY_DIR . "/public/cache", ($permission == "0755" ? 0755 : 0777)))
			$output['message'] .= sprintf(__('Cache folder %s chmod is <strong>successful</strong> to %s.<br/>','td'),'(<span style="color:#888">'.dirname(__FILE__)."/cache".'</span>)',$permission);
		else
			$output['message'] .= sprintf(__('Cache folder %s chmod <strong>failed</strong>.<br/>','td'),'(<span style="color:#888">'.dirname(__FILE__)."/cache".'</span>)');
		
		if(chmod(CIRCLES_GALLERY_DIR . "/public/cache/index.html", ($permission == "0755" ? 0755 : 0777)))
			$output['message'] .= sprintf(__('File %s chmod is <strong>successful</strong> to %s.<br/>','td'),'(<span style="color:#888">'.dirname(__FILE__)."/cache/index.html".'</span>)',$permission);
		else
			$output['message'] .= sprintf(__('File %s chmod <strong>failed</strong>.<br/>','td'),'(<span style="color:#888">'.dirname(__FILE__)."/cache/index.html".'</span>)');
		
		if(chmod(CIRCLES_GALLERY_DIR . "/public/cache/cg_timthumb_cacheLastCleanTime.touch", ($permission == "0755" ? 0755 : 0777)))
			$output['message'] .= sprintf(__('File %s chmod is <strong>successful</strong> to %s.<br/>','td'),'(<span style="color:#888">'.dirname(__FILE__)."/cache/cg_timthumb_cacheLastCleanTime.touch".'</span>)',$permission);
		else
			$output['message'] .= sprintf(__('File %s chmod <strong>failed</strong>.<br/>','td'),'(<span style="color:#888">'.dirname(__FILE__)."/cache/cg_timthumb_cacheLastCleanTime.touch".'</span>)');
					
		echo json_encode($output);
		die();
	}

	// adds custom link functionality to gallery images
	function cg_image_attachment_fields_to_edit($form_fields, $post)
	{
		$form_fields["cg_image_link"] = array(
			"label" => __('CG Link', 'cg_td'),
			"input" => "text",
			"value" => get_post_meta($post->ID, "_cg_image_link", true),
			"helps" => __('Use this when creating a gallery with Circles Gallery and you wish to point the image link to a custom URL', 'cg_td'),
		);
		$form_fields["cg_image_link_target"] = array(
			"label" => __('cg Target', 'cg_td'),
			"input" => "html",
			"html" => "<div style='padding-top:5px; font-weight:bold;'><input style='width:auto;' type='radio' ".checked(get_post_meta($post->ID, "_cg_image_link_target", true), '',false).checked(get_post_meta($post->ID, "_cg_image_link_target", true), 'default',false)." value='default' id='attachments[{$post->ID}][cg_image_link_target]' name='attachments[{$post->ID}][cg_image_link_target]'><label style='margin: 0 5px;' for='attachments[{$post->ID}][cg_image_link_target]'>default</label>
			<input style='width:auto;' type='radio' ".checked(get_post_meta($post->ID, "_cg_image_link_target", true), '_blank',false)." value='_blank' id='attachments[{$post->ID}][cg_image_link_target]-blank' name='attachments[{$post->ID}][cg_image_link_target]'><label style='margin: 0 5px;' for='attachments[{$post->ID}][cg_image_link_target]-blank'>_blank</label><br />
			<input style='width:auto;' type='radio' ".checked(get_post_meta($post->ID, "_cg_image_link_target", true), '_self',false)." value='_self' id='attachments[{$post->ID}][cg_image_link_target]-self' name='attachments[{$post->ID}][cg_image_link_target]'><label style='margin: 0 5px;' for='attachments[{$post->ID}][cg_image_link_target]-self'>_self</label>"
		);		
		return $form_fields;
	}

	// saves it
	function cg_image_attachment_fields_to_save($post, $attachment)
	{
		if(isset($attachment['cg_image_link'])){
			update_post_meta($post['ID'], '_cg_image_link', $attachment['cg_image_link']);
		}
		if(isset($attachment['cg_image_link_target'])){
			update_post_meta($post['ID'], '_cg_image_link_target', $attachment['cg_image_link_target']);
		}		
		return $post;
	}

	/**
	 * Return an instance of this class.
	 *
	 * @since     1.0.0
	 *
	 * @return    object    A single instance of this class.
	 */
	public static function get_instance()
	{

		// If the single instance hasn't been set, set it now.
		if ( null == self::$instance ) {
			self::$instance = new self;
		}

		return self::$instance;
	}

	/**
	 * Register and enqueue admin-specific style sheet.
	 *
	 * @since     1.0.0
	 *
	 * @return    null    Return early if no settings page is registered.
	 */
	public function enqueue_admin_styles()
	{

		if ( ! isset( $this->plugin_screen_hook_suffix ) ) {
			return;
		}

		$screen = get_current_screen();
		if ( $this->plugin_screen_hook_suffix == $screen->id )
		{
			wp_enqueue_style( $this->plugin_slug .'-admin-styles', plugins_url( 'assets/css/admin.css', __FILE__ ), array(), CirclesGallery::VERSION );

			wp_enqueue_style( 'wp-color-picker' );
		}

	}

	/**
	 * Register and enqueue admin-specific JavaScript.
	 *
	 * @TODO:
	 *
	 * - Rename "CirclesGallery" to the name your plugin
	 *
	 * @since     1.0.0
	 *
	 * @return    null    Return early if no settings page is registered.
	 */
	public function enqueue_admin_scripts()
	{
		if ( ! isset( $this->plugin_screen_hook_suffix ) )
		{
			return;
		}

		$screen = get_current_screen();
		if ( $this->plugin_screen_hook_suffix == $screen->id )
		{
			wp_enqueue_script( $this->plugin_slug . '-admin-script', plugins_url( 'assets/js/admin.js', __FILE__ ), array( 'jquery', 'wp-color-picker' ), CirclesGallery::VERSION );
		}

	}

	/**
	 * Render the settings page for this plugin.
	 *
	 * @since    1.0.0
	 */
	public function build_settings_page()
	{
		wp_enqueue_script('jquery');		
		$from_editor = false;
		include 'views/options.php';
	}

	/**
	 * Add settings action link to the plugins page.
	 *
	 * @since    1.0.0
	 */
	public function add_action_links( $links )
	{
		return array_merge(
			array(
				'settings' => '<a href="' . admin_url( 'options-general.php?page=' . $this->plugin_slug ) . '">' . __( 'Settings', $this->plugin_slug ) . '</a>'
			),
			$links
		);

	}

	/**
	 * NOTE:     Actions are points in the execution of a page or process
	 *           lifecycle that WordPress fires.
	 *
	 *           Actions:    http://codex.wordpress.org/Plugin_API#Actions
	 *           Reference:  http://codex.wordpress.org/Plugin_API/Action_Reference
	 *
	 * @since    1.0.0
	 */
	public function action_method_name()
	{
		// @TODO: Define your action hook callback here
	}

	/**
	 * NOTE:     Filters are points of execution in which WordPress modifies data
	 *           before saving it or sending it to the browser.
	 *
	 *           Filters: http://codex.wordpress.org/Plugin_API#Filters
	 *           Reference:  http://codex.wordpress.org/Plugin_API/Filter_Reference
	 *
	 * @since    1.0.0
	 */

	public function editor_button($buttons)
	{
		array_push($buttons, 'separator', 'cg_shortcode_editor');
		return $buttons;
	}

	public function register_editor_plugin($plugin_array)
	{
		$plugin_array['cg_shortcode_editor'] = plugins_url('/assets/js/circles-plugin.js',__file__);
		return $plugin_array;
	}

	public function cg_shortcode_editor()
	{
		$from_editor = true;
		$css_path = plugins_url( 'assets/css/admin.css', __FILE__ );
		$admin_url = admin_url();
		include 'includes/cg-shortcode-editor.php';
		die();
	}

	public function include_options($editor=false)
	{
		global $from_editor;
		global $show_message;

		$assets = plugins_url( 'assets', __FILE__ );
		$from_editor = $editor;
		include 'views/options.php';
	}

	function bypass_editor_max_image_size()
	{
		if(!empty($width) && !empty($height))
		{
			return array($width, $height);
		}

		return;
	}
}

