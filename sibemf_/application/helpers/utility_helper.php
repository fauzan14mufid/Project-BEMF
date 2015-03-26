<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by PhpStorm.
 * User: andre.na70
 * Date: 3/2/2015
 * Time: 9:33 PM
 */

    if(!function_exists('asset_url()')){
        function asset_url()
        {
            return base_url().'assets/';
        }
    }

?>