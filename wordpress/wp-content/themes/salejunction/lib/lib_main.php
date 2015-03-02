<?php
$file_name = array('constants', 'custom_function', 'shop_loop', 'metabox');
foreach ($file_name as $files): 
    if (file_exists(LIBPATH . $files . '.php')): 
        require_once(LIBPATH . $files . '.php');
    endif;
endforeach;
