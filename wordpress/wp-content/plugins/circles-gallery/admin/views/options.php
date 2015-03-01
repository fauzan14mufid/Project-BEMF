<?php
/**
 * Represents the view for the administration dashboard.
 *
 * This includes the header, options, and other information that should provide
 * The User Interface to the end user.
 *
 * @package   CirclesGallery
 * @author    GreenTreeLabs <diego@greentreelabs.net>
 * @license   GPL-2.0+
 * @link      http://greentreelabs.net
 * @copyright 2014 GreenTreeLabs
 */
?>

<div class="wrap">
	<?php if(!$from_editor) : ?>
	<h2><?php echo esc_html( get_admin_page_title() ); ?></h2>
	<div id="help">
		<p>Need help? <a href="http://circles-gallery.com/wordpress/tutorial/" target="_blank">Read the tutorial.</a></p>
	</div>
	<?php endif ?>	

	<form method="post" action="options.php" class="cg-options <?php print $from_editor ? "from-editor" : "" ?>">
		<?php settings_fields(CIRCLES_GALLERY_OPT_NAME); ?>

		<input name="circles-gallery-options[ids]" id="ids" type="hidden" class="shortcode-field" />
		
		<?php do_settings_sections($this->plugin_slug); ?>
		<input id="submitButton" name="Submit" type="submit" value="<?php esc_attr_e('Save Changes'); ?>" />
	</form>
</div>
<script>
(function( $ ) {
	var from_editor = <?php print $from_editor ? "true" : "false"; ?>;
    // Add Color Picker to all inputs that have 'color-field' class
    $(function() {
        $('.color-field').wpColorPicker();
        
        $("#colorbox_theme, #prettyphoto_theme")
        	.attr("disabled", "disabled");
        $("#click_action").change(function () {
	        if($(this).val() == "prettyphoto" ||
	           $(this).val() == "colorbox") {
		           $("#" + $(this).val() + "_theme").removeAttr("disabled")
	           } else {
		           $("#colorbox_theme, #prettyphoto_theme")
				   		.attr("disabled", "disabled");
	           }
        });
    });
 	
 	$(function() {

 		var setEffectDescription = function (css_class) {
 			var lines = $(".effects li." + css_class).find("span");
 		}

 		var lastEffect = 0;
 		var $lastGroup = null;

 		$(".effects li").each(function () {
			var $item = $(this).children("div").eq(0);
			var css_class = $item.attr("class");
			var data = $.trim(css_class.replace("ih-item", "").replace("circle", ""));

			var effectNo = 0;
			var effectName = "";

			$.each(data.split(' '), function (i, e) {
				if(e.substr(0, 'effect'.length) == 'effect') {
					effectNo = /(\d+)/.exec(e)[0];
				} else {
					effectName = e.replace(/_/g, ' ');					
				} 
			});
			
			if($lastGroup == null || lastEffect != effectNo)
			{
				$lastGroup = $("<optgroup label='Effect "+ effectNo +"'></optgroup>");				
				$(".effect-name").append($lastGroup);				
			} 
			lastEffect = effectNo;

			$lastGroup.append("<option value='"+ effectNo + "|" + data +"'>Effect " + effectNo + " " + effectName + "</option>");
 		});
 		
 		if(from_editor) {
	 		$("form select").prepend("<option></option>").get(0).selectedIndex = 0;
 		} else {
			var savedEffect = $("[name=hover_effect_bridge]").val();
			if(savedEffect)
				$("#hover_effect").val(savedEffect);	 		
 		}

		$("#hover_effect").change(function () {
			var idx = this.selectedIndex - 1;
			if(from_editor)
				idx--;
				
			$(".effects li").hide().eq(idx).show();
			if(this.selectedIndex == 0 || (this.selectedIndex == 1 && from_editor)) {
				$(".effects").hide();	
			} else {
				$(".effects").show();
			}
		}).change();
 	});	

})( jQuery );
</script>
