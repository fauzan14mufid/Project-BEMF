<?php
/**
 *
 * @package   CirclesGallery
 * @author    GreenTreeLabs <diego@greentreelabs.net>
 * @license   GPL-2.0+
 * @link      http://greentreelabs.net
 * @copyright 2014 GreenTreeLabs
 *
 * @wordpress-plugin
 * Plugin Name:       Circles Gallery Free
 * Version:           1.0.7
 * Description: 	  Creates galleries made of circles and bubbles and love.
 * Author:            GreenTreeLabs
 * Author URI:        http://greentreelabs.net
 * Text Domain:       circles-gallery-locale
 * License:           GPL-2.0+
 * License URI:       http://www.gnu.org/licenses/gpl-2.0.txt
 * Domain Path:       /languages
 */

// If this file is called directly, abort.
if ( ! defined( 'WPINC' ) ) {
	die;
}

define('CIRCLES_GALLERY_FILE', __FILE__ );
define('CIRCLES_GALLERY_OPT_NAME', "circles-gallery-options");
define('CIRCLES_GALLERY_DIR', dirname(__FILE__));

/*----------------------------------------------------------------------------*
 * Public-Facing Functionality
 *----------------------------------------------------------------------------*/

require_once( plugin_dir_path( __FILE__ ) . 'public/class-circles-gallery.php' );

/*
 * Register hooks that are fired when the plugin is activated or deactivated.
 * When the plugin is deleted, the uninstall.php file is loaded.
 *
 */
register_activation_hook( __FILE__, array( 'CirclesGallery', 'activate' ) );
register_deactivation_hook( __FILE__, array( 'CirclesGallery', 'deactivate' ) );

/*
 * @TODO:
 *
 */
add_action( 'plugins_loaded', array( 'CirclesGallery', 'get_instance' ) );

/*----------------------------------------------------------------------------*
 * Dashboard and Administrative Functionality
 *----------------------------------------------------------------------------*/

/*
 * @TODO:
 *
 *
 * If you want to include Ajax within the dashboard, change the following
 * conditional to:
 *
 * if ( is_admin() ) {
 *   ...
 * }
 *
 * The code below is intended to to give the lightest footprint possible.
 */
if ( is_admin()) {

	require_once( plugin_dir_path( __FILE__ ) . 'admin/class-circles-gallery-admin.php' );
	add_action( 'plugins_loaded', array( 'CirclesGallery_Admin', 'get_instance' ) );

}
