<?php
/**
 * The template for displaying all pages.
 *
 * This is the template that displays all pages by default.
 * Please note that this is the wordpress construct of pages
 * and that other 'pages' on your wordpress site will use a
 * different template.
 *
 */
?>
<?php get_header(); ?>
<div class="content_wrapper woocommerce">
    <div class="page-content">
        <div class="container_24">
            <div class="grid_24">
                <div class="grid_16 alpha">
				 <div class="content-bar">
				 <p><?php printf(SEARCH_RESULT, '' . get_search_query() . ''); ?></p>
            <?php if (have_posts()) : ?>               
                <!--Start Post-->
                <?php get_template_part('loop', 'search'); ?>
                <!--End Post-->
            <?php else : ?>
                <article id="post-0" class="post no-results not-found">
                    <header class="entry-header">
                        <h1 class="entry-title">
                        <?php echo NOTHING_FOUND; ?>
                        </h1>
                    </header>
                    <!-- .entry-header -->
                    <div class="entry-content">
                        <p>
                        <?php echo NOTHING_MATCHED; ?>
                        </p>
						<br/>
                        <?php get_search_form(); ?>
                    </div>
                    <!-- .entry-content -->
                </article>
            <?php endif; ?>
            <div class="clear"></div>
            <nav id="nav-single"> <span class="nav-previous">
		<?php next_posts_link(NEWER_POSTS); ?>
	</span> <span class="nav-next">
		<?php previous_posts_link(OLDER_POSTS); ?>
	</span> </nav>
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