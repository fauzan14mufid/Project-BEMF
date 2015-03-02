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
<div class="content_wrapper">
    <div class="page-content woocommerce">
        <div class="container_24">
            <div class="grid_24">
                <div class="grid_16 alpha">
                    <div class="content-bar">
                    <?php get_template_part('loop', 'index'); ?>
                        <div class="clear"></div>
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