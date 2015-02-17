<?php
/* ----------------------------------------------------------------------------------- */
/* Auto Feed Links Support
  /*----------------------------------------------------------------------------------- */

function salejunction_setup() {
    global $wpdb;
    add_theme_support('automatic-feed-links');
    add_theme_support('post-thumbnails');
    add_image_size('index-categories',
            200,
            150,
            true);
    add_image_size('page-single',
            600,
            600,
            true);
    add_editor_style();
	register_nav_menu('custom_menu',
            MAIN_MENU);
			//Load languages file
load_theme_textdomain('salejunction',
        get_template_directory() . '/languages');
$locale = get_locale();
$locale_file = get_template_directory() . "/languages/$locale.php";
if (is_readable($locale_file))
    require_once($locale_file);
	
/**
 * Set the content width based on the theme's design and stylesheet.
 *
 * Used to set the width of images and content. Should be equal to the width the theme
 * is designed for, generally via the style.css stylesheet.
 */
 global $content_width;
if (!isset($content_width))
    $content_width = 590;

}

add_action('after_setup_theme',
        'salejunction_setup');

function woocommerce_support() {
    add_theme_support('woocommerce');
}

add_action('after_setup_theme',
        'woocommerce_support');
/* ----------------------------------------------------------------------------------- */
/* Custom Menus Function
  /*----------------------------------------------------------------------------------- */

// Add CLASS attributes to the first <ul> occurence in wp_page_menu
function salejunction_add_menuclass($ulclass) {
    return preg_replace('/<ul>/',
            '<ul class="mysuperfishmenu">',
            $ulclass,
            1);
}

add_filter('wp_page_menu',
        'salejunction_add_menuclass');


function salejunction_nav() {
    if (function_exists('wp_nav_menu'))
        wp_nav_menu(array(
            'theme_location' => 'custom_menu',
            'container_id' => 'menu',
            'menu_class' => 'mysuperfishmenu sf-menu',
            'fallback_cb' => 'salejunction_nav_fallback'));
    else
        salejunction_nav_fallback();
}

function salejunction_nav_fallback() {
    ?>
    <div id="menu">
        <ul class="mysuperfishmenu sf-menu">
            <?php
            wp_list_pages("title_li=&show_home=1&sort_column=menu_order");
            ?>
        </ul>
    </div>
    <?php
}

function salejunction_nav_menu_items($items) {
    if (is_home()) {
        $homelink = '<li class="current_page_item">' . '<a href="' . esc_url(home_url('/')) . '">' . HOME_TEXT . '</a></li>';
    } else {
        $homelink = '<li>' . '<a href="' . esc_url(home_url('/')) . '">' . HOME_TEXT . '</a></li>';
    }
    $items = $homelink . $items;
    return $items;
}

add_filter('wp_list_pages',
        'salejunction_nav_menu_items');
/**
 * Load plugin notification file
 */
require_once(get_template_directory() . '/functions/plugin-activation.php');
require_once(get_template_directory() . '/functions/inkthemes-plugin-notify.php');
add_action('tgmpa_register',
        'salejunction_plugins_notify');
/* ----------------------------------------------------------------------------------- */
/* Breadcrumbs Plugin
  /*----------------------------------------------------------------------------------- */

function salejunction_breadcrumbs() {
    $delimiter = '&raquo;';
    $home = 'Home'; // text for the 'Home' link
    $before = '<span class="current">'; // tag before the current crumb
    $after = '</span>'; // tag after the current crumb
    echo '<div id="crumbs">';
    global $post;
    $homeLink = home_url();
    echo '<a href="' . $homeLink . '">' . $home . '</a> ' . $delimiter . ' ';
    if (is_category()) {
        global $wp_query;
        $cat_obj = $wp_query->get_queried_object();
        $thisCat = $cat_obj->term_id;
        $thisCat = get_category($thisCat);
        $parentCat = get_category($thisCat->parent);
        if ($thisCat->parent != 0)
            echo(get_category_parents($parentCat,
                    TRUE,
                    ' ' . $delimiter . ' '));
        echo $before . 'Archive by category "' . single_cat_title('',
                false) . '"' . $after;
    }
    elseif (is_day()) {
        echo '<a href="' . get_year_link(get_the_time('Y')) . '">' . get_the_time('Y') . '</a> ' . $delimiter . ' ';
        echo '<a href="' . get_month_link(get_the_time('Y'),
                get_the_time('m')) . '">' . get_the_time('F') . '</a> ' . $delimiter . ' ';
        echo $before . get_the_time('d') . $after;
    } elseif (is_month()) {
        echo '<a href="' . get_year_link(get_the_time('Y')) . '">' . get_the_time('Y') . '</a> ' . $delimiter . ' ';
        echo $before . get_the_time('F') . $after;
    } elseif (is_year()) {
        echo $before . get_the_time('Y') . $after;
    } elseif (is_single() && !is_attachment()) {
        if (get_post_type() != 'post') {
            $post_type = get_post_type_object(get_post_type());
            $slug = $post_type->rewrite;
            echo '<a href="' . $homeLink . '/' . $slug['slug'] . '/">' . $post_type->labels->singular_name . '</a> ' . $delimiter . ' ';
            echo $before . get_the_title() . $after;
        } else {
            $cat = get_the_category();
            $cat = $cat[0];
            echo get_category_parents($cat,
                    TRUE,
                    ' ' . $delimiter . ' ');
            echo $before . get_the_title() . $after;
        }
    } elseif (!is_single() && !is_page() && get_post_type() != 'post') {
        $post_type = get_post_type_object(get_post_type());
        echo $before . $post_type->labels->singular_name . $after;
    } elseif (is_attachment()) {
        $parent = get_post($post->post_parent);
        $cat = get_the_category($parent->ID);
        $cat = $cat[0];
        echo get_category_parents($cat,
                TRUE,
                ' ' . $delimiter . ' ');
        echo '<a href="' . get_permalink($parent) . '">' . $parent->post_title . '</a> ' . $delimiter . ' ';
        echo $before . get_the_title() . $after;
    } elseif (is_page() && !$post->post_parent) {
        echo $before . get_the_title() . $after;
    } elseif (is_page() && $post->post_parent) {
        $parent_id = $post->post_parent;
        $breadcrumbs = array();
        while ($parent_id) {
            $page = get_page($parent_id);
            $breadcrumbs[] = '<a href="' . get_permalink($page->ID) . '">' . get_the_title($page->ID) . '</a>';
            $parent_id = $page->post_parent;
        }
        $breadcrumbs = array_reverse($breadcrumbs);
        foreach ($breadcrumbs as $crumb)
            echo $crumb . ' ' . $delimiter . ' ';
        echo $before . get_the_title() . $after;
    } elseif (is_search()) {
        echo $before . 'Search results for "' . get_search_query() . '"' . $after;
    } elseif (is_tag()) {
        echo $before . 'Posts tagged "' . single_tag_title('',
                false) . '"' . $after;
    } elseif (is_author()) {
        global $author;
        $userdata = get_userdata($author);
        echo $before . 'Articles posted by ' . $userdata->display_name . $after;
    } elseif (is_404()) {
        echo $before . 'Error 404' . $after;
    }
    if (get_query_var('paged')) {
        if (is_category() || is_day() || is_month() || is_year() || is_search() || is_tag() || is_author())
            echo ' (';
        echo PAGE . ' ' . get_query_var('paged');
        if (is_category() || is_day() || is_month() || is_year() || is_search() || is_tag() || is_author())
            echo ')';
    }
    echo '</div>';
}

//* ----------------------------------------------------------------------------------- */
/* Function to call first uploaded image in functions file
  /*----------------------------------------------------------------------------------- */

/**
 * This function gets image 
 * Prints attached images from the post        
 */
function salejunction_get_image() {
   global $post, $posts;
  $first_img = '';
  ob_start();
  ob_end_clean();
  $output = preg_match_all('/<img.+src=[\'"]([^\'"]+)[\'"].*>/i', $post->post_content, $matches);
  $first_img = $matches[1][0];

  if(empty($first_img)) {
     $first_img = '';
  }
  return $first_img;
}

/* ----------------------------------------------------------------------------------- */
/* Attachment Page Design  /*----------------------------------------------------------------------------------- */

//For Attachment Page
/**
 * Prints HTML with meta information for the current post (category, tags and permalink).
 *
 */
function salejunction_posted_in() {
// Retrieves tag list of current post, separated by commas.
    $tag_list = get_the_tag_list('',
            ', ');
    if ($tag_list) {
        $posted_in = THIS_ENTRY_WAS_POSTED_IN . ' .' . AND_TAGGED . ' %2$s.' . BOOKMARK_THE . ' <a href="%3$s" title="Permalink to %4$s" rel="bookmark">' . PERMALINK . '</a>.';
    } elseif (is_object_in_taxonomy(get_post_type(),
                    'category')) {
        $posted_in = THIS_ENTRY_WAS_POSTED_IN . ' %1$s. ' . BOOKMARK_THE . ' <a href="%3$s" title="Permalink to %4$s" rel="bookmark">' . PERMALINK . '</a>.';
    } else {
        $posted_in = BOOKMARK_THE . '<a href="%3$s" title="Permalink to %4$s" rel="bookmark">' . PERMALINK . '</a>.';
    }
// Prints the string, replacing the placeholders.
    printf(
            $posted_in,
            get_the_category_list(', '),
            $tag_list,
            get_permalink(),
            the_title_attribute('echo=0')
    );
}


// This theme styles the visual editor with editor-style.css to match the theme style.


/**
 * Register widgetized areas, including two sidebars and four widget-ready columns in the footer.
 *
 * To override twentyten_widgets_init() in a child theme, remove the action hook and add your own
 * function tied to the init hook.
 *
 * @uses register_sidebar
 */
function salejunction_widgets_init() {
// Area 1, located at the top of the sidebar.
    register_sidebar(array(
        'name' => PRIMARY_WIDGET,
        'id' => 'primary-widget-area',
        'description' => THE_PRIMARY_WIDGET,
        'before_widget' => '',
        'after_widget' => '',
        'before_title' => '<h3><a href="#">',
        'after_title' => '</a></h3>',
    ));
// Area 2, located below the Primary Widget Area in the sidebar. Empty by default.
    register_sidebar(array(
        'name' => SECONDRY_WIDGET,
        'id' => 'secondary-widget-area',
        'description' => THE_SECONDRY_WIDGET,
        'before_widget' => '',
        'after_widget' => '',
        'before_title' => '<h3><a href="#">',
        'after_title' => '</a></h3>',
    ));
    // Area 3, located in the footer. Empty by default.
    register_sidebar(array(
        'name' => FIRST_FOOTER_WIDGET,
        'id' => 'first-footer-widget-area',
        'description' => THE_FIRST_FOOTER_WIDGET,
        'before_widget' => '',
        'after_widget' => '',
        'before_title' => '<h6>',
        'after_title' => '</h6>',
    ));
    // Area 4, located in the footer. Empty by default.
    register_sidebar(array(
        'name' => SECONDRY_FOOTER_WIDGET,
        'id' => 'second-footer-widget-area',
        'description' => THE_SECONDRY_FOOTER_WIDGET,
        'before_widget' => '',
        'after_widget' => '',
        'before_title' => '<h6>',
        'after_title' => '</h6>',
    ));
    // Area 5, located in the footer. Empty by default.
    register_sidebar(array(
        'name' => THIRD_FOOTER_WIDGET,
        'id' => 'third-footer-widget-area',
        'description' => THE_THIRD_FOOTER_WIDGET,
        'before_widget' => '',
        'after_widget' => '',
        'before_title' => '<h6>',
        'after_title' => '</h6>',
    ));
    // Area 5, located in the footer. Empty by default.
    register_sidebar(array(
        'name' => FOURTH_FOOTER_WIDGET,
        'id' => 'fourth-footer-widget-area',
        'description' => THE_FOURTH_FOOTER_WIDGET,
        'before_widget' => '',
        'after_widget' => '',
        'before_title' => '<h6>',
        'after_title' => '</h6>',
    ));
    register_sidebar(array(
        'id' => 'shop',
        'name' => __('Shop',
                'salejunction'),
        'description' => __('The widget area appears on the shop page.',
                'salejunction'),
        'before_widget' => '',
        'after_widget' => '',
        'before_title' => '<h3><a href="#">',
        'after_title' => '</a></h3>',
            )
    );
}

/** Register sidebars by running salejunction_widgets_init() on the widgets_init hook. */
add_action('widgets_init',
        'salejunction_widgets_init');


/**
 * Pagination
 *
 */
function salejunction_pagination($pages = '', $range = 2) {
    $showitems = ($range * 2) + 1;
    global $paged;
    if (empty($paged))
        $paged = 1;
    if ($pages == '') {
        global $wp_query;
        $pages = $wp_query->max_num_pages;
        if (!$pages) {
            $pages = 1;
        }
    }
    if (1 != $pages) {
        echo "<ul class='paging'>";
        if ($paged > 2 && $paged > $range + 1 && $showitems < $pages)
            echo "<li><a href='" . get_pagenum_link(1) . "'>&laquo;</a></li>";
        if ($paged > 1 && $showitems < $pages)
            echo "<li><a href='" . get_pagenum_link($paged - 1) . "'>&lsaquo;</a></li>";
        for ($i = 1; $i <= $pages; $i++) {
            if (1 != $pages && (!($i >= $paged + $range + 1 || $i <= $paged - $range - 1) || $pages <= $showitems )) {
                echo ($paged == $i) ? "<li><a href='" . get_pagenum_link($i) . "' class='current' >" . $i . "</a></li>" : "<li><a href='" . get_pagenum_link($i) . "' class='inactive' >" . $i . "</a></li>";
            }
        }
        if ($paged < $pages && $showitems < $pages)
            echo "<li><a href='" . get_pagenum_link($paged + 1) . "'>&rsaquo;</a></li>";
        if ($paged < $pages - 1 && $paged + $range - 1 < $pages && $showitems < $pages)
            echo "<li><a href='" . get_pagenum_link($pages) . "'>&raquo;</a></li>";
        echo "</ul>\n";
    }
}

/////////Theme Options
/* ----------------------------------------------------------------------------------- */
/* Add Favicon
  /*----------------------------------------------------------------------------------- */
function salejunction_childtheme_favicon() {
    if (salejunction_get_option('salejunction_favicon') != '') {
        echo '<link rel="shortcut icon" href="' . salejunction_get_option('salejunction_favicon') . '"/>' . "\n";
    }
}

add_action('wp_head',
        'salejunction_childtheme_favicon');
/* ----------------------------------------------------------------------------------- */
/* Custom CSS Styles */
/* ----------------------------------------------------------------------------------- */

function salejunction_of_head_css() {
    $output = '';
    $custom_css = salejunction_get_option('salejunction_customcss');
    if ($custom_css <> '') {
        $output .= $custom_css . "\n";
    }
// Output styles
    if ($output <> '') {
        $output = "<!-- Custom Styling -->\n<style type=\"text/css\">\n" . $output . "</style>\n";
        echo $output;
    }
}

add_action('wp_head',
        'salejunction_of_head_css');


//Trim excerpt
function salejunction_custom_trim_excerpt($length) {
    global $post;
    $text = get_the_content('');
    $text = apply_filters('the_content',
            $text);
    $text = str_replace(']]>',
            ']]>',
            $text);
    $text = strip_shortcodes($text); // optional
    $text = strip_tags($text);
    $excerpt_length = $length;
    $words = explode(' ',
            $text,
            $excerpt_length + 1);
    if (count($words) > $excerpt_length) {
        array_pop($words);
        array_push($words,
                '...');
        $text = implode(' ',
                $words);
        $text = apply_filters('the_excerpt',
                $text);
    }
    return $text;
}

/* ----------------------------------------------------------------------------------- */
/* jQuery Enqueue */
/* ----------------------------------------------------------------------------------- */

function salejunction_wp_enqueue_scripts() {
    if (!is_admin()) {
wp_enqueue_style('salejunction-style', get_stylesheet_uri());
        wp_enqueue_script('salejunction-mysuperfishmenu',
                TMPLURI . '/js/superfish.js',
                array(
            'jquery'));
        wp_enqueue_script('flex-slider',
                TMPLURI . '/js/jquery.flexslider-min.js',
                array(
            'jquery'));
        wp_enqueue_script('salejunction-custom',
                TMPLURI . '/js/custom.js',
                array(
            'jquery'));
        wp_enqueue_script('salejunction-tool',
                TMPLURI . '/js/jquery.tools.min.js',
                array(
            'jquery'));
        wp_enqueue_script('jquery-ba-cond',
                TMPLURI . '/js/jquery.ba-cond.min.js',
                array(
            'jquery'));
			wp_enqueue_script('jquery-ba-cond',
                TMPLURI . '/js/mobile-menu.js',
                array(
            'jquery'), '', true);
			
        if (get_option('thread_comments')) {
            // enqueue the javascript that performs in-link comment reply fanciness
            wp_enqueue_script('comment-reply');
        }
    }
}

add_action('wp_enqueue_scripts','salejunction_wp_enqueue_scripts');
/* ----------------------------------------------------------------------------------- */
/* Custom Jqueries Enqueue */
/* ----------------------------------------------------------------------------------- */
//
function salejunction_get_option($name) {
    $options = get_option('salejunction_options');
    if (isset($options[$name]))
        return $options[$name];
}

//
function salejunction_update_option($name, $value) {
    $options = get_option('salejunction_options');
    $options[$name] = $value;
    return update_option('salejunction_options',
            $options);
}

//
function salejunction_delete_option($name) {
    $options = get_option('salejunction_options');
    unset($options[$name]);
    return delete_option('salejunction_options',
            $options);
}

