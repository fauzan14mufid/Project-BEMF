<?php 
/*
Plugin Name: Manage Site Logo
Plugin URI:	 www.raveinfosys.com
Description: Help you to manage your Website Logo
Version:	 1.0
Author:		 Rave Infosys
Author URI:	 www.raveinfosys.com
*/
//Initialization
$url =plugins_url();
function ri_custom_css()
{
	wp_register_style( 'ri_main_style', plugins_url( '/css/ri_main_style.css', __FILE__ ));
	wp_enqueue_style('ri_main_style');
}
add_action('admin_init','ri_custom_css');
add_action('admin_menu','add_logo_init');
$logo_title;
$logo_alt;
$is_file_selected;
$check;   
function add_logo_init()
{
	global $logo_title,$url,$is_file_selected;
	if($_FILES['file'])
		$is_file_selected=1;
	if(!empty($_POST['add_logo_submit']))
	{
		
		if(!wp_verify_nonce($_POST['add_site_logo'],'add_site_logo'))
			exit();
		
		if(get_option('add_logo_filename')!=""&&($_FILES['file']['name']==""||$_FILES['file']['name']==NULL))
		{
			//update_option('add_title',$_POST['title']);
			//update_option('add_alt',$_POST['alt']);
			//$logo_title=get_option('add_title');
			//$logo_title=get_option('add_alt');
		}
		else
		{
				$check = 1;
				if ((($_FILES["file"]["type"] == "image/gif") || ($_FILES["file"]["type"] == "image/jpeg") || ($_FILES["file"]["type"] == "image/png") || ($_FILES["file"]["type"] == "image/pjpeg")))
			{

				if ($_FILES["file"]["type"])
				{
					$image = $_FILES["file"]["name"];
					unlink(plugin_dir_path(__FILE__).'images/'.get_option('add_logo_filename'));
					move_uploaded_file($_FILES["file"]["tmp_name"],plugin_dir_path(__FILE__).'images/'.$image);
					update_option('add_title',$_POST['title']);
					update_option('add_alt',$_POST['alt']);
					$logo_title=get_option('add_title');
					$logo_title=get_option('add_alt');
					update_option('add_logo_path',$url.'/website-logo/images/'.$image);
					update_option('add_logo_filename',$image);

				}
				if($_POST['saved']==true)
				{
					$location =$_SERVER['REQUEST_URI'];
				}
				else
				{
					$location = str_replace("&deleted=true", "", $_SERVER['REQUEST_URI']."&saved=true");
				}
				wp_redirect($location);
				die();
			}
		}
	}
	$add_logo_page =add_options_page(__('Manage Site Logo', 'Manage-Site-Logo'), __('Manage Site Logo', 'Manage-Site-Logo'), 'manage_options', basename(__FILE__), 'add_logo_options');
}
function ri_site_logo()
{
	return  '<img src="'.get_option('add_logo_path').'" title="'.get_option('add_title').'" alt="'.get_option('add_alt').'"/>';
}
add_shortcode('site_logo','ri_site_logo');	
function add_logo_settings_link($links)
{
	$settings_link ='<a href="options-general.php?page=create_logo.php">Settings</a>';
	array_unshift($links, $settings_link);
	return $links;
}
$plugin = plugin_basename(__FILE__);
add_filter("plugin_action_links_$plugin",'add_logo_settings_link');
//set default options
function set_add_logo_options()
{
	add_option('add_title','');
	add_option('add_alt','');
	add_option('add_logo','');
	add_option('add_logo_path','');
	add_option('add_logo_filename','');
}
//delete options upon plugin deactivation
function unset_add_logo_options()
{
	delete_option('add_logo');
}

	register_activation_hook(__FILE__,'set_add_logo_options');
	register_deactivation_hook(__FILE__,'unset_add_logo_options');

//create admin page
function add_logo_options()
{
	global $logo_title,$is_file_selected;?>
	<div class="main_body">
	<div class="top"><h2 class="title_align">Manage Your Website Logo</h2><h4 class="logo_hint"><strong>you can use anywhere your logo by this short code:&nbsp;&nbsp;&nbsp;[site_logo]</strong></h4></div>
	<!-- Add Logo to Admin box begin-->
	<form  method="post" enctype="multipart/form-data">
		<table class="inner_body">
			<?php
				if($is_file_selected==1)
				{
					echo '<div class="show_error"><p><strong> Please choose a valid image file to be uploaded </strong></p></div>';
				}
				else
				{
					if($check == 1)
					{
						echo '<div class="show_error"><p><strong> Invalid image</strong></p></div>';$save='';
					}
					elseif($_REQUEST['saved']=='true')
					{
						echo '<div class="show_message"><p><strong>Changes have been saved.</strong></p></div>';
					}
					else
					{
						echo '<div class="show_none"><p><strong></strong></p></div>';
					}
				}
			?>
		<tr>
			<td  class="column_left">
				Choose a file to upload:
			</td>
                  	<td class="column_right">
				<input type="file" name="file" id="file"  value=""/><small>Click Save Changes below to upload your logo.</small></br>
			</td>
		</tr>
		<tr>
			<td class="column_left">
				Title:
			</td>
			<td class="column_right" >
				<input type="text" name="title" value="<?php echo get_option('add_title');?>"/>&nbsp;<small>Title of your logo.</small>
			</td>
		</tr>
		<tr>
			<td class="column_left">
				Alt:
			</td>
			<td class="column_right">
				<input type="text" name="alt" value="<?php echo get_option('add_alt');?>"/>&nbsp;<small>Alt of your logo.</small>
			</td>
		</tr>
		<tr>
			<td class="column_left">
			</td>
			<td class="column_right">
				<p ><small>Your Current Logo Is Showing Here</small></p>
			<img src="<?php echo get_option('add_logo_path');?>"/>
			</td>
		</tr>
		<tr>
			<td class="column_left">
			</td>
			<td class="column_right">
				<input  class="submit_bttn" type="submit" name="add_logo_submit"  value="Save Changes" />
			</td>
		</tr>
		<?php  if(function_exists('wp_nonce_field')) wp_nonce_field('add_site_logo', 'add_site_logo');?>
	</form>
	<!-- Add Logo to Admin admin box end-->
</table>
</div>
<?php }?>