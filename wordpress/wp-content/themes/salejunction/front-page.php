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
<div class="slide"><?php
if (is_home()) {
echo do_shortcode('[SlideDeck2 id=158]');
}
?></div>
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
    <!--<?php _e('Youy have not posted any blog yet.',
            'salejunction'); ?> -->
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