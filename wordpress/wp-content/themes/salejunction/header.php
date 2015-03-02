<?php
/**
 * The Header for our theme.
 *
 * Displays all of the <head> section and everything up till <div id="main">
 *
 */
ob_start();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html <?php language_attributes(); ?>>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
        <meta charset="<?php bloginfo('charset'); ?>" />
        <title> <?php wp_title(); ?></title>
        <link rel="pingback" href="<?php bloginfo('pingback_url'); ?>" />
<?php wp_head(); ?>
    </head>
    <body <?php body_class(); ?>>
        <div class="wrapper_main">
            <div class="wrapper_top">
                <div class="top_cartinfo">
                    <div class="container_24 short dd-container">
                        <div class="grid_24">
                            <?php
                            $result = count_users();
                            global $current_user;
                            if (post_type_exists('product')) {
                                ?>
                                <div class="siteinfo"><?php global $woocommerce; ?><span class="iteminfo"><img class="cart_image" src="<?php echo TMPLURI; ?>/images/carticon.png" /><a class="cart-contents" href="<?php echo $woocommerce->cart->get_cart_url(); ?>" title="<?php _e('View your shopping cart',
                                    'salejunction'); ?>"><?php echo sprintf(_n('%d item',
                                            '%d items',
                                            $woocommerce->cart->cart_contents_count,
                                            'salejunction'),
                                    $woocommerce->cart->cart_contents_count); ?> - (  <?php echo $woocommerce->cart->get_cart_total(); ?> <?php _e('in total', 'salejunction'); ?> )</a></span>
                                </div> <?php } else { ?>
                                <div class="down_div"></div>
                            <?php } ?> 
<?php if (post_type_exists('product')) { ?>
                                <div class="carticon"><?php if (sizeof($woocommerce->cart->cart_contents) > 0) : ?>
                                        <a href="<?php echo $woocommerce->cart->get_checkout_url() ?>" title="<?php _e('Checkout',
                'salejunction') ?>"><?php _e('Checkout',
                'salejunction') ?></a>
    <?php endif; ?></div>
<?php } else if (post_type_exists('download')) { ?><div class="carticon"></div>   
<?php
} else {
    echo "";
}
?>                           
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
            <div class="wrapper_header">
                <div class="container_24 dd-container">
                    <div class="grid_24">
                        <div class="header">
                            <div class="grid_6 alpha">
                                <div class="logo">
<?php if (salejunction_get_option('salejunction_logo') != '') { ?>
                                        <a href="<?php echo esc_url(home_url('/')); ?>"><img src="<?php echo salejunction_get_option('salejunction_logo'); ?>" alt="<?php bloginfo('name'); ?>" /></a>
                                            <?php } else { ?>
                                        <h1><a href="<?php echo esc_url(home_url()); ?>"><?php bloginfo('name'); ?></a></h1>
                                        <p><?php bloginfo('description'); ?></p>                     
<?php } ?>
                                </div>
                                <!--End Logo-->
                            </div>
                            <div class="grid_18 omega">
                                <div class="menu_container">
                                    <div class="menu_bar">
                                        <div id="MainNav">
                                            <a href="#" class="mobile_nav closed"><?php _e('Pages Navigation Menu', 'salejunction'); ?><span></span></a>
<?php salejunction_nav(); ?> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
            <!--End of wrapper_header -->