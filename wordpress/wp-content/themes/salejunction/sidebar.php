<div class="sidebar">
    <?php if (!dynamic_sidebar('primary-widget-area')) : ?>
        <h3><a href="#">
               <?php _e('Categories', 'salejunction'); ?>
            </a></h3>
        <ul>
            <?php wp_list_categories('title_li'); ?>
        </ul>
        <h3><a href="#">
                  <?php _e('Archives', 'salejunction'); ?>
            </a></h3>
        <ul>
            <?php wp_get_archives('type=monthly'); ?>
        </ul>
        <h3><a href="#"><?php _e('Search:', 'salejunction'); ?></a></h3>
        <?php get_search_form(); ?>
    <?php
    endif; // end primary widget area 
    // A second sidebar for widgets, just because.
    if (is_active_sidebar('secondary-widget-area')) :
        ?>
        <?php dynamic_sidebar('secondary-widget-area'); ?>
<?php endif; ?>  
</div>