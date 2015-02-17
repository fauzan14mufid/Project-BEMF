<?php
$file_name = array(
    'inkthemes-functions',
    'admin-functions',
    'admin-interface',
    'theme-options'
);
foreach($file_name as $files):
    if(file_exists(FUNCPATH.$files.'.php')):
        require_once(FUNCPATH.$files.'.php');
    endif;
endforeach; 
