<?php
/**
 * 
 * Retrieves the latest downloads.
 * 
 * @return   string
 * @access   private
 * @since    1.0
 */
if (!function_exists('wocommorce_latest_downloads')) {

    function wocommorce_latest_downloads($args = array()) {
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
                'number' => '10'
            );
        }
        $categories = get_terms('product_cat',
                $args);
        //$product_obj = new WC_Product($product);
        foreach ($categories as $cat) {
            // set query arguments
            $params = array(
                'post_type' => 'product',
                'post_status' => 'publish',
                'posts_per_page' => 16,
                'taxonomy' => 'product_cat',
                'term' => $cat->slug
            );
            // create query
            $downloads = new WP_Query($params);
            // loop
            if ($downloads->have_posts()) {
                ?>
                <div id="<?php echo $cat->slug; ?>" class="section-latest latest">
                    <ul class="thumbnail">
                        <?php
                        while ($downloads->have_posts()) : $downloads->the_post();
                            global $post, $product, $woocommerce;
                            ?>
                            <li>
                                <section class="edd-image">
                                    <?php if (has_post_thumbnail()) { ?>
                                        <?php get_post_thumbnail_id(); ?>
                                    <?php } else { ?>
                                        <?php salejunction_get_image(); ?> 
                                    <?php
                                }
                                ?>	
                                </section>
                                <?php if ($price_html = $product->get_price_html()) : ?>
                                    <span class="price"><?php echo $price_html; ?></span>
                    <?php endif; ?>
                    <?php if ($product->is_on_sale()) { ?>
                                    <span class="tag-sale"></span>
                    <?php } ?>
                                <!-- latest-thumbnail -->                    
                                <h6><a href="<?php the_permalink(); ?>" title="<?php the_title(); ?>"><?php the_title(); ?></a></h6>
                                <section class="thumb-content">
                    <!--                                <a href="<?php the_permalink(); ?>" title="<?php the_title(); ?>" class="latest-thumbnail">
                                        <span class="new-link">SEE MORE</span>
                                    </a>-->
                                    <a href="<?php the_permalink(); ?>" title="<?php the_title(); ?>" class="latest-thumbnail">
                                        <section class="edd-the-price">
                                        </section></a>
                                    <p><?php echo salejunction_custom_trim_excerpt(15); ?></p>
                                </section>
                                <!-- latest-meta -->
                            </li>			
                    <?php $categories = get_terms('product_cat',
                            array(
                        'orderby' => 'count',));
                    ?>      <?php endwhile; ?>
                        <span class="all_item"><?php echo $cat->name; ?>: <a href="<?php echo site_url() . '/?product_cat=' . $cat->slug; ?>" class="view_more"><?php _e('More items', 'salejunction'); ?></a>				<br/><br/>				<br/><br/>				</span>
                    </ul><!-- .latest-listing -->			  
                </div><!-- .section-latest.-->
                <?php
            }
        }
        wp_reset_postdata();
    }

}
/**
 * Show Latest Product Of Wocommorce
 *
 * Echoes the latest Product on the store front page
 *
 * @return   string
 * @access   private
 * @since    1.0
 */
if (!function_exists('wocommorce_front_latest_downloads')) {

    function wocommorce_front_latest_downloads() {
        wocommorce_latest_downloads();
    }

}
add_action('wocommorce_store_front',
        'wocommorce_front_latest_downloads',
        3);
