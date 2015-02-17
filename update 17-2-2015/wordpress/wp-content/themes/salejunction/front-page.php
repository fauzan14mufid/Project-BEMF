<?php
/**
 * The main template file.
 *
 * This is the most generic template file in a WordPress theme
 * and one of the two required files for a theme (the other being style.css).
 * It is used to display a page when nothing more specific matches a query. 
 * E.g., it puts together the home page when no home.php file exists.
 * Learn more: http://codex.wordpress.org/Template_Hierarchy
 *
 */
 get_header(); ?> 
<div class="siteinfobox">
    <div class="container_24 short">
        <div class="grid_24">        
            <div class="clear"></div>
        </div>
    </div>
  
    <div class="clear"></div>
</div>
<div class="content_wrapper">
    <div class="content">
        <div class="container_24 short">
            <div class="grid_24">
                <div class="productlisting">
                    <?php
                    $options = salejunction_get_option('of_template');
                    foreach ($options as $option) {
                        $option_type = $option['type'];
                        if ($option_type == 'multicheck') {
                            foreach ($option['options'] as $key => $option1) {
                                if ($key == '' || $key == NULL) {
                                    
                                } else {
                                    $of_key = $option['id'] . '_' . $key;
                                    $saved_std = salejunction_get_option($of_key);
                                    if ($saved_std == 'true') {
                                        $window[] = $key;
                                    }
                                }
                            }
                        }
                    }
                    if (post_type_exists('product')) {
                        if (!empty($window)) {
                            $args = array(
                                'orderby' => 'id',
                                'order' => 'ASC',
                                'include' => $window,
                                'number' => '10'
                            );
                        } else {
                            $args = array(
                                'orderby' => 'id',
                                'order' => 'ASC',
                                'number' => '10',
                                'hierarchical' => false,
                            );
                        }
                        $categories = get_terms('product_cat',
                                $args);
                    } 
                    ?>
                    <ul id="tabs" class="pmenu-bar">
                        <?php
                        if (( post_type_exists('product') ) || ( post_type_exists('download') )) {
                            foreach ($categories as $cat):
                                ?>
                                <li><a href="#" title="<?php echo $cat->slug; ?>"><?php echo $cat->name; ?></a></li>
    <?php
    endforeach;
}
?>
                    </ul>
                    <div class="clear"></div>
                    <div class="pgallery">
                        <div id="content">
                            <?php
                            if (post_type_exists('product')) {
                                do_action('wocommorce_store_front');
                            } else if (post_type_exists('download')) {
                                do_action('digitalstore_store_front');
                            } else {
                                
                            }
                            ?>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
<div class="feature_content_wrapper">
    <div class="container_24 short">
        <div class="grid_24">
            <div class="feature_content">
                <div class="feature_content_inner">
                    <div class="feature_content_inner_head">
                        <?php if (salejunction_get_option('salejunction_blog_heading') != '') { ?>
                            <h2><?php echo salejunction_get_option('salejunction_blog_heading'); ?></h2>
                        <?php } else { ?>
                            <h2>
                            <?php _e('Show Your Latest Posts',
                                    'salejunction'); ?>
                            </h2>
                        <?php } ?>
                        <?php if (salejunction_get_option('salejunction_blog_desc') != '') { ?>
                            <h6><?php echo salejunction_get_option('salejunction_blog_desc'); ?></h6>
                        <?php } else { ?>
                            <h6>
                            <?php _e('Here you can showcase your latest blog and let users know about your recent activities.',
                                    'salejunction'); ?>
                            </h6>
                                    <?php } ?>
                    </div>
                    <ul class="feature_content_inner_box">
                                    <?php
                                    if (have_posts()) : while (have_posts()) : the_post(); 
									if($wp_query->post_count == 1)
									{
									?><li class="content-full"><?php
									}
									else { ?>
                                <li><?php } ?>
                                    <div class="feature_content_inner_box1"><span class="f-date">
                                <?php the_time('j') ?>
                                        </span><span class="f-month">
                                <?php the_time('M') ?>
                                        </span>
                                        <h5><a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title_attribute(); ?>">
        <?php the_title(); ?>
                                            </a></h5>
											
                                            <?php
if($wp_query->post_count == 1)
{
the_content();
?><nav id="nav-single"> <span class="nav-previous">
                            <?php previous_post_link('%link', __('<span class="meta-nav">&larr;</span> Previous Post ', 'nutrition')); ?>
                        </span> <span class="nav-next">
                            <?php next_post_link('%link', __('Next Post <span class="meta-nav">&rarr;</span>', 'nutrition')); ?>
                        </span> </nav><?php
}
else
											echo salejunction_custom_trim_excerpt(15); ?> </div>
                                </li>
    <?php
    endwhile;
else:
    ?>
                            <li>
                                <div class="feature_content_inner_box1">
                                    <p>
    <?php _e('Youy have not posted any blog yet.',
            'salejunction'); ?>
                                    </p>
                                </div>
                            </li>
<?php endif; ?>
                    </ul>
<nav id="nav-single"> 
	<span class="alignleft">
		<?php next_posts_link(__('&larr; Older posts', 'slejunction')); ?>
	</span>
	<span class="alignright">
		<?php previous_posts_link(__('Newer posts &rarr;', 'slejunction')); ?>
	</span>
</nav>
                </div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<?php get_footer(); ?>