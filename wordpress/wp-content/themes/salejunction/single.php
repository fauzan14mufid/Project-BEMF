<?php
/**
 * Single post page for displaying detailed about
 * the selected post. 
 */
get_header();
?>
<div class="content_wrapper">
    <div class="page-content woocommerce">
        <div class="container_24">
            <div class="grid_24">
                <div class="grid_16 alpha">				
                    <div class="content-bar single"> 
                        <!-- Start the Loop. -->						  
                        <?php if (have_posts()) : while (have_posts()) : the_post(); ?>   
                                <h1 class="post_title single"><?php the_title(); ?></h1>
                                <!--post start-->
                                <div id="post-<?php the_ID(); ?>" <?php post_class('blog'); ?>> 							
                                    <div class="post_content">
                                        <ul class="post_meta">
                                            <li class="post_date">&nbsp;&nbsp;
                                                <?php
                                                $archive_year = get_the_time('Y');
                                                $archive_month = get_the_time('m');
                                                $archive_day = get_the_time('d');
                                                ?>
                                                <a href="<?php echo get_day_link($archive_year,
                                                $archive_month,
                                                $archive_day); ?>"><?php echo get_the_time('M, d, Y') ?></a></li>
                                            <li class="posted_by">&nbsp;<span><?php the_author_posts_link(); ?></span></a></li>
                                            <li class="post_category"><?php the_category(', '); ?></li>
                                            <li class="post_comment"><span><?php comments_popup_link('No Comments.',
                                                '1 Comment.',
                                                '% Comments.'); ?></li>
                                        </ul>
                                        <?php the_content(); ?>
                                    </div>
                                    <div class="clear"></div>
                                    <?php if (has_tag()) { ?>
                                        <div class="tag">
                                    <?php the_tags('Post Tagged with ',
                                            ', ',
                                            ''); ?>
                                        </div>
                                <?php } ?>
                                </div>
                                <!--End Post-->
                                        <?php
                                    endwhile;
                                else:
                                    ?>
                            <div class="post">
                                <p>
                                    <?php echo SORRY_NO_POST_MATCHED; ?>
                                </p>
                            </div>
                        <?php endif; ?>
                        <!--End Loop-->
                        <nav id="nav-single"> <span class="nav-previous">
<?php previous_post_link('%link',
        '<span class="meta-nav">&larr;</span>' . PREV_POST); ?>
                            </span> <span class="nav-next">
                    <?php next_post_link('%link',
                            NEXT_POST . ' <span class="meta-nav">&rarr;</span>'); ?>
                            </span> </nav>
<?php wp_link_pages(array(
    'before' => '<div class="clear"></div><div class="page-link"><span>' . PAGES_COLON . '</span>',
    'after' => '</div>')); ?>
<?php comments_template(); ?>
                    </div>
                </div>
                <div class="grid_8 omega">
<?php get_sidebar(); ?>
                </div>
            </div>
        </div>
    </div>
</div>
<?php get_footer(); ?>