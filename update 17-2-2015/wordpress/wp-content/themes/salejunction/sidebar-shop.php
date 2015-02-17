<?php
// Exit if accessed directly
if ( !defined('ABSPATH')) exit;
/**
 * Shop Sidebar Template
 *
 * Displays widgets for the Shop dynamic sidebar if any have been added to the sidebar through the 
 * widgets screen in the admin by the user.  Otherwise, nothing is displayed.
 *
 * @package 	salejunction
 * @author		InkThemes
 * @license		license.txt
 * @since 		1.0
 */
if ( is_active_sidebar( 'shop' ) ) : ?>
<div class="grid_8 omega">
	<div class="widget-area sidebar" id="secondary">
		<?php do_action( 'koorsi_sidebar_shop_open' ); ?>
			<?php dynamic_sidebar( 'shop' ); ?>
	</div>
	</div>
<?php endif; ?>
	            </div>
        </div>
    </div>
</div><!-- #secondary .widget-area .sidebar -->