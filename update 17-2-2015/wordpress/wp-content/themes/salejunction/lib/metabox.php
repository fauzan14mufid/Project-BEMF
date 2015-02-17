<?php
$key = 'pdduct_meta';
$meta_boxes = array(
    'Product' => array(
        'name' => 'image1',
        'title' => __('First Image URL (Optional)', SLUG),
        'description' => __('Enter first image URL.',SLUG),
    ),
    'Paypal' => array(
        'name' => 'image2',
        'title' => __('Second Image URL(Optional)', SLUG),
        'description' => __('Enter second image URL.',SLUG)
    ),
    'ThankURL' => array(
        'name' => 'image3',
        'title' => __('Third Image URL (Optional)',SLUG),
        'description' => __('Enter third image URL.',SLUG)
    ),
    'CancelURL' => array(
        'name' => 'see_demo',
        'title' => __('See Demo URL (Optional)', SLUG),
        'description' => __('Enter your demo URL.', SLUG)
    )
);
function create_meta_box() {
    global $key;
    if (function_exists('add_meta_box'))
    add_meta_box('new-meta-boxes', __('Single Page Slider Images and Demo URL Meta', SLUG), 'display_meta_box', 'download', 'normal', 'high');
}
function display_meta_box() {
    global $post, $meta_boxes, $key;
    ?>
    <div class="panel-wrap">	
        <div class="form-wrap">
            <?php
            wp_nonce_field(plugin_basename(__FILE__), $key . '_wpnonce', false, true);
            foreach ($meta_boxes as $meta_box) {
                $data = get_post_meta($post->ID, $meta_box['name'], true);
                ?>
                <div class="form-field form-required" style="margin:0; padding: 0 8px">
                    <label for="<?php echo $meta_box['name']; ?>" style="color: #666; padding-bottom: 8px; overflow:hidden; zoom:1; "><?php echo $meta_box['title']; ?></label>
                    <?php
                    if (!isset($meta_box['type']))
                        $meta_box['type'] = 'input';
                    switch ($meta_box['type']) :
                        case "datetime" :
                            if ($post->post_status <> 'publish') :
                                echo '<p>' . __('Post is not yet published', 'figero') . '</p>';
                            else :
                                $date = $data;
                                if (!$data) {
                                    // Date is 30 days after publish date (this is for backwards compatibility)
                                    $date = strtotime('+30 day', strtotime($post->post_date));
                                }
                                ?>							
                                <div style="float:left; margin-right: 10px; min-width: 320px;"><select name="<?php echo $meta_box['name']; ?>_month">
                                        <?php
                                        for ($i = 1; $i <= 12; $i++) :
                                            echo '<option value="' . str_pad($i, 2, '0', STR_PAD_LEFT) . '" ';
                                            if (date_i18n('F', $date) == date_i18n('F', strtotime('+' . $i . ' month', mktime(0, 0, 0, 12, 1, 2010))))
                                                echo 'selected="selected"';
                                            echo '>' . date_i18n('F', strtotime('+' . $i . ' month', mktime(0, 0, 0, 12, 1, 2010))) . '</option>';
                                        endfor;
                                        ?>
                                    </select>
                                    <select name="<?php echo $meta_box['name']; ?>_day">
                                        <?php
                                        for ($i = 1; $i <= 31; $i++) :
                                            echo '<option value="' . str_pad($i, 2, '0', STR_PAD_LEFT) . '" ';
                                            if (date_i18n('d', $date) == str_pad($i, 2, '0', STR_PAD_LEFT))
                                                echo 'selected="selected"';
                                            echo '>' . str_pad($i, 2, '0', STR_PAD_LEFT) . '</option>';
                                        endfor;
                                        ?>
                                    </select>
                                    <select name="<?php echo $meta_box['name']; ?>_year">
                                        <?php
                                        for ($i = 2010; $i <= 2020; $i++) :
                                            echo '<option value="' . $i . '" ';
                                            if (date_i18n('Y', $date) == $i)
                                                echo 'selected="selected"';
                                            echo '>' . $i . '</option>';
                                        endfor;
                                        ?>
                                    </select> @ <input type="text" name="<?php echo $meta_box['name']; ?>_hour" size="2" maxlength="2" style="width:2.5em" value="<?php echo date_i18n('H', $date) ?>" />:<input type="text" name="<?php echo $meta_box['name']; ?>_min" size="2" maxlength="2" style="width:2.5em" value="<?php echo date_i18n('i', $date) ?>" /></div><?php if ($meta_box['description'])
                        echo wpautop(wptexturize($meta_box['description'])); ?>
                            <?php
                            endif;
                            break;
                        case "textarea" :
                            ?>
                            <?php if ($meta_box['description'])
                                echo wpautop(wptexturize($meta_box['description'])); ?>
                            <?php
                            break;
                        case "select" :
                            $pages = get_pages();
                            ?>
                            <select name="<?php echo $meta_box['name']; ?>">
                                <?php
                                foreach ($pages as $page) {
                                    ?>
                                    <option><?php echo get_page_link($page->ID) ?></option>
                                    <?php
                                }
                                ?>
                            </select>
                            <select>
                                <?php
                                foreach ($pages as $page) {
                                    ?>
                                    <option><?php echo $page->post_title ?></option>
                                    <?php
                                }
                                ?>
                            </select>
                            <?php if ($meta_box['description'])
                                echo wpautop(wptexturize($meta_box['description'])); ?>
                            <?php
                            break;
                        default :
                            ?>
                            <input type="text" style="width:320px; margin-right: 10px; float:left" name="<?php echo $meta_box['name']; ?>" value="<?php echo htmlspecialchars($data); ?>" /><?php if ($meta_box['description'])
                    echo wpautop(wptexturize($meta_box['description'])); ?>
                            <?php
                            break;
                    endswitch;
                    ?>				
                    <div class="clear"></div>
                </div>
            <?php } ?>
        </div>
    </div>	
    <?php
}
function save_meta_box($post_id) {
    global $post, $meta_boxes, $key;
    if (!isset($_POST[$key . '_wpnonce']))
        return $post_id;
    if (!wp_verify_nonce($_POST[$key . '_wpnonce'], plugin_basename(__FILE__)))
        return $post_id;
    if (!current_user_can('edit_post', $post_id))
        return $post_id;
    foreach ($meta_boxes as $meta_box) {
        if ($meta_box['type'] == 'datetime') {
            $year = $_POST[$meta_box['name'] . '_year'];
            $month = $_POST[$meta_box['name'] . '_month'];
            $day = $_POST[$meta_box['name'] . '_day'];
            $hour = $_POST[$meta_box['name'] . '_hour'];
            $min = $_POST[$meta_box['name'] . '_min'];
            if (!$hour)
                $hour = '00';
            if (!$min)
                $min = '00';
            if (checkdate($month, $day, $year)) :
                $date = $year . $month . $day . ' ' . $hour . ':' . $min;
                update_post_meta($post_id, $meta_box['name'], strtotime($date));
            endif;
        } else {
            update_post_meta($post_id, $meta_box['name'], $_POST[$meta_box['name']]);
        }
    }
}
add_action('admin_menu', 'create_meta_box');
add_action('save_post', 'save_meta_box');
?>
