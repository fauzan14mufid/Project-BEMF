<?php
/**
 * Circles Gallery.
 *
 * @package   CirclesGallery
 * @author    GreenTreeLabs <diego@greentreelabs.net>
 * @license   GPL-2.0+
 * @link      http://greentreelabs.net
 * @copyright 2014 GreenTreeLabs
 */

require_once( 'includes/BFI_Thumb.php' );

/**
 * @package CirclesGallery
 * @author    GreenTreeLabs <diego@greentreelabs.net>
 */
class CirclesGallery {

	/**
	 * @since   1.0.0
	 *
	 * @var     string
	 */
	const VERSION = '1.0.0';

	/**
	 * @since    1.0.0
	 *
	 * @var      string
	 */
	protected $plugin_slug = 'circles-gallery';

	/**
	 * @since    1.0.0
	 *
	 * @var      object
	 */
	protected static $instance = null;

	protected $settings = null;
	/**
	 * @since     1.0.0
	 */
	private function __construct() 
	{
		$this->settings = get_option(CIRCLES_GALLERY_OPT_NAME);

		// Load plugin text domain
		add_action( 'init', array( $this, 'load_plugin_textdomain' ) );

		//Add shortcode
		add_shortcode( 'circles_gallery', array($this, 'gallery_shortcode_handler') );		

		// Activate plugin when new blog is added
		add_action( 'wpmu_new_blog', array( $this, 'activate_new_site' ) );

		// Load public-facing style sheet and JavaScript.
		add_action( 'wp_enqueue_scripts', array( $this, 'enqueue_styles' ) );
		add_action( 'wp_enqueue_scripts', array( $this, 'enqueue_scripts' ) );		
		
		$this->galleryIndex = 1;		
	}
	
	private function toRGB($Hex)
    {            
        if (substr($Hex,0,1) == "#")
            $Hex = substr($Hex,1);
        
        $R = substr($Hex,0,2);
        $G = substr($Hex,2,2);
        $B = substr($Hex,4,2);

        $R = hexdec($R);
        $G = hexdec($G);
        $B = hexdec($B);

        $RGB['R'] = $R;
        $RGB['G'] = $G;
        $RGB['B'] = $B;
        
        $RGB[0] = $R;
        $RGB[1] = $G;
        $RGB[2] = $B;

        return $RGB;

    }
	
	private function get_post_by_id($posts, $id)
	{
		foreach($posts as $post)
		{
			if($post->ID == $id)
			{
				return $post;
			}	
		}
	}
	


	/**
	 * @since    1.0.0
	 */	 
	public $galleryIndex = 1;
	public function gallery_shortcode_handler($atts)
	{
		global $post;  
		$defaults = $this->settings;
		
		$galleryId = "circles-gallery-" . ($this->galleryIndex++);
		
		extract(shortcode_atts(array(
			'gallery_width' => $defaults['gallery_width'],
			'circle_width' => $defaults['circle_width'],
			'circle_max_width' => $defaults['circle_max_width'],
			'columns_no' => $defaults['columns_no'],
			'columns_no_1024' => $defaults['columns_no_1024'],
			'columns_no_768' => $defaults['columns_no_768'],
			'columns_no_phone' => $defaults['columns_no_phone'],
			'circle_background_color'=> $defaults['circle_background_color'],
			'hover_effect' => $defaults['hover_effect'],
			'title_font_size' => $defaults['title_font_size'],
			'title_color' => $defaults['title_color'],
			'description_font_size' => $defaults['description_font_size'],
			'description_color' => $defaults['description_color'],
			'circle_border_size' => $defaults['circle_border_size'],
			'circle_border_color' => $defaults['circle_border_color'],
			'margin_bottom' => $defaults['margin_bottom'],
			'text_position' => $defaults['text_position'],
			'circle_icon' => $defaults['circle_icon'],
			'circle_icon_color' => $defaults['circle_icon_color'],
			'item_height' => $defaults['item_height'],
			'custom_css' => $defaults['custom_css'],
			'click_action' => $defaults['click_action'],
			'prettyphoto_theme' => $defaults['prettyphoto_theme'],
			'colorbox_theme' => $defaults['colorbox_theme'],
			'ids' => ''
		), $atts));	


		list($effectNo, $effectClasses) = explode("|", $hover_effect);

		if(empty($item_height))
			$item_height = "auto";
		else
			$item_height .= "px";

		$borderColorRGB = $this->toRGB($circle_border_color);
		$circleBgRGB = $this->toRGB($circle_background_color);

		$args = array(
			'post_type'				=> 'attachment',
			'post_mime_type'		=> 'image',
			'posts_per_page' 		=> -1,
			'post__in'				=> explode(",", $ids)
		); 
		
		$attachments_from_query = get_posts($args);
		$attachments = array();

		foreach(explode(",", $ids) as $id)
		{
			$attachments []= $this->get_post_by_id($attachments_from_query, $id);
		}

		$html = "";
		$this->images = $url_hash_list = array();
				
		$dir = plugin_dir_path( __FILE__ ) . '/images/';
		$purl = plugins_url("images", __FILE__);
		
		$infoPanel = ".info";
		if($effectNo == "20")
			$infoPanel = ".info .info-back";

		$html .= "<link rel='stylesheet' type='text/css' media='all' href='".plugins_url( 'assets/css/effect'.$effectNo.'.css', __FILE__ )."'>";

		$html 	.= "<style>\n";
		$html 	.= "	#circles-gallery-$galleryId { width: $gallery_width }\n";
		$html 	.= "	#circles-gallery-$galleryId .cg-item { width: ".(100 / $columns_no)."%; }\n";
		$html 	.= "	#circles-gallery-$galleryId .cg-item .outside-text p { height: $item_height; }\n";
		$html 	.= "	#circles-gallery-$galleryId .cg-item { margin-bottom: ".$margin_bottom."px; }\n";
		$html 	.= "	#circles-gallery-$galleryId .cg-item .ih-item $infoPanel { " .
						"background-color: rgb(".$circleBgRGB[0].", ".$circleBgRGB[1].", ".$circleBgRGB[2]."); }\n";

		$html 	.= "	#circles-gallery-$galleryId .cg-item .ih-item $infoPanel { " .
						"background-color: rgba(".$circleBgRGB[0].", ".$circleBgRGB[1].", ".$circleBgRGB[2].", 0.9); }\n";
		$html 	.= "	#circles-gallery-$galleryId .cg-item .ih-item i.fa { " .
						"color: ".$circle_icon_color."; }\n";

		$html 	.= "	#circles-gallery-$galleryId .cg-item .circle a.link img { border-radius: ".$circle_width."px; }\n";
		$html   .= "	#circles-gallery-$galleryId .cg-item .circle .img:before { box-shadow: inset 0 0 0 ".$circle_border_size."px ".
							"rgba(".$borderColorRGB[0].", ".$borderColorRGB[1].", ".$borderColorRGB[2].", 0.6), 0 1px 2px rgba(0, 0, 0, 0.3) }\n";
		
		$html 	.= "	@media screen and (max-width: 1024px) {\n";
		$html   .= "		#circles-gallery-$galleryId .cg-item { width: ".(100 / $columns_no_1024)."%; }\n";
		$html   .= "}\n";
		
		$html 	.= "	@media screen and (max-width: 768px) {\n";
		$html   .= "		#circles-gallery-$galleryId .cg-item { width: ".(100 / $columns_no_768)."%; }\n";
		$html   .= "}\n";
		
		$html 	.= "	@media screen and (max-width: 480px) {\n";
		$html   .= "		#circles-gallery-$galleryId .cg-item { width: ".(100 / $columns_no_phone)."%; }\n";
		$html   .= "}\n";
		
		$html   .= "	#circles-gallery-$galleryId .cg-item .ih-item.circle { width: ".$circle_width ."px; max-width: $circle_max_width;  }\n";
			
		
		$html   .= "	#circles-gallery-$galleryId .cg-item  h3 { font-size: ".$title_font_size."px; color: ".$title_color."; }\n";
		$html   .= "	#circles-gallery-$galleryId .cg-item p { font-size: ".$description_font_size."px; color: ".$description_color."; }\n";		
		
		$html   .= $custom_css;		
		
		$html .= "</style>\n";
		
		$html .= "<div class='circles-gallery' id='circles-gallery-$galleryId'>\n";
		
		$tt = plugins_url('resize.php', CIRCLES_GALLERY_DIR . "/resize.php");

		$rel = "";
		$lightbox = "";
		$params = array( 'width' => $circle_width, 'height' => $circle_width, 'crop' => true );
		$bigParams = array( 'width' => 800 );

		if($click_action == "lightbox") 
		{
			$rel = "lightbox";
			$lightbox = $rel;
			wp_register_script("lightbox", plugins_url('assets/lightbox/lightbox.min.js', __FILE__), 'jquery', '1.3.19', true);
			wp_enqueue_script("lightbox");
			wp_register_style('lightbox-style', plugins_url('assets/lightbox/css/lightbox.css', __FILE__), false);
			wp_enqueue_style('lightbox-style');
		}
		foreach ($attachments as $attachment)
		{
			$url = wp_get_attachment_url($attachment->ID);
			$link = esc_attr(stripslashes(get_post_meta($attachment->ID, '_cg_image_link', true)));
			$meta_link_target = "";

			if(! empty($link)) {
				$dataHref = "";
				$meta_link_target = get_post_meta($attachment->ID, '_cg_image_link_target', true);
			} else {
				if($click_action == "attachment_page")
					$link = get_attachment_link($attachment->ID);
				else if($click_action == "image")
					$link = wp_get_attachment_url($attachment->ID);
				else 
					$link = bfi_thumb($url, $bigParams);
					
				$dataHref = $click_action == 'none' ? "data-" : "";
			}

			$html .= "	<div class='cg-item cg-text-$text_position'>\n";
			$html .= "		<div class='ih-item circle $effectClasses'>\n";
			$html .= "			<a data-title=".htmlspecialchars($attachment->post_title)." ".$dataHref."href='$link' target='$meta_link_target' rel='$rel'>\n";

			if($effectNo == "8")
				$html .= "		<div class='img-container'>\n";
			

			$html .= "				<div class='img'>\n";
			$html .= "					<img src='" . bfi_thumb($url, $params ) . "'/>";
			$html .= "				</div>\n";
			if($effectNo == "8")
				$html .= "		</div>\n";

			if($effectNo == "8")
				$html .= "		<div class='info-container'>\n";

	      	$html .= "				<div class='info'>\n";
	      	if($effectNo == "20")
				$html .= "				<div class='info-back'>\n";

			if($text_position == "inside")
			{
	      		$html .= "					<h3>".$attachment->post_title."</h3>\n";
	      		if(strlen(trim($attachment->post_excerpt)) > 0)	      	
	      			$html .= "				<p>".nl2br($attachment->post_excerpt)."</p>\n";
	      	}
	      	else
	      	{
	      		$html .= "					<i class='fa ".$circle_icon."'></i>\n";
	      	}

	      	$html .= "				</div>\n";
	      	if($effectNo == "8" || $effectNo == "20")
				$html .= "		</div>\n";

	      	$html .= "			</a>\n";
	      	$html .= "		</div>\n";

	      	if($text_position == "outside")
	      	{
	      		$html .= "	<div class='outside-text'>";
		      	$html .= "		<h3>".$attachment->post_title."</h3>\n";
		      	if(strlen(trim($attachment->post_excerpt)) > 0)	      	
	      			$html .= "		<p>".nl2br($attachment->post_excerpt)."</p>\n";
	      		
	      		$html .= "	</div>\n";
	      	}
	      	$html .= "</div>\n";
		}	
		$html .= "</div>\n";
		//http://dotdotdot.frebsite.nl/

		$html .= "<script>\n		
						jQuery(function () {\n";
		$html .= "		jQuery('#circles-gallery-$galleryId .cg-item .outside-text p').dotdotdot();\n";
		if($lightbox == "prettyphoto")
		{
			$html .= "		jQuery('#circles-gallery-$galleryId a[rel=prettyphoto]').prettyPhoto({theme: '$prettyphoto_theme'});\n";
		}
		if($lightbox == "colorbox")
		{
			$html .= "		jQuery('#circles-gallery-$galleryId a[rel=colorbox]').colorbox({rel: 'gallery', maxWidth:'90%', mahHeight:'90%', title: function () { return jQuery(this).data('title'); }});\n";
		}
		if($lightbox == "swipebox")
		{
			$html .= "		jQuery('#circles-gallery-$galleryId a[rel=swipebox]').swipebox({});\n";
		}
		if($lightbox == "fancybox")
		{
			$html .= "		jQuery('#circles-gallery-$galleryId a[rel=fancybox]').fancybox({});\n";
		}
		if($lightbox == "magnific")
		{
			$html .= "		jQuery('#circles-gallery-$galleryId a[rel=magnific]').magnificPopup({type:'image', zoom: { enabled: true, duration: 300, easing: 'ease-in-out' }, image: { titleSrc: 'data-title' }, gallery: { enabled: true } });\n";
		}
		$html .="			var container = document.getElementById('circles-gallery-$galleryId');\n
								imagesLoaded( container, function( instance ) {\n
									new Masonry( container, {\n
				  						itemSelector: '.cg-item'\n
									});\n
							});\n
						});\n
				</script>";
		
		if(! empty($_GET["debug"]))
			return $html;

		return str_replace(array("\n", "\t"), "", $html);
	}

	

	/**
	 * Return the plugin slug.
	 *
	 * @since    1.0.0
	 *
	 * @return    Plugin slug variable.
	 */
	public function get_plugin_slug() 
	{
		return $this->plugin_slug;
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
		if ( null == self::$instance ) 
		{
			self::$instance = new self;
		}
		return self::$instance;
	}

	/**
	 * Fired when the plugin is activated.
	 *
	 * @since    1.0.0
	 *
	 * @param    boolean    $network_wide    True if WPMU superadmin uses
	 *                                       "Network Activate" action, false if
	 *                                       WPMU is disabled or plugin is
	 *                                       activated on an individual blog.
	 */
	public static function activate( $network_wide ) 
	{	
		if ( function_exists( 'is_multisite' ) && is_multisite() ) {

			if ( $network_wide  ) {

				// Get all blog ids
				$blog_ids = self::get_blog_ids();

				foreach ( $blog_ids as $blog_id ) {

					switch_to_blog( $blog_id );
					self::single_activate();

					restore_current_blog();
				}

			} else {
				self::single_activate();
			}

		} else {
			self::single_activate();
		}

	}

	/**
	 * Fired when the plugin is deactivated.
	 *
	 * @since    1.0.0
	 *
	 * @param    boolean    $network_wide    True if WPMU superadmin uses
	 *                                       "Network Deactivate" action, false if
	 *                                       WPMU is disabled or plugin is
	 *                                       deactivated on an individual blog.
	 */
	public static function deactivate( $network_wide ) {

		if ( function_exists( 'is_multisite' ) && is_multisite() ) {

			if ( $network_wide ) {

				// Get all blog ids
				$blog_ids = self::get_blog_ids();

				foreach ( $blog_ids as $blog_id ) {

					switch_to_blog( $blog_id );
					self::single_deactivate();

					restore_current_blog();

				}

			} else {
				self::single_deactivate();
			}

		} else {
			self::single_deactivate();
		}

	}

	/**
	 * Fired when a new site is activated with a WPMU environment.
	 *
	 * @since    1.0.0
	 *
	 * @param    int    $blog_id    ID of the new blog.
	 */
	public function activate_new_site( $blog_id ) {

		if ( 1 !== did_action( 'wpmu_new_blog' ) ) {
			return;
		}

		switch_to_blog( $blog_id );
		self::single_activate();
		restore_current_blog();

	}

	/**
	 * Get all blog ids of blogs in the current network that are:
	 * - not archived
	 * - not spam
	 * - not deleted
	 *
	 * @since    1.0.0
	 *
	 * @return   array|false    The blog ids, false if no matches.
	 */
	private static function get_blog_ids() {

		global $wpdb;

		// get an array of blog ids
		$sql = "SELECT blog_id FROM $wpdb->blogs
			WHERE archived = '0' AND spam = '0'
			AND deleted = '0'";

		return $wpdb->get_col( $sql );

	}

	/**
	 * Fired for each blog when the plugin is activated.
	 *
	 * @since    1.0.0
	 */
	private static function single_activate() {
		// @TODO: Define activation functionality here
	}

	/**
	 * Fired for each blog when the plugin is deactivated.
	 *
	 * @since    1.0.0
	 */
	private static function single_deactivate() {
		// @TODO: Define deactivation functionality here
	}

	/**
	 * Load the plugin text domain for translation.
	 *
	 * @since    1.0.0
	 */
	public function load_plugin_textdomain() {

		$domain = $this->plugin_slug;
		$locale = apply_filters( 'plugin_locale', get_locale(), $domain );

		load_textdomain( $domain, trailingslashit( WP_LANG_DIR ) . $domain . '/' . $domain . '-' . $locale . '.mo' );
		load_plugin_textdomain( $domain, FALSE, basename( plugin_dir_path( dirname( __FILE__ ) ) ) . '/languages/' );

	}

	/**
	 * Register and enqueue public-facing style sheet.
	 *
	 * @since    1.0.0
	 */
	public function enqueue_styles() 
	{
		wp_enqueue_style( 'font-awesome', '//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css', array(), self::VERSION );
		wp_enqueue_style( $this->plugin_slug . '-plugin-styles', plugins_url( 'assets/css/public.css', __FILE__ ), array(), self::VERSION );
	}

	/**
	 * Register and enqueues public-facing JavaScript files.
	 *
	 * @since    1.0.0
	 */
	public function enqueue_scripts() {
		wp_enqueue_script( $this->plugin_slug . '-plugin-script', plugins_url( 'assets/js/public.js', __FILE__ ), array( 'jquery' ), self::VERSION );
	}

	/**
	 * NOTE:  Actions are points in the execution of a page or process
	 *        lifecycle that WordPress fires.
	 *
	 *        Actions:    http://codex.wordpress.org/Plugin_API#Actions
	 *        Reference:  http://codex.wordpress.org/Plugin_API/Action_Reference
	 *
	 * @since    1.0.0
	 */
	public function action_method_name() {
		// @TODO: Define your action hook callback here
	}

	/**
	 * NOTE:  Filters are points of execution in which WordPress modifies data
	 *        before saving it or sending it to the browser.
	 *
	 *        Filters: http://codex.wordpress.org/Plugin_API#Filters
	 *        Reference:  http://codex.wordpress.org/Plugin_API/Filter_Reference
	 *
	 * @since    1.0.0
	 */
	public function filter_method_name() {
		// @TODO: Define your filter hook callback here
	}

}
