<?php

add_action('init', 'of_options');
if (!function_exists('of_options')) {

    function of_options() {
        // VARIABLES
        $themename = 'Salejunction Theme';
        $shortname = "of";
        // Populate OptionsFramework option in array for use in theme
        global $of_options;
        $of_options = salejunction_get_option('of_options');
        // Background Defaults
        $background_defaults = array('color' => '', 'image' => '', 'repeat' => 'repeat', 'position' => 'top center', 'attachment' => 'scroll');
        //Color Stylesheet 
        // Pull all the categories into an array
        $options_categories = array();
        $options_categories_obj = get_categories();
        foreach ($options_categories_obj as $category) {
            $options_categories[$category->cat_ID] = $category->cat_name;
        }
        // Pull all the Product categories into an array
        $product_categories = array();
        $product_categories_obj = get_terms("product_cat");
        if ($product_categories_obj) {
            foreach ($product_categories_obj as $product_category) {
                if (isset($product_category->name)) {
                    $product_categories[$product_category->term_id] = $product_category->name;
                }
            }
        }
        // Pull all the pages into an array
        $options_pages = array();
        $options_pages_obj = get_pages('sort_column=post_parent,menu_order');
        $options_pages[''] = 'Select a page:';
        foreach ($options_pages_obj as $page) {
            $options_pages[$page->ID] = $page->post_title;
        }
        // If using image radio buttons, define a directory path
        $imagepath = get_stylesheet_directory_uri() . '/images/';
        $options = array(
            array("name" => __('General Settings', 'slejunction'),
                "type" => "heading"),
            array("name" => __('Custom Logo', 'slejunction'),
                "desc" => __('Choose your own logo. Optimal Size: 200px Wide by 90px Height.', 'slejunction'),
                "id" => "salejunction_logo",
                "type" => "upload"),
            array("name" => __('Custom Favicon', 'slejunction'),
                "desc" => __('Specify a 16px x 16px image that will represent your websites favicon.', 'slejunction'),
                "id" => "salejunction_favicon",
                "type" => "upload"),
            //Home Page Slider Setting
            array("name" => __('Top Feature Settings', 'slejunction'),
                "type" => "heading"),
            //First Slider
            array("name" => __('Top Feature Image', 'slejunction'),
                "desc" => __('The optimal size of the image is 1920 px wide x 654 px height, but it can be varied as per your requirement.', 'slejunction'),
                "id" => "salejunction_slideimage1",
                "std" => "",
                "type" => "upload"),
            array("name" => __('Top Feature Heading', 'slejunction'),
                "desc" => __('Mention the heading for the Top Feature.', 'slejunction'),
                "id" => "salejunction_sliderheading1",
                "std" => "",
                "type" => "textarea"),
            array("name" => __('Link for Top Feature', 'slejunction'),
                "desc" => __('Mention the URL for Top Feature image.', 'slejunction'),
                "id" => "salejunction_Sliderlink1",
                "std" => "",
                "type" => "text"),
            array("name" => __('Top Feature Description', 'slejunction'),
                "desc" => __('Here mention a short description for the First Top Feature.', 'slejunction'),
                "id" => "salejunction_sliderdes1",
                "std" => "",
                "type" => "textarea"),
            array("name" => __('Button Text for Top Feature', 'slejunction'),
                "desc" => __('Mention the text for Top Feature Button.', 'slejunction'),
                "id" => "salejunction_slider_button1",
                "std" => "",
                "type" => "text"),
            array("name" => __('Home Page Category', 'slejunction'),
                "type" => "heading"),
            array("name" => __('Select WooCommerce Category List', 'slejunction'),
                "desc" => __('Select your product category to display your products on home page.', 'slejunction'),
                "id" => "salejunction_woo_cat",
                "std" => "false",
                "type" => "multicheck",
                "options" => $product_categories),
            //****=============================================================================****//
            //****------This code is used for creating Home Page Blog Feature options----------****//		//****=============================================================================****//			
            array("name" => __('Home Page Blog Feature Section', 'slejunction'),
                "type" => "heading"),
            array("name" => __('Home Blog Heading', 'slejunction'),
                "desc" => __('Enter your home blog heading', 'slejunction'),
                "id" => "salejunction_blog_heading",
                "std" => "",
                "type" => "textarea"),
            array("name" => __('Home Blog Description', 'slejunction'),
                "desc" => __('Enter your home blog description', 'slejunction'),
                "id" => "salejunction_blog_desc",
                "std" => "",
                "type" => "textarea"),
//****=============================================================================****//
//****-----------This code is used for creating color styleshteet options----------****//							
//****=============================================================================****//				
            array("name" => __('Styling Options', 'slejunction'),
                "type" => "heading"),
            array("name" => __('Custom CSS', 'slejunction'),
                "desc" => __('Quickly add some CSS to your theme by adding it to this block.', 'slejunction'),
                "id" => "salejunction_customcss",
                "std" => "",
                "type" => "textarea"));

        salejunction_update_option('of_template', $options);
        salejunction_update_option('of_themename', $themename);
        salejunction_update_option('of_shortname', $shortname);
    }

}
?>
