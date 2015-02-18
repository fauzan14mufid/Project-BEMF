<?php

$functions_path = get_template_directory() . '/functions/';
define('TMPLURI',
        get_template_directory_uri());
define('FUNCPATH',
        get_template_directory() . '/functions/');
define('FUNCURI',
        TMPLURI . '/functions/');
define('LIBPATH',
        get_template_directory() . '/lib/');
define('LIBURI',
        TMPLURI . '/lib/');
define('EDD_SLUG',
        'items');
define('POST_TYPE',
        'download');
define('SLUG',
        'salejunction');

/**
 * Include all functions files. 
 */
if (file_exists(FUNCPATH . 'main.php')) {
    include_once(FUNCPATH . 'main.php');
}
require_once ($functions_path . 'define_template.php');
/**
 * Include all library files 
 */
if (file_exists(LIBPATH . 'lib_main.php')) {
    include_once(LIBPATH . 'lib_main.php');
}

function is_on_sale() {
    return isset($this->sale_price) && $this->sale_price == $this->price ? true : false;
}

?>